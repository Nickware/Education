# Análisis de componentes sinusoidales en una señal de audio
# Este script carga un archivo de audio, realiza un análisis espectral utilizando la FFT,
# identifica las componentes sinusoidales principales y visualiza tanto la señal temporal como las componentes identificadas.
# Asegúrate de tener el archivo 'test.wav' en el mismo directorio que
# este script o ajusta la ruta según sea necesario.
# Requiere los paquetes de audio y signal en Octave.
# Autor: N.Torres
# Fecha: Update 24/abr/2026
# Nota: Este código es compatible con MATLAB, pero se ha adaptado para funcionar en Octave.
# Para ejecutar este código, asegúrate de tener Octave instalado y los paquetes necesarios cargados. Puedes instalar los paquetes utilizando el comando 'pkg install' en Octave.
# Ejemplo de uso:
# 1. Guarda este código en un archivo llamado 'wave_v.2.m'.
# 2. Coloca un archivo de audio llamado 'test.wav' en el mismo directorio.
# 3. Ejecuta el script en Octave para ver los resultados.
# Cargar paquetes necesarios
# En Octave, es necesario cargar explícitamente los paquetes para audio y procesamiento de señales.
# En MATLAB, estos paquetes están integrados, por lo que no es necesario cargarlos.
# Si estás utilizando MATLAB, puedes comentar las siguientes líneas de código.

pkg load audio;  % Cargar paquete de audio 
pkg load signal; % Cargar paquete de signal

%% Cargar el archivo de audio
[audio, fs] = audioread('test.wav');
audio = audio(:,1);            % Convertir a mono si es estéreo
audio = audio - mean(audio);   % Eliminar componente DC

%% Preparar datos
N = length(audio);
t = (0:N-1)/fs;                % Vector de tiempo

%% Calcular la FFT
X = fft(audio);
half = floor(N/2);
X_half = X(1:half);            % Mitad del espectro
frequencies = (0:half-1)*(fs/N);

%% Obtener magnitud y fase
magnitude = abs(X_half)/(N/2); % Normalizar magnitud
phase = angle(X_half);         % Obtener fase en radianes

%% Encontrar picos principales 
[pks, locs] = findpeaks(magnitude);      % Solo el vector, sin argumentos extra

umbral = max(pks) * 0.1;                % Umbral del 10% del máximo
idx_validos = find(pks > umbral);       % Índices de picos válidos

pks_filtrados = pks(idx_validos);
locs_filtrados = locs(idx_validos);

[~, orden] = sort(pks_filtrados, 'descend');
locs_ordenados = locs_filtrados(orden);
pks_ordenados = pks_filtrados(orden);

num_comp = min(5, length(locs_ordenados)); % Mostrar máximo 5 componentes
locs_finales = locs_ordenados(1:num_comp);
pks_finales = pks_ordenados(1:num_comp);

%% Visualización
figure('Position', [100 100 900 800]);

% Señal original
subplot(3,1,1);
plot(t, audio);
xlabel('Tiempo (s)'); ylabel('Amplitud');
title('Señal original');
grid on;
xlim([0 min(1, t(end))]);

%% Espectro de frecuencias
subplot(3,1,2);
stem(frequencies, magnitude, 'filled', 'MarkerSize', 2);
xlabel('Frecuencia (Hz)'); ylabel('Magnitud');
title('Espectro de magnitud (FFT)');
grid on;
xlim([0 2000]);

%% Componentes sinusoidales principales
subplot(3,1,3);
hold on;
colors = {'c', 'm', 'g', 'r', 'b'};
legend_str = {};

for i = 1:num_comp
    freq = frequencies(locs_finales(i));
    mag = magnitude(locs_finales(i));
    ph = phase(locs_finales(i));
    component = mag * cos(2 * pi * freq * t + ph);
    plot(t, component, colors{mod(i-1,5)+1}, 'LineWidth', 1.5);
    legend_str{i} = sprintf('%.1f Hz', freq);
end

xlabel('Tiempo (s)'); ylabel('Amplitud');
title('Componentes seno/coseno principales');
legend(legend_str);
hold off;
grid on;
xlim([0 min(1, t(end))]);

%% Mostrar frecuencias principales en consola
disp('Frecuencias principales (Hz) y magnitudes:');
for i = 1:num_comp
    freq = frequencies(locs_finales(i));
    mag = magnitude(locs_finales(i));
    fprintf('%.2f Hz (magnitud: %.4f)\n', freq, mag);
end
