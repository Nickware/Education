% waves.m - Analisis espectral basico de una senal de audio
%
% Carga un archivo de audio, aplica una ventana de Hann, calcula su
% espectro normalizado y detecta las cinco frecuencias principales.
% Ver README.md para la documentacion completa y la comparacion
% metodologica con waves.v.2.m.
%
% Requiere los paquetes 'audio' y 'signal', y el directorio lib/ en el
% mismo lugar que este script.
%
% Autor: N. Torres
% Fecha: Actualizado 31/ago/2026

pkg load audio;
pkg load signal;
addpath('lib');

archivo = 'test.wav';
[audio, fs, t, N] = cargar_audio(archivo);

%% Espectro (ventaneo de Hann para reducir fugas espectrales)
[f, mag, fase] = calcular_espectro(audio, fs, 'hann');
mag = mag / max(mag);   % Normalizacion relativa: solo para comparar la FORMA
                         % del espectro, no representa amplitud fisica real
                         % (para eso, ver waves.v.2.m).

%% Deteccion de las 5 frecuencias principales
% (la fase se calcula igual, pero waves.m no la necesita: solo interesa
% la forma del espectro de magnitud)
resolucion_hz = fs / N;
[freqs_pico, mag_pico, ~] = detectar_picos_principales(f, mag, fase, ...
    'num_picos', 5, 'umbral_relativo', 0.1, 'dist_min_hz', 2*resolucion_hz);

%% Visualizacion
graficar_analisis_basico(t, audio, f, mag, freqs_pico, fs);

%% Salida en consola
disp('Frecuencias principales detectadas (Hz):');
for i = 1:length(freqs_pico)
  fprintf('%.2f Hz (magnitud relativa: %.3f)\n', freqs_pico(i), mag_pico(i));
end
