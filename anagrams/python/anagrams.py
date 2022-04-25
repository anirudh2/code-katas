# from itertools import product
import itertools


def readfile(filename: str) -> tuple[str, ...]:

    with open(filename, "r") as fin:
        contents = fin.read().splitlines()

    return tuple(contents)


def anagram(user_input: str, database: tuple[str, ...]) -> tuple[str, ...]:
    ps = map(lambda x: "".join(x), itertools.permutations(user_input))

    prods = itertools.product(ps, database)

    return tuple(map(lambda x: x[1], filter(lambda x: x[0] == x[1], prods)))
