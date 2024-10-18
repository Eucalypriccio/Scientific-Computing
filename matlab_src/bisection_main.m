equation = @(x) x - 2^(-x);

result = bisection(equation, 0, 1, 1e-4);