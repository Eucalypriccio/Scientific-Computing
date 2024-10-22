function y = lagrange_interpolation(f, X, x_interp)
    n = length(X);
    Y = zeros(n);

    for i = 1:n
       Y(i) = f(X(i));
    end
    
    y = zeros(length(x_interp));
    
    for k = 1:length(x_interp)
        x_k = x_interp(k);
        y_k = 0;

        for i = 1:n
            L_i = 1;

            for j = 1:n
                if i ~= j
                    L_i = L_i * ( (x_k - X(j)) / (X(i) - X(j)) );
                end
            end

            y_k = y_k + Y(i) * L_i;
        end

        y(k) = y_k;
    end

    err = zeros(length(x_interp));
    y_acc = zeros(length(x_interp));
    for i = 1:length(x_interp)
        y_acc(i) = f(x_interp);
        err(i) = abs(y_acc(i) - y(i));
    end
    
    fprintf("Estimated y is \n %.14f \n", y);
    fprintf("Error is \n %.14f", err);
end