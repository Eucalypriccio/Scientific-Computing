import sympy as sp

def newton_iteration(func, derivative_func, x_0, tolerance):
    
    k = 1
    
    x_current = x_0
    y = func(x_current)
    z = derivative_func(x_current)
    
    while abs(y) > tolerance:
        if z == 0:
            raise ValueError("derivative value can't be 0")
        
        x_current = x_current - y / z
        print(f"{k} iteration")
        print(f"{x_current}")
        k += 1
        
        y = func_lambdified(x_current)
        z = derivative_func(x_current)
        
    return x_current


# symbol variable
x = sp.symbols('x')

func = 2 * sp.sin(x + sp.pi * (1 / 3)) - x

derivative = sp.diff(func, x)

func_lambdified = sp.lambdify(x, func)
derivative_func = sp.lambdify(x, derivative)
    
root = newton_iteration(func_lambdified, derivative_func, 1.5, 1e-8)
print(f"root is: {root}")