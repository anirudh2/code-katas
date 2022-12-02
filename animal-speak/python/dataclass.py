from dataclasses import dataclass


@dataclass
class Dog:
    name: str
    age: int = 0
    age_unit: str = "year"
    word: str = "Ruff"

    def __str__(self):
        if self.age == 0 or self.age > 1:
            self.age_unit = "years"
        return f"{self.word}. My name is {self.name} and I am {self.age} {self.age_unit} old."


@dataclass
class Cat:
    name: str
    age: int = 0
    age_unit: str = "year"
    word: str = "Meow"

    # This code is now looking W.E.T., since the implementation below
    # repeats much of what was implemented above for Dog.
    def __str__(self):
        if self.age == 0 or self.age > 1:
            self.age_unit = "years"
        return f"{self.word}. My name is {self.name} and I am {self.age} {self.age_unit} old."


d1 = Dog("Rex", 1)
d2 = Dog("Fido", 6)
c1 = Cat("Kitty")  # use default of zero years old
c2 = Cat("Sylvester", 2)

animals = (d1, d2, c1, c2)

for ani in animals:
    print(ani)
