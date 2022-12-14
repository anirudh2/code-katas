# Anirudh and Chad team code of rock, paper, scissors

"""
Julia can dispatch on three main types
- types
- bitstype (Int32, Float32), ref isbitstype(), by constructing a value type of a bitstype
    e.g., val of 1, 2, 3, true, false
    mild form of pattern matching
    julia> isbitstype(Int)
    true
    
    julia> isbitstype(String)
    false
- symbols, by constructing a value type of a symbol
From any string, one can construct a symbol
    const aged_brie_sym = Symbol("Aged Brie")
    const sulfuras_sym = Symbol("Sulfuras, Hand of Ragnaros")
    const backstage_sym = Symbol("Backstage passes to a TAFKAL80ETC concert")
    const conjured_sym = Symbol("Conjured Mana Cake")
"""

winner(::Val{:rock}, ::Val{:paper}) = "Paper covers rock! You lose."
winner(::Val{:rock}, ::Val{:scissors}) = "Rock smashes scissors! You win!"

winner(::Val{:paper}, ::Val{:rock}) = "Paper covers rock!. You win!"
winner(::Val{:paper}, ::Val{:scissors}) = "Scissors cuts paper!  You lose."

winner(::Val{:scissors}, ::Val{:rock}) = "Rock smashes scissors! You lose."
winner(::Val{:scissors}, ::Val{:paper}) = "Scissors cuts paper!  You win!"

winner(::Val{T}, ::Val{T}) where {T} = "It's a tie!"

const hands = (:rock, :paper, :scissors)  # make them all symbols, not strings

function play_round()

    println("Enter a choice $(hands .|> string)")
    user_input = readline() |> lowercase |> Symbol

    if user_input ∉ hands
        error("Bad input")  # rudimentary error checking
    end

    computer_input = rand(hands)

    println("\nYou chose $user_input, computer chose $computer_input.\n")

    winner(Val(user_input), Val(computer_input)) |> println


    return nothing

end

function main()

    while true

        play_round()

        println("Play again? (y/n)")
        play_again = readline() |> lowercase

        if play_again != "y"
            break
        end
    end # while true loop

    return nothing
end

# debugged with
# cbh@Atlas/Users/cbh/code-katas/rock-paper-scissors/julia> julia -e 'include("rps2.jl"); main()' 

# turn optimization off
# cbh@Atlas/Users/cbh/code-katas/rock-paper-scissors/julia> julia rps2.jl -O 0

main()
