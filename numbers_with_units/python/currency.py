"""This module defines numbers with units that are either deg F or deg C."""

# F -> C
# (x->32°F − 32) × 5/9 = 0.0°C
# (x->100°F − 32) × 5/9 = 37.778°C

# 1.04 U == 1.00 E
# For ease of computation, we artificially say this intead:
# 2.00 U == 1.00 E

from typing import Final, NamedTuple, Union


class U(NamedTuple):
    value: float


class E(NamedTuple):
    value: float


Currency = Union[U, E]  # supertype, type alias (?)

etou: Final[float] = 2.0
utoe: Final[float] = 1 / etou


def to_U(val: Currency) -> U:
    if isinstance(val, U):
        return val
    else:
        return U(val.value * etou)


def to_E(val: Currency) -> E:
    if isinstance(val, E):
        return val
    else:
        return E(val.value * utoe)


def equals(a: Currency, b: Currency) -> bool:
    if type(a) == type(b):
        return a.value == b.value
    else:  # a and b are heterogeneous types
        a_C = to_E(a)
        b_C = to_E(b)
        return a_C.value == b_C.value


def plus(a: Currency, b: Currency) -> Currency:
    if type(a) == type(b):
        return type(a)(a.value + b.value)
    else:  # a and b are heterogeneous types
        a_C = to_E(a)
        b_C = to_E(b)
        return E(a_C.value + b_C.value)


# What we want to do in Python, but can't.
# def to_F(val: C) -> F:
#     return 1.
#
#
# def to_F(val: F) -> F:
#     return 1.
#
