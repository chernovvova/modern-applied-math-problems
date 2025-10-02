gamma0 = 1e-10;

% 1 задание
% K = [1 1; 1 -1; 2 1];
% f = [2; 0; 2];
% eta = [0.01; -0.01; 0.02];

% 2 задание
K = [3 2 1; 4 3 1; 2 1 2; 2 1 1];
f = [4; 7; -4; 1];
% eta = [0.01; -0.01; 0.02; -0.01];

% случайный шум
eta = rand(1, size(f, 1))';


exact_solution = linsolve(K, f);
f_n = f + eta;

cond_val = cond(K);
fprintf('Число обусловленности матрицы K: %f\n', cond_val);

phi = solve(K, f, gamma0);
phi_err = norm(phi - exact_solution) / norm(phi);

phi_n = solve(K, f_n, gamma0);
phi_n_err = norm(phi_n - exact_solution) / norm(phi_n);
f_n_err = norm(f_n - f) / norm(f);
fprintf('Относительная ошибка незашумленного решения: %f\n', phi_n_err);
fprintf( ...
    'Проверка удовлетворения неравенству: %.16f <= %.16f \n результат: %s \n', ...
    phi_n_err, ...
    cond_val * f_n_err, ...
    string(phi_err <= cond_val * f_n_err) ...
);