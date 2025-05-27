%% 1. Configuración inicial
clc; clear; close all;  % Limpiar consola, variables y figuras
format short;          % Formato numérico compacto
more off;              % Desactivar paginación de salida

disp('=== INTRODUCCIÓN A OCTAVE PARA FÍSICA ===');

%% 2. Fundamentos de programación
disp('=== 2.1 Conceptos básicos ===');
% Comentarios:
% - En Octave/MATLAB los comentarios inician con %
% - Para texto usar comillas simples (') en lugar de dobles (")

% Variables básicas
v0 = 5;          % Velocidad inicial (m/s)
theta = pi/4;    % Ángulo de lanzamiento (radianes)
g = 9.81;        % Aceleración gravitacional (m/s²)
t = 1;           % Tiempo (s)

% Operaciones matemáticas
x = v0*cos(theta)*t;
y = v0*sin(theta)*t - (g*t^2)/2;

disp(['Posición en t=1s: x=', num2str(x), ' m, y=', num2str(y), ' m']);

%% 3. Cinemática en 2D
disp('=== 3.1 Trayectoria parabólica ===');

% Vector de tiempo
t = 0:0.1:1;    % Desde 0 hasta 1s en pasos de 0.1s

% Cálculo de posición
x = v0*cos(theta)*t;
y = v0*sin(theta)*t - (g*t.^2)/2;

% Visualización
figure;
plot(x, y, 'b-o', 'LineWidth', 2, 'MarkerFaceColor', 'b');
title('Trayectoria de Proyectil 2D');
xlabel('Distancia (m)');
ylabel('Altura (m)');
grid on;
axis equal;

%% 4. Análisis paramétrico en 3D
disp('=== 4.1 Variación del ángulo ===');

% Definición de parámetros
angles = linspace(pi/6, pi/3, 10);  % Rango de ángulos
t = 0:0.1:1;                        % Vector de tiempo

% Prealocación de matrices
X = zeros(length(angles), length(t));
Y = zeros(length(angles), length(t));

% Cálculo para cada ángulo
for i = 1:length(angles)
    X(i,:) = v0*cos(angles(i))*t;
    Y(i,:) = v0*sin(angles(i))*t - (g*t.^2)/2;
end

% Visualización 3D
figure;
surf(X, repmat(angles', 1, length(t)), Y);
title('Trayectorias para Diferentes Ángulos');
xlabel('Distancia (m)');
ylabel('Ángulo (rad)');
zlabel('Altura (m)');
colorbar;
view(30, 30);  % Ángulo de visualización

%% 5. Interacción con usuario
disp('=== 5.1 Simulación interactiva ===');

% Entrada de usuario
user_v0 = input('Ingrese velocidad inicial (m/s): ');
user_angle = input('Ingrese ángulo (grados): ');
user_angle = user_angle * pi/180;  % Conversión a radianes

% Cálculo
t_max = 2*user_v0*sin(user_angle)/g;  % Tiempo de vuelo
t = linspace(0, t_max, 50);

x = user_v0*cos(user_angle)*t;
y = user_v0*sin(user_angle)*t - (g*t.^2)/2;

% Visualización
figure;
plot(x, y, 'r-', 'LineWidth', 2);
title(['Trayectoria para v0=', num2str(user_v0), ' m/s, θ=', ...
      num2str(user_angle*180/pi), '°']);
xlabel('Distancia (m)');
ylabel('Altura (m)');
grid on;

%% 6. Manejo de datos
disp('=== 6.1 Exportación/Importación de datos ===');

% Crear tabla de resultados
results = [t; x; y]';

% Exportar a archivo
fid = fopen('trayectoria.dat', 'w');
fprintf(fid, 'Tiempo(s)\tDistancia(m)\tAltura(m)\n');
fprintf(fid, '%6.3f\t%10.4f\t%10.4f\n', results');
fclose(fid);

disp('Datos guardados en trayectoria.dat');

% Importar datos (ejemplo)
% loaded_data = load('trayectoria.dat');

%% 7. Buenas prácticas y consejos
disp('=== 7.1 Recomendaciones ===');
disp('1. Use nombres descriptivos para variables');
disp('2. Comente su código explicando la física involucrada');
disp('3. Vectorice operaciones en lugar de usar bucles');
disp('4. Documente unidades de medida');
disp('5. Verifique resultados con casos límite conocidos');

%% 8. Ejercicios propuestos
disp('=== 8.1 Para practicar ===');
disp('1. Modifique el código para incluir resistencia del aire');
disp('2. Implemente cálculo automático del alcance máximo');
disp('3. Cree una animación de la trayectoria');
disp('4. Compare con solución analítica exacta');
disp('5. Extienda a tres dimensiones (movimiento en x,y,z)');

%% 9. Recursos adicionales
disp('=== 9.1 Para aprender más ===');
disp('* Documentación oficial de Octave: help <comando>');
disp('* Libro: "Numerical Methods for Physics" (A. Garcia)');
disp('* Curso: "Computational Physics" (Coursera)');
disp('* Repositorio: GitHub/octave-physics-examples');
