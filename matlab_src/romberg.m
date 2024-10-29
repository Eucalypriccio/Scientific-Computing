function [R, z]=romberg(f, a, b, epsilon)
    R = [];
    h = b - a;
    R(1, 1) = h * (f(a) + f(b)) / 2;
    i = 1;

    while true
        i = i + 1;
        h = h / 2;
        sum = 0;
        for k = 1:2^(i-2)
            sum = sum + f(a + (2*k - 1) * h);
        end
        R(i, 1) = 0.5 * R(i-1, 1) + h * sum;

        for j = 2:i
            R(i, j) = R(i, j-1) + (R(i, j-1) - R(i-1, j-1)) / (4^(j-1) - 1);
        end

        if abs(R(i, i) - R(i-1, i-1)) < epsilon
            break;
        end
    end
    
    z = R(i, i);
end