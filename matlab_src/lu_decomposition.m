function x = lu_decomposition(A, b)
    [n, ~] = size(A);
    L = zeros(n);
    U = zeros(n);
    x = zeros(n, 1);
    y = zeros(n, 1);

    for i = 1:n
        for j = i:n
            U(i, j) = A(i, j) - sum(L(i, 1:i-1).*U(1:i-1, j)');
            L(j, i) = (A(j, i) - sum(L(j, 1:i-1).*U(1:i-1, i)')) / U(i, i);
        end
    end

    L, U

    for i = 1:n
        y(i) = b(i) - sum(L(i, 1:i-1).*y(1:i-1)');
    end

    for j = n:-1:1
        x(j) = (y(j)-sum(U(j, j+1:n).*x(j+1:n)')) / U(j, j);
    end

end