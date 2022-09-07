# function wordcount(sentence::AbstractString)
function ff(sentence::AbstractString)
    aa = lowercase(strip(sentence))
    rm = [' ', '.', ',', '\n', '\"', ';', ':', '!']
    println("removals $rm")
    bb = split(aa, rm, keepempty=false)
end
