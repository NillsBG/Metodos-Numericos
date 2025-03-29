% Definimos los polinomios
p = [1 -6 11 -6];  % x^3 - 6x^2 + 11x - 6
q = [1 -1];         % x - 1

% Suma (debemos asegurar misma longitud)
max_len = max(length(p), length(q));
p_sum = [zeros(1, max_len-length(p)) p];
q_sum = [zeros(1, max_len-length(q)) q];

resultado_suma = suma_polinomios(p_sum, q_sum);
disp('Resultado suma:');
disp(resultado_suma);
% Definimos los polinomios
p = [1 -6 11 -6];  % x^3 - 6x^2 + 11x - 6
q = [1 -1];         % x - 1

% Suma (debemos asegurar misma longitud)
max_len = max(length(p), length(q));
p_sum = [zeros(1, max_len-length(p)) p];
q_sum = [zeros(1, max_len-length(q)) q];

resultado_suma = suma_polinomios(p_sum, q_sum);
disp('Resultado suma:');
disp(resultado_suma);
