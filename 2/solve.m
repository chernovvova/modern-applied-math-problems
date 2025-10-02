function phi_plus = solve(K, f, gamma_0)
[N, M] = size(K);
[U, S, V] = svd(K);
S_vals = diag(S);
S_max = max(S_vals);
phi_plus = zeros(M, 1);

for j  = 1:M
    if S_vals(j) / S_max >= gamma_0
        phi_plus = phi_plus + (dot(f, U(:,j)) / S_vals(j)) * V(:,j);
    end
end