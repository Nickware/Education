% crear archivo desde la terminal

edit nombreArchivo.m

% cdate == year
% pop == population

plot(cdate,pop,'o')

%o style plot
%manera de mostrar la linea de la grafica

% %Aplicacion
%polynomial curve fitting
% A partir de una curva, ajustar a curva, polinomial (configurar una matrix)
%optimizar

D = [1 1; 2 2; 3 5; 4 4; 5 2; 6 -3]

xdata = D(:,1) % primera columna
ydata = D(:,2) % segunda columna

% manipular las filas como variables

% ejemplo para la casa
% guardar datos en extension .dat, bin, cvs, xls

%copie y los guarde de la manera
edit nombre.dat

doc ones

% magic ones zeros

% parantesis
%genero matriz de 10*10
matrix = magic(10)
%mostrar una grafica aparti de esa matriz
imagesc(matrix)
%*****************
% metodo de ajuste por matrices -- Minimos cuadrados
A(:,1) = xdata.^2 % operaciones con columnas -- variables son datos

% ecuaciones normales A*A AT*P
% tarea A'.A

B =A'A

%genere unas ecuaciones asociadas "ecuaciones normales"
% buscar un ajuste de un polinomio con datos"
% datos
% matriz ones
% cambie filas por columnas A'
% encontrar ecuacion normal
% ajustela a unos ydata
rref(B)
% y = ax^2+bx+c
% y = -0.1194x^2+3.6441x-0

x = linspace(0,5,50);

y = -0.1194*x.^2+3.6441*x-0; % y extraño, rectificar
y = -0.8929*x^2+5.6500*x-4.4000 % matlab  via polyfit

plot(xdata, ydata,'o', x,y,'linewidth',2)
grid on
legend('valores datos', 'parabola-minimos cuadrados')
title('y = -0.8929*x^2+5.6500*x-4.4000')

%polyfit
% reevaluar con el metodo para llegar a title('y = -0.8929*x^2+5.6500*x-4.4000')

D = [1 1 3 3 2 1 3; 2 0 0 2 3 2 2]

x = D(1,:);
y = D(2,:);

% concepto 
% R = [cos(theta) -sin(theta; sin(theta) cos(theta]
% 90 grados
% matriz RD % operacion de rotacion

% 90 grados
theta1 = 90*pi/180;
R1 = [cos(theta1) -sin(theta1); sin(theta1) cos(theta1)];

RD1 =R1*D;
x1 = RD1(1,:);
y1 = RD1(2,:);

% 225 grados de rotacion
theta2 = 225*pi/180;
R2 = [cos(theta2) -sin(theta2); sin(theta2) cos(theta2)];
RD2 =R2*D;
x2 = RD2(1,:);
y2 = RD2(2,:);
% b=blue r=red
plot(x, y, 'bo-',x1,y1,'ro-',x2, y2,'go-')
axis([-4 4 -4 4],'igual')
grid on
legend('originales','rotacion en 90 grados','rotacion de 225 grados')

%legenda se vea fuera del cuadro
% guardar la imagen con dimensiones pixeles, unidades cm, in
% legend ubicar bottom
% 

%topicos para explorar
% reflexiones de matrices
% dilataciones de matrices
% transformaciones lineales, no lineales
