using Bob
using Test
using Mocking
Mocking.activate()

@testset "Bob" begin

    readline_question_patch = @patch function readline()
        println("Question? \n\t(readline stub => simulating question)")
        return "Question?"
    end
    readline_yell_patch = @patch function readline()
        println("YELL \n\t(readline stub => simulating yell)")
        return "YELL"
    end
    readline_yellquestion_patch = @patch function readline()
        println("YELL? \n\t(readline stub => simulating yell question)")
        return "YELL?"
    end
    readline_noinput_patch = @patch function readline()
        println(" \n\t(readline stub => simulating no input)")
        return " "
    end
    readline_fallback_patch = @patch function readline()
        println("Hello. \n\t(readline stub => simulating fallback)")
        return "Hello"
    end

    @testset "prompt" begin
        apply(readline_question_patch) do
            @test Bob.prompt() == "Question?"
        end
    end

    @testset "texttype" begin
        @test Bob.texttype("Question? ") == Val(:question)
        @test Bob.texttype("YELL") == Val(:yell)
        @test Bob.texttype("YELL?") == Val(:yellquestion)
        @test Bob.texttype(" ") == Val(:noinput)
        @test Bob.texttype("Hello.") == Val(:fallback)
    end

    @testset "respond" begin
        @test Bob.respond(Val(:question)) == "Sure."
        @test Bob.respond(Val(:yell)) == "Whoa, chill out!"
        @test Bob.respond(Val(:yellquestion)) == "Calm down, I know what I'm doing!"
        @test Bob.respond(Val(:noinput)) == "Fine. Be that way!"
        @test Bob.respond(Val(:fallback)) == "Whatever."
    end

    @testset "bob" begin
        apply(readline_question_patch) do
            @test bob() == "Sure."
        end
        apply(readline_yell_patch) do
            @test bob() == "Whoa, chill out!"
        end
        apply(readline_yellquestion_patch) do
            @test bob() == "Calm down, I know what I'm doing!"
        end
        apply(readline_noinput_patch) do
            @test bob() == "Fine. Be that way!"
        end
        apply(readline_fallback_patch) do
            @test bob() == "Whatever."
        end
    end

    @testset "boringbob" begin
        @test bob("Question?") == "Sure."

        questions = (
            "Does this cryogenic chamber make me look fat?",
            "Hä?",
            "You are, what, like 15?",
            "fffbbcbeab?",
            "4?",
            ":) ?",
            "Wait! Hang on. Are you going to be OK?",
            "Okay if like my  spacebar  quite a bit?   ",
            "Oida?",
        )

        yells = (
            "WATCH OUT!",
            "FCECDFCAAB",
            "FCÄEÜCÖDFCẞAB",
            "1, 2, 3 GO!",
            "ZOMG THE %^*@#\$(*^ ZOMBIES ARE COMING!!11!!1!",
            "I HATE YOU",
            "I HATE THE DENTIST",
            "OIDA!",
        )

        silences = (
            "",
            "          ",
            "\t\t\t\t\t\t\t\t\t\t",
            "\n\r \t",
        )

        miscs = (
            "Tom-ay-to, tom-aaaah-to.",
            "Let's go make out behind the gym!",
            "It's OK if you don't want to work for the NSA.",
            "Es ist okay, wenn du nicht für den BND arbeiten möchtest.",
            "1, 2, 3",
            "Ending with ? means a question.",
            "\nDoes this cryogenic chamber make me look fat?\nno",
            "         hmmmmmmm...",
            "This is a statement ending with whitespace      ",
            "Oida.",
        )

        forceful_questions = (
            "WHAT THE HELL WERE YOU THINKING?",
            "WAS ZUR HÖLLE GEHT HIER VOR?",
            "OIDA?",
        )

        response = Dict(
            :question => "Sure.",
            :yelling => "Whoa, chill out!",
            :silence => "Fine. Be that way!",
            :misc => "Whatever.",
            :forceful_question => "Calm down, I know what I'm doing!",
        )

        @testset "questions" begin
            @testset "$question" for question in questions
                @test bob(question) == response[:question]
            end
        end


        @testset "forceful questions" begin
            @testset "$question" for question in forceful_questions
                @test bob(question) == response[:forceful_question]
            end
        end

        @testset "yelling" begin
            @testset "$yell" for yell in yells
                @test bob(yell) == response[:yelling]
            end
        end

        @testset "silence" begin
            @testset "$silence" for silence in silences
                @test bob(silence) == response[:silence]
            end
        end


        @testset "misc" begin
            @testset "$misc" for misc in miscs
                @test bob(misc) == response[:misc]
            end
        end

    end

end