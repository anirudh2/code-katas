module QuadraticFormula

using TypeClasses
using MLStyle

export quadratic_formula, ±, quadratic_formula_functional, DivideByZero, BadInputs

# One-line function definition
±(a, b) = [a - b, a + b]

# Define custom exceptions
struct DivideByZero <: Exception end

struct BadInputs <: Exception
    x
end

# Julian way of defining the quadratic formula
function quadratic_formula(a::Real, b::Real, c::Real)::Vector{Real}
    if a == 0
        throw(DivideByZero())
    end
    return (-b ± √(b^2 - 4a*c)) / (2a)
end
function quadratic_formula(a, b, c)
    throw(BadInputs("Got string"))
end

# Functional way of defining the quadratic formula using the Try monad and pattern matching
quadratic_formula_functional(a, b, c) = @match a begin
    0 => Const("ZeroDivision")
    _ => @Try (-b ± √(b^2 - 4a*c)) / (2a)
end

end
