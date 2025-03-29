function [cociente, residuo] = divide_polinomios(p, q)
    [cociente, residuo] = deconv(p, q);
    cociente = normalizar(cociente);
    residuo = normalizar(residuo);
end