using Dates

import Base.+

function hh(x::Integer)
    if x ≥ 0
        # return x % 24
        return Int(floor(x / 60)) % 24
    else
        return Int(floor(x / 60)) % 24 + 24
    end
end

function mm(x::Integer)
    # return x % 60
    if x ≥ 0
        return x % 60
    else
        # return (x + 60) % 60
        # return x % 60 + 60
        return x % 60 ≥ 0 ? x % 60 : x % 60 + 60
    end
end

struct Clock
    hours::Integer
    minutes::Integer
    function Clock(hours, minutes)

        # convert input hours + minutes into total minutes
        mins = hours * 60 + minutes
        new(hh(mins), mm(mins))
    end
end


function +(cc::Clock, mm::Dates.Minute)
    h = cc.hours
    m1 = cc.minutes
    m2 = Dates.DateTime(mm) |> minute
    return Clock(h, m1 + m2)
end