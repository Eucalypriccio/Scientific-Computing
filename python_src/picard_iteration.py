import numpy as np

def picard_iteration(iterative, x_0, epsilon):
    k = 1
    x_cur = x_0
    
    while True:
        x_next = iterative(x_cur)
        
        if abs(x_next - x_cur) < epsilon:
            print(f"{k} iteration: {x_next}")
            break
        
        x_cur = x_next
        print(f"{k} iteration: {x_cur}")
        k += 1
        
def iterative(x):
    return np.exp(-x)

picard_iteration(iterative, 0.5, 1e-5)