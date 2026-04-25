# Análisis de una señal de audio en MATLAB/Octave
# Este código carga un archivo de audio, aplica una ventana de Hann para minimizar efectos de borde,
# realiza un análisis espectral utilizando la Transformada Rápida de Fourier (FFT) y visualiza tanto la señal temporal como su espectro de frecuencias.
# Asegúrate de tener el archivo 'test.wav' en el mismo directorio que este script o ajusta la ruta según sea necesario.
# Requiere los paquetes de audio y signal en Octave.
# Autor: N.Torres
# Fecha: Update 24/abr/2026
# Nota: Este código es compatible con MATLAB, pero se ha adaptado para funcionar en Octave utilizando los paquetes correspondientes.
# Para ejecutar este código, asegúrate de tener Octave instalado y los paquetes necesarios cargados. Puedes instalar los paquetes utilizando el comando 'pkg install' en Octave.
# Ejemplo de uso:
# 1. Guarda este código en un archivo llamado 'wave.m'.
# 2. Coloca un archivo de audio llamado 'test.wav' en el mismo directorio.
# 3. Ejecuta el script en Octave para ver los resultados.   
# Cargar paquetes necesarios
# En Octave, es necesario cargar explícitamente los paquetes para audio y procesamiento de señales.
# En MATLAB, estos paquetes están integrados, por lo que no es necesario cargarlos.
# Si estás utilizando MATLAB, puedes comentar las siguientes líneas de código.
pkg load audio;  % Cargar paquete de audio 
pkg load signal; % Cargar paquete de signal

%% Cargar archivo de audio
[audio, fs] = audioread('test.wav');
audio = audio(:,1);               % Convertir a mono si es estéreo
audio = audio - mean(audio);      % Eliminar componente DC
N = length(audio);

%% Preprocesamiento y ventaneo
n = 0:N-1;
ventana = 0.5*(1 - cos(2*pi*n/(N-1)))';  % Ventana de Hann
audio_ventaneado = audio .* ventana;     % Aplicar ventana

%% Análisis espectral
Y = fft(audio_ventaneado);
Y = abs(Y(1:floor(N/2)));        % Magnitud del espectro
Y = Y / max(Y);                  % Normalización
f = (0:(N/2)-1)*(fs/N);          % Vector de frecuencias

%% Visualización gráfica
figure('Position', [100 100 800 600]);

%% Gráfico temporal
subplot(2,1,1);
t = (0:N-1)/fs;
plot(t, audio, 'b');
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Señal original');
grid on;
xlim([0 t(end)]);

%% Gráfico frecuencial
subplot(2,1,2);
plot(f, Y, 'r');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud normalizada');
title('Espectro de frecuencias');
grid on;
xlim([0 4000]);  % Ajustar según necesidad

%% Opcional: Identificar componentes principales
[pks, idx] = findpeaks(Y);                % Solo detecta los picos
umbral = max(pks) * 0.1;                  % Define un umbral del 10% del máximo
idx_filtrados = idx(pks > umbral);        % Filtra por altura
pks_filtrados = pks(pks > umbral);        % Solo los picos válidos

%% Ordena por magnitud descendente
[~, orden] = sort(pks_filtrados, 'descend');
idx_ordenados = idx_filtrados(orden);

%% Por ejemplo, para los 5 picos más altos:
num_picos = min(5, length(idx_ordenados));
idx_finales = idx_ordenados(1:num_picos);
