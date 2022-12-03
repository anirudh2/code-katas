# This is a very bad implementation because it does "if checking", which means
# code is hard to debug, maintain, and extend.  But, it is a style of
# implementation frequently encountered in the wild.  And, it is a prime
# example of code in need of refactoring.

animals = ["Rex", "Fido", "Kitty", "Sylvester"]

for name in animals:
    if name == "Rex":
        print("Ruff.  My name is Rex and I am 1 year old.")
    elif name == "Fido":
        print("Ruff.  My name is Fido and I am 6 years old.")
    elif name == "Kitty":
        print("Meow.  My name is Kitty and I am 0 years old.")
    elif name == "Sylvester":
        print("Meow.  My name is Sylvester and I am 2 years old.")

# only mildly better, but still bad

for name in animals:
    if name == "Rex":
        print(f"Ruff.  My name is {name} and I am 1 year old.")
    elif name == "Fido":
        print(f"Ruff.  My name is {name} and I am 6 years old.")
    elif name == "Kitty":
        print(f"Meow.  My name is {name} and I am 0 years old.")
    elif name == "Sylvester":
        print(f"Meow.  My name is {name} and I am 2 years old.")