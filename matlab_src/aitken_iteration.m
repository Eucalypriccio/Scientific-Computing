function result = aitken_iteration(g, x_0, tolerance)
    k = 1;
    x_current = x_0;
    x_1 = g(x_current);
    x_2 = g(x_1);
    x_next = x_2 - (x_2 - x_1)^2 / (x_2 - 2 * x_1 + x_current);
    fprintf('%d result: %.14f\n', k, x_next);

    while abs(x_next - x_current) >= tolerance
        x_current = x_next;
        x_1 = g(x_current);
        x_2 = g(x_1);
        x_next = x_2 - (x_2 - x_1)^2 / (x_2 - 2 * x_1 + x_current);
        result = x_next;
        k = k + 1;
        fprintf('%d result: %.14f\n', k, result);
    end
end