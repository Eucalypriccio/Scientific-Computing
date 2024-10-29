f = @(x) x*exp(x) / (x+1)^2;

[R, z] = romberg(f, 0, 3, 1e-8);
disp("Romberg matrix:");
disp(R);
fprintf("Estimated value is: %.14f", z);