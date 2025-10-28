function [t, Y] = bulstoer(odefun, tspan, y0, varargin)
    p = inputParser;
    addParameter(p, 'Tol', 1e-4, @(x) x > 0);
    addParameter(p, 'MaxStep', 1, @(x) x > 0);
    parse(p, varargin{:});
    
    tol = p.Results.Tol;
    h_max = p.Results.MaxStep;
    
    t0 = tspan(1);
    tf = tspan(2);
    n_vars = length(y0);
    
    sequence = [2, 4, 6, 8, 12, 16, 24, 32];
    
    t = t0;
    Y = y0(:)';
    h = min(h_max, (tf - t0)/10);
    current_t = t0;
    current_y = y0(:);
    
    while current_t < tf
        if current_t + h > tf
            h = tf - current_t;
        end
        
        [success, t_new, y_new, error_est] = ...
            bulirsch_stoer_step(odefun, current_t, current_y, h, sequence, tol, n_vars);
        
        if success
            current_t = t_new;
            current_y = y_new;
            t = [t; current_t];
            Y = [Y; current_y'];
            
            if error_est < tol/10
                h = min(h_max, 1.5 * h);
            end
        else
            h = 0.5 * h;
            if h < 1e-12
                warning('Слишком малый шаг. Интегрирование прервано.');
                break;
            end
        end
    end
    
    function [success, t_new, y_new, error_est] = ...
             bulirsch_stoer_step(odefun, t, y, h, sequence, tol, n)
        
        m = length(sequence);
        T = zeros(n, m);
       
        for j = 1:m
            n_j = sequence(j);
            h_j = h / n_j;
            y_temp = y;
           
            y_temp = y_temp + h_j * odefun(t, y_temp);
            
            for k = 2:n_j
                y_temp = y_temp + 2 * h_j * odefun(t + (k-1)*h_j, y_temp);
            end
            
            y_temp = 0.5 * (y_temp + y + h_j * odefun(t + h, y_temp));
            T(:, j) = y_temp;
        end
       
        for k = 2:m
            for j = k:m
                r = (sequence(j) / sequence(j-k+1))^2;
                T(:, j) = T(:, j) + (T(:, j) - T(:, j-1)) / (r - 1);
            end
        end
        
        error_est = max(abs(T(:, m) - T(:, m-1)));
        
        if error_est < tol
            success = true;
            t_new = t + h;
            y_new = T(:, m);
        else
            success = false;
            t_new = t;
            y_new = y;
        end
    end
end