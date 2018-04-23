falsePosition is a function that estimates a single root of a chosen 
function using false positioning, which is a bracketing method.

Inputs:
1. func = the function being evaluated
1. xL = the lower guess
1. xU = the upper guess
1. es = desired relative error (defaults to 0.0001%)
1. maxIter = desired number of iterations (defaults to 200)
 
Outputs:
1. root = estimated root location (x-value)
1. fx = function value at the estimated root (y-value)
1. ea = the approximate relative error (%)
1. iter = number of iterations performed

* PLEASE NOTE *
1. If the default value for maxIter OR es is desired, enter a 0 for that value and enter the other desired value. (5 inputs)
1. If the default value for maxIter AND es is desired, enter only the first three inputs. (func, xl, xu)
