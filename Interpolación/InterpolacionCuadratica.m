clc;
function [y_interp, error] = interpolacionCuadratica(x, y, x_interp)

% Inicialización
y_interp = zeros(size(x_interp));
error = zeros(size(x_interp));

y_real = log(x_interp); 

if length(x) < 3
    
    error('Se necesitan al menos 3 nodos para la interpolación cuadrática.');
    return;
end

for i = 1:length(x_interp)

    [~, idx] = sort(abs(x - x_interp(i))); 
    x_usados = x(idx(1:3));
    y_usados = y(idx(1:3));

    L0 = ((x_interp(i) - x_usados(2)) * (x_interp(i) - x_usados(3))) / ((x_usados(1) - x_usados(2)) * (x_usados(1) - x_usados(3)));
    L1 = ((x_interp(i) - x_usados(1)) * (x_interp(i) - x_usados(3))) / ((x_usados(2) - x_usados(1)) * (x_usados(2) - x_usados(3)));
    L2 = ((x_interp(i) - x_usados(1)) * (x_interp(i) - x_usados(2))) / ((x_usados(3) - x_usados(1)) * (x_usados(3) - x_usados(2)));

    y_interp(i) = y_usados(1) * L0 + y_usados(2) * L1 + y_usados(3) * L2;

    error(i) = abs(((y_interp(i) - y_real(i))/y_real(i))*100);
end
end

x = [1, 2, 3]; 
y = [log(1), log(2), log(3)];

x_interp = 2;


[y_interp, error] = interpolacionCuadratica(x, y, x_interp);


fprintf('Resultados de la Interpolación Cuadrática para ln(2):\n');
fprintf('x = %.2f, y_interp (ln(2)) = %.4f, Error = %.4f\n', x_interp, y_interp, error);