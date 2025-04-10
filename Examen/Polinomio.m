%% Evaluación de Polinomios - Forma Anidada
clear all;
close all;
clc;

%% 1. Explicación de la Evaluación de P(2)
fprintf('=== EVALUACIÓN DE P(2) - FORMA ANIDADA ===\n');
fprintf('Polinomio: P(x) = 4x^3 - 2x^2 + 5x - 1\n');
fprintf('Forma anidada: ((4x - 2)x + 5)x - 1\n\n');

fprintf('Paso 1: 4 * 2 = 8\n');
fprintf('Paso 2: 8 - 2 = 6\n');
fprintf('Paso 3: 6 * 2 = 12\n');
fprintf('Paso 4: 12 + 5 = 17\n');
fprintf('Paso 5: 17 * 2 = 34\n');
fprintf('Paso 6: 34 - 1 = 33\n\n');
fprintf('Resultado final: P(2) = 33\n\n');

%% 2. Función para Evaluación de Polinomios
fprintf('=== FUNCIÓN MATLAB ===\n');

% Ejemplo de uso
coeficientes = [4, -2, 5, -1]; 
x_valor = 2;

resultado = evaluate_polynomial(coeficientes, x_valor);
fprintf('P(%d) = %d\n', x_valor, resultado);
% resultado = evaluate_polynomial([], 2);

%% Función Principal (guardar en evaluate_polynomial.m)
function result = evaluate_polynomial(a, x)
    % Validación de vector vacío
    if isempty(a)
        error('Error: El vector de coeficientes está vacío');
    end
    
    result = a(1); 
    i = 2;         
    n = length(a);
    
    fprintf('\nProceso de evaluación:\n');
    fprintf('Paso 1: result = %.2f (coef inicial)\n', result);
    
    % Usando bucle while como se solicita
    while i <= n
        result_prev = result;
        result = result * x + a(i);
        
        fprintf('Paso %d: %.2f * %.2f + %.2f = %.2f\n', ...
                i, result_prev, x, a(i), result);
        i = i + 1;
    end
    
    fprintf('\nResultado final: %.2f\n', result);
end

%% 3. Pruebas Adicionaless
fprintf('\n=== PRUEBAS ADICIONALES ===\n');
test_cases = {
    {[1, 0, -2], 3, 7};    % x^2 - 2 evaluado en x=3
    {[2, -1, 0, 1], -1, 2}; % 2x^3 - x^2 + 1 evaluado en x=-1
    {[5], 10, 5}            % Polinomio constante 5
};

for k = 1:length(test_cases)
    tc = test_cases{k};
    res = evaluate_polynomial(tc{1}, tc{2});
    fprintf('P(%d) = %d (Esperado: %d) -> %s\n', ...
            tc{2}, res, tc{3}, ...
            string(abs(res - tc{3}) < 1e-6));
end
