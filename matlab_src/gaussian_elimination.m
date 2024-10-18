function x = gaussian_elimination(A, b)
    % get the size of A
    [n, m] = size(A);
    
    if n ~= m
        error("A must be a square matrix")
    end    

    % get augmented matrix
    Ab = [A b];

    % forward elimination
    for i = 1:n-1
        % find main element
        [~, max_index] = max(abs(Ab(i:n, i)));

        % let the partial maximum index become overall maximum index 
        max_index = max_index + i - 1;

        if max_index ~= i
            % exchange rows
            Ab([i, max_index], :) = Ab([max_index, i], :);
        end

        for j = (i+1):n
            factor = Ab(j, i) / Ab(i, i);
            Ab(j, i:end) = Ab(j, i:end) - factor * Ab(i, i:end);
        end

    end
    
    % back substitution
    x = zeros(n, 1);
    x(n) = Ab(n, end) / Ab(n, n);
    for i = n-1:-1:1
        x(i) = (Ab(i, end) - Ab(i, i+1:n) * x(i+1:n)) / Ab(i, i);
    end

end