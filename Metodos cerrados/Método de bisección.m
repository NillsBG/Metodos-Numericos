% Definir la función
f = @(x) x.^3 - 6*x.^2 + 11*x - 6;

% Parámetros del método
a = 0; % Límite inferior
b = 4; % Límite superior
tol = 1e-6; % Tolerancia
max_iter = 100; % Número máximo de iteraciones

% Método de bisección
for iter = 1:max_iter
    c = (a + b) / 2; % Punto medio
    if f(c) == 0 || (b - a) / 2 < tol
        break; % Raíz encontrada
    end
    if f(a) * f(c) < 0
        b = c; % La raíz está en [a, c]
    else
        a = c; % La raíz está en [c, b]
    end
end

% Mostrar la raíz encontrada
fprintf('Raíz encontrada: x = %.6f\n', c);