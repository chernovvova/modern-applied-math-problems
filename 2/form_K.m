function K = form_K(N, M, sigma)
    K = zeros(N, M);
    for i = 0:N-1
        for j = 0:M-1
            K(i + 1, j + 1) = exp(-((j - (M / N) * i) ^ 2 ) / sigma ^ 2);
        end
    end
end