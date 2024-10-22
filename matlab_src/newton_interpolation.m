function y = newton_interpolation(f, X, x_interp)
    n = length(X);
    Y = zeros(n);

    for i = 1:n
        Y(i) = f(X(i));
    end

    % 差商表
    diff_quo = zeros(n, n);
    for i = 1:n
        diff_quo(i, 1) = Y(i);
    end

    for j = 2:n
        for i = j:n
            diff_quo(i, j) = (diff_quo(i, j-1) - diff_quo(i-1, j-1)) / (X(i) - X(i-j+1));
        end
    end

    fprintf("Difference quotient table is\n");
    disp(diff_quo);

    for k = 1:length(x_interp)
        x_k = x_interp(k);
        y_k = 0;

        for i = 1:n
            N_i = 1;
            for j = 1:i-1
                N_i = N_i * (x_k - X(j));
            end
            y_k = y_k + N_i * diff_quo(i, i);
        end

        y(k) = y_k;
    end

    err = zeros(length(x_interp));
    y_acc = zeros(length(x_interp));
    for i = 1:length(x_interp)
        y_acc = f(x_interp(i));
        err(i) = abs(y_acc(i) - y(i));
    end
    
    fprintf("Estimated y is\n%.14f\n", y);
    fprintf("Error is\n%.14f", err);
end