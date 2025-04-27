% LIMPIEZA DEL ENTORNO DE TRABAJO
clc;        % Limpia la ventana de comandos
clear;      % Elimina todas las variables del workspace
close all;  % Cierra todas las figuras abiertas

% DEFINICIÓN DE LA FUNCIÓN DE INTERPOLACIÓN
% Esta función implementa el método de interpolación de Newton para polinomios de tercer grado
% utilizando diferencias divididas. Recibe como entrada:
% - x_points: vector con los valores x conocidos (nodos de interpolación)
% - y_points: vector con los valores f(x) correspondientes
% - x: punto donde se desea estimar el valor de la función
% - valor_real: valor conocido de la función en x (para cálculo de error)
% Devuelve:
% - y_interp: valor interpolado en el punto x
% - error: porcentaje de error relativo respecto al valor real
function [y_interp, error] = newton_interp_3rd_degree(x_points, y_points, x, valor_real)
    
    % CONSTRUCCIÓN DE LA TABLA DE DIFERENCIAS DIVIDIDAS
    
    % n: número de puntos de interpolación (para grado 3, n=4)
    n = length(x_points);
    
    % F: matriz que almacenará las diferencias divididas
    % La estructura de la matriz será:
    % F(i,j) = f[x_i, x_i+1, ..., x_i+j-1]
    F = zeros(n, n);
    
    % La primera columna contiene los valores de la función (diferencias de orden 0)
    F(:,1) = y_points;
    
    % Cálculo de las diferencias divididas de órdenes superiores
    for j = 2:n               % Columnas de la tabla (desde orden 1 hasta n-1)
        for i = 1:n-j+1       % Filas de la tabla para cada orden
            % Fórmula de diferencias divididas:
            % f[x_i,...,x_i+j-1] = (f[x_i+1,...,x_i+j-1] - f[x_i,...,x_i+j-2])/(x_i+j-1 - x_i)
            F(i,j) = (F(i+1,j-1) - F(i,j-1)) / (x_points(i+j-1) - x_points(i));
        end
    end
    
    % EVALUACIÓN DEL POLINOMIO INTERPOLANTE DE NEWTON
    
    % El polinomio tiene la forma:
    % P(x) = f[x0] + f[x0,x1](x-x0) + f[x0,x1,x2](x-x0)(x-x1) + ...
    
    % Inicialización con el término constante (f[x0])
    y_interp = F(1,1);
    
    % Suma de los términos de orden superior
    for k = 2:n               % Para cada término del polinomio (desde orden 1 hasta n-1)
        term = F(1,k);        % Coeficiente del término (diferencia dividida)
        
        % Productorio de los factores (x - x_i)
        for m = 1:k-1
            term = term * (x - x_points(m));
        end
        
        % Agregar el término al polinomio
        y_interp = y_interp + term;
    end
    
    % CÁLCULO DEL ERROR RELATIVO PORCENTUAL
    % Error = |valor estimado - valor real| / |valor real| * 100
    error = abs((y_interp - valor_real) / valor_real) * 100;
end

% DATOS DEL PROBLEMA ESPECÍFICO
% Puntos conocidos de la función ln(x)
x_points = [1, 1.5, 2.5, 4];          % Valores de x donde conocemos ln(x)
y_points = [0, 0.405465, 0.916291, 1.386294];  % Valores correspondientes de ln(x)

% Punto donde queremos estimar el valor
x = 2;                                 % Queremos estimar ln(2)

% Valor real de ln(2) para comparación (precisión de 7 decimales)
valor_real = 0.6931472;

% EJECUCIÓN DE LA INTERPOLACIÓN
% Llamamos a nuestra función con los datos del problema
[y_est, error] = newton_interp_3rd_degree(x_points, y_points, x, valor_real);

% PRESENTACIÓN DE RESULTADOS
% Mostramos la estimación obtenida y el error porcentual
fprintf('Estimación mediante interpolación cúbica:\n');
fprintf(' ln(2) ≈ %.6f\n', y_est);
fprintf(' Error relativo: %.2f%%\n', error);
fprintf(' Valor real: %.7f\n', valor_real);
