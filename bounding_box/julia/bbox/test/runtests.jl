using bbox
using Test

@testset "bbox.jl" begin
    # Write your tests here.
    @test 4 ± 2 == [2, 6]
end
