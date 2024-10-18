function result = bisection(fun, left, right, tolerance)
    k = 1;

    while right - left > tolerance
        mid = (right + left) / 2;
        if fun(mid) == 0
            result = mid;
        elseif fun(left) * fun(mid) < 0
            right = mid;
        else
            left = mid;
        end

        result = mid;
        fprintf('%d result: %.14f\n', k, result);
        k = k + 1;
    end
end