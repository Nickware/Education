% Comentarios
% tildes
disp "hola" % no pertinente
disp 'hola' % pertinente 

% variables
a = 1; 
y = a*1; 
9+6/8+5
(9+6)/(8*5)
sin 

% graficas
x = -pi:0.01:pi;
plot(x,sin(x)), grid on

% grafica mas compleja
x = linspace(-2*pi,2*pi);
y1 = sin(x);
y2 = cos(x);

figure
plot(x,y1,x,y2)

% eliminacion gausiana

B = [1 2 3 4; 0 -2 -4 6; 1 -1 0 0] % definir matriz
B(1,:) % seleccione una fila
% aplicando operacion entre filas
B(3,:)=(-1)*B(1,:)+B(3,:) % operar entre filas

B(3,:)= -1.5*B(2,:)+B(3,:) % reeemplazar la fila 3 por, multiplicar por -1.5 la fila 2 y agregar la fila 3

power(5,3)

% iteracion

% programa que calcule paso a paso la eliminacion gausiana de una matriz
% mxn

% ¿Es posible que los resultados despues de reducir la matriz en MATLAB o
% OCTAVE, el software los arroje como fraccionarios?

% ingenieria INVERSA

% fplot fprint history

% formato de las matrices debe ser en enteros

% posible solucion, buscar format style, numeros enteros 

% división de matrices

A=B(:,1:3) % Variable cuya asignación (filas, columnas), reduce la matriz

% matlab y octave diferencian mayusculas de minusculas

% Resolver el sistema AX=b

% Eliminacion gausiana
% left division == Resolver el sistema AX=b

% desistalar todas versiones de matlab
% instalo un clear registro 
% pasar limpiador de registro 

% confirmar que sus SO cumple con los requisitos
% instalarlo - administrador, sistema fallos (sin internet - minimos
% requerimientos de funcionamiento)

% plan B no funciona, formatear el SO, reinstalarlo

% Eliminacion gausiana, metodo descomposicion, matriz factorizacion

% contrastando con el metodo analitico A=LU
% A=LU matrices triangulares

U=[1 2 3; 0 -2 -4; 0 0 3] % tiene que llegar analiticamente a este resultado
L=[1 0 0; 0 1 0; 1 1.5 1] %operaciones intermedias

% metodologia se resume en dos TRIANGULARES

% Solviendo Ly=b
% Solviendo Ux=y

% b -> matriz con una columna 
% L, U

% LU descompisicion (con permutacion) PA=LU Matriz por permutacion
%PA=LU analitica evaluar
% borre las variables
clear L 
clear U

[L U P]= lu(A)

%Aplicacion
%polynomial curve fitting
% A partir de una curva, ajustar a curva, polinomial (configurar una matrix)
%optimizar

% transformar matrices

% Vectores **
% espacios vectorial
% mapear el espacio vectorial
% meshgrid contourf contour surf
 %Recurso
%https://la.mathworks.com/help/curvefit/polynomial-curve-fitting.html?s_tid=srchtitle_%2525polynomial%20curve%20fitting_1

%jntorresr@udistrital.edu.co
%Nicolas Torres
%Semillero de Modelamiento, Simulacion y Analisis de Datos
