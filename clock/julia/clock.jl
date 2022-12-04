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
        # added_hours = Int(floor(minutes / 60)) % 24

        # if added_hours > 0
        #     new(hh(hours) + added_hours, mm(minutes))
        # else
        #     new(hh(hours) % 24, mm(minutes))
        # end

        # if hours ≥ 0
        #     if added_hours > 0
        #         new(hours % 24 + added_hours, minutes % 60)
        #     else
        #         new(hours % 24, minutes % 60)
        #     end
        # elseif hours < 0
        #     if added_hours > 0
        #         new(hours % 24 + 24 + added_hours, minutes % 60)
        #     else
        #         new(hours % 24 + 24, minutes % 60)
        #     end
        # end
    end
end

