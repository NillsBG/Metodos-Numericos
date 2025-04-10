%%
clc; clear; close all;

%% Ejercicio Serie 2: f(x) = x^3 - 6x^2 + 11x - 6

% Definir la función
f = @(x) x.^3 - 6*x.^2 + 11*x - 6;

% a) Graficar la función en el intervalo [0, 4]
x_vals = linspace(0, 4, 100);   % Crear 100 puntos equiespaciados entre 0 y 4
y_vals = f(x_vals);             % Evaluar la función en esos puntos
plot(x_vals, y_vals);          % Graficar f(x)
grid on;                       % Mostrar la cuadrícula
xlabel('x'); ylabel('f(x)');   % Etiquetas
title('Gráfica de f(x) en [0, 4]'); 
yline(0, '--k');               % Línea horizontal en y = 0 para ver dónde cruza

%% b) Método de Bisección con tolerancia 1e-5 en [2.5, 3.5]
a = 2.5; b = 3.5; tol = 1e-5;
fa = f(a); fb = f(b);

fprintf('\nMétodo de Bisección:\n');
iter = 0;
while (b - a)/2 > tol
    c = (a + b) / 2;
    fc = f(c);
    iter = iter + 1;
    fprintf('Iteración %d: a=%.6f, b=%.6f, c=%.6f, f(c)=%.6f\n', iter, a, b, c, fc);
    
    if fa * fc < 0
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end
end

%% Calcular el error relativo porcentual
raiz = (a + b)/2;        % Raíz aproximada final
raiz_anterior = c;       % Valor anterior de la raíz
error_rel = abs((b - a)/raiz) * 100;   % Error relativo porcentual

%% c) Escribir en tabla (salida por pantalla)
fprintf('\nResultado final:\n');
fprintf('Iteraciones: %d\n', iter);
fprintf('Raíz aproximada: %.6f\n', raiz);
fprintf('Error relativo porcentual: %.6f %%\n',error_rel);