clear; clc;

A = [0, 2; -4, -0.8];
B = [0; 1];
C = [1, 0];
D = 0;
X0 = [0; 0];
t1 = 0;
t2 = 30;
M = 500;

sys = ss(A, B, C, D);

t = linspace(t1, t2, M);
u_vec = ones(size(t));
[y, t, x] = lsim(sys, u_vec, t, X0);

figure(1);
subplot(1, 2, 1);
plot(t, y, 'g-', 'LineWidth', 2);
xlabel('t');
ylabel('y(t)');
title('Решение задачи');
grid on;

subplot(1, 2, 2);
plot(t, x(:,1), 'r-', 'LineWidth', 2, 'DisplayName', 'x1'); 
hold on;
plot(t, x(:,2), 'g-', 'LineWidth', 2, 'DisplayName', 'x2');
xlabel('t');
ylabel('x(t)');
title('Состояния системы');
grid on;


x1_range = linspace(min(x(:,1)), max(x(:,1)), 15);
x2_range = linspace(min(x(:,2)), max(x(:,2)), 15);
[X1, X2] = meshgrid(x1_range, x2_range);
dX1dt = zeros(size(X1));
dX2dt = zeros(size(X2));
for i = 1:numel(X1)
    dx = A * [X1(i); X2(i)] + B * u_vec(i);
    dX1dt(i) = dx(1);
    dX2dt(i) = dx(2);
end
L = sqrt(dX1dt.^2 + dX2dt.^2);
L(L == 0) = 1;
dX1dt_norm = dX1dt ./ L;
dX2dt_norm = dX2dt ./ L;

figure(2);
plot(x(:,1), x(:,2), 'g-', 'LineWidth', 2);
hold on;
quiver(X1, X2, dX1dt_norm, dX2dt_norm, 0.6, 'r', 'LineWidth', 1);
xlabel('x_1(t)');
ylabel('x_2(t)');
title('Фазовый портрет');
grid on;