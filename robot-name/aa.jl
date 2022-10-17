const letters = 'A':'Z'
const numbers = 0:9
const hist = Set{String}()
const nletters = 2
const nnumbers = 3

mutable struct Robot
    name::String

    Robot() = new(generate_name(iscollision))
end

"""
    reset!(r::Robot)

Give the robot a new name.
"""
function reset!(r::Robot)
    n = generate_name(iscollision)
    return name!(r, n)
end

function generate_name(condition::Function)
    n = generate_name()
    while condition(n)
        n = generate_name()
    end
    push!(hist, n)
    return n
end

generate_name() = randletter(nletters) * randnumber(nnumbers)

randletter(c::Integer) = join(rand(letters, c))
randnumber(c::Integer) = join(rand(numbers, c))

iscollision(n::AbstractString) = n ∈ hist

# Get name of robot `r`
name(r::Robot) = r.name

# Set the name `n` of the robot `r`
function name!(r::Robot, n::AbstractString)
    r.name = n
    return nothing
end
