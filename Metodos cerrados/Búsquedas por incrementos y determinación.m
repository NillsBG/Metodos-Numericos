% Definir la función
f = @(x) x.^3 - 6*x.^2 + 11*x - 6;

% Parámetros del método
x_min = 0; % Límite inferior
x_max = 4; % Límite superior
step = 0.01; % Tamaño del incremento
tol = 1e-6; % Tolerancia

% Búsqueda por incrementos
x_values = x_min:step:x_max;
roots = [];

for i = 1:length(x_values)-1
    if f(x_values(i)) * f(x_values(i+1)) < 0 % Cambio de signo
        root = fzero(f, [x_values(i), x_values(i+1)]); % Refinar con fzero
        roots = [roots, root];
    end
end

% Mostrar las raíces encontradas
fprintf('Raíces encontradas: x = %.6f, %.6f, %.6f\n', roots);