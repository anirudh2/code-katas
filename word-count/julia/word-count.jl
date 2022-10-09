function counts(needles, haystack)
    return map(x -> sum([x == y for y in haystack]), needles)
end


function wordcount(sentence::AbstractString)
    aa = lowercase(strip(sentence))
    rm = [' ', '.', ',', '\n', '\t', '\"', ';', ':', '~', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '{', '}', '[', ']', '<', '>', '/']
    # println("removals $rm")
    hs1 = split(aa, rm, keepempty=false)
    hs2 = map(x -> strip(x, ['\'']), hs1)
    hs3 = join(hs2, " ")
    haystack = split(hs3)
    needles = [x for x in Set(haystack)]
    cs = counts(needles, haystack)
    return Dict(zip(needles, cs))
end
