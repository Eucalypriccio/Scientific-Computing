equation = @(x) x^3 - x - 1;
% syms x;
% equation_sym = symfun(equation, x);
% derivative_sym = diff(equation_sym, x);
% derivative = matlabFunction(derivative_sym);
derivative = @(x) 3*x^2 - 1;

result = newton_iteration(equation, derivative, 1, 1e-8);