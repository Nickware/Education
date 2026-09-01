function componentes = reconstruir_componentes(t, freqs, mags, fases)
  % RECONSTRUIR_COMPONENTES  Reconstruye cada componente sinusoidal en el
  %                          dominio del tiempo a partir de su frecuencia,
  %                          magnitud y fase.
  %
  %   componentes = reconstruir_componentes(t, freqs, mags, fases)
  %
  %   'componentes' es una matriz [length(t) x length(freqs)]: la columna i
  %   corresponde a mags(i) * cos(2*pi*freqs(i)*t + fases(i)).
  %
  %   Nota: la fidelidad de esta reconstruccion depende de que 'freqs(i)'
  %   caiga cerca de un bin real de la FFT (resolucion = fs/N); frecuencias
  %   que no coinciden con la rejilla pueden mostrar fase/magnitud
  %   distorsionadas por fuga espectral.

  num = length(freqs);
  componentes = zeros(length(t), num);
  for i = 1:num
    componentes(:, i) = mags(i) * cos(2*pi*freqs(i)*t + fases(i));
  end
end
