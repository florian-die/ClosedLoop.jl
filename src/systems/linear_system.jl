"""
    LinearSystem
"""
struct LinearSystem <: AbstractSystem
    # continous time state-space matrices 
    # ẋ = Ax + Bu, y = Cx + Du 
    A 
    B
    C
    D

    # measurement noise properties
    "μ : mean of the sensor noise"
    μ # mean 
    Σ # covariance matrix
    rng # random number generator : MvNormal(μ,Σ)

    # variables dimension
    # inferred form the matrices size
    nx # state
    nu # control input
    ny # measurements
end