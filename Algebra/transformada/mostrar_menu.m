% =============================================
% CLASE: TRANSFORMACIONES LINEALES COMPLEJAS
% =============================================

function mostrar_menu()
    fprintf('\n=== TRANSFORMACIONES LINEALES COMPLEJAS ===\n');
    fprintf('1. Rotación compleja\n');
    fprintf('2. Escalamiento complejo\n');
    fprintf('3. Transformación de Möbius\n');
    fprintf('4. Exponencial compleja\n');
    fprintf('5. Transformación lineal general\n');
    fprintf('6. Visualizar transformación\n');
    fprintf('7. Salir\n');
end

% Función para rotación compleja
function w = rotacion_compleja(z, theta)
    % z: vector complejo
    % theta: ángulo de rotación en radianes
    w = z * exp(1i * theta);
end

% Función para escalamiento complejo
function w = escalamiento_complejo(z, factor)
    % factor: puede ser real o complejo
    w = z * factor;
end

% Transformación de Möbius
function w = transformacion_mobius(z, a, b, c, d)
    % Transformación: w = (a*z + b) / (c*z + d)
    w = (a * z + b) ./ (c * z + d);
end

% Exponencial compleja
function w = exponencial_compleja(z)
    w = exp(z);
end

% Transformación lineal general
function w = transformacion_lineal_general(z, A)
    % A: matriz compleja 2x2 para transformación en R^2
    if length(z) == 1
        error('Para transformación general, z debe ser vector de 2 elementos');
    end
    w = A * z;
end
