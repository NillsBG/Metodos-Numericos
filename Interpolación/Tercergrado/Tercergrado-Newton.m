clc; clear; close all;

% Función para interpolación de Newton de tercer grado
% Esta función me permite obtener una estimación del valor de una función
% en un punto dado 'x', usando interpolación de Newton con 4 puntos (grado 3)
function [y_interp, error] = newton_interp_3rd_degree(x_points, y_points, x, valor_real)
    % Calculo la tabla de diferencias divididas
    n = length(x_points);             % Número de puntos conocidos
    F = zeros(n, n);                  % Inicializo la matriz F para las diferencias divididas
    F(:,1) = y_points;                % La primera columna son los valores de y conocidos
    
    % Aquí lleno la tabla de diferencias divididas
    for j = 2:n
        for i = 1:n-j+1
            % Fórmula para calcular las diferencias divididas
            F(i,j) = (F(i+1,j-1) - F(i,j-1)) / (x_points(i+j-1) - x_points(i));
        end
    end

    % Evaluo el polinomio en el punto x
    y_interp = F(1,1);                % Empiezo con el término independiente
    for k = 2:n
        term = F(1,k);                % Tomo el coeficiente correspondiente
        for m = 1:k-1
            % Multiplico por los factores (x - x_i)
            term = term * (x - x_points(m));
        end
        % Sumo el término al valor aproximado
        y_interp = y_interp + term;
    end

    % Calculo el error porcentual con respecto al valor real
    error = abs((y_interp - valor_real) / valor_real) * 100;
end

% Datos conocidos (puntos cercanos entre sí)
% Aquí estoy usando puntos de la función ln(x)
x_points = [1, 1.5, 2.5, 4];                         % Valores de x conocidos
y_points = [0, 0.405465, 0.916291, 1.386294];        % ln(x) en los puntos anteriores
x = 2;                                               % Punto donde quiero estimar
valor_real = 0.6931472;                              % Valor real de ln(2) para comparar

% Llamo a la función de interpolación
[y_est, error] = newton_interp_3rd_degree(x_points, y_points, x, valor_real);

% Imprimo el resultado con el error relativo
fprintf('Estimation: ln(2) ≈ %.6f, Error = %.2f%%\n',y_est,error);