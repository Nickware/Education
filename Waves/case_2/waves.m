% waves.v.2.m - Descomposicion de una senal de audio en componentes seno/coseno
%
% Carga un archivo de audio, calcula magnitud y fase por FFT, detecta las
% componentes sinusoidales dominantes y las reconstruye/grafica por
% separado. Ver README.md para la documentacion completa y la comparacion
% metodologica con waves.m.
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

%% Espectro con magnitud absoluta (necesaria para reconstruir componentes
%% con sentido fisico) y fase
% tipo_ventana = 'hann'   -> reduce fugas espectrales y mejora la
%                            separacion entre picos cercanos (recomendado)
% tipo_ventana = 'ninguna' -> preserva el comportamiento de la version
%                             original de este script
tipo_ventana = 'hann';
[f, mag, fase] = calcular_espectro(audio, fs, tipo_ventana);

%% Deteccion de componentes principales
resolucion_hz = fs / N;
[freqs_pico, mag_pico, fase_pico] = detectar_picos_principales(f, mag, fase, ...
    'num_picos', 5, 'umbral_relativo', 0.1, 'dist_min_hz', 3*resolucion_hz);

%% Reconstruccion de cada componente en el dominio del tiempo
componentes = reconstruir_componentes(t, freqs_pico, mag_pico, fase_pico);

%% Visualizacion
graficar_descomposicion(t, audio, f, mag, freqs_pico, componentes, fs);

%% Salida en consola
disp('Frecuencias principales (Hz) y magnitudes:');
for i = 1:length(freqs_pico)
  fprintf('%.2f Hz (magnitud: %.4f)\n', freqs_pico(i), mag_pico(i));
end
