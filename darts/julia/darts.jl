function score(x, y)
    radius = sqrt(x^2 + y^2)
    r_in, r_mid, r_out = 1.0, 5.0, 10.0 # radius units

    if radius > r_out # miss target
        return 0
        # elseif (radius ≤ r_out) && (radius > r_mid) # outer circle
    elseif radius ≤ r_out && radius > r_mid # outer circle
        return 1
        # elseif (radius ≤ r_mid) && (radius > r_in) # middle circle
    elseif radius ≤ r_mid && radius > r_in # middle circle
        return 5
    else # inner circle
        return 10
    end
end
