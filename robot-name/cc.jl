Base.@kwdef mutable struct Robot
    # l1::Char
    # l2::Char
    # n1::Int64
    # n2::Int64
    # n3::Int64
    # first::AbstractString
    # last::Int64
    properties::Dict{Symbol,Any}
    # powered::Bool = false
end

# Add field to an existing struct
# https://discourse.julialang.org/t/add-new-field-to-struct/73923

Robot() = Robot(Dict{Symbol,Any}())

Base.getproperty(x::Robot, property::Symbol) = getfield(x, :properties)[property]
Base.setproperty!(x::Robot, property::Symbol, value) = getfield(x, :properties)[property] = value
Base.propertynames(x::Robot) = keys(getfield(x, :properties))



# Robot() = name(Robot)
# Robot(name::String) = Robot(name[1:2], parse(UInt64, name[3:5]))


# function reset!(instance::Robot)
# 
# end

function turn_on!(instance::Robot)
    #first = rand(('A':'Z')) * rand(('A':'Z'))
    # first = reduce(*, rand('A':'Z', 2))
    first = join(rand('A':'Z', 2))

    # last = string(rand(0:9)) * string(rand(0:9)) * string((0:9))
    last = join(rand(0:9, 3))

    # Robot(first, last)
    instance.first = first
    instance.last = last
    instance.name = first * last
    instance.powered = true
end

function name(instance::Robot)
    try
        # is_on = instance.powdered
        _ = instance.powered
    catch
        turn_on!(instance)
    end
    return instance.name
end
