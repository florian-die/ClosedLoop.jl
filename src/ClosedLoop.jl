module ClosedLoop

using DocStringExtensions
using LinearAlgebra
using DifferentialEquations
using Distributions, PDMatsExtras

include("utils.jl")
include("systems.jl")
include("controllers.jl")
include("filters.jl")
include("simulations.jl")

export LinearSystem

greet() = print("Hello World!")
include("foo.jl")

end # module
