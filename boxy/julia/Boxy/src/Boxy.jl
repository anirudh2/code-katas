module Boxy

using MeshIO

export ±, thebox

# Write your package code here.

# one-line function definition for plus/minus
±(a, b) = [a - b, a + b]

# end # ± <-- no end on one-line functions Chad!

function thebox(mesh)
    for i in 1:2
        # for vertex in coordinates(mesh)
        println("vertex")
    end
    return true
end # thebox

end # module Boxy
