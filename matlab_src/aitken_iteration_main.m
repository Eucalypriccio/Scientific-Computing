equation = @(x) (x+1)^(1/3);

result = aitken_iteration(equation, 1, 1e-8);