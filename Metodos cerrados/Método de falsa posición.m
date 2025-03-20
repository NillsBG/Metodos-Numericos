% Definir la función
f = @(x) x.^3 - 6*x.^2 + 11*x - 6;

% Parámetros del método
a = 0; % Límite inferior
b = 4; % Límite superior
tol = 1e-6; % Tolerancia
max_iter = 100; % Número máximo de iteraciones

% Método de falsa posición
for iter = 1:max_iter
    fa = f(a);
    fb = f(b);
    c = (a * fb - b * fa) / (fb - fa); % Interpolación lineal
    if f(c) == 0 || abs(f(c)) < tol
        break; % Raíz encontrada
    end
    if fa * f(c) < 0
        b = c; % La raíz está en [a, c]
    else
        a = c; % La raíz está en [c, b]
    end
end

% Mostrar la raíz encontrada
fprintf('Raíz encontrada: x = %.6f\n', c);