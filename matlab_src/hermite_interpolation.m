function y = hermite_interpolation(f, f_diff, X, x_interp)
    n = length(X);
    Y = zeros(1, n);
    Y_diff = zeros(1, n);

    for i = 1:n
        Y(i) = f(X(i));
        Y_diff(i) = f_diff(X(i));
    end

    for k = 1:length(x_interp)
        x_k = x_interp(k);
        y_k = 0;

        for i = 1:n
            Li = 1;
            Li_diff = 0;
            for j = 1:n
                if j~=i
                    Li = Li * (x_k - X(j)) / (X(i) - X(j));
                    Li_diff = Li_diff + 1 / (X(i) - X(j));
                end
            end

            y_k = y_k + Li^2 * ( Y(i) + ( x_k - X(i) ) * (Y_diff(i) - 2 * Y(i) * Li_diff) );
        end

        y(k) = y_k;
    end

    err = zeros(length(x_interp));
    y_acc = zeros(length(x_interp));
    for i = 1:length(x_interp)
        y_acc(i) = f(x_interp(i));
        err(i) = abs(y_acc(i) - y(i));
    end

    fprintf("Estimated y is\n%.14f\n", y);
    fprintf("Error is\n%.14f", err);
end