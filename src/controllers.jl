abstract type AbstractController end

abstract type StaticController <: AbstractController end
abstract type DynamicController <: AbstractController end

include("controllers/static_gain_controller.jl")