% comentarios
% tildes 
disp "hola" % no pertinente
disp 'hola' % pertinente

% variables
b = 1;
y = b*1;

% matlab como calculadora
9+6/8*5
(9+6)/(8*5)

% funciones trigonometricas
sin

% Averiguar en la documentacion octave o matlab, emplear angulos en grados
x = -pi:0.01:pi;
plot(x, sin(x)), 
grid on

% comandos claves
clc % limpia mi ventana de comandos
clear % borrar todas las variables almacenadas
doc % comando que permite consultar toda la documentacion

% grafica mas compleja
x = linspace(-2*pi,2*pi)
y1 = sin(x);
y2 = cos(x);

figure
plot(x,y1,'o',x,y2,'-')

% si deseo emplear colores width 2
% doc comando

%limites, secuencias y series
%lim n -> inf (1+1/n)^n
% e aproximadamente igual  lim n -> inf (1+1/n)^n

f = @(n) (1+1./n).^n; % funcion anonima

k = [0 : 1 : 9] % variable

% formato a mis datos
% explorar comando format 
format long % numero con decimales 

n = 10.^k; % lista de potencias multiplos de 10

f(n)

% averiguar como se escriben las constantes

% conclusion: cuando se evalua n con potencias de 10, 
% el limite de la funcion f(n) converge a e

% series
% sumatoria desde n=2 hasta inf an
% an=1/n(n+2)
% calcular los primeros 10 terminos
% graficar
% metodo 1
n = [ 2: 11]; % fila vector, vector de puntos  
a = 1./(n.*(n+2)) % terminos de mi secuencia

% los arreglos se cuentan desde 0
% matlab, octave, python, r, julia, % lenguajes de cauerta generacion

% tarea casa
% hacerlo analiticamente desde 0 a 9
% hacerlo analiticamente desde 2 a 11

% iteracion
% ciclo de evaluacion loops for
% metodo 2
for i=1:10 % intervalo 1 hasta 10
    s(i)=sum(a(1:i)); % sumatoria doc sum
end
% comparar los resultados de ambos metodos

plot(n,a, 'o',n, s,'+')
grid on
legend('terminos', 'sumas parciales')

% conocemos que converge la serie
% estimamos una suma

% Serie armonica
%an= sumatoria n=1 hasta 1000 
% a = 1/n

n = [1 : 1000]; % vector de puntos
a = 1./n;
sum(a)

% limite superior usando notacion cientifica -> numero grande

n = [1 : 1e6];
a = 1./n;
sum(a)

% series armonicas y su relacion con el factorial
%factorial(15)

% limites
% series 

% evaluar el navegador (chrome, firefox, safari, opera, microsoft edge
% borrar el cache del navedador -> configuracion -historial -matlab
% cambio de navegador
% reinicio mi equipo -> liberar memoria
% invitaria a instalar octave
% invitaria a instalar matlab
% emplear octave en linea

% ecuaciones parametricas
% construir dos funciones 
% graficar
% curvas polares, 
% funciones implicitas

% ecuaciones parametricas - cicloides
%x = r(t-sin(t))
%y = r(1-cos(t))
% r = 2;
% periodo 2pi
% 0 < t < 6pi
% t, x, y

t = linspace(0,6*pi,50);
x = 2*(t-sin(t));
y = 2*(t-cos(t));

plot(x,y)
axis('equal')
axis([0 12*pi 0 8])

% escalar la imagen
% grafica polares r=f(theta)

% limacon
% grafica cuya funcion esta definida como
% r = 1-sin(theta)
% r =1 

%***
% teorema de pitagoras
% r = x^2+y^2
% x = r.*cos(theta)
% y = r.*sin(theta)
% dibujar el plano
% ubicar sin, cos, r=1
% circulo

% grafica polar a mano
theta = linspace(0, 2*pi, 100);
r = 1 -2*sin(theta);
x = r.*cos(theta);
y = r.*sin(theta);

plot(x,y)

% grafica polar con matlab
% r=f(theta)
theta = linspace(0, 2*pi, 50);
r = 1 -2*sin(theta);
polar(theta,r)

% graficas implicitas
%forma f(x,y)=0
% -x^2-xy+x-y^2-y=1
theta = linspace(0, 2*pi, 50);
r = 1 -2*sin(theta);
x = r.*cos(theta);
y = r.*sin(theta);

% validar la funcion @(x,y) para fplot, ezplot
f = @(x,y) -x.^2-x.*y+x-y.^2-y-1
% comparar f @(x,y) con ***

fplot(xt,yt)

ezplot(f)


% calculo simbolico
% repasar el cuaderno de apuntes
% doc
