omega = 0.5;
beta = 0.2;
M = 50;

y0 = [1; 0];
t0 = 0;
t1 = 50;

D = @(t, Y) [Y(2); - omega * Y(1) - beta * Y(2)];

solRK = ode45(D, [t0 t1], y0, odeset('RelTol', 1e-4));
tRK = solRK.x;
YRK = solRK.y;

[tB, YB] = bulstoer(D, [t0 t1], y0);

figure;
subplot(3, 1, 1)
plot(tRK, YRK(1, :), 'b-', 'LineWidth', 2, 'Color', 'g', 'DisplayName', 'y1');
hold on
plot(tRK, YRK(2, :), 'b-', 'LineWidth', 2, 'Color', 'y', 'DisplayName', 'y2');
xlabel('t', 'FontSize', 12);
ylabel('Y(t)', 'FontSize', 12);
title('Решение системы ОДУ (Рунге-Кутта)', 'FontSize', 14);
grid on;

subplot(2, 1, 2);
plot(tB, YB(:, 1), 'b-', 'LineWidth', 2, 'Color', 'g', 'DisplayName', 'y1');
hold on;
plot(tB, YB(:, 2), 'b-', 'LineWidth', 2, 'Color', 'y', 'DisplayName', 'y2');
xlabel('t', 'FontSize', 12);
ylabel('Y(t)', 'FontSize', 12);
title('Решение системы ОДУ (Булирша-Штера)', 'FontSize', 14);
grid on;

figure;
plot(tRK, YRK(1, :), 'b-', 'LineWidth', 2, 'Color', 'g', 'DisplayName', 'y1_{RK}');
hold on
plot(tRK, YRK(2, :), 'b-', 'LineWidth', 2, 'Color', 'y', 'DisplayName', 'y2_{PK}');
plot(tB, YB(:, 1), 'b-', 'LineWidth', 2, 'Color', 'b', 'DisplayName', 'y1_B');
plot(tB, YB(:, 2), 'b-', 'LineWidth', 2, 'Color', 'r', 'DisplayName', 'y2_B');
xlabel('t', 'FontSize', 12);
ylabel('Y(t)', 'FontSize', 12);
title('Решение системы ОДУ (Общий график)', 'FontSize', 14);
grid on;