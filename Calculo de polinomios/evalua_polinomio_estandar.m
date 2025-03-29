function y = evalua_polinomio_estandar(p, x)
    p = normalizar(p);
    y = zeros(size(x));
    for i = 1:length(p)
        y = y + p(i) * x.^(i-1);
    end
end