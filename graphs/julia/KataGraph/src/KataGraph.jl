module KataGraph

# using Base.Iterators  # Base is in Julia standard library

export shuffle, wrap_first, pair_up

# Write your package code here.

# The most Pythonic way to define this function signature:
# function shuffle(x::Vector{Vector{Int64}})
# but not nice for the Julia compiler


function wrap_first(x::AbstractVector{<:Integer})
    # return vcat(x, x[1])
    return vcat(x, first(x))
end


function pair_up(x::AbstractVector{<:Integer})
    # collect(product(x, x))
    # return map(y -> sort(collect(y)), zip(x[1:end-1], x[2:end]))
    # return sort.(collect.(zip(x[1:end-1], x[2:end])))
    return zip(x[1:end-1], x[2:end]) .|> collect .|> sort
end


function shuffle(x::AbstractVector{<:AbstractVector{<:Integer}})
    # Our python version
    # return vcat(map(y -> pair_up(wrap_first(y)), x))

    # Normal/basic julia version
    # return sort(unique(collect(Iterators.flatten(pair_up.(wrap_first.(x))))))

    # Cleaner julia syntax
    return x .|> wrap_first .|> pair_up |> Iterators.flatten |> collect |> unique |> sort
end

end
