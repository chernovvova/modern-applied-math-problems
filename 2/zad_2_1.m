gamma_0 = 1E-10;

K_example = [1 2 3; 5 7 9; 6 8 9; 4 6 8; 1 3 5];
f_example = [1; 2; 1; 1; 1];

phi_plus = solve(K_example, f_example, gamma_0);
disp(phi_plus);