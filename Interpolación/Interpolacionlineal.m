clc;
function [y_interp, error] = interpolacionLineal(x, y, x_interp)

% Inicialización
y_interp = zeros(size(x_interp));
error = zeros(size(x_interp));


y_real = log(x_interp); 


for i = 1:length(x_interp)

    if x_interp(i) < min(x)
  
        x1 = x(1);
        y1 = y(1);
        x2 = x(2);
        y2 = y(2);
        y_interp(i) = y1 + (x_interp(i) - x1) * (y2 - y1) / (x2 - x1);

    elseif x_interp(i) > max(x)
  
        x1 = x(end-1);
        y1 = y(end-1);
        x2 = x(end);
        y2 = y(end);
        y_interp(i) = y1 + (x_interp(i) - x1) * (y2 - y1) / (x2 - x1);

    else
    
        [~, idx] = min(abs(x - x_interp(i)));

    
        if any(x == x_interp(i))
            y_interp(i) = y(x == x_interp(i));
        else
 
            if x_interp(i) < x(idx)
                x1 = x(idx-1);
                y1 = y(idx-1);
                x2 = x(idx);
                y2 = y(idx);
            else
                x1 = x(idx);
                y1 = y(idx);
                x2 = x(idx+1);
                y2 = y(idx+1);
            end

       
            y_interp(i) = y1 + (x_interp(i) - x1) * (y2 - y1) / (x2 - x1);
        end
    end

    error(i) = abs(((y_interp(i) - y_real(i))/y_real(i))*100);
end
end


x = [1, 4];
y = [log(1), log(4)]; 

x_interp = 2;

[y_interp, error] = interpolacionLineal(x, y, x_interp);

fprintf('Resultados de la Interpolación Lineal para ln(2):\n');
fprintf('x = %.2f, y_interp (ln(2)) = %.4f, Error porcentual = %.4f\n', x_interp, y_interp,error);