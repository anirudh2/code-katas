using Boxy
using FileIO
using GeometryBasics
# using Meshes
using MeshIO
using Test

const tf = joinpath(dirname(@__FILE__), "testfiles")

function test_face_indices(mesh)
    for face in faces(mesh)
        for index in face
            pass = firstindex(coordinates(mesh)) <= index <= lastindex(coordinates(mesh))
            pass || return false
        end
    end
    return true
end

@testset "Boxy.jl" begin
    # Write your tests here.
    @test 4 ± 2 == [2, 6]

    # examples from https://docs.julialang.org/en/v1/stdlib/Test/
    @test π ≈ 3.14 atol = 0.01
    @testset "trigonometric identities" begin
        θ = 2 / 3 * π
        @test sin(-θ) ≈ -sin(θ)
        @test cos(-θ) ≈ cos(θ)
        @test sin(2θ) ≈ 2 * sin(θ) * cos(θ)
        @test cos(2θ) ≈ cos(θ)^2 - sin(θ)^2
    end

    # MeshIO
    #https://github.com/JuliaIO/MeshIO.jl/blob/master/src/io/stl.jl
    # function load stl

    # from package mode
    # pkg> add FileIO MeshIO    
    # using FileIO
    # mesh = load("path/to/mesh.obj")
    # mesh = load("testfiles/cube.stl")

    # https://github.com/hovey/MeshIO.jl/blob/master/test/runtests.jl#L57
    @testset "file read" begin
        mesh = load(joinpath(tf, "cube.stl"))
        @test length(coordinates(mesh)) == 36
        @test length(faces(mesh)) == 12
        @test test_face_indices(mesh)
        # @test bbox.boundingbox(mesh)
        # @test thebox(mesh)
        @test thebox_version_001(mesh) == ((0.0, 10.0), (0.0, 10.0), (0.0, 10.0))
    end

end # @testset "Boxy.jl" begin
