# from abc import ABCMeta
# import abc


class Animal:

    # __metaclass__ = abc.ABCMeta

    def __init__(self, name, age):

        self.name = name
        self.age = age

        self.word = None

        self.age_unit = "year"
        if age == 0 or age > 1:
            self.age_unit = "years"

        # self.sentence = f"{self.unique_word}. My name is {self.name} and I am {self.age} {self.age_unit} old."

    def speak(self):
        # print(self.sentence)

        sentence = f"{self.word}. My name is {self.name} and I am {self.age} {self.age_unit} old."
        print(sentence)


# Dog class
class Dog(Animal):

    def __init__(self, name, age):
        super().__init__(name, age)

        self.word = "Ruff"


# Cat class
class Cat(Animal):

    def __init__(self, name, age):
        super().__init__(name, age)

        self.word = "Meow"


d1 = Dog("Rex", 1)
d2 = Dog("Fido", 6)
c1 = Cat("Kitty", 0)
c2 = Cat("Sylvester", 2)

animals = (d1, d2, c1, c2)

for ani in animals:
    ani.speak()
