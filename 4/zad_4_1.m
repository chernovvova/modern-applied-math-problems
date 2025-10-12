omega = 0.5;
beta = 0.2;
M = 50;

y0 = [1; 0];
t0 = 0;
t1 = 50;

D = @(t, Y) [Y(2); - omega * Y(1) - beta * Y(2)];

[t, Y] = rkfixed(y0, t0, t1, M, D);

plot(t, Y, 'b-', 'LineWidth', 2, 'Color', 'g');
xlabel('t', 'FontSize', 12);
ylabel('y(t)', 'FontSize', 12);
title('Решение уравнения: y(t)', 'FontSize', 14);
grid on;