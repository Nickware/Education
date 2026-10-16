## Transformaciones en el plano complejo

Classroom interactivo en Octave para aplicar transformaciones a números complejos, ver los resultados numéricos y comparar sus representaciones gráficas.

> La rotación y el escalamiento por un factor complejo son transformaciones lineales del plano complejo. La exponencial y la transformación de Möbius son ejemplos de funciones complejas, pero no son lineales en general.

### Requisitos

- GNU Octave instalado.
- Un toolkit gráfico de Octave disponible (por ejemplo, Qt, FLTK o gnuplot) para abrir las figuras.
- No se requieren paquetes adicionales.

### Ejecutar desde la interfaz de Octave

1. Abre Octave.
2. Cambia el directorio actual a `Algebra/transformada` dentro del repositorio. Por ejemplo:

        ```octave
        cd('/ruta/al/repositorio/Algebra/transformada')
        ```

3. Inicia el classroom:

        ```octave
        classroom_transformaciones_complejas()
        ```

4. Escribe el número de una opción cuando aparezca el menú y responde a las preguntas de entrada.
5. Selecciona `7` para salir.

### Ejecutar desde una terminal Bash

Desde el directorio raíz del repositorio, ejecuta:

```bash
cd Algebra/transformada
octave --persist --eval "classroom_transformaciones_complejas()"
```

Octave mostrará el menú en la terminal; ingresa las opciones y valores solicitados. `--persist` mantiene abierta la sesión de Octave después de salir del menú. No uses `--no-gui` si quieres que las figuras se abran en una ventana gráfica.

Si prefieres iniciar Octave primero, ejecuta `octave` desde esa carpeta y luego escribe `classroom_transformaciones_complejas()` en el prompt de Octave.

#### VS Code instalado como Flatpak

Si la terminal integrada no encuentra Octave porque está instalado en el sistema anfitrión, desde la raíz del repositorio puedes iniciarlo así:

```bash
flatpak-spawn --host octave --persist --eval "cd('$PWD/Algebra/transformada'); classroom_transformaciones_complejas()"
```

### Opciones del menú

1. **Rotación compleja:** aplica una rotación de ejemplo de 45 grados.
2. **Escalamiento complejo:** solicita un vector de entrada y un factor real o complejo. Ejemplo de vector: `[1+1i, 2-1i]`.
3. **Transformación de Möbius:** solicita el vector y los parámetros `a`, `b`, `c` y `d` para calcular `(a*z+b)/(c*z+d)`. Evita valores que hagan cero el denominador.
4. **Exponencial compleja:** muestra el efecto de `exp(z)` sobre puntos del eje imaginario.
5. **Transformación lineal general:** aplica una matriz compleja de `2x2` a un vector columna de dos elementos. Por ejemplo, usa `[1+1i; 2-1i]` y `[1, 0; 0, 1]`.
6. **Visualizar malla:** compara una malla del plano complejo con su imagen bajo `exp(z)`.
7. **Salir.**

Las opciones que transforman puntos muestran los valores antes y después, y abren una gráfica comparativa. La opción 6 crea su propia gráfica de la malla.

### Casos de exploración

- **Conservar distancias:** comparar un conjunto de puntos antes y después de una rotación y verificar que las distancias entre pares no cambian.
- **Identificar una singularidad:** usar `w = 1/z` (`a=0`, `b=1`, `c=1`, `d=0`) y observar qué ocurre cerca de `z=0`, excluyendo ese punto porque el denominador se anula.
- **Relacionar exponencial y geometría:** transformar puntos del eje imaginario y observar cómo sus imágenes se distribuyen sobre el círculo unitario.
- **Contrastar linealidad:** probar una transformación lineal con combinaciones de vectores y compararla con `exp(z)`, que no satisface en general la propiedad aditiva.

### Propuestas de desarrollo

- Permitir ingresar el ángulo de rotación y elegir entre varios conjuntos de puntos de prueba.
- Validar dimensiones de la matriz y del vector, y advertir antes de evaluar parámetros de Möbius que anulen el denominador.
- Ampliar las gráficas para transformar segmentos, curvas y mallas con correspondencia visual entre puntos.
- Añadir pruebas numéricas pequeñas para propiedades esperadas, como la conservación de distancias en una rotación y los valores de referencia de `exp(z)`.
