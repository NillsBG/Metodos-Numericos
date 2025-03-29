function p_norm = normalizar(p)
    % Elimina ceros al inicio del vector de coeficientes
    first_non_zero = find(p ~= 0, 1);
    if isempty(first_non_zero)
        p_norm = 0;
    else
        p_norm = p(first_non_zero:end);
    end
end