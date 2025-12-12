## Visualización de la función sinc bidimensional en C++, Octave y Scilab

### Descripción general

Este documento describe un script en C++ que genera y visualiza la superficie 3D de la función:

$$
z = \frac{\sin(\sqrt{x^2 + y^2})}{\sqrt{x^2 + y^2}}
$$

Esta función, conocida como el **sinc bidimensional**, es famosa por su pico central y anillos decrecientes, y se utiliza frecuentemente para ilustrar conceptos en matemáticas, física e ingeniería.

### Funcionamiento del script en C++

- **Definición matemática:**
La función `f(double x, double y)` calcula el valor de $z\$ para cada par $\(x, y)\$, manejando el caso especial \$r=0\$ para evitar división por cero.
- **Configuración de la cuadrícula:**
El rango de \$x\$ y \$y\$ es de -8 a 8, con 41 puntos en cada eje, formando una malla de 41x41.
- **Generación de datos:**
Se calcula \$z\$ para cada punto de la cuadrícula y se guarda en un archivo `surface_data.dat` compatible con Gnuplot.
- **Creación del script de Gnuplot:**
Se genera un archivo `plot_surface.gp` con instrucciones para graficar la superficie 3D.
- **Visualización automática:**
El script ejecuta Gnuplot para mostrar la superficie de la función.


### Comparación con Octave y Scilab

Existen scripts equivalentes en Octave y Scilab que abordan el mismo problema, permitiendo la visualización de la función sinc bidimensional de manera similar, aunque con diferencias en sintaxis y herramientas de graficación.

### Tabla comparativa

| Característica | C++ + Gnuplot | Octave | Scilab |
| :-- | :-- | :-- | :-- |
| Lenguaje principal | C++ | Octave (similar a Matlab) | Scilab |
| Generación de datos | Manual, mediante bucles | Vectorizada con funciones nativas | Vectorizada con funciones nativas |
| Visualización | Gnuplot externo | Función `mesh` o `surf` integrada | Función `surf` o `plot3d` integrada |
| Portabilidad | Depende de Gnuplot y el SO | Requiere Octave | Requiere Scilab |
| Facilidad de uso | Media (requiere manejo de archivos) | Alta (sintaxis directa y simple) | Alta (sintaxis directa y simple) |
| Extensión | Fácil de adaptar a otras funciones | Muy flexible y rápida para prototipos | Muy flexible y rápida para prototipos |

### Resumen de pasos del script en C++

1. **Definir la función** \$z=\frac{\sin(r)}{r}\$ para cada $(x, y)$.
2. **Configurar la cuadrícula**: rango de -8 a 8, 41 puntos por eje.
3. **Generar archivo de datos**: almacenar puntos $(x, y, z)$.
4. **Crear script de Gnuplot**: instrucciones para graficar la superficie.
5. **Ejecutar visualización**: llamar a Gnuplot para mostrar el gráfico.

### Consideraciones adicionales

- **Portabilidad:** El script en C++ depende de la instalación de Gnuplot y de la capacidad del sistema operativo para ejecutar comandos externos.
- **Precisión:** La resolución de la cuadrícula puede ajustarse para mayor detalle o rapidez.
- **Extensión:** Puede modificarse para graficar otras funciones o cambiar el rango de visualización.

> **Nota:**
> Octave y Scilab permiten realizar este tipo de visualización de manera más directa, gracias a sus funciones integradas para manejo de matrices y gráficos 3D, lo que los hace especialmente útiles para prototipos rápidos y análisis exploratorio.
