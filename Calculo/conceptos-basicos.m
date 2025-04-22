%% 1. Configuración inicial y primeros comandos
clc; clear; close all;
format compact;
more off;

disp('=== 1. Configuración básica y primeros comandos ===');

% Comentarios y visualización básica
disp('Ejemplo de visualización:');
disp('hola');  % Forma correcta para mostrar texto

% Variables y operaciones básicas
b = 1;        % Asignación de variables
y = b*1;      % Operaciones aritméticas

% Operaciones como calculadora
disp('Operaciones básicas:');
result1 = 9+6/8*5        % Precedencia de operadores
result2 = (9+6)/(8*5)    % Uso de paréntesis

%% 2. Funciones matemáticas y gráficos
disp('=== 2. Funciones matemáticas y gráficos ===');

% Funciones trigonométricas
x = -pi:0.01:pi;        % Rango de valores

figure;
plot(x, sin(x));        % Gráfico básico
grid on;                % Activar cuadrícula
title('Función seno');  % Añadir título
xlabel('x');
ylabel('sin(x)');

% Gráfica más compleja
x = linspace(-2*pi, 2*pi);
y1 = sin(x);
y2 = cos(x);

figure;
plot(x, y1, 'o', x, y2, '-', 'LineWidth', 2);
legend('sen(x)', 'cos(x)');
title('Funciones trigonométricas');
grid on;

%% 3. Límites y sucesiones
disp('=== 3. Límites y sucesiones ===');

% Cálculo del número e
f = @(n) (1+1./n).^n;  % Función anónima
k = 0:9;               % Vector de exponentes
n = 10.^k;             % Potencias de 10

disp('Aproximación al número e:');
format long;           % Mostrar más decimales
resultados = f(n)'
format short;          % Volver al formato corto

%% 4. Series y sumatorias
disp('=== 4. Series y sumatorias ===');

% Serie convergente ejemplo
n = 2:11;                     % Términos de la serie
a = 1./(n.*(n+2));            % Términos individuales

% Sumas parciales (dos métodos)
% Método vectorizado
sumas = cumsum(a);            

% Método con bucle
for i = 1:10
    s(i) = sum(a(1:i));
end

% Visualización
figure;
plot(n, a, 'o', n, sumas, '+', 'MarkerSize', 8, 'LineWidth', 1.5);
legend('Términos', 'Sumas parciales');
title('Serie convergente ejemplo');
grid on;

% Serie armónica (divergente)
disp('Suma de la serie armónica:');
n = 1:1000;
sum_armonica_1k = sum(1./n)

n = 1:1e6;
sum_armonica_1M = sum(1./n)

%% 5. Gráficas paramétricas y polares
disp('=== 5. Gráficas paramétricas y polares ===');

% Cicloide (curva paramétrica)
t = linspace(0, 6*pi, 50);
x = 2*(t-sin(t));
y = 2*(1-cos(t));

figure;
plot(x, y, 'LineWidth', 2);
axis('equal');  % Misma escala en ejes
title('Cicloide');
grid on;

% Gráficas polares
theta = linspace(0, 2*pi, 100);
r = 1 - 2*sin(theta);

% Método 1: Conversión a cartesianas
x = r.*cos(theta);
y = r.*sin(theta);

figure;
subplot(1,2,1);
plot(x, y, 'LineWidth', 2);
title('Limaçon en coordenadas cartesianas');
axis('equal');
grid on;

% Método 2: Usando función polar
subplot(1,2,2);
polar(theta, r);  % Gráfico polar directo
title('Limaçon en coordenadas polares');

%% 6. Gráficas implícitas
disp('=== 6. Gráficas implícitas ===');

% Función implícita
f = @(x,y) -x.^2 - x.*y + x - y.^2 - y - 1;

figure;
ezplot(f);
title('Gráfica implícita: -x^2-xy+x-y^2-y=1');
grid on;

%% 7. Consejos y ejercicios adicionales
disp('=== 7. Consejos y ejercicios ===');

disp('Consejos:');
disp('1. Use operaciones vectorizadas en lugar de bucles');
disp('2. Pre-asigne memoria para matrices grandes');
disp('3. Documente su código con comentarios');

disp('Ejercicios sugeridos:');
disp('1. Modificar la cicloide para diferentes radios');
disp('2. Graficar rosas polares (r = cos(kθ))');
disp('3. Calcular límites de sucesiones más complejas');

disp('Recursos:');
disp('doc plot      % Documentación de gráficos');
disp('doc function  % Crear funciones personalizadas');
disp('doc symbolic  % Cálculo simbólico');

disp('=== Fin del cuaderno ===');
