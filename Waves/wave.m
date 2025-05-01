pkg load audio;  % Cargar paquete de audio si es necesario
pkg load signal;

%% 1. Cargar archivo de audio
[audio, fs] = audioread('test.wav');
audio = audio(:,1);               % Convertir a mono si es estéreo
audio = audio - mean(audio);      % Eliminar componente DC
N = length(audio);

%% 2. Preprocesamiento y ventaneo
n = 0:N-1;
ventana = 0.5*(1 - cos(2*pi*n/(N-1)))';  % Ventana de Hann
audio_ventaneado = audio .* ventana;     % Aplicar ventana

%% 3. Análisis espectral
Y = fft(audio_ventaneado);
Y = abs(Y(1:floor(N/2)));        % Magnitud del espectro
Y = Y / max(Y);                  % Normalización
f = (0:(N/2)-1)*(fs/N);          % Vector de frecuencias

%% 4. Visualización gráfica
figure('Position', [100 100 800 600]);

% Gráfico temporal
subplot(2,1,1);
t = (0:N-1)/fs;
plot(t, audio, 'b');
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Señal original');
grid on;
xlim([0 t(end)]);

% Gráfico frecuencial
subplot(2,1,2);
plot(f, Y, 'r');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud normalizada');
title('Espectro de frecuencias');
grid on;
xlim([0 4000]);  % Ajustar según necesidad

%% Opcional: Identificar componentes principales
%[~, idx] = findpeaks(Y, 'MinPeakHeight',0.1, 'SortStr','descend');
%disp('Componentes principales:');
%disp([f(idx(1:5))' Y(idx(1:5))]);  % Muestra 5 frecuencias principales
