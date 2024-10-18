import numpy as np

def aitken_iteration(iterative, x_0, epsilon):
    k = 1
    x_cur = x_0
    
    while True:
        x_1 = iterative(x_cur)
        x_2 = iterative(x_1)
        x_next = x_2 - (x_2 - x_1)**2 / (x_2 - 2 * x_1 + x_cur)
        
        if abs(x_next - x_cur) < epsilon:
            print(f"{k} iteration: {x_next}")
            break
        
        x_cur = x_next
        print(f"{k} iteration: {x_cur}")
        k += 1
        
def iterative(x):
    return (x + 1)**(1 / 3)

aitken_iteration(iterative, 1, 1e-8)
        