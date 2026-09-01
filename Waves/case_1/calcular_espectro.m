function [f, mag, fase] = calcular_espectro(senal, fs, tipo_ventana)
  % CALCULAR_ESPECTRO  Calcula el espectro de magnitud y fase de una senal real
  %                    a partir de la mitad positiva de su FFT.
  %
  %   [f, mag, fase] = calcular_espectro(senal, fs, tipo_ventana)
  %
  %   tipo_ventana: 'hann'    aplica ventana de Hann antes de la FFT (reduce
  %                           fugas espectrales, recomendado para deteccion
  %                           de picos cercanos).
  %                 'ninguna' FFT directa sobre la senal sin modificar
  %                           (comportamiento de la version original de
  %                           waves.v.2.m).
  %                 Por defecto: 'ninguna'.
  %
  %   'mag' queda expresada en las mismas unidades de amplitud que 'senal':
  %   se corrige por la ganancia coherente de la ventana (su valor medio),
  %   de modo que activar el ventaneo NO altera la escala de magnitud
  %   reportada, solo mejora la nitidez de los picos.

  if nargin < 3
    tipo_ventana = 'ninguna';
  end

  senal = senal(:);
  N = length(senal);

  switch tipo_ventana
    case 'hann'
      n = (0:N-1)';
      ventana = 0.5*(1 - cos(2*pi*n/(N-1)));
      senal_proc = senal .* ventana;
      ganancia_coherente = mean(ventana);
    case 'ninguna'
      senal_proc = senal;
      ganancia_coherente = 1;
    otherwise
      error('calcular_espectro: tipo_ventana debe ser ''hann'' o ''ninguna''.');
  end

  X = fft(senal_proc);
  half = floor(N/2);
  X_half = X(1:half);

  mag = abs(X_half) / (N/2 * ganancia_coherente);
  fase = angle(X_half);
  f = (0:half-1)'*(fs/N);
end
