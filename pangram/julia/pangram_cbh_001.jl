"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input::AbstractString)
    # function ff(input::AbstractString)
    # aa = collect(input)
    # bb = lowercase(aa)
    # aa = [contains(lowercase(input), x) for x in ['a', 'b', 'c']]
    ua = Int('a') # Unicode a
    uz = Int('z')
    # aa = [contains(lowercase(input), x) for x in collect("abcd")]
    aa = [contains(lowercase(input), x) for x in [Char(y) for y in ua:uz]]
    if all(aa)
        return true
    else
        return false
    end
end

