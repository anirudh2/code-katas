import Base: +, *, sin, cos

struct Dual{T}
    value::T
    derivative::T
end

+(n::Number, d::Dual) = Dual(d.value + n, d.derivative)
+(d::Dual, n::Number) = Dual(d.value + n, d.derivative)
+(d1::Dual, d2::Dual) = Dual(d1.value + d2.value, d1.derivative + d2.derivative)

*(n::Number, d::Dual) = Dual(d.value * n, n * d.derivative)
*(d::Dual, n::Number) = Dual(d.value * n, n * d.derivative)
*(d1::Dual, d2::Dual) = Dual(d1.value * d2.value, d1.value * d2.derivative + d2.value * d1.derivative)

sin(d::Dual) = Dual(sin(d.value), d.derivative * cos(d.value))
cos(d::Dual) = Dual(cos(d.value), -d.derivative * sin(d.value))

f(x) = sin(3x + π/4)
x = π/4
x_dual = Dual(x, 1.0)  # derivative is dx/dx
y = f(x_dual)
@show y.derivative

# Compare against numerical differentiation
δx = 1e-5
estimate = (f(x + δx) - f(x)) / δx
@show estimate

function ∇f(f, x)
    d = Dual(x, one(x))
    y = f(d)
    return y.derivative
end

@show ∇f(f, π/4)