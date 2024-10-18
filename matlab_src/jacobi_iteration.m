function x = jacobi_iteration(A, b, x_0, epsilon)
    k = 1;
    n = length(b);
    x_pre = x_0;
    x_cur = zeros(1, n);

    for i = 1:n
        x_cur(i) = (b(i) - sum(A(i, 1:n) .* x_pre(1, 1:n)) + A(i, i) * x_pre(i)) / A(i, i);
    end
    
    err = norm(abs(x_cur - x_pre));
    % update
    x_pre = x_cur;
    fprintf("%d iteration", k);
    disp(x_cur);

    while err >= epsilon
        for i = 1:n
            x_cur(i) = (b(i) - sum(A(i, 1:n) .* x_pre(1, 1:n)) + A(i, i) * x_pre(i)) / A(i, i);
        end

        err = norm(abs(x_cur - x_pre));
        x_pre = x_cur;
        k = k + 1;
        fprintf("%d iteration", k);
        disp(x_cur);
    end

    x = x_cur;
end