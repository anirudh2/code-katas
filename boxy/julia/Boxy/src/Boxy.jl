module Boxy

using GeometryBasics
using MeshIO

export ±, thebox_version_001

# Write your package code here.
# one-line function definition for plus/minus
±(a, b) = [a - b, a + b]

# end # ± <-- no end on one-line functions Chad!

function thebox_version_001(mesh)
    # for i in coordinates(mesh)
    xmin, xmax = 0.0, 0.0 # initial values
    ymin, ymax = 0.0, 0.0 # initial values
    zmin, zmax = 0.0, 0.0 # initial values
    ix, iy, iz = 1, 2, 3 # integer indexes

    for (index, value) in enumerate(coordinates(mesh))
        # println("index: $index vertex $value")
        xmin = min(xmin, value[ix])
        xmax = max(xmax, value[ix])
        ymin = min(ymin, value[iy])
        ymax = max(ymax, value[iy])
        zmin = min(zmin, value[iz])
        zmax = max(zmax, value[iz])
    end
    return ((xmin, xmax), (ymin, ymax), (zmin, zmax))
end

# https://juliageometry.github.io/GeometryBasics.jl/stable/meshes/ 
# function thebox_version_002(mesh::M) where {M<:GeometryBasics.FaceMesh}
function thebox_version_002(mesh::M) where {M<:AbstractMesh}
    # for i in coordinates(mesh)
    xmin, xmax = 0.0, 0.0 # initial values
    ymin, ymax = 0.0, 0.0 # initial values
    zmin, zmax = 0.0, 0.0 # initial values
    ix, iy, iz = 1, 2, 3 # integer indexes

    for (index, value) in enumerate(coordinates(mesh))
        # println("index: $index vertex $value")
        xmin = min(xmin, value[ix])
        xmax = max(xmax, value[ix])
        ymin = min(ymin, value[iy])
        ymax = max(ymax, value[iy])
        zmin = min(zmin, value[iz])
        zmax = max(zmax, value[iz])
    end
    return ((xmin, xmax), (ymin, ymax), (zmin, zmax))
end

# inspiration from https://github.com/JuliaGeometry/Meshes.jl/blob/master/src/boundingboxes.jl#L50    
# function boundingbox(points::AbstractVector{Point{Dim,T}}) where {Dim,T}
#     xmin = MVector(ntuple(i -> typemax(T), Dim))
#     xmax = MVector(ntuple(i -> typemin(T), Dim))
#     for p in points
#         x = coordinates(p)
#         @. xmin = min(x, xmin)
#         @. xmax = max(x, xmax)
#     end
#     Box(Point(xmin), Point(xmax))
# end



end # module Boxy
