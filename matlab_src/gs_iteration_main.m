A = [5,-1,-1,-1;
    -1,10,-1,-1;
    -1,-1,5,-1;
    -1,-1,-1,10];
b = [-4;12;8;34];
x_0 = zeros(1, 4);
epsilon = 1e-4;

x = gs_iteration(A, b, x_0, epsilon);