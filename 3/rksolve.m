function [t, Y] = rkfixed(y0, t0, t1, M, D)
    % D - функция правой части (аналог из Mathcad)
    % tspan - [t1, t2]
    % y0 - начальные условия
    % n - количество точек
    h = (t1 - t0) / (M - 1);  % шаг
    t = linspace(t0, t1, M)';
    Y = zeros(length(y0), M);
    Y(:,1) = y0(:);
    
    for i = 1:M-1
        k1 = D(t(i), Y(:,i));
        k2 = D(t(i) + h / 2, Y(:,i) + h * k1 / 2);
        k3 = D(t(i) + h / 2, Y(:,i) + h * k2 / 2);
        k4 = D(t(i) + h, Y(:,i) + h * k3);
        Y(:, i + 1) = Y(:, i) + (h / 6) * (k1 + 2 * k2 + 2 * k3 + k4);
    end
    Y = Y';
end