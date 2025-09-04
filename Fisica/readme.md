# Fundamentos de Octave para Curso Introductorio en Física

## 1. Configuración Inicial y Fundamentos
- **Entorno de trabajo**
  - Comandos básicos (`clc`, `clear`, `format`)
  - Sintaxis de comentarios y texto
- **Variables y operaciones**
  - Declaración de variables físicas (con unidades)
  - Operaciones matemáticas básicas
  - Precedencia de operadores

## 2. Cinemática Bidimensional
- **Modelado de trayectorias**
  - Ecuaciones paramétricas del movimiento parabólico
  - Vectorización de cálculos con arreglos temporales
- **Visualización 2D**
  - Uso avanzado de `plot`
  - Personalización de gráficos (etiquetas, cuadrículas, estilos)

## 3. Análisis Paramétrico (3D)
- **Variación de parámetros físicos**
  - Estudio del ángulo de lanzamiento
  - Generación de mallas paramétricas (`repmat`)
- **Visualización 3D**
  - Gráficos de superficie (`surf`)
  - Configuración de vistas 3D (`view`)
  - Barras de color y ejes proporcionales

## 4. Interfaz de Usuario
- **Entrada interactiva**
  - Captura de parámetros con `input`
  - Conversión de unidades (grados a radianes)
- **Cálculo automático**
  - Determinación del tiempo de vuelo
  - Generación dinámica de rangos temporales

## 5. Manejo de Datos Científicos
- **Exportación de resultados**
  - Formateo de tablas con `fprintf`
  - Estructuración de archivos `.dat`
- **Buenas prácticas**
  - Organización de datos en matrices
  - Precisión decimal controlada

## 6. Herramientas Pedagógicas
- **Ejercicios propuestos**
  - Extensión a resistencia del aire
  - Cálculo de alcance máximo
  - Animación de trayectorias
- **Recursos adicionales**
  - Documentación oficial
  - Libros y cursos recomendados
  - Repositorios de ejemplos

## 7. Técnicas Computacionales Avanzadas
- **Optimización de código**
  - Pre-asignación de matrices
  - Vectorización vs bucles
- **Validación física**
  - Casos límite analíticos
  - Verificación dimensional

## Aplicaciones Interdisciplinares
- **Física**
  - Movimiento de proyectiles
  - Análisis de parámetros cinemáticos
- **Matemáticas**
  - Ecuaciones paramétricas
  - Visualización de funciones
- **Ingeniería**
  - Simulación de escenarios
  - Análisis de sensibilidad

## Estructura Didáctica
```mermaid
flowchart TD
    A[Fundamentos] --> B[Cinemática 2D]
    B --> C[Análisis 3D]
    C --> D[Interacción]
    D --> E[Manejo de Datos]
    E --> F[Ejercicios]
    F --> G[Aplicaciones]
