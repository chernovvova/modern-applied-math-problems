syms y(x)
[V] = odeToVectorField(diff(y, 3) + (x ^ 2) * diff(y, 2) + x * y == exp(x) * cos(x));

M = matlabFunction(V,'vars', {'x','Y'});

[x, Y] = ode45(M, [0 10], [-8 3 3]);

subplot(1, 2, 1)
plot(x, Y(:, 1), 'b-', 'LineWidth', 2, 'Color', 'g');
xlabel('x', 'FontSize', 12);
ylabel('y(x)', 'FontSize', 12);
title('Решение уравнения: y(x)', 'FontSize', 14);
grid on;

subplot(1, 2, 2)
plot3(Y(:, 1), Y(:, 2), Y(:, 3), 'b-', 'LineWidth', 2, 'Color', 'g');
xlabel('y(x)', 'FontSize', 12);
ylabel("y'(x)", 'FontSize', 12);
zlabel("y''(x)", 'FontSize', 12);
title('Фазовый портрет системы', 'FontSize', 14);
grid on;
