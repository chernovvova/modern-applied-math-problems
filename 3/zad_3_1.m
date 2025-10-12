omega = 0.5;
beta = 0.2;

syms y(t)
[V] = odeToVectorField((omega ^ 2) * diff(y, 2) + beta * diff(y, 1) + y == 0);

M = matlabFunction(V,'vars', {'t','Y'});

[t, Y] = ode45(M, [0 10], [1 0]);

subplot(1, 2, 1)
plot(t, Y(:, 1), 'b-', 'LineWidth', 2, 'Color', 'g');
xlabel('t', 'FontSize', 12);
ylabel('y(t)', 'FontSize', 12);
title('Решение уравнения: y(t)', 'FontSize', 14);
grid on;

subplot(1, 2, 2)
plot(Y(:, 1), Y(:, 2), 'b-', 'LineWidth', 2, 'Color', 'g');
xlabel('y(t)', 'FontSize', 12);
ylabel("y'(t)", 'FontSize', 12);
title('Фазовый портрет системы', 'FontSize', 14);
grid on;
