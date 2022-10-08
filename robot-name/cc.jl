# For discussion with AP
# - several solutions a priori create all possible name iterations, which seems ineffient at first, but the much more efficient later when naming a Robot.  Thoughts?
# - my solution makes use of powered Boolean, but other solutions seemed not to make use of this approach.
# - seems like a very nice implementation: 
#   - https://exercism.org/tracks/julia/exercises/robot-name/solutions/sbacelar



# Incomplete inner constructor
# https://docs.julialang.org/en/v1/manual/constructors/#man-inner-constructor-methods
# While you are allowed to create objects with uninitialized fields, any access to an uninitialized reference is an immediate error.

# const history = Set{String}()
# history = Set{String}()
hist = Set{String}()


mutable struct Robot
    name::AbstractString
    # powered::Bool = false
    powered::Bool
    # Robot() = new()  # incomplete inner constructor
    Robot() = new("", false)  # complete inner constructor
end
# Base.@kwdef mutable struct Robot
#     # l1::Char
#     # l2::Char
#     # n1::Int64
#     # n2::Int64
#     # n3::Int64
#     # first::AbstractString
#     # last::Int64
#     properties::Dict{Symbol,Any}
#     # powered::Bool = false
# end
# 
# # Add field to an existing struct
# # https://discourse.julialang.org/t/add-new-field-to-struct/73923
# 
# Robot() = Robot(Dict{Symbol,Any}())
# 
# Base.getproperty(x::Robot, property::Symbol) = getfield(x, :properties)[property]
# Base.setproperty!(x::Robot, property::Symbol, value) = getfield(x, :properties)[property] = value
# Base.propertynames(x::Robot) = keys(getfield(x, :properties))



# Robot() = name(Robot)
# Robot(name::String) = Robot(name[1:2], parse(UInt64, name[3:5]))

function generate_name()::AbstractString
    # first = rand(('A':'Z')) * rand(('A':'Z'))
    # first = reduce(*, rand('A':'Z', 2))
    first = join(rand('A':'Z', 2))

    # last = string(rand(0:9)) * string(rand(0:9)) * string((0:9))
    last = join(rand(0:9, 3))

    # Robot(first, last)
    # instance.first = first
    # instance.last = last
    # instance.name = first * last
    return first * last
end

function reset!(instance::Robot)
    if instance.powered  # name change requires power 
        candidate = generate_name()
        while in(candidate, hist)
            # collision, keep looping until unique name found
            candidate = generate_name()  # overwrite
        end
        # instance.name = first * last
        instance.name = candidate  # overwrite unique name
        push!(hist, instance.name)
    end
    return
end

function turn_on!(instance::Robot)
    instance.powered = true
    reset!(instance)
end

function name(instance::Robot)
    if !instance.powered
        turn_on!(instance)
    end
    return instance.name
end


# function name(instance::Robot)
#     try
#         # is_on = instance.powdered
#         _ = instance.powered
#     catch
#         turn_on!(instance)
#     end
#     return instance.name
# end

