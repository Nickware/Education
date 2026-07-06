# Algoritmo número feliz

Este código implementa un **algoritmo iterativo** para determinar si un número es "feliz" o no. Un número feliz es aquel que, al reemplazarlo por la suma de los cuadrados de sus dígitos repetidamente, termina llegando al número **1**.

Si el proceso entra en un ciclo infinito que **no** incluye al 1 (es decir, el número se repite en una secuencia), entonces el número no es feliz.

---

### Desglose del algoritmo

El algoritmo sigue una lógica de **bucle con memoria**:

1. **Validación de entrada:** Verifica que el número sea positivo. Si no lo es, el programa se detiene con un error.
2. **Gestión de memoria (`visitados`):** Crea un vector vacío llamado `visitados`. Este es el paso más importante: funciona como una "historia clínica" del número. Si el resultado actual ya está en esta lista, significa que has entrado en un bucle infinito y, por lo tanto, el número **no es feliz**.
3. **El Bucle (Ciclo `while`):**
* Continúa ejecutándose mientras el número no sea `1` y mientras el número no haya sido visitado previamente.
* **Registro:** Añade el número actual al vector `visitados`.
* **Procesamiento:**
* `num2str(n) - '0'`: Convierte el número (ej. 19) en sus dígitos individuales (1 y 9).
* `n = sum(digitos .^ 2)`: Eleva cada dígito al cuadrado y los suma. (Ejemplo para 19: $1^2 + 9^2 = 1 + 81 = 82$).


* **Repetición:** El proceso vuelve a empezar con el nuevo valor de `n`.


4. **Conclusión:** Cuando el bucle termina, se comprueba si el valor final de `n` es exactamente `1`. Si es así, la función devuelve `true` (feliz); de lo contrario, `false`.

---

### Ejemplo de flujo (Número 19)

Para que veas cómo "piensa" el código:

1. **Inicio:** `n = 19`. `visitados = []`.
2. **Iteración 1:** `n` no es 1 y no está en `visitados`. `visitados = [19]`. Nuevo `n = 1^2 + 9^2 = 82`.
3. **Iteración 2:** `n` no es 1 y no está en `visitados`. `visitados = [19, 82]`. Nuevo `n = 8^2 + 2^2 = 68`.
4. **Iteración 3:** `n` no es 1 y no está en `visitados`. `visitados = [19, 82, 68]`. Nuevo `n = 6^2 + 8^2 = 100`.
5. **Iteración 4:** `n` no es 1 y no está en `visitados`. `visitados = [19, 82, 68, 100]`. Nuevo `n = 1^2 + 0^2 + 0^2 = 1`.
6. **Fin:** El `while` termina porque `n == 1`. Retorna `true`.

---

### Observación técnica

Este algoritmo es muy eficiente para números pequeños. El uso de la lista `visitados` es una forma elegante de implementar un **sistema de detección de ciclos**. Sin esta lista, el programa podría quedarse "colgado" para siempre en los números que no son felices, consumiendo recursos de memoria hasta que el usuario lo detuviera manualmente.