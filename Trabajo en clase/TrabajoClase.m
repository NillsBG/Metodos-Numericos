% Datos
x = [0 1 2 3 4];
y = [0 1 0.5 2 1.5];
xi = linspace(0, 4, 200); % Puntos densos para la gráfica

% Interpolación lineal
yi_linear = interp1(x, y, xi, 'linear');

% Interpolación cúbica (spline natural)
yi_spline = spline(x, y, xi);

% Graficar
figure;
plot(x, y, 'ko', 'MarkerFaceColor', 'k'); hold on;
plot(xi, yi_linear, 'r--', 'LineWidth', 1.5);
plot(xi, yi_spline, 'b-', 'LineWidth', 2);
legend('Datos originales', 'Interpolación Lineal', 'Spline Cúbico Natural', 'Location', 'best');
title('Comparación: Interpolación Lineal vs Spline Cúbico');
xlabel('x');
ylabel('y');
grid on;
