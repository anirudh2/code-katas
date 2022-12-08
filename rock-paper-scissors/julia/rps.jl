# const rock_sym = Symbol("rock")
# const paper_sym = Symbol("paper")
# const scissors_sym = Symbol("scissors")
const rock_id = "rock"
const paper_id = "paper"
const scissors_id = "scissors"


abstract type Hand end

struct Rock <: Hand
    name::String
    # Rock() = new("rock")
    Rock() = new(rock_id)
end

struct Paper <: Hand
    name::String
    # Paper() = new("paper")
    Paper() = new(paper_id)
end

struct Scissors <: Hand
    name::String
    Scissors() = new(scissors_id)
end

r = Rock()
p = Paper()
s = Scissors()

hands = [i.name for i in [r, p, s]]

function HandFactory(type::String)::Hand
    # if type == "rock"
    #     return Rock()
    # elseif type == "paper"
    #     return Paper()
    # elseif type == "scissors"
    #     return Scissors()
    # end
    pairs = (
        (rock_id, Rock()),
        (paper_id, Paper()),
        (scissors_id, Scissors())
    )
    dict = Dict(pairs)
    return dict[type]
end



struct Player
    # hand::String
    # Player(hand) = new(hand)

    hand::Hand
    Player(name::String) = new(HandFactory(name))
end

hand(a::Player) = a.hand.name


function main()::Cint

    while true
        print("\nEnter a choice $hands: ")
        human = Player(readline())
        computer = Player(rand(hands))

        # println("\nYou chose " * hand(human) * ", computer chose " * hand(computer) * ".\n")
        println("\nYou chose $(human |> hand), computer chose $(computer |> hand).\n")

        print("Play again? (y/n): ")
        play_again = readline()
        if lowercase(play_again) != "y"
            break
        end
    end

    return 0  # no errors
end