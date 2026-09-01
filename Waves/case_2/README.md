# `waves.v.2.m` — Descomposición de una señal de audio en componentes seno/coseno

## ¿Qué hace?

`waves.v.2.m` carga un archivo de audio (`test.wav`), calcula su espectro de magnitud y fase mediante la FFT, identifica las componentes sinusoidales dominantes y reconstruye cada una por separado en el dominio del tiempo. A diferencia de `waves.m`, no se queda en el diagnóstico visual del espectro: usa la fase de cada pico para producir, literalmente, la sinusoide que esa componente representa, y la grafica junto a las demás.

Es la versión "avanzada" del par de scripts: comparte con `waves.m` la carga de audio y el criterio de detección de picos, pero añade el cálculo de fase y el paso de reconstrucción, y por eso su magnitud está en unidades físicas reales (no normalizada 0–1 como en `waves.m`) — es la única forma de que la reconstrucción tenga sentido cuantitativo.

## Estructura y dependencias

Igual que `waves.m`, es un script orquestador corto que delega la lógica en funciones de `lib/`. Tres de ellas ya las conoces de `waves.m`; dos son nuevas para esta versión:

```
├── waves.v.2.m
└── lib/
    ├── cargar_audio.m                  (compartida con waves.m)
    ├── calcular_espectro.m             (compartida con waves.m)
    ├── detectar_picos_principales.m    (compartida con waves.m)
    ├── reconstruir_componentes.m       (nueva)
    └── graficar_descomposicion.m       (nueva)
```

## Cómo está implementado (paso a paso)

**1. Carga de paquetes y del audio.** Igual que en `waves.m`: se cargan los paquetes `audio` y `signal`, se agrega `lib/` al path y se llama a `cargar_audio('test.wav')`, que entrega la señal en mono sin componente DC, la frecuencia de muestreo `fs`, el vector de tiempo `t` y el número de muestras `N`.

**2. Cálculo del espectro con magnitud absoluta.** Aquí está la primera diferencia real con `waves.m`: se llama a `calcular_espectro(audio, fs, tipo_ventana)` con `tipo_ventana = 'hann'` por defecto (configurable a `'ninguna'` si quieres reproducir el comportamiento de la versión original, sin ventaneo), y el script **no** normaliza la magnitud dividiendo por su máximo. La corrección de ganancia coherente dentro de `calcular_espectro` deja la magnitud en las mismas unidades de amplitud que la señal original, aplicar o no la ventana solo cambia la nitidez de los picos, no la escala. Eso es indispensable para el paso 4.

**3. Detección de componentes principales.** Se usa la misma `detectar_picos_principales` que en `waves.m`, pero pidiendo `dist_min_hz = 3*resolucion_hz` en vez de `2*resolucion_hz` — un poco más conservador, porque aquí confundir dos picos cercanos con un solo tono no solo afecta una lista de frecuencias, sino que produce una componente reconstruida que no corresponde a ningún tono real de la señal. El resultado son hasta cinco tríos (frecuencia, magnitud, fase).

**4. Reconstrucción de cada componente.** `reconstruir_componentes(t, freqs_pico, mag_pico, fase_pico)` genera, para cada pico detectado, la sinusoide `magnitud · cos(2π·frecuencia·t + fase)` a lo largo de todo el vector de tiempo. El resultado es una matriz con una columna por componente. Su fidelidad depende de qué tan cerca caiga cada frecuencia detectada de un bin real de la FFT (resolución `fs/N`): cuanto más se aleje, más se nota la fuga espectral en la fase y magnitud estimadas.

**5. Visualización.** `graficar_descomposicion` arma tres subgráficos: la señal original (limitada al primer segundo o menos si el audio es más corto, para que se vea la forma de onda sin saturar la vista), el espectro de magnitud con los picos marcados (eje acotado a `min(2000, fs/2)`), y las componentes reconstruidas superpuestas, cada una con su propio color y una leyenda con su frecuencia.

**6. Salida en consola.** El script imprime cada frecuencia detectada junto con su magnitud absoluta.

## Prerrequisitos

- Octave 7.3.0 o superior
- Paquetes `signal` y `audio`:
```matlab
pkg install -forge signal
pkg install -forge audio
```

## Uso

1. Coloca `test.wav` y la carpeta `lib/` junto a `waves.v.2.m` (con las cinco funciones que lista arriba).
2. Ejecuta:
```
octave waves.v.2.m
```
3. Resultado: una figura con tres gráficos (señal, espectro, componentes) y, en consola, la tabla de frecuencias y magnitudes.

## Notas sobre las limitaciones actuales

La reconstrucción asume que cada componente detectada es una sinusoide pura y estacionaria durante toda la duración de la señal; si el audio real tiene tonos que cambian de frecuencia o amplitud en el tiempo, las componentes reconstruidas solo aproximan un "promedio" de ese comportamiento. Y como en `waves.m`, dos tonos separados por menos que la resolución `fs/N` no se distinguirán como picos independientes, sin importar el umbral o la distancia mínima configurados — para eso haría falta interpolación alrededor de cada pico, que sigue en la lista de mejoras pendientes.
