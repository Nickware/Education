% PROGRAMA PRINCIPAL - CLASSROOM INTERACTIVO
function classroom_transformaciones_complejas()
    fprintf('=== CLASSROOM DE TRANSFORMACIONES LINEALES COMPLEJAS ===\n');
    fprintf('Bienvenido al entorno educativo de transformaciones complejas\n');
    
    while true
        mostrar_menu();
        opcion = input('\nSelecciona una opción (1-7): ');
        
        switch opcion
            case 1
                ejemplo_rotacion();
                
            case 2
                fprintf('\n=== ESCALAMIENTO COMPLEJO ===\n');
                z = input('Ingresa vector complejo z (ej: [1+1i, 2-1i]): ');
                factor = input('Ingresa factor de escalamiento (real o complejo): ');
                w = escalamiento_complejo(z, factor);
                mostrar_resultados(z, w, 'Escalamiento');
                
            case 3
                fprintf('\n=== TRANSFORMACIÓN DE MÖBIUS ===\n');
                z = input('Ingresa vector complejo z: ');
                a = input('Parámetro a: ');
                b = input('Parámetro b: ');
                c = input('Parámetro c: ');
                d = input('Parámetro d: ');
                w = transformacion_mobius(z, a, b, c, d);
                mostrar_resultados(z, w, 'Möbius');
                
            case 4
                ejemplo_exponencial();
                
            case 5
                fprintf('\n=== TRANSFORMACIÓN LINEAL GENERAL ===\n');
                z = input('Ingresa vector 2D complejo (ej: [1+1i; 2-1i]): ');
                A = input('Ingresa matriz 2x2 compleja A: ');
                w = transformacion_lineal_general(z, A);
                mostrar_resultados(z, w, 'Lineal General');
                
            case 6
                visualizar_malla_transformada();
                
            case 7
                fprintf('¡Hasta luego!\n');
                break;
                
            otherwise
                fprintf('Opción no válida. Intenta de nuevo.\n');
        end
    end
end

% Función auxiliar para mostrar resultados
function mostrar_resultados(z, w, tipo)
    fprintf('\n%s:\n', tipo);
    for i = 1:length(z)
        fprintf('z%d = %6.2f + %6.2fi -> w%d = %6.2f + %6.2fi\n', ...
                i, real(z(i)), imag(z(i)), i, real(w(i)), imag(w(i)));
    end
    visualizar_transformacion(z, w, tipo);
end
