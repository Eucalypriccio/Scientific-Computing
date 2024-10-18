function result = newton_iteration(g, g1, x_0, tolerance)
    k = 1;
    x_current = x_0;
    x_next = x_current - g(x_current) / g1(x_current);
    fprintf('%d result: %.14f\n', k, x_next);

    while abs(x_next - x_current) >= tolerance
        x_current = x_next;
        x_next = x_current - g(x_current) / g1(x_current);
        result = x_next;
        k = k + 1;
        fprintf('%d result: %.14f\n', k, result);
    end
end