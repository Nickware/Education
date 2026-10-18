function ejemplo_exponencial()
    fprintf('\n=== EJEMPLO: EXPONENCIAL COMPLEJA ===\n');

    z = 1i * linspace(0, 2*pi, 8);
    w = exponencial_compleja(z);

    fprintf('Exponencial compleja (puntos en círculo unitario):\n');
    for i = 1:length(z)
        fprintf('z = %6.2f + %6.2fi -> w = %6.2f + %6.2fi\n', ...
                real(z(i)), imag(z(i)), real(w(i)), imag(w(i)));
    end

    visualizar_transformacion(z, w, 'Exponencial e^z');
end