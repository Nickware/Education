% Ejemplo 1: Rotación de puntos
function ejemplo_rotacion()
    fprintf('\n=== EJEMPLO: ROTACIÓN COMPLEJA ===\n');
    
    % Puntos de ejemplo en el plano complejo
    z = [1+1i, -1+1i, -1-1i, 1-1i, 2+0i, 0+2i];
    theta = pi/4; % 45 grados
    
    w = rotacion_compleja(z, theta);
    
    fprintf('Rotación de %.2f radianes:\n', theta);
    for i = 1:length(z)
        fprintf('z = %6.2f + %6.2fi -> w = %6.2f + %6.2fi\n', ...
                real(z(i)), imag(z(i)), real(w(i)), imag(w(i)));
    end
    
    visualizar_transformacion(z, w, 'Rotación π/4');
end

% Ejemplo 2: Transformación de Möbius
function ejemplo_mobius()
    fprintf('\n=== EJEMPLO: TRANSFORMACIÓN DE MÖBIUS ===\n');
    
    z = [-2+0i, -1+0i, 0+0i, 1+0i, 2+0i, 0+1i, 0-1i];
    a = 1; b = 0; c = 0; d = 1;
    
    w = transformacion_mobius(z, a, b, c, d);
    
    fprintf('Transformación identidad:\n');
    for i = 1:length(z)
        fprintf('z = %6.2f + %6.2fi -> w = %6.2f + %6.2fi\n', ...
                real(z(i)), imag(z(i)), real(w(i)), imag(w(i)));
    end
    
    visualizar_transformacion(z, w, 'Möbius Identidad');
end

% Ejemplo 3: Exponencial compleja
function ejemplo_exponencial()
    fprintf('\n=== EJEMPLO: EXPONENCIAL COMPLEJA ===\n');
    
    % Puntos a lo largo del eje imaginario
    z = 1i * linspace(0, 2*pi, 8);
    w = exponencial_compleja(z);
    
    fprintf('Exponencial compleja (puntos en círculo unitario):\n');
    for i = 1:length(z)
        fprintf('z = %6.2f + %6.2fi -> w = %6.2f + %6.2fi\n', ...
                real(z(i)), imag(z(i)), real(w(i)), imag(w(i)));
    end
    
    visualizar_transformacion(z, w, 'Exponencial e^z');
end
