# Autodiff

A common problem is given some function f(x), find the function df(x) that evaluates df/dx at x.

We have three options here:

1. Analytic differentiation:
    * Work out the derivative by hand and write code that implements that derivative

2. Numerical differentiation
    * Estimate df/dx at x by evaluating (f(y) - f(x))/(y - x) for y close to x.
        
3. Automatic differentiation (autodiff)
    * A set of methods for computing an exact derivative by running a special type through your code.
    * We only implement forward-mode autodiff
        * Create a *dual* number, which stores both its value and its derivative. Then we implement math operations for the dual number. Then we let chain rule handle differentiation.
