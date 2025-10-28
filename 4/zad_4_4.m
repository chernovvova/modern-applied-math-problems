A = [1, 1; -3, -0.5];
B = [0; 2];
C = [0, 1];
D = 0;
X0 = [0; 0];
t1 = 0;
t2 = 40;
M = 500;

sys = ss(A, B, C, D);

t = linspace(t1, t2, M);

u = ones(size(t));
[y, t, x] = lsim(sys, u, t, X0);

y_mean = mean(y);
y_max = max(y);
y_min = min(y);

subplot(2,1,1);
plot(t, y, 'g-', 'LineWidth', 2, 'DisplayName', 'y'); hold on;
yline(y_mean, 'g--', 'LineWidth', 2, 'Label', sprintf('Среднее: %.4f', y_mean));
yline(y_max, 'r--', 'LineWidth', 2, 'Label', sprintf('Максимум: %.4f', y_max));
yline(y_min, 'b--', 'LineWidth', 2, 'Label', sprintf('Минимум: %.4f', y_min));
xlabel('t');
ylabel('y(t)');
title('Выход системы');
grid on;

subplot(2,1,2);
plot(t, x(:,1), 'r-', 'LineWidth', 2, 'DisplayName', 'x1'); 
hold on;
plot(t, x(:,2), 'g-', 'LineWidth', 2, 'DisplayName', 'x2');
xlabel('t');
ylabel('x(t)');
title('Состояния системы');
grid on;

x1_range = linspace(min(x(:,1)), max(x(:,1)), 20);
x2_range = linspace(min(x(:,2)), max(x(:,2)), 20);
[X1, X2] = meshgrid(x1_range, x2_range);
U_vec = ones(size(X1));
dX1dt = zeros(size(X1));
dX2dt = zeros(size(X2));
for i = 1:numel(X1)
    dx = A * [X1(i); X2(i)] + B * U_vec(i);
    dX1dt(i) = dx(1);
    dX2dt(i) = dx(2);
end

L = sqrt(dX1dt.^2 + dX2dt.^2);
L(L == 0) = 1;
dX1dt_norm = dX1dt ./ L;
dX2dt_norm = dX2dt ./ L;

figure;
quiver(X1, X2, dX1dt_norm, dX2dt_norm, 0.5, 'b', 'LineWidth', 1);
hold on;
plot(x(:,1), x(:,2), 'g-', 'LineWidth', 2.5);
xlabel('x_1(t)');
ylabel('x_2(t)');
title('Фазовый портрет');
grid on;