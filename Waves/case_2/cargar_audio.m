function [audio, fs, t, N] = cargar_audio(archivo)
  % CARGAR_AUDIO  Carga un archivo de audio, lo reduce a mono y elimina la
  %               componente DC.
  %
  %   [audio, fs, t, N] = cargar_audio(archivo)
  %
  %   Entradas:
  %     archivo  Ruta al archivo .wav (u otro formato soportado por audioread)
  %
  %   Salidas:
  %     audio    Vector columna con la senal (mono, sin componente DC)
  %     fs       Frecuencia de muestreo (Hz)
  %     t        Vector de tiempo asociado a 'audio' (s)
  %     N        Numero de muestras

  if ~exist(archivo, 'file')
    error('cargar_audio: no se encontro el archivo "%s" en el directorio actual.', archivo);
  end

  [audio, fs] = audioread(archivo);
  if size(audio, 2) > 1
    audio = audio(:, 1);   % Convertir a mono usando el primer canal
  end
  audio = audio - mean(audio);
  N = length(audio);
  t = (0:N-1)'/fs;
end
