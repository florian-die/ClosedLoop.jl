using ClosedLoop
using Test

@testset "Utils" begin include("utils.jl") end

@testset "Linear systems" begin include("linear_systems.jl") end

@testset "Static Gain Controller" begin include("static_gain_controllers.jl") end