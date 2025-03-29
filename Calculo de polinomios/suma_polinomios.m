function r = suma_polinomios(p, q)
    % Normalizar primero
    p = normalizar(p);
    q = normalizar(q);
    
    % Determinar la longitud máxima
    max_len = max(length(p), length(q));
    
    % Completar con ceros al inicio para igualar longitudes
    p = [zeros(1, max_len - length(p)) p];
    q = [zeros(1, max_len - length(q)) q];
    
    % Sumar los coeficientes
    r = p + q;
    
    % Normalizar el resultado
    r = normalizar(r);
end