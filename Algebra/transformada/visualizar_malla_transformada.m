function visualizar_malla_transformada()
    [X, Y] = meshgrid(-2:0.5:2, -2:0.5:2);
    Z = X + 1i * Y;
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