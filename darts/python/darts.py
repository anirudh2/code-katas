from math import sqrt
from typing import NamedTuple


class Point(NamedTuple):
    x: float
    y: float


class Circle(NamedTuple):
    radius: int
    score: int


rs = (1, 5, 10)
ss = (10, 5, 1)
cs = tuple(Circle(r, s) for (r, s) in zip(rs, ss))


# def contains(c: Circle, x: float, y: float)
def contains(c: Circle, p: Point) -> bool:
    point_radius = sqrt(p.x**2 + p.y**2)
    return point_radius <= c.radius


def score(x: float, y: float) -> int:
    # print(tuple(cs))
    print(cs)
    for cir in cs:
        # breakpoint()
        if contains(c=cir, p=Point(x=x, y=y)):
            return cir.score
    return 0
