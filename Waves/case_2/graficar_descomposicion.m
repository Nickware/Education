function graficar_descomposicion(t, audio, f, mag, freqs_pico, componentes, fs)
  % GRAFICAR_DESCOMPOSICION  Grafica la senal original, el espectro con los
  %                          picos marcados, y las componentes sinusoidales
  %                          reconstruidas.
  %
  %   graficar_descomposicion(t, audio, f, mag, freqs_pico, componentes, fs)

  if nargin < 7 || isempty(fs)
    fs = 2*f(end);
  end
  xlim_espectro = min(2000, fs/2);
  xlim_tiempo = min(1, t(end));

  figure('Position', [100 100 900 800]);

  subplot(3,1,1);
  plot(t, audio);
  xlabel('Tiempo (s)'); ylabel('Amplitud');
  title('Senal original');
  grid on;
  xlim([0 xlim_tiempo]);

  subplot(3,1,2);
  stem(f, mag, 'filled', 'MarkerSize', 2); hold on;
  [~, idx_marcar] = ismember(freqs_pico, f);
  idx_marcar = idx_marcar(idx_marcar > 0);
  plot(f(idx_marcar), mag(idx_marcar), 'ro', 'MarkerFaceColor', 'r');
  hold off;
  xlabel('Frecuencia (Hz)'); ylabel('Magnitud');
  title('Espectro de magnitud (FFT)');
  grid on;
  xlim([0 xlim_espectro]);

  subplot(3,1,3);
  hold on;
  colores = {'c', 'm', 'g', 'r', 'b'};
  legend_str = {};
  for i = 1:length(freqs_pico)
    plot(t, componentes(:,i), colores{mod(i-1, numel(colores))+1}, 'LineWidth', 1.5);
    legend_str{i} = sprintf('%.1f Hz', freqs_pico(i));
  end
  hold off;
  xlabel('Tiempo (s)'); ylabel('Amplitud');
  title('Componentes seno/coseno principales');
  if ~isempty(legend_str)
    legend(legend_str);
  end
  grid on;
  xlim([0 xlim_tiempo]);
end
