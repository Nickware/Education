%% Introducción
% Este cuaderno explora dos temas fundamentales:
% 1. Ajuste de curvas polinomiales por mínimos cuadrados
% 2. Transformaciones geométricas usando matrices

%% Configuración inicial
format compact;
close all;  % Cierra todas las figuras previas
clc;        % Limpia la consola

%% 1. Ajuste de curvas polinomiales
disp('=== 1. Ajuste de curvas polinomiales ===');

% 1.1 Datos de ejemplo
D = [1 1; 2 2; 3 5; 4 4; 5 2; 6 -3];
xdata = D(:,1); % Valores en x
ydata = D(:,2); % Valores en y

% Visualización inicial de datos
figure(1);
plot(xdata, ydata, 'o', 'MarkerSize', 8, 'LineWidth', 1.5);
title('Datos originales');
xlabel('Variable independiente (x)');
ylabel('Variable dependiente (y)');
grid on;

% 1.2 Ajuste polinomial (mínimos cuadrados)
% Queremos ajustar un polinomio de grado 2: y = ax² + bx + c

% Método manual (ecuaciones normales)
A = [xdata.^2, xdata, ones(size(xdata))]; % Matriz de diseño
B = A' * A;  % Matriz del sistema normal
b = A' * ydata; % Vector del sistema normal
coeff = B \ b;  % Resolución del sistema

disp('Coeficientes calculados manualmente:');
disp(['a = ', num2str(coeff(1)), ', b = ', num2str(coeff(2)), ', c = ', num2str(coeff(3))]);

% 1.3 Uso de polyfit (método integrado)
p = polyfit(xdata, ydata, 2);
disp('Coeficientes con polyfit:');
disp(['a = ', num2str(p(1)), ', b = ', num2str(p(2)), ', c = ', num2str(p(3))]);

% 1.4 Evaluación y gráfico del ajuste
x_fit = linspace(min(xdata), max(xdata), 100);
y_fit_manual = coeff(1)*x_fit.^2 + coeff(2)*x_fit + coeff(3);
y_fit_polyfit = polyval(p, x_fit);

figure(2);
plot(xdata, ydata, 'o', 'MarkerSize', 8, 'LineWidth', 1.5);
hold on;
plot(x_fit, y_fit_manual, 'r-', 'LineWidth', 2);
plot(x_fit, y_fit_polyfit, 'b--', 'LineWidth', 2);
hold off;
title('Ajuste polinomial (grado 2)');
xlabel('x');
ylabel('y');
legend('Datos', 'Ajuste manual', 'Ajuste polyfit', 'Location', 'northwest');
grid on;

%% 2. Transformaciones geométricas con matrices
disp('=== 2. Transformaciones geométricas ===');

% 2.1 Datos de ejemplo (puntos que forman una figura)
D = [1 1 3 3 2 1 3; 
     2 0 0 2 3 2 2]; % Coordenadas [x; y]

% 2.2 Visualización original
figure(3);
subplot(2,2,1);
plot(D(1,:), D(2,:), 'bo-', 'LineWidth', 1.5);
axis equal;
axis([-4 4 -4 4]);
grid on;
title('Figura original');
xlabel('x');
ylabel('y');

% 2.3 Rotación de 90 grados
theta1 = 90*pi/180; % Convertir a radianes
R1 = [cos(theta1) -sin(theta1); 
     sin(theta1)  cos(theta1)];
RD1 = R1 * D;

subplot(2,2,2);
plot(D(1,:), D(2,:), 'b:', 'LineWidth', 1);
hold on;
plot(RD1(1,:), RD1(2,:), 'ro-', 'LineWidth', 1.5);
hold off;
axis equal;
axis([-4 4 -4 4]);
grid on;
title('Rotación de 90°');
legend('Original', 'Rotado', 'Location', 'southwest');

% 2.4 Rotación de 225 grados
theta2 = 225*pi/180;
R2 = [cos(theta2) -sin(theta2); 
     sin(theta2)  cos(theta2)];
RD2 = R2 * D;

subplot(2,2,3);
plot(D(1,:), D(2,:), 'b:', 'LineWidth', 1);
hold on;
plot(RD2(1,:), RD2(2,:), 'go-', 'LineWidth', 1.5);
hold off;
axis equal;
axis([-4 4 -4 4]);
grid on;
title('Rotación de 225°');
legend('Original', 'Rotado', 'Location', 'southwest');

% 2.5 Reflexión sobre el eje x
R_reflex = [1  0; 
            0 -1];
RD_reflex = R_reflex * D;

subplot(2,2,4);
plot(D(1,:), D(2,:), 'b:', 'LineWidth', 1);
hold on;
plot(RD_reflex(1,:), RD_reflex(2,:), 'mo-', 'LineWidth', 1.5);
hold off;
axis equal;
axis([-4 4 -4 4]);
grid on;
title('Reflexión sobre eje x');
legend('Original', 'Reflejado', 'Location', 'southwest');

%% 3. Funciones útiles para matrices
disp('=== 3. Funciones matriciales útiles ===');

% 3.1 Creación de matrices especiales
disp('Matriz mágica 4x4:');
disp(magic(4));

disp('Matriz de unos 3x3:');
disp(ones(3));

disp('Matriz identidad 4x4:');
disp(eye(4));

% 3.2 Visualización de matrices
figure(4);
imagesc(magic(10));
colorbar;
title('Visualización de matriz mágica 10x10');
axis square;

%% 4. Manejo de archivos
disp('=== 4. Manejo de archivos ===');

% 4.1 Guardar datos
save('datos_ejemplo.dat', 'D', '-ascii');
disp('Datos guardados en datos_ejemplo.dat');

% 4.2 Leer datos (ejemplo comentado)
% datos_leidos = load('datos_ejemplo.dat');

%% 5. Temas avanzados para explorar
disp('=== 5. Temas para explorar ===');
disp('1. Transformaciones lineales más complejas');
disp('2. Ajuste de curvas no lineales');
disp('3. Interpolación de datos');
disp('4. Descomposición de matrices (SVD, QR)');
disp('5. Optimización numérica');

%% Consejos finales
disp('=== Consejos finales ===');
disp('1. Use help <función> para obtener ayuda sobre cualquier función');
disp('2. Experimente cambiando parámetros para entender su efecto');
disp('3. Guarde sus scripts con nombres descriptivos');
disp('4. Documente sus experimentos con comentarios');
