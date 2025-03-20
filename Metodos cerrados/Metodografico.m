% Definir la función
f = @(x) x.^3 - 6*x.^2 + 11*x - 6;

% Crear un vector de valores de x
x = linspace(0, 4, 1000);

% Evaluar la función
y = f(x);

% Graficar la función
figure;
plot(x, y, 'b-', 'LineWidth', 2);
hold on;
plot(x, zeros(size(x)), 'k--'); % Línea horizontal en y = 0
xlabel('x');
ylabel('f(x)');
title('Gráfica de f(x) = x^3 - 6x^2 + 11x - 6');
grid on;

% Encontrar las raíces gráficamente
roots = [1, 2, 3]; % Raíces conocidas (puedes ajustar esto)
scatter(roots, f(roots), 100, 'r', 'filled'); % Marcar las raíces
legend('f(x)', 'y = 0', 'Raíces');
