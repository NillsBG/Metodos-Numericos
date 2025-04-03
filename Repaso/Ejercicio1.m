clc; clear; close all;

% ----------------------------------------------
% Definición de la función y su derivada
% ----------------------------------------------
f = @(x) x.^3 - 2*x - 5;
df = @(x) 3*x.^2 - 2;

% Parámetros
tol = 1e-6;
max_iter = 100;

% ----------------------------------------------
% Método de Newton-Raphson con x0 = 2
% ----------------------------------------------
fprintf('Método de Newton-Raphson (x0 = 2)\n');
fprintf('Iteración |    x         |    f(x)      | Error Relativo Aproximado\n');
fprintf('------------------------------------------------------------------\n');

x = 2;
iter = 0;

while true
    x_new = x - f(x)/df(x);
    iter = iter + 1;
    
    if iter == 1
        err_rel = NaN;
    else
        err_rel = abs(x_new - x) / abs(x_new);
    end
    
    fprintf('%9d | %11.6f | %11.6f | %24.6f\n', iter, x_new, f(x_new), err_rel);
    
    if iter >= 3
        break;
    end
    
    x = x_new;
end

fprintf('Raíz aproximada por Newton-Raphson: %.6f\n\n', x_new);

% ----------------------------------------------
% Método de la Secante con x0 = 1, x1 = 2
% ----------------------------------------------
fprintf('Método de la Secante (x0 = 1, x1 = 2)\n');
fprintf('Iteración |    x0        |    x1        |    x_new     | f(x_new)   | Error Relativo\n');
fprintf('------------------------------------------------------------------------------\n');

x0 = 1;
x1 = 2;

for iter = 1:3
    f0 = f(x0);
    f1 = f(x1);
    
    x_new = x1 - f1*(x1 - x0)/(f1 - f0);
    err_rel = abs(x_new - x1) / abs(x_new);
    
    fprintf('%9d | %11.6f | %11.6f | %11.6f | %11.6f | %16.6f\n', iter, x0, x1, x_new, f(x_new), err_rel);
    
    x0 = x1;
    x1 = x_new;
end

fprintf('Raíz aproximada por Secante: %.6f\n', x_new);
