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

export sizes, number2array

export LinearSystem
export state_dynamics, noiseless_measurement, noisy_measurement

end # module
