module Bob

using Mocking

export bob

function prompt()
    print("Enter text: ")
    text = @mock(readline())
    return text
end


# TODO: If/else is disgusting
function texttype(s::AbstractString)
    ss = strip(s)
    isquestion = endswith(ss, "?")
    isyell = !any(islowercase, ss) && any(isuppercase, ss)

    if isempty(ss)
        return Val(:noinput)
    end

    if isyell && isquestion
        return Val(:yellquestion)
    end

    if isquestion
        return Val(:question)
    end

    if isyell
        return Val(:yell)
    end

    return Val(:fallback)
end


respond(::Val{:question}) = "Sure."
respond(::Val{:yell}) = "Whoa, chill out!"
respond(::Val{:yellquestion}) = "Calm down, I know what I'm doing!"
respond(::Val{:noinput}) = "Fine. Be that way!"
respond(::Val{:fallback}) = "Whatever."

bob() = respond(texttype(prompt()))

bob(s::AbstractString) = s |> texttype |> respond

end # module Bob
