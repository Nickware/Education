%% Introducción a Octave
% Este cuaderno sirve como guía para aprender Octave, un lenguaje de programación
% similar a MATLAB. Aquí cubriremos conceptos básicos y avanzados.

%% Configuración básica
format compact   % Reduce espacios entre salidas
format rat       % Muestra números como fracciones cuando es posible
more off         % Permite que la salida no se pause

%% 1. Fundamentos del lenguaje
disp('=== 1. Fundamentos del lenguaje ===');

% 1.1 Comentarios y acentos
% Los comentarios se hacen con %, pero para texto con acentos es mejor:
disp('Hola mundo con acentos: áéíóúñ');

% 1.2 Operaciones básicas
a = 1; 
b = 2;
suma = a + b;
resta = a - b;
producto = a * b;
division = a / b;
potencia = a^b;

disp(['Operaciones básicas: suma = ', num2str(suma), ', resta = ', num2str(resta)]);

% 1.3 Precedencia de operadores
result1 = 9 + 6 / 8 + 5;      % División primero
result2 = (9 + 6) / (8 * 5);  % Paréntesis primero

disp(['Precedencia: result1 = ', num2str(result1), ', result2 = ', num2str(result2)]);

%% 2. Gráficos básicos
disp('=== 2. Gráficos básicos ===');

% 2.1 Gráfico simple
x = -pi:0.01:pi;
figure(1);
plot(x, sin(x)); 
title('Función seno');
xlabel('x');
ylabel('sin(x)');
grid on;

% 2.2 Múltiples funciones en un gráfico
x = linspace(-2*pi, 2*pi, 100);
y1 = sin(x);
y2 = cos(x);

figure(2);
plot(x, y1, 'r-', x, y2, 'b--');
title('Funciones seno y coseno');
xlabel('x');
ylabel('y');
legend('sin(x)', 'cos(x)');
grid on;

%% 3. Álgebra Lineal - Eliminación Gaussiana
disp('=== 3. Álgebra Lineal ===');

% 3.1 Definición de matriz
B = [1 2 3 4; 0 -2 -4 6; 1 -1 0 0];
disp('Matriz original B:');
disp(B);

% 3.2 Operaciones entre filas
disp('Operación F3 = -1*F1 + F3:');
B(3,:) = -1*B(1,:) + B(3,:);
disp(B);

disp('Operación F3 = -1.5*F2 + F3:');
B(3,:) = -1.5*B(2,:) + B(3,:);
disp(B);

% 3.3 Resolución de sistemas lineales
A = B(:,1:3);  % Matriz de coeficientes
b = B(:,4);    % Vector de términos independientes

disp('Solución del sistema Ax=b:');
x = A\b;       % División izquierda (equivale a inv(A)*b)
disp(x);

%% 4. Factorización LU
disp('=== 4. Factorización LU ===');

% 4.1 Factorización LU básica
[L, U, P] = lu(A);
disp('Matriz L:');
disp(L);
disp('Matriz U:');
disp(U);
disp('Matriz de permutación P:');
disp(P);

% 4.2 Resolución usando LU
% PA = LU => Ax = b => PAx = Pb => LUx = Pb
% 1. Resolver Ly = Pb
% 2. Resolver Ux = y
y = L\(P*b);
x_lu = U\y;

disp('Solución usando LU:');
disp(x_lu);

%% 5. Ajuste de curvas polinomiales
disp('=== 5. Ajuste de curvas ===');

% 5.1 Datos de ejemplo
x_data = linspace(0, 10, 20);
y_data = 2*x_data.^2 - 3*x_data + 1 + randn(size(x_data))*5;

% 5.2 Ajuste polinomial (grado 2)
p = polyfit(x_data, y_data, 2);
y_fit = polyval(p, x_data);

% 5.3 Gráfico
figure(3);
plot(x_data, y_data, 'bo', x_data, y_fit, 'r-');
title('Ajuste polinomial');
xlabel('x');
ylabel('y');
legend('Datos', 'Ajuste cuadrático');
grid on;

%% 6. Visualización 3D
disp('=== 6. Visualización 3D ===');

% 6.1 Crear malla
[x_grid, y_grid] = meshgrid(-2:0.1:2, -2:0.1:2);
z = x_grid .* exp(-x_grid.^2 - y_grid.^2);

% 6.2 Gráficos
figure(4);
subplot(2,2,1);
mesh(x_grid, y_grid, z);
title('Mesh');

subplot(2,2,2);
surf(x_grid, y_grid, z);
title('Surf');

subplot(2,2,3);
contour(x_grid, y_grid, z);
title('Contour');

subplot(2,2,4);
contourf(x_grid, y_grid, z);
title('Contourf');
colorbar;

%% 7. Funciones definidas por el usuario
disp('=== 7. Funciones personalizadas ===');

% 7.1 Función en línea
cuadrado = @(x) x.^2;
disp(['Cuadrado de 5: ', num2str(cuadrado(5))]);

% 7.2 Función en archivo (debe estar en el path)
% function y = mi_funcion(x)
%   y = x.^3 + 2*x;
% end

%% 8. Consejos y buenas prácticas
disp('=== 8. Consejos finales ===');
disp('1. Use nombres descriptivos para variables');
disp('2. Comente su código explicando la lógica');
disp('3. Utilice ; para suprimir salidas no deseadas');
disp('4. Organice su código en secciones lógicas');
disp('5. Guarde su trabajo frecuentemente');

disp('¡Feliz programación en Octave!');
