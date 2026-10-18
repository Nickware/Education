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
