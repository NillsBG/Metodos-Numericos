clc; clear; close all;

% Función para interpolación de Lagrange
% Esta función estima el valor de una función en un punto dado 'x'
% usando el método de interpolación de Lagrange
function [y_interp, error] = lagrange_interp(x_points, y_points, x, valor_real)

    n = length(x_points) - 1;  % El grado del polinomio es el número de puntos - 1
    y_interp = 0;              % Inicializo la estimación de la función en el punto x
    
    % Recorro cada uno de los puntos para construir los polinomios de Lagrange
    for i = 0:n
        L = 1;                 % Inicializo el polinomio básico L_i(x) en 1
        
        % Construyo L_i(x) como el producto de (x - x_j)/(x_i - x_j) para j ≠ i
        for j = 0:n
            if j ~= i          % No se incluye el mismo índice
                % Actualizo el valor de L multiplicando los factores
                L = L * (x - x_points(j+1)) / (x_points(i+1) - x_points(j+1));
            end
        end
        
        % Sumo el término correspondiente a y_i * L_i(x)
        y_interp = y_interp + y_points(i+1) * L;
    end

    % Calculo el error porcentual relativo respecto al valor real
    error = abs((y_interp - valor_real) / valor_real) * 100;
end

% Datos conocidos (valores de x y ln(x))
x_points = [1, 2, 3];                     % Valores de x que conozco
y_points = [0, 0.6931472, 1.098612];       % ln(x) evaluado en esos x

x = 2;                                     % Punto donde quiero aproximar ln(2)
valor_real = 0.6931472;                    % Valor real de ln(2) para comparar

% Llamo a la función lagrange_interp para calcular la estimación y el error
[y_est, error] = lagrange_interp(x_points, y_points, x, valor_real);

% Muestro el resultado final: la estimación y el porcentaje de error
fprintf('Estimación usando Lagrange: ln(2) ≈ %.6f, Error = %.2f%%\n', y_est, error);
