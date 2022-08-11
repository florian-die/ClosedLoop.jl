"""
$(TYPEDEF)

A linear time-invariant state-space model of equations 

``ẋ = Ax + Bu``

``y = Cx + Du`` 

# Fields 
$(FIELDS)
"""
struct LinearSystem <: AbstractSystem
    """State matrix of size `nx` by `nx`"""
    A 
    """Control matrix of size `nu` by `nx`"""
    B
    """Sensor matrix of size `nx` by `ny`"""
    C
    """Sensor matrix of size `nu` by `ny`"""
    D

    """Mean of sensor noise"""
    μ 
    """Covariance matrix of sensor noise"""
    Σ 
    """
    Random number generator for sensor noise.

    It is automatically created based on `μ` and `Σ` with

    `rng = MvNormal(μ,PSDMat(Σ))`
    """
    rng 

    """State dimension"""
    nx 
    """Control dimension"""
    nu 
    """Measurements dimension"""
    ny 
end