## Classroom de Transformaciones Lineales Complejas

### Propósito General
Este script implementa un **entorno educativo interactivo** (classroom) en Octave para el estudio y visualización de transformaciones lineales en el plano complejo, diseñado como una herramienta de aprendizaje práctico.

### ** Funcionalidades Principales

#### 1. Menú Interactivo 
Sistema de 7 opciones que permite al usuario:
- **Ejecutar ejemplos predefinidos**
- **Introducir sus propios parámetros**
- **Visualizar resultados numéricos y gráficos**

#### 2. Transformaciones Implementadas
1. **Rotación Compleja** - Ejemplo demostrativo
2. **Escalamiento Complejo** - Interactivo con entrada de usuario
3. **Transformación de Möbius** - Interactivo con parámetros personalizables
4. **Exponencial Compleja** - Ejemplo demostrativo  
5. **Transformación Lineal General** - Con matrices 2x2 complejas
6. **Visualización de Mallas** - Análisis geométrico

### 3. Valor Educativo

#### Para Estudiantes
- **Aprendizaje experimental** mediante prueba y error
- **Visualización inmediata** de efectos geométricos
- **Comprensión intuitiva** de conceptos abstractos
- **Verificación numérica** de propiedades matemáticas

#### Conceptos Matemáticos Abordados
- Aritmética de números complejos
- Representación geométrica en el plano complejo
- Propiedades de linealidad
- Transformaciones conformes
- Efectos de multiplicación compleja

### 4. Características Técnicas

#### Entrada de Datos:
```matlab
z = input('Ingresa vector complejo z (ej: [1+1i, 2-1i]): ');
```
- **Flexible**: acepta vectores complejos arbitrarios
- **Guíado**: ejemplos claros del formato esperado

#### Procesamiento:
```matlab
w = transformacion_mobius(z, a, b, c, d);
```
- **Modular**: funciones especializadas para cada transformación
- **Numérico**: cálculo preciso con aritmética compleja

#### Salida de Resultados:
```matlab
fprintf('z%d = %6.2f + %6.2fi -> w%d = %6.2f + %6.2fi\n', ...
        i, real(z(i)), imag(z(i)), i, real(w(i)), imag(w(i)));
```
- **Formateada**: presentación clara de números complejos
- **Comparativa**: muestra entrada y salida lado a lado

#### Visualización:
- **Gráficos comparativos** (antes/después)
- **Conexiones visuales** entre puntos correspondientes
- **Mallas transformadas** para análisis global

### 5. Contexto de Aplicación

#### Cursos Relacionados:
- Variable Compleja
- Álgebra Lineal
- Análisis Matemático
- Geometría Diferencial

#### Nivel Educativo:
- **Pregrado** en matemáticas, física, ingeniería
- **Autodidactas** en matemáticas avanzadas
- **Docentes** como material de demostración

### Ventajas Pedagógicas

1. **Inmediatez**: Resultados instantáneos
2. **Interactividad**: Participación activa del estudiante  
3. **Retroalimentación**: Corrección inmediata de errores
4. **Exploración**: Libertad para probar casos límite
5. **Multimodal**: Combinación de números y gráficos

### Ejemplo de Flujo de Aprendizaje

1. **Teoría**: Estudio conceptual de transformaciones
2. **Experimentación**: Uso del classroom para ver ejemplos
3. **Verificación**: Comprobación de propiedades matemáticas
4. **Generalización**: Prueba con nuevos parámetros
5. **Análisis**: Interpretación de resultados visuales

Este script representa una **herramienta pedagógica poderosa** que transforma conceptos abstractos de álgebra lineal compleja en experiencias de aprendizaje concretas y accesibles.
