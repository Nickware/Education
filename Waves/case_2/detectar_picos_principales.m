function [f_pico, mag_pico, fase_pico] = detectar_picos_principales(f, mag, fase, varargin)
  % DETECTAR_PICOS_PRINCIPALES  Identifica las componentes espectrales
  %                              dominantes de un espectro de magnitud.
  %
  %   [f_pico, mag_pico, fase_pico] = detectar_picos_principales(f, mag, fase, ...)
  %
  %   Parametros opcionales (nombre, valor):
  %     'num_picos'        Numero maximo de picos a devolver (default: 5)
  %     'umbral_relativo'  Fraccion del pico maximo por debajo de la cual se
  %                        descartan picos candidatos (default: 0.1)
  %     'dist_min_hz'      Separacion minima en Hz entre picos aceptados.
  %                        Evita reportar el mismo tono repetido en bins
  %                        adyacentes por fuga espectral (default: 2 veces
  %                        la resolucion en frecuencia f(2)-f(1))
  %
  %   Los picos se seleccionan de mayor a menor magnitud; un candidato solo
  %   se acepta si esta a mas de 'dist_min_hz' de todos los picos ya
  %   aceptados. El resultado se devuelve ordenado por frecuencia creciente.

  resolucion_hz = f(2) - f(1);
  opciones = struct('num_picos', 5, 'umbral_relativo', 0.1, ...
                     'dist_min_hz', 2*resolucion_hz);
  for k = 1:2:length(varargin)
    opciones.(varargin{k}) = varargin{k+1};
  end

  [pks, idx] = findpeaks(mag);
  if isempty(pks)
    f_pico = []; mag_pico = []; fase_pico = [];
    warning('detectar_picos_principales: no se encontraron picos en el espectro.');
    return;
  end

  umbral = opciones.umbral_relativo * max(pks);
  validos = pks > umbral;
  pks = pks(validos);
  idx = idx(validos);

  [~, orden] = sort(pks, 'descend');
  idx_ordenados = idx(orden);

  dist_min_bins = max(1, round(opciones.dist_min_hz / resolucion_hz));
  idx_finales = [];
  for k = 1:length(idx_ordenados)
    candidato = idx_ordenados(k);
    if isempty(idx_finales) || all(abs(candidato - idx_finales) >= dist_min_bins)
      idx_finales(end+1) = candidato;
    end
    if length(idx_finales) >= opciones.num_picos
      break;
    end
  end

  idx_finales = sort(idx_finales);  % orden creciente de frecuencia (mas legible)
  f_pico = f(idx_finales);
  mag_pico = mag(idx_finales);
  fase_pico = fase(idx_finales);
end
