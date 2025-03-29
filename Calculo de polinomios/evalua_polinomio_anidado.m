function y = evalua_polinomio_anidado(p, x)
    p = normalizar(p);
    y = zeros(size(x));
    if ~isempty(p)
        y = p(1);
        for i = 2:length(p)
            y = y .* x + p(i);
        end
    end
end