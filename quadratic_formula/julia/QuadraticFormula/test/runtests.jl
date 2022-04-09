using QuadraticFormula
using Test

@testset "QuadraticFormula.jl" begin


    @test 4 ± 2 == [2, 6]

    # ax^2 + bx + c
    @test quadratic_formula(1, 0, -4) == [-2, 2]
    @test_throws BadInputs quadratic_formula("1", 0, -4)
    @test_throws DomainError quadratic_formula(1, 0, 4)
    @test_throws DivideByZero quadratic_formula(0, 2, -4)

    @test quadratic_formula_functional(1, 0, -4).value == [-2, 2]
    @test quadratic_formula_functional(0, 2, -4).value == "ZeroDivision"
end
