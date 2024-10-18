equation = @(x) exp(-x);

result = picard_iteration(equation, 0.5, 1e-5);