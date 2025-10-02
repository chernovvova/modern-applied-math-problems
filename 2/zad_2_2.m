K = form_K(5, 3, 30);
eta = [0.01; -0.01; 0.02; -0.01; -0.01];
phi = [1; 3; 6];

f = K * phi;
f_n = f + eta;

cond_k = cond(K);

f_err = norm(f - f_n) / norm(f);

phi_1 = solve(K, f, 1e-10);
phi_2 = solve(K, f_n, 1e-10);

phi1_err = norm(phi - phi_1) / norm(phi);
phi2_err = norm(phi - phi_2) / norm(phi);
