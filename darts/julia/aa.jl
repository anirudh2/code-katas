import Base

struct Point{S<:Real,T<:Real}
    x::S
    y::T
end

struct Circle
    r::Int64
    s::Int64
end

# const co = Circle(10, 1)
# const cm = Circle(5, 5)
# const ci = Circle(1, 10)
# const cs = (ci, cm, co)

const rs = (1, 5, 10)
const ss = (10, 5, 1)
@assert length(rs) == length(ss)
# const cs = map((r, s) -> Circle(r, s), rs, ss)
const cs = Circle.(rs, ss)

Base.hypot(p::Point) = hypot(p.x, p.y)

contains(c::Circle, p::Point) = hypot(p) ≤ c.r

score(x::S, y::T) where {S<:Real,T<:Real} = score(Point{S,T}(x, y))

function score(p::Point)
    # contains(ci, p) && return ci.s
    # contains(cm, p) && return cm.s
    # contains(co, p) && return co.s
    for c in cs
        contains(c, p) && return c.s
    end
    return 0
end
