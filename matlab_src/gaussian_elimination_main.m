A = [2,1,2; 4,5,2; -2,8,-7];
b = [10;20;-7];
x = gaussian_elimination(A, b);
disp(x)