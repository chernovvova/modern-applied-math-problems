function [U, S, V] = SVD(K)
[U, S, V] = svd(K);

disp('Сингулярные числа матрицы S:');
disp(S);

disp('Число обусловленности матрицы:');
S_vals = svds(K);
cond_value = max(S_vals) / min(S_vals);
disp(cond_value);

disp("Матрица U:");
disp(U);

disp("Матрица V:");
disp(V);

is_U_ortog = U * U';
is_V_ortog = V * V';

disp('Проверка на ортогональность.')
disp("U * U':");
disp(is_U_ortog);

disp("V * V':");
disp(is_V_ortog);
end