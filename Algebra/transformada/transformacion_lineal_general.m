function w = transformacion_lineal_general(z, A)
    if length(z) == 1
        error('Para transformación general, z debe ser vector de 2 elementos');
    end
    w = A * z;
end