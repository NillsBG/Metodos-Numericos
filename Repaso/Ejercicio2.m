clc; clear; close all;

% ----------------------------------------------
% Parte a) Verificar existencia de raíz en [1.5, 2.5]
% ----------------------------------------------
f = @(x) x.^3 - 6*x.^2 + 11*x - 6;

a0 = 1.5;
b0 = 2.5;

if f(a0) * f(b0) < 0
    fprintf('Existe al menos una raíz en el intervalo [%.1f, %.1f]\n', a0, b0);
else
    fprintf('No se puede garantizar que haya una raíz en [%.1f, %.1f]\n', a0, b0);
end

% ----------------------------------------------
% Parte b) BISECCIÓN – 3 iteraciones
% ----------------------------------------------
fprintf('\nMétodo de BISECCIÓN (3 iteraciones)\n');
fprintf('Iteración |   a      |   b      |   c      | f(a)*f(c) | Error Relativo Aproximado\n');
fprintf('------------------------------------------------------------------------------\n');

a = a0;
b = b0;
c_prev = 0;

for iter = 1:3
    c = (a + b) / 2;
    
    % Calcular el error relativo
    if iter > 1
        error_rel = abs(c - c_prev) / abs(c);
    else
        error_rel = NaN;
    end
    
    fprintf('%9d | %7.4f | %7.4f | %7.4f | %9.4f | %24.6f\n', iter, a, b, c, f(a)*f(c), error_rel);
    
    % Actualizar intervalo
    if f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
    
    c_prev = c;
end

fprintf('Raíz aproximada por bisección: %.6f\n', c);

% ----------------------------------------------
% Parte c) REGLA FALSA – 3 iteraciones
% ----------------------------------------------
fprintf('\nMétodo de REGLA FALSA (3 iteraciones)\n');
fprintf('Iteración |   a      |   b      |   c      | f(a)*f(c) | Error Relativo Aproximado\n');
fprintf('------------------------------------------------------------------------------\n');

a = a0;
b = b0;
c_prev = 0;

for iter = 1:3
    fa = f(a);
    fb = f(b);
    c = b - fb*(b - a)/(fb - fa);
    
    % Calcular error relativo
    if iter > 1
        error_rel = abs(c - c_prev) / abs(c);
    else
        error_rel = NaN;
    end
    
    fprintf('%9d | %7.4f | %7.4f | %7.4f | %9.4f | %24.6f\n', iter, a, b, c, f(a)*f(c), error_rel);
    
    % Actualizar intervalo
    if f(a)*f(c) < 0
        b = c;
    else
        a = c;
    end
    
    c_prev = c;
end

fprintf('Raíz aproximada por regla falsa: %.6f\n', c);
