omega = 0.5;
beta = 0.2;
M = 50;

y0 = [1; 0];
t0 = 0;
t1 = 50;

D = @(t, Y) [Y(2); - omega * Y(1) - beta * Y(2)];

[t, Y] = rkfixed(y0, t0, t1, M, D);

plot(t, Y(:, 1), 'b-', 'LineWidth', 2, 'Color', 'g', 'DisplayName', 'y1');
hold on
plot(t, Y(:, 2), 'b-', 'LineWidth', 2, 'Color', 'y', 'DisplayName', 'y2');
xlabel('t', 'FontSize', 12);
ylabel('Y(t)', 'FontSize', 12);
title('Решение системы ОДУ', 'FontSize', 14);
grid on;
hold off;

fprintf( ...
    'y0(50) = %f, y1(50) = %f \n', ...
    Y(find(t == 50), 1), ...
    Y(find(t == 50), 2) ...
);