module ClosedLoop

using LinearAlgebra
using DifferentialEquations
using Distributions, PDMatsExtras

include("systems.jl")
include("controllers.jl")
include("filters.jl")
include("simulations.jl")

greet() = print("Hello World!")
include("foo.jl")

end # module
