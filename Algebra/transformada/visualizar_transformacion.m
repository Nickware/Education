% Visualizar transformación en el plano complejo
function visualizar_transformacion(z, w, titulo)
    figure;
    
    subplot(1,2,1);
    plot(real(z), imag(z), 'bo', 'MarkerSize', 6, 'MarkerFaceColor', 'b');
    grid on;
    axis equal;
    title(['Original: ' titulo]);
    xlabel('Parte Real');
    ylabel('Parte Imaginaria');
    
    subplot(1,2,2);
    plot(real(w), imag(w), 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r');
    grid on;
    axis equal;
    title(['Transformada: ' titulo]);
    xlabel('Parte Real');
    ylabel('Parte Imaginaria');
    
    % Conectar puntos originales con transformados
    hold on;
    for i = 1:length(z)
        plot([real(z(i)), real(w(i))], [imag(z(i)), imag(w(i))], 'k--', 'LineWidth', 0.5);
    end
end

% Visualizar malla transformada
function visualizar_malla_transformada()
    % Crear malla en el plano complejo
    [X, Y] = meshgrid(-2:0.5:2, -2:0.5:2);
    Z = X + 1i * Y;
    
    % Aplicar transformación exponencial
    W = exp(Z);
    
    figure;
    
    subplot(1,2,1);
    plot(real(Z(:)), imag(Z(:)), 'b+', 'MarkerSize', 8);
    grid on; axis equal;
    title('Malla Original');
    xlabel('Re(z)'); ylabel('Im(z)');
    
    subplot(1,2,2);
    plot(real(W(:)), imag(W(:)), 'r+', 'MarkerSize', 8);
    grid on; axis equal;
    title('Malla Transformada (e^z)');
    xlabel('Re(w)'); ylabel('Im(w)');
end
