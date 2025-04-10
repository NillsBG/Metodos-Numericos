%% Métodos Abiertos - Función f(x) = x^4 - 3x^3 + 2x^2 - x + 1
clear all;
close all;
clc;

f = @(x) x^4 - 3*x^3 + 2*x^2 - x + 1;
df = @(x) 4*x^3 - 9*x^2 + 4*x - 1; 
d2f = @(x) 12*x^2 - 18*x + 4;      


fprintf('\n=== MÉTODO DE NEWTON-RAPHSON ESTÁNDAR ===\n');
x0 = 2;
tol = 1e-6;
max_iter = 100;
iter = 0;
results_nr = [];

fprintf('Iter\t x_prev\t\t x_new\t\t f(x_new)\t Error Rel%%\n');
fprintf('------------------------------------------------\n');

while iter < max_iter
    x_new = x0 - f(x0)/df(x0);
    error_rel = abs((x_new - x0)/x_new)*100;
    iter = iter + 1;
    
    results_nr = [results_nr; iter, x0, x_new, f(x_new), error_rel];
    
    fprintf('%3d\t %8.6f\t %8.6f\t %8.2e\t %8.6f\n', ...
            iter, x0, x_new, f(x_new), error_rel);
    
    if abs(x_new - x0) < tol
        break;
    end
    x0 = x_new;
end

fprintf('\n=== MÉTODO DE NEWTON-RAPHSON MODIFICADO ===\n');
x0 = 2;
tol = 1e-6;
max_iter = 100;
iter = 0;
results_nrm = [];


df0 = df(x0); 
d2f0 = d2f(x0); % Para el método modificado

fprintf('Iter\t x_prev\t\t x_new\t\t f(x_new)\t Error Rel%%\n');
fprintf('------------------------------------------------\n');

while iter < max_iter
    % Fórmula modificada usando derivada constante
    x_new = x0 - f(x0)/df0 - 0.5*(f(x0)^2*d2f0)/(df0^3);
    error_rel = abs((x_new - x0)/x_new)*100;
    iter = iter + 1;
    
    % Almacenar resultados
    results_nrm = [results_nrm; iter, x0, x_new, f(x_new), error_rel];
    
    fprintf('%3d\t %8.6f\t %8.6f\t %8.2e\t %8.6f\n', ...
            iter, x0, x_new, f(x_new), error_rel);
    
    if abs(x_new - x0) < tol
        break;
    end
    x0 = x_new;
end

fprintf('\n=== RESUMEN DE RESULTADOS ===\n');
fprintf('Método\t\t Raíz\t\t Iteraciones\t Error Final\n');
fprintf('------------------------------------------------\n');
fprintf('Newton\t\t %f\t %d\t\t %.2e\n', ...
        results_nr(end,3), results_nr(end,1), results_nr(end,5));
fprintf('Newton Mod.\t %f\t %d\t\t %.2e\n', ...
        results_nrm(end,3), results_nrm(end,1), results_nrm(end,5));

figure;
semilogy(results_nr(:,1), results_nr(:,5), 'b-o', 'LineWidth', 2);
hold on;
semilogy(results_nrm(:,1), results_nrm(:,5), 'r-s', 'LineWidth', 2);
grid on;
xlabel('Iteración');
ylabel('Error Relativo (%)');
title('Comparación de Convergencia');
legend('Newton Estándar', 'Newton Modificado');
