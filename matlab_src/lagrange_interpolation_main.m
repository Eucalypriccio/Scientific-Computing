f = @(x) x * (1 + cos(x));
X = [0, pi / 8, pi / 4, 3*pi/8, pi/2];
x_interp = [3*pi/16];

y = lagrange_interpolation(f, X, x_interp);