const rock_sym = Symbol("rock")
const paper_sym = Symbol("paper")
const scissors_sym = Symbol("scissors")

abstract type Hand end

struct Rock <: Hand
    name::String
    Rock() = new("rock")
end

struct Paper <: Hand
    name::String
    Paper() = new("paper")
end

struct Scissors <: Hand
    name::String
    Scissors() = new("scissors")
end

r = Rock()
p = Paper()
s = Scissors()


function HandFactory(type::String)::Hand
    if type == "rock"
        return Rock()
    elseif type == "paper"
        return Paper()
    elseif type == "scissors"
        return Scissors()
    end
end

hand(a::Player) = a.hand.name

# actions = ("rock", "paper", "scissors")
# actions = [i.name for i in [r, p, s]]
hands = [i.name for i in [r, p, s]]

struct Player
    # hand::String
    # Player(hand) = new(hand)

    hand::Hand
    Player(name::String) = new(HandFactory(name))
end


# struct Action
#     name::String
#     hand::Hand
#     # name::String
#     # Action(::Val{rock_sym}) = new(Rock())
#     # Action(::Val{paper_sym}) = new(Paper())
#     # Action(::Val{scissors_sym}) = new(Scissors())
#     Action(name) = new(Rock())
#         if name == "rock" 
#     elseif name == "paper"
#         Action(name) = n
# end

# name(a::Action) = a.name # accessor

# struct UserAction <: Action
#     UserA
# end
# struct ComputerAction <: Action
#     name::String
# end

function main()::Cint

    while true
        print("Enter a choice $hands: ")
        # user_action = readline()
        # user_action = Action(readline())
        # user_action = Action(Symbol(readline()))
        # user_action = Action(Val(Symbol(readline())))
        human = Player(readline())

        # computer_action = rand(actions)
        # computer_action = Action(rand(actions))
        # computer_action = Action(Val(Symbol(rand(actions))))
        computer = Player(rand(hands))

        # println("\nYou chose $user_action, computer chose $computer_action.\n")
        # println("\nYou chose $name(user_action), computer chose $name(computer_action).\n")
        println("\nYou chose " * hand(human) * ", computer chose " * hand(computer) * ".\n")

        print("Play again? (y/n): ")
        play_again = readline()
        if lowercase(play_again) != "y"
            break
        end
    end

    return 0  # no errors
end