% comentarios # % octave
% comentarios % matlab

% doble comilla
% comilla sencilla

%octave me acepta ambas
%matlab comilla doble

% borrar el historial 
% history -c

% introduccion
% variables y operadores
% funciones y graficas
% explorar datos
% fisica

% ecuaciones fundamentales de la cinematica
% x = x0 + v0*t + 1/2*g*t^2
% y = y0 + v0*t - 1/2*g*t^2

% definiendo mis variables
% latin tildes - como colocarlas

v0=5; % velocidad inicial
theta = pi/4; % angulo
g = 9.81; % aceleracion
t=1; % tiempo inicial

x = v0*cos(theta)*t;
y = v0*sin(theta)*t-g*t.^2/2;
% y = v0*sin(theta)*t-g^2*t/2 % error

% introduccion fisica
% magnitudes fisicas 
% escalas
% cifras significativas
% incertidumbre

% clc % limpia la terminal
% clear % borra mis variables
% doc % google

% format 9.81
% format short 5 digitos
% format <5

% operaciones
% En general: existe la jerarquia de operaciones

% arreglos - expresiones mediante arreglos

%t = [0, 0.2, 0.4, 0.6, 0.8, 1] % fila vector
% array unidimensional array == arreglo
% array de seis elementos

t = [0:0.2:1] % [inicio:incremento:final]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%2D%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% comandos para limpiar la pantalla y la memoria
clear
clc
% parametros iniciales
v0=5; % velocidad inicial
%t=1; % tiempo inicial
%t = [0:0.2:1] % intervalos de tiempo
t = 0:0.2:1;
theta = pi/4; % angulo 

% constante
g = 9.81; % aceleracion 

% modelo fisico
x = v0*cos(theta)*t;
y = v0*sin(theta)*t-g*t.^2/2;

% grafica dos dimensiones
plot(x,y)
title('Trayectoria 2D de una particula')
xlabel('Distancia (m)')
ylabel('Altura (m)')

% variables nombres
%altura01
%velocidadInicial 
%m@r&a nombre variable (no conveniente)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%3D%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
% parametros iniciales
v0=5; % velocidad inicial
%t=1; % tiempo inicial
%t = [0:0.2:1] % intervalos de tiempo
t = 0:0.2:1;
theta = pi:8:pi/200:3*pi/8; % angulo **

% constante
g = 9.81; % aceleracion 

% grafica tres dimensiones

% graficas surf contour contourf
tiempo = repmat(t, length(theta), 1);
angulo = repmat(theta, 1, length(t)); 

% modelo fisico
X = v0*cos(angulo)*.tiempo;
Y = v0*sin(angulo)*.tiempo-g*tiempo.^2/2;
% por convencion X Y Z mesh == malla de puntos
surf(X,angulo,Z)
hold on

% array =0 arreglo
% varios arreglos es una matriz
%  elements are all 1 ones
%  elements are all 0 magic
%  elements are random magic

Z = zeros(length(theta), length(t));
mesh(X,angulo,Z)

title('Trayectoria 3D de una particula')
xlabel('Distancia (m)')
ylabel('Angulo (radianes)')
zlabel('Altura (m)')
colorbar
axis vis3d

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%tabla%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc

% parametros
v0=input('Ingrese la velocidad inicial (m/s): '); % velocidad inicial
theta = input('Ingrese el angulo de elevacion (grados): ');
theta = theta*pi/180;

% constante
g = 9.81; % aceleracion 

% modelo fisico
x = v0*cos(theta)*t;
y = v0*sin(theta)*t-g*t.^2/2;

tabla = [t;x;y];

fprintf('\n Tiempo(s) Distancia(m) Altura(m)\n')
fprintf('%8.1f %13.4f %13.4f \n',tabla)

% resumen
% Definir variables
% Operaciones
% graficas 2D
% guardar datos -> tabla

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%guardar-tabla%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc

% parametros
v0 = 5;
t = 0:0.2:1;
theta = pi/4; % angulo 

% constante
g = 9.81; % aceleracion 

% modelo fisico
x = v0*cos(theta)*t;
y = v0*sin(theta)*t-g*t.^2/2;

tabla = [t;x;y];
% octave, matlab 

% guardar datos a archivo
% dat bin txt csv
% averiguar ext datos 

% imprimir
archivo = fopen('archivo.dat','w+');
fprintf('\n Tiempo(s) Distancia(m) Altura(m)\n');
fprintf(archivo,'%8.1f %13.4f %13.4f \n',tabla);
fclose(archivo);

% abrir los datos desde la terminal
% edit archivo.dat
clear
archivo = fopen('archivo.dat','r');
fscanf(archivo,'\n Tiempo(s) Distancia(m) Altura(m)\n')
tabla = fscanf(archivo,'%f %f %f\n',[3,11]);
fclose(archivo);


% imprima en la pantalla
fprintf('\n Tiempo(s) Distancia(m) Altura(m)\n')
fprintf('%8.1f %13.4f %13.4f \n',tabla)

% almacenar datos en una variable que se llama tabla
% guardar los datos almacenados de la variable tabla 
% en un archivo que se llama archivo.dat

% arreglar la grafica 3D

#Nicolas Torres
#jntorresr@udistrital.edu.co
# Semillero de modelamiento, simulacion y datos ABACOS






