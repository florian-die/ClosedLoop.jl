abstract type AbstractController end

abstract type AbstractStaticController <: AbstractController end
abstract type AbstractDynamicController <: AbstractController end

include("controllers/static_gain_controller.jl")