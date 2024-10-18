import numpy as np

def jacobi_iteration(A, b, x_0, epsilon):
    k = 1
    n = len(b)
    x_pre = x_0
    x_cur = np.zeros(n)
    
    for i in range(n):
        x_cur[i] = (b[i] - np.sum(A[i, :] * x_pre[:n]) + A[i, i] * x_pre[i]) / A[i, i]
        
    err = np.linalg.norm(x_cur - x_pre)
    x_pre = x_cur.copy()
    print(f"{k} iteration")
    print(x_cur)
    
    while err >= epsilon:
        for i in range(n):
            x_cur[i] = (b[i] - np.sum(A[i, :] * x_pre[:n]) + A[i, i] * x_pre[i]) / A[i, i]
            
        err = np.linalg.norm(x_cur - x_pre)
        x_pre = x_cur.copy()
        k += 1
        print(f"{k} iteration")
        print(x_cur)


A = np.array([[5,-1,-1,-1],
              [-1,10,-1,-1],
              [-1,-1,5,-1],
              [-1,-1,-1,10],])
b = np.array([-4,12,8,34])
x_0 = np.zeros(4)

jacobi_iteration(A, b, x_0, 1e-4)