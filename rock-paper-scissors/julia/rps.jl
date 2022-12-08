const rock_sym = Symbol("rock")
const paper_sym = Symbol("paper")
const scissors_sym = Symbol("scissors")

abstract type Hand end

struct Rock
    name::String
    Rock() = new("rock")
end

struct Paper
    name::String
    Paper() = new("paper")
end

struct Scissors
    name::String
    Scissors() = new("scissors")
end

r = Rock()
p = Paper()
s = Scissors()

# actions = ("rock", "paper", "scissors")
actions = [i.name for i in [r, p, s]]

struct Action
    name::String
    hand::Hand
    # name::String
    # Action(::Val{rock_sym}) = new(Rock())
    # Action(::Val{paper_sym}) = new(Paper())
    # Action(::Val{scissors_sym}) = new(Scissors())
    Action(name) = new(Rock())
        if name == "rock" 
    elseif name == "paper"
        Action(name) = n
end

# name(a::Action) = a.name # accessor

# struct UserAction <: Action
#     UserA
# end
# struct ComputerAction <: Action
#     name::String
# end

function main()::Cint

    while true
        print("Enter a choice $actions: ")
        # user_action = readline()
        # user_action = Action(readline())
        # user_action = Action(Symbol(readline()))
        user_action = Action(Val(Symbol(readline())))

        # computer_action = rand(actions)
        # computer_action = Action(rand(actions))
        computer_action = Action(Val(Symbol(rand(actions))))

        # println("\nYou chose $user_action, computer chose $computer_action.\n")
        println("\nYou chose $name(user_action), computer chose $name(computer_action).\n")

        print("Play again? (y/n): ")
        play_again = readline()
        if lowercase(play_again) != "y"
            break
        end
    end

    return 0  # no errors
end