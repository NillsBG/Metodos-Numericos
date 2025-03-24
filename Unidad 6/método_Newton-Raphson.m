% Método de Newton-Raphson
function newton_raphson()
    % Parámetros
    x0 = 0;          % Valor inicial
    tol = 1e-6;      % Tolerancia
    max_iter = 100;  % Número máximo de iteraciones
    
    % Inicialización
    x = x0;
    iter = 0;
    error = tol + 1;
    
    % Iteraciones
    while error > tol && iter < max_iter
        f = exp(-x) - x;          % Función f(x)
        df = -exp(-x) - 1;         % Derivada f'(x)
        x_new = x - f / df;        % Actualización de x
        error = abs(x_new - x);
        x = x_new;
        iter = iter + 1;
    end
    
    % Resultados
    if iter == max_iter
        disp('El método no convergió en el número máximo de iteraciones.');
    else
        fprintf('Solución encontrada: x = %.6f\n', x);
        fprintf('Número de iteraciones: %d\n', iter);
    end
end