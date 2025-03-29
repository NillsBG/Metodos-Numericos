% Definición de los polinomios
p = [1 -6 11 -6];  % p(x) = x³ - 6x² + 11x - 6
q = [1 -1];         % q(x) = x - 1

% --- SUMA ---
% Asegurar misma longitud rellenando con ceros
max_len = max(length(p), length(q));
p_padded = [zeros(1, max_len - length(p)) p];
q_padded = [zeros(1, max_len - length(q)) q];
suma = p_padded + q_padded;
disp('=== SUMA ===');
disp(['p(x) + q(x) = ', poly2str(suma, 'x')]);

% --- MULTIPLICACIÓN ---
mult = conv(p, q);
disp('=== MULTIPLICACIÓN ===');
disp(['p(x) * q(x) = ', poly2str(mult, 'x')]);

% --- DIVISIÓN ---
[cociente, residuo] = deconv(p, q);
disp('=== DIVISIÓN ===');
disp(['Cociente: ', poly2str(cociente, 'x')]);
disp(['Residuo: ', poly2str(residuo, 'x')]);

% --- EVALUACIÓN ---
x_eval = 2;  % Punto donde evaluar
valor_estandar = polyval(p, x_eval);
valor_anidado = polyval(p, x_eval);  % Usamos polyval (implementación eficiente de Horner)
disp('=== EVALUACIÓN ===');
disp(['p(', num2str(x_eval), ') = ', num2str(valor_estandar)]);
disp(['q(', num2str(x_eval), ') = ', num2str(polyval(q, x_eval))]);

% --- Función para convertir coeficientes en string (poly2str) ---
function str = poly2str(coefs, variable)
    coefs = normalizar(coefs);
    n = length(coefs);
    if n == 0
        str = '0';
        return;
    end
    str = '';
    for i = 1:n
        exponente = n - i;
        coef = coefs(i);
        if coef == 0
            continue;
        end
        % Manejo de signos y coeficientes
        if ~isempty(str)
            if coef > 0
                str = [str, ' + '];
            else
                str = [str, ' - '];
                coef = abs(coef);
            end
        elseif coef < 0
            str = [str, '-'];
            coef = abs(coef);
        end
        % Agregar término
        if exponente == 0
            str = [str, num2str(coef)];
        elseif exponente == 1
            if coef == 1
                str = [str, variable];
            else
                str = [str, num2str(coef), variable];
            end
        else
            if coef == 1
                str = [str, variable, '^', num2str(exponente)];
            else
                str = [str, num2str(coef), variable, '^', num2str(exponente)];
            end
        end
    end
    if isempty(str)
        str = '0';
    end
end
