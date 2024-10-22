f = @(x) (1 + cosh(x)^2) ^ (0.5);
X = [0.35, 0.5, 0.65, 0.8, 0.95];
x_interp = [0.7];

y = newton_interpolation(f, X, x_interp);