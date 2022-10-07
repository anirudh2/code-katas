# Chad's updated implementation of darts, based on learning from AP, the Jedi master.

struct Circle
    radius::Int64
    score::Int64
end

struct Point
    x::Real
    y::Real
end

# rr = (10, 5, 1)  # radii
rr = (1, 5, 10)  # radii
ss = (10, 5, 1)  # scores
cs = Circle.(rr, ss)  # circles

score(x, y) = score(Point(x, y))

function score(point::Point)::Int64
    for circle in cs
        contains(circle, point) && return circle.score
    end
    return 0
end

function contains(cir::Circle, p::Point)::Bool
    return hypot(p.x, p.y) ≤ cir.radius
end