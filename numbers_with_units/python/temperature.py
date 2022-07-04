"""This module defines numbers with units that are either deg F or deg C."""

# F -> C
# (x->32°F − 32) × 5/9 = 0.0°C
# (x->100°F − 32) × 5/9 = 37.778°C


from typing import NamedTuple, Union


class F(NamedTuple):
    value: float


class C(NamedTuple):
    value: float


Temperature = Union[F, C]  # supertype, type alias (?)


def to_F(val: Temperature) -> F:
    if isinstance(val, F):
        return val
    else:
        return F(val.value * (9.0 / 5.0) + 32.0)


def to_C(val: Temperature) -> C:
    if isinstance(val, C):
        return val
    else:
        return C((val.value - 32.0) * (5.0 / 9.0))


def equals(a: Temperature, b: Temperature) -> bool:
    if type(a) == type(b):
        return a.value == b.value
    else:  # a and b are heterogeneous types
        a_C = to_C(a)
        b_C = to_C(b)
        return a_C.value == b_C.value


def plus(a: Temperature, b: Temperature) -> Temperature:
    if type(a) == type(b):
        return type(a)(a.value + b.value)
    else:  # a and b are heterogeneous types
        a_C = to_C(a)
        b_C = to_C(b)
        return C(a_C.value + b_C.value)


# What we want to do in Python, but can't.
# def to_F(val: C) -> F:
#     return 1.
#
#
# def to_F(val: F) -> F:
#     return 1.
#
