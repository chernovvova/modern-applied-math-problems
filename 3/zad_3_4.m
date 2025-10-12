D = @(t, y) 1 - y ^ 2;
y0 = 0;
t0 = 0;
t1 = 5;
M = 20;
[t, Y] = rksolve(y0, t0, t1, M, D);

plot(t, Y, 'b-', 'LineWidth', 2, 'Color', 'g');
xlabel('t', 'FontSize', 12);
ylabel('y(t)', 'FontSize', 12);
title('Решение уравнения: y(t)', 'FontSize', 14);
grid on;