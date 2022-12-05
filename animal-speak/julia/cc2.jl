abstract type Animal end

struct Identity
    name::String
    age::Integer
    word::String
end

struct Dog <: Animal
    id:Identity
    Dog(name, age) = new(id(name, age, "Ruff"))
end

struct Cat <: Animal
    id::Identity
    Cat(name) = new((idname, 0, "Meow"))
    Cat(name, age) = new(id(name, age, "Meow"))
end

d1 = Dog("Rex", 1)
d2 = Dog("Fido", 6)
c1 = Cat("Kitty")
c2 = Cat("Sylvester", 2)

function speak(x::Animal)
    # age_unit = "year"
    # if animal.age == 0 || animal.age > 1
    #     age_unit = "years"
    # end

    age_unit = x.age == 0 || x.age > 1 ? "years" : "year"

    println("$(x.word). My name is $(x.name) and I am $(x.age) $(age_unit) old.")
end

animals = (d1, d2, c1, c2)

for ani in animals
    speak(ani)
end