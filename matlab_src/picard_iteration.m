function result = picard_iteration(g, x_0, tolerance)
    k = 1;
    x_current = x_0;
    while true
        x_next = g(x_current);

        if abs(x_next - x_current) < tolerance
            result = x_next;
            fprintf('%d result: %.14f\n', k, result);
            return;
        end

        x_current = x_next;
        fprintf('%d result: %.14f\n', k, x_current);
        k = k + 1;
    end
end
