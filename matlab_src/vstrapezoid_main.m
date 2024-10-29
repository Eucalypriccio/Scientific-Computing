f = @(x) x*exp(x) / (x+1)^2;

z = vstrapezoid(f, 0, 3, 1e-10);