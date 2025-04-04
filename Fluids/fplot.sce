function z = f(x, y)
    z = sin(sqrt(x.^2 + y.^2)) ./ sqrt(x.^2 + y.^2);
endfunction

range = linspace(-8, 8, 41);
[X, Y] = meshgrid(range, range);
Z = f(X, Y);
surf(X, Y, Z);
