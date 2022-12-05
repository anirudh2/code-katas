using Lazy

abstract type Animal end

struct Identity{I<:Integer}
    name::String
    age::I
end

name(a::Identity) = a.name
age(a::Identity) = a.age

struct Dog <: Animal
    a::Identity

    Dog(name, age) = new(Identity(name, age))
end

Lazy.@forward Dog.a name, age

struct Cat <: Animal
    a::Identity

    Cat(name, age) = new(Identity(name, age))
end

Lazy.@forward Cat.a name, age

function speak(a::Dog)
    return speak(a, "Ruff")
end

function speak(a::Cat)
    return speak(a, "Meow")
end

function speak(a::Animal, s::AbstractString)
    a_age = a |> age
    age_unit = a_age == 0 || a_age > 1 ? "years" : "year"
    return "$s. My name is $(a |> name), and I am $a_age $age_unit old."
end

function main()::Cint

    d1 = Dog("Rex", 1)
    d2 = Dog("Fido", 6)
    c1 = Cat("Kitty", 0)
    c2 = Cat("Sylvester", 2)

    animals = (d1, d2, c1, c2)

    animals .|> speak .|> println

    return 0
end
