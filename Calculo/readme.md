## Cuaderno introductorio interactivo en MATLAB

Este script es un **cuaderno introductorio interactivo en MATLAB** diseñado para enseñar conceptos fundamentales de programación, cálculo numérico y visualización matemática. Está estructurado en secciones temáticas progresivas, cada una enfocada en un aspecto clave del uso de MATLAB para matemáticas y ciencia computacional.

### Descripción general por secciones:

1. **Configuración básica y primeros comandos**:  
   Inicia el entorno limpio (`clc`, `clear`, `close all`), muestra cómo usar `disp` para imprimir mensajes, y presenta asignación de variables y operaciones aritméticas, incluyendo el uso de paréntesis para controlar la precedencia.

2. **Funciones matemáticas y gráficos**:  
   Introduce funciones trigonométricas (`sin`, `cos`) y su visualización mediante `plot`. Muestra cómo crear gráficos simples y combinados, con leyendas, títulos, etiquetas de ejes y cuadrícula, destacando buenas prácticas de visualización.

3. **Límites y sucesiones**:  
   Ilustra numéricamente la definición del número *e* como límite de la sucesión $\((1 + 1/n)^n\)$, usando funciones anónimas y potencias de 10 para observar la convergencia, con formato de salida ajustado para mayor precisión.

4. **Series y sumatorias**:  
   Trabaja con series convergentes y divergentes. Calcula sumas parciales de una serie racional mediante dos enfoques (vectorizado con `cumsum` y bucle `for`), y compara la divergencia lenta de la serie armónica al sumar hasta 1,000 y 1,000,000 términos.

5. **Gráficas paramétricas y polares**:  
   Visualiza curvas no funcionales: una **cicloide** (paramétrica) y una **limaçon** (en coordenadas polares), mostrando dos formas de graficar polares: manualmente (convirtiendo a cartesianas) y con la función `polar`.

6. **Gráficas implícitas**:  
   Usa `ezplot` para graficar una ecuación implícita en dos variables, útil para curvas que no pueden expresarse fácilmente como $\(y = f(x)\)$.

7. **Consejos y ejercicios adicionales**:  
   Ofrece recomendaciones de programación eficiente (vectorización, preasignación), propone ejercicios prácticos para reforzar el aprendizaje y sugiere comandos útiles (`doc`) para explorar la documentación de MATLAB.

---

### Objetivo Formativo:
El script sirve como **guía didáctica interactiva** para estudiantes o principiantes en MATLAB, integrando teoría matemática (límites, series, curvas) con implementación práctica y visualización gráfica. Fomenta el aprendizaje activo mediante ejemplos ejecutables, comparaciones de métodos y sugerencias para la exploración autónoma.

> **Ideal para**: talleres introductorios, laboratorios de cálculo numérico o como material de apoyo en cursos de matemáticas aplicadas.
