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
    # Scissors() = new("scissors")
    Scissors() = new(scissors_id)
end

const r = Rock()
const p = Paper()
const s = Scissors()

const hands = [i.name for i in [r, p, s]]

# Paradigm between dispatch and OOP.
# April review, anything one can do with a factory one can (and also should) do with dispatch.
# The factory here is a fancy RTTI, which doesn't take advantage of dispatch.
# RTTI is runtime.  Dispatch is compiler level (dispatch is still runtime).

function HandFactory(type::String)::Hand
    # if type == "rock"
    #     return Rock()
    # elseif type == "paper"
    #     return Paper()
    # elseif type == "scissors"
    #     return Scissors()
    # end

    # pairs = (
    #     (rock_id, Rock()),
    #     (paper_id, Paper()),
    #     (scissors_id, Scissors())
    # )
    # dict = Dict(pairs)
    # return dict[type]

    d2 = Dict("rock" => Rock(), "paper" => Paper(), "scissors" => Scissors())
    return d2[type]

end

struct Player
    hand::Hand
    Player(name::String) = new(HandFactory(name))
end

hand(a::Player) = a.hand.name

function tie(hand::Hand)
    return "Both players selected $(hand.name).  It's a tie!"
end

function winner(human_hand::Rock, computer_hand::Rock)
    return tie(human_hand)
end

function winner(human_hand::Paper, computer_hand::Paper)
    return tie(human_hand)
end

function winner(human_hand::Scissors, computer_hand::Scissors)
    return tie(human_hand)
end

winner(human_hand::Rock, computer_hand::Scissors) = "Rock smashes scissors! You win!"
winner(human_hand::Rock, computer_hand::Paper) = "Paper covers rock! You lose."

winner(human_hand::Paper, computer_hand::Rock) = "Paper covers rock! You win."
winner(human_hand::Paper, computer_hand::Scissors) = "Scissors cuts paper! You lose."

winner(human_hand::Scissors, computer_hand::Paper) = "Scissors cuts paper! You win."
winner(human_hand::Scissors, computer_hand::Rock) = "Rock smashes scissors! You lose."


# function main()::Cint
function main()

    while true
        print("\nEnter a choice $hands: ")
        human = Player(readline())
        computer = Player(rand(hands))

        println("\nYou chose $(human |> hand), computer chose $(computer |> hand).")

        winner(human.hand, computer.hand) |> println

        print("Play again? (y/n): ")
        play_again = readline()
        if lowercase(play_again) != "y"
            break
        end
    end

    # return 0  # no errors
    return nothing
end

main()

