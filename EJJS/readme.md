---

# Simulación de la función sin(x) usando EJSS (Easy Java/JavaScript Simulations) (En edición)

Este proyecto muestra cómo crear una simulación interactiva de la función \$ \sin(x) \$ utilizando Easy Java Simulations

## Requisitos

- Descargar [EJSS/EJSSS](https://www.um.es/fem/EjsWiki/pmwiki.php) e instalar en el equipo.

---

## 1. Configuración inicial del modelo

1. Abrir EJSS y crear un nuevo modelo de simulación.
2. Definir las variables necesarias en la pestaña **Variables**:

```java
x_min = -10;   // Límite inferior del dominio
x_max = 10;    // Límite superior del dominio
dx = 0.1;      // Paso de discretización
x = x_min;     // Variable independiente inicial
y = 0;         // Variable dependiente (sin(x))
```


---

## 2. Definición de ecuaciones dinámicas

En la sección **Evolución** (o **Dinámica**), ingresar las ecuaciones para actualizar la simulación:

```java
// Actualización de la posición x y cálculo de y = sin(x)
x = x + dx;
y = Math.sin(x);

// Reiniciar x al alcanzar el límite superior
if (x > x_max) {
  x = x_min;
}
```


---

## 3. Configuración de la visualización

1. Ir a la pestaña **Vistas** y agrega un gráfico 2D.
    - **Eje X**: Rango de `x_min` a `x_max`.
    - **Eje Y**: Rango de `-1.5` a `1.5`.
2. Dibujar la función usando un **Elemento de Línea**:

```java
// Código para trazar la función
addLine("sin(x)", x, y, Color.BLUE);
```


---

## 4. Personalización de controles

Agregar elementos interactivos en la pestaña **Vista GUI**:

- **Slider** para ajustar `dx` (rango sugerido: 0.01 a 0.5).
- **Botón de inicio/pausa** para controlar la ejecución.
- **Campo de texto** para mostrar el valor actual de \$ x \$ y \$ \sin(x) \$.

---

## 5. Ejecución y validación

- Hacer clic en el botón **Play** para iniciar la simulación.
- Verificar que la gráfica muestre una onda sinusoidal suave.
- Ajusta `dx` para observar cambios en la resolución de la curva.

---

## Recursos adicionales

- [Documentación oficial de EJSS](https://www.um.es/fem/EjsWiki/pmwiki.php)
- [Repositorio Open Source Physics](https://www.compadre.org/osp/)

---

Deberá haber creado su primera simulación de \$ \sin(x) \$ con EJSS.
