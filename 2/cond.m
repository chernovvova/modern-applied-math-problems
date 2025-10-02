function [cond] = cond(K)
    lambdas = svds(K);
    cond = max(lambdas) / min(lambdas);
end