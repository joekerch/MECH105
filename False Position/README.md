falsePosition is a function that estimates a single root of a chosen 
function using false positioning, which is a bracketing method.

Inputs:
 func = the function being evaluated
 xL = the lower guess
 xU = the upper guess
 es = desired relative error (defaults to 0.0001%)
 maxIter = desired number of iterations (defaults to 200)
Outputs:
 root = estimated root location (x-value)
 fx = function value at the estimated root (y-value)
 ea = the approximate relative error (%)
 iter = number of iterations performed

* PLEASE NOTE *
If the default value for maxIter OR es is desired, enter a 0
 for that value and enter the other desired value. (5 inputs)
If the default value for maxIter AND es is desired, enter
 only the first three inputs. (func, xl, xu)
