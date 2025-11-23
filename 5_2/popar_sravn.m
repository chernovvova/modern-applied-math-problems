function [lambda_max, w1_norm, w] = popar_sravn(A)
[V, D] = eig(A);
[lambda_max, ind] = max(diag(D));

w = V(:, ind);

w1 = w / sum(w);

w1_norm = w1 / max(w1);
end