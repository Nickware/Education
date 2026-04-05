ALGORITMO EsNumeroFeliz
ENTRADA: entero positivo n
SALIDA: verdadero si n es feliz, falso en caso contrario

INICIO
    SI n ≤ 0 ENTONCES
        MOSTRAR "Error: el número debe ser un entero positivo."
        RETORNAR falso
    FIN SI

    crear conjunto vacío visitados

    MIENTRAS n ≠ 1 Y n NO está en visitados HACER
        añadir n al conjunto visitados
        suma ← 0
        temp ← n

        MIENTRAS temp > 0 HACER
            digito ← temp MÓDULO 10
            suma ← suma + digito²
            temp ← parte entera de (temp / 10)
        FIN MIENTRAS

        n ← suma
    FIN MIENTRAS

    SI n = 1 ENTONCES
        RETORNAR verdadero
    SINO
        RETORNAR falso
    FIN SI
FIN