using KataGraph
using Test

@testset "KataGraph.jl" begin
    # Write your tests here.
    tol = 0.00001
    pi = 3.14159
    theta = 2 / 3 * pi
    @test isapprox(sin(-theta), -sin(theta); atol = tol)
    # input data

    element1 = [1, 2, 5, 4]
    element2 = [6, 5, 2, 3]
    # mesh_connectivity = [[1, 2, 5, 4], [6, 5, 2, 3]]
    # mesh_connectivity = [single_element, [6, 5, 2, 3]]
    mesh_connectivity = [element1, element2]
    # (1, 2), (2, 5), (5, 4), (4, 1), (6, 5), (5, 2), (2, 3), (3, 6)

    @test [1, 2, 5, 4, 1] == wrap_first(element1)

    @test [[1, 2], [2, 5], [4, 5], [1, 4]] == pair_up([1, 2, 5, 4, 1])

    known_output = [[1, 2], [1, 4], [2, 3], [2, 5], [3, 6], [4, 5], [5, 6]]
    # @test known_output == shuffle(mesh_connectivity)
    # @test mesh_connectivity == shuffle(mesh_connectivity)
    @test known_output == shuffle(mesh_connectivity)

end
