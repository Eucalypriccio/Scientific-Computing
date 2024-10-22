f =@(x) x * log(1+x);
f_diff =@(x) log(1+x) + x / (1+x);

X = [1, 1.2, 1.4];
x_interp = [1.3];

y = hermite_interpolation(f, f_diff, X, x_interp);