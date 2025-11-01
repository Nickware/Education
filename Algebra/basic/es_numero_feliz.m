function es_feliz = es_numero_feliz(n)
  % Verifica si un número entero positivo n es un número feliz.
  % Devuelve true (1) si es feliz, false (0) si no lo es.

  if n <= 0
    error("El número debe ser un entero positivo.");
  endif

  visitados = [];

  while n != 1 && !any(visitados == n)
    visitados = [visitados, n];
    digitos = num2str(n) - '0';   % Convierte el número en un vector de dígitos
    n = sum(digitos .^ 2);        % Suma de los cuadrados de los dígitos
  endwhile

  es_feliz = (n == 1);
endfunction

% Ejemplo de uso:
numero = input("Ingresa un número entero positivo: ");
if es_numero_feliz(numero)
  printf("%d es un número feliz.\n", numero);
else
  printf("%d no es un número feliz.\n", numero);
endif
