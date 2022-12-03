from dataclasses import dataclass
from typing import Union


@dataclass
class Dog:
    name: str
    age: int = 0
    # age_unit: str = "year"
    word: str = "Ruff"


@dataclass
class Cat:
    name: str
    age: int = 0
    # age_unit: str = "year"
    word: str = "Meow"


def speak(animal: Union[Dog, Cat]):
    # age_unit = "year"
    # if animal.age == 0 or animal.age > 1:
    #     age_unit = "years"

    age_unit = "years" if animal.age == 0 or animal.age > 1 else "year"

    print(f"{animal.word}. My name is {animal.name} and I am {animal.age} {age_unit} old.")


d1 = Dog("Rex", 1)
d2 = Dog("Fido", 6)
c1 = Cat("Kitty")  # use default of zero years old
c2 = Cat("Sylvester", 2)

animals = (d1, d2, c1, c2)

for ani in animals:
    speak(ani)
