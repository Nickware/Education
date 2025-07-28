# Análisis y Descomposición de Audio en Octave

Repositorio con dos rutinas de Octave para procesamiento de audio:
1. **waves. Análisis Básico**
2. **waves.v.2. Descomposición en Componentes Sinusoidales**

## Estructura del Repositorio.
- ├── waves.m # Análisis espectral básico
- ├── waves.v.2.m # Descomposición del audio en senos/cosenos
- └── audio.wav # Archivo de ejemplo 

---

## Script: `waves.m`
**Propósito**: Cargar audio, ver onda y espectro

### Características Clave
- Cargue de audio
- Aplicación de ventana de Hann para reducir fugas espectrales
- Visualización dual:
  - Dominio temporal (forma de onda)
  - Dominio frecuencial (espectro normalizado)
- Detección automática de cinco (5) frecuencias principales

### Uso
```matlab
octave waves.m
```
## Script : `waves.v.2`
**Propósito**: Carga el archivo de audio, análisis de fase y magnitud mediante FFT y descomposición en  componentes individuales de seno/coseno.

### Características Clave
- Carga de archivos
- Análisis de fase y magnitud mediante FFT
- Visualización triple:
  - Señal original
  - Espectro de frecuencias con detección de picos
  - Componentes individuales de seno/coseno
- Salida en terminal de frecuencias y magnitudes

### Uso
```matlab
octave waves.v.2.m
```
## Prerrequisitos
1. **Octave** (versión 7.3.0 o superior)
2. Paquetes de Octave:
> Paquete signal
```matlab
pkg install -forge signal # Para funciones avanzadas de procesamiento
```
> Paquete signal
```matlab
pkg install -forge audio # Para grabación/reproducción de audio
```
---

## Instrucciones de Uso
1. **Análisis básico**:
- Ejecutar `waves.m`
- Resultados: `audio.wav` + gráficas integrados

2. **Para descomposición avanzada**:
- Cargar archivo `test.wav` en el mismo directorio
- Ejecutar `waves.v.2.m`
- Resultados: tres (3) gráficos interactivos + información en terminal

---

## Oportunidades de mejora 
- Hacer un zoom a las componentes individuales 
- Extraer bloque de datos de ese zoom 
- Comparar ese zoom con la función analítica de seno y coseno

---

## Licencia
Este proyecto se distribuye bajo licencia MIT. Ver archivo `LICENSE` para más detalles.

---

## Futuras Contribuciones
¡Se aceptan contribuciones vía pull requests! Por favor:
- Mantener el código compatible con Octave
- Documentar nuevos aportes en el README
- Incluir ejemplos de uso
