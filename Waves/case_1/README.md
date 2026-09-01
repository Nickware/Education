# `waves.m` — Análisis espectral básico de una señal de audio

`waves.m` carga un archivo de audio (`test.wav`), calcula su espectro de frecuencias mediante la FFT y muestra dos gráficos: la forma de onda en el dominio del tiempo y su espectro de magnitud normalizado en el dominio de la frecuencia. Además, identifica automáticamente hasta cinco frecuencias dominantes en el espectro y las imprime en consola.

Es la versión "básica" de un par de scripts de análisis de audio: no calcula fase ni reconstruye componentes individuales (eso lo hace `waves.v.2.m`); su objetivo es únicamente diagnosticar visualmente el contenido espectral de una grabación.

## Estructura y dependencias

`waves.m` es un script orquestador corto: no contiene la lógica de procesamiento directamente, sino que la delega en cuatro funciones ubicadas en `lib/`. Se debe colocar esa carpeta en el mismo directorio que el script:

```
├── waves.m
└── lib/
    ├── cargar_audio.m
    ├── calcular_espectro.m
    ├── detectar_picos_principales.m
    └── graficar_analisis_basico.m
```

## Cómo está implementado (paso a paso)

**1. Carga de paquetes y del audio.** El script carga los paquetes `audio` y `signal` de Octave, agrega `lib/` al path, y llama a `cargar_audio('test.wav')`. Esta función valida que el archivo exista, lo lee con `audioread`, lo reduce a un solo canal si es estéreo (se queda con el primero) y le resta la media para eliminar cualquier componente DC que distorsionaría el espectro cerca de 0 Hz. Devuelve la señal, la frecuencia de muestreo `fs`, el vector de tiempo `t` y el número de muestras `N`.

**2. Cálculo del espectro.** `calcular_espectro(audio, fs, 'hann')` aplica una ventana de Hann a la señal antes de calcular la FFT, lo que reduce las fugas espectrales (energía que se "esparce" hacia frecuencias vecinas cuando la señal no es periódica dentro de la ventana de análisis). Internamente toma solo la mitad positiva del espectro —suficiente para una señal real— y corrige la magnitud dividiendo por la ganancia coherente de la ventana (su valor medio), de modo que el ventaneo no altere artificialmente la escala de amplitud. El script luego normaliza esa magnitud dividiendo por su máximo, dejando un espectro relativo entre 0 y 1: útil para comparar la *forma* del espectro, no para leer amplitudes físicas absolutas.

**3. Detección de picos principales.** `detectar_picos_principales` recibe el espectro de magnitud y busca picos locales con `findpeaks`, descarta los que estén por debajo del 10% del pico máximo, y de los que quedan selecciona los más altos exigiendo que estén separados entre sí por al menos el doble de la resolución en frecuencia de la señal (`2·fs/N`). Esa separación mínima es la que evita que una misma componente real aparezca reportada dos veces en dos bins de frecuencia adyacentes, algo que puede ocurrir por la fuga espectral residual incluso con ventana de Hann. El resultado son hasta cinco frecuencias, ordenadas de menor a mayor.

**4. Visualización.** `graficar_analisis_basico` dibuja dos subgráficos en una sola figura: arriba la señal en el tiempo completo; abajo el espectro de magnitud con las frecuencias detectadas marcadas con puntos negros. El eje de frecuencias se limita a `min(4000, fs/2)`, de forma que nunca se intenta mostrar más allá de la frecuencia de Nyquist real del archivo cargado, sea cual sea su tasa de muestreo.

**5. Salida en consola.** Finalmente, el script imprime cada frecuencia detectada junto con su magnitud relativa.

## Prerrequisitos

- Octave 7.3.0 o superior
- Paquetes `signal` y `audio`:
```matlab
pkg install -forge signal
pkg install -forge audio
```

## Uso

1. Coloca `test.wav` y la carpeta `lib/` junto a `waves.m`.
2. Ejecuta:
```
octave waves.m
```
3. Resultado: una figura con dos gráficos (onda + espectro) y, en consola, la lista de frecuencias principales detectadas.

## Notas sobre las limitaciones actuales

La magnitud reportada es relativa (normalizada por el máximo), así que sirve para comparar picos entre sí dentro del mismo espectro, pero no para comparar amplitudes entre grabaciones distintas. La resolución en frecuencia está limitada por `fs/N`: dos tonos más cercanos entre sí que esa resolución no podrán distinguirse como picos separados, independientemente del umbral o la distancia mínima configurados.
