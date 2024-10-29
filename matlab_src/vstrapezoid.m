function z=vstrapezoid(f, a, b, epsilon)
    h_pre = b - a;
    t_pre = h_pre / 2 * (f(a) + f(b));
    h_cur = (b - a) / 2;
    t_cur = (t_pre + h_pre * f((a+b) / 2)) / 2;
    k = 0;
    fprintf("h = %f\n", h_cur);
    fprintf("Estimated value is: %.14f\n", t_cur);

    while abs(t_cur - t_pre) >= epsilon
        t_pre = t_cur;
        k = k + 1;
        n = 2^k;
        H = 0;
        h_pre = h_cur;
        for j = 1:n
            H = H + f(a + (j - 0.5) * h_pre);
        end
        h_cur = (b-a) / (2^(k+1));
        t_cur = (t_pre + h_pre * H) / 2;
        fprintf("h = %f\n", h_cur);
        fprintf("Estimated value is: %.14f\n", t_cur);
    end

    z = t_cur;
end