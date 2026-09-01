function graficar_analisis_basico(t, audio, f, mag, freqs_pico, fs)
  % GRAFICAR_ANALISIS_BASICO  Grafica la senal temporal y su espectro,
  %                           marcando las frecuencias principales.
  %
  %   graficar_analisis_basico(t, audio, f, mag, freqs_pico, fs)
  %
  %   El limite del eje de frecuencias se ajusta a min(4000, fs/2) para no
  %   exceder nunca la frecuencia de Nyquist real de la senal cargada.

  if nargin < 6 || isempty(fs)
    fs = 2*f(end);
  end
  xlim_espectro = min(4000, fs/2);

  figure('Position', [100 100 800 600]);

  subplot(2,1,1);
  plot(t, audio, 'b');
  xlabel('Tiempo (s)'); ylabel('Amplitud');
  title('Senal original');
  grid on;
  xlim([0 t(end)]);

  subplot(2,1,2);
  plot(f, mag, 'r'); hold on;
  [~, idx_marcar] = ismember(freqs_pico, f);
  idx_marcar = idx_marcar(idx_marcar > 0);
  plot(f(idx_marcar), mag(idx_marcar), 'ko', 'MarkerFaceColor', 'k');
  hold off;
  xlabel('Frecuencia (Hz)'); ylabel('Magnitud normalizada');
  title('Espectro de frecuencias');
  grid on;
  xlim([0 xlim_espectro]);
end
