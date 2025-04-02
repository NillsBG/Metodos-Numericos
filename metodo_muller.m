clc; clear; close all;

% Definir la función
f = @(x) x.^3 - 13*x - 12;

% Valores iniciales
x0 = 4.5;
x1 = 5.5;
x2 = 5;

% Tolerancia y número máximo de iteraciones
tol = 1e-6;
max_iter = 100;

% Llamar al método de Müller
raiz = muller(f, x0, x1, x2, tol, max_iter);
fprintf('\nRaíz encontrada: %.8f\n', raiz);

function raiz = muller(f, x0, x1, x2, tol, max_iter)
    fprintf('Iter\t x0\t\t x1\t\t x2\t\t x3\t\t f(x3)\t\t Error\n');
    fprintf('--------------------------------------------------------------\n');
    
    for i = 1:max_iter
        % Evaluar la función en los puntos actuales
        f0 = f(x0);
        f1 = f(x1);
        f2 = f(x2);
        
        % Calcular diferencias divididas
        h1 = x1 - x0;
        h2 = x2 - x1;
        
        d1 = (f1 - f0) / h1;
        d2 = (f2 - f1) / h2;
        
        % Calcular coeficientes del polinomio cuadrático
        a = (d2 - d1) / (h2 + h1);
        b = a * h2 + d2;
        c = f2;
        
        % Calcular el discriminante
        discriminante = sqrt(b^2 - 4*a*c);
        
        % Elegir el denominador más grande para mayor estabilidad
        if abs(b + discriminante) > abs(b - discriminante)
            denominador = b + discriminante;
        else
            denominador = b - discriminante;
        end
        
        % Calcular la nueva aproximación
        x3 = x2 - (2*c) / denominador;
        
        % Calcular el error aproximado
        if i > 1
            error = abs(x3 - x2) / abs(x3) * 100;
        else
            error = 100; % No hay error en la primera iteración
        end
        
        % Mostrar resultados de la iteración actual
        fprintf('%d\t%.6f\t%.6f\t%.6f\t%.6f\t%.6f\t%.6f\n',...
                i, x0, x1, x2, x3, f(x3), error);
        
        % Verificar convergencia
        if abs(f(x3)) < tol
            raiz = x3;
            fprintf('\nConvergencia alcanzada.\n');
            return;
        end
        
        % Actualizar puntos para la siguiente iteración
        x0 = x1;
        x1 = x2;
        x2 = x3;
    end
    
    raiz = x2;
    fprintf('\nMáximo de iteraciones alcanzado.\n');
end