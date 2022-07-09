using Currency
using Test

@testset "Currency" begin
    u = USD(2.0)
    e = EUR(1.0)

    @testset "convert" begin
        @test u == e
    end

    @testset "+" begin
        @test u + e == EUR(2.0)
    end

    @testset "gbp" begin
        g = GBP(0.2)
        @test u == g
    end
end
