module ClosedLoop

using DifferentialEquations

include("systems.jl")
include("controllers.jl")
include("filters.jl")
include("simulations.jl")

greet() = print("Hello World!")
include("foo.jl")

end # module
