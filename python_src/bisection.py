def bisection(fun, left ,right, tolerance):
    k = 1
    
    while right - left > tolerance:
        mid = (left + right ) / 2
        if fun(mid) == 0:
            result = mid
        elif fun(left) * fun(mid) < 0:
            right = mid
        else:
            left = mid
        result = mid
        print(f"{k} result: {result}")
        k += 1
        
def equation(x):
    return x - 2**(-x)

bisection(equation, 0, 1, 1e-4)