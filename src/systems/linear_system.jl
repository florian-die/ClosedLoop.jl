"""
$(TYPEDEF)

A linear time-invariant state-space model of equations 

``ẋ = Ax + Bu``

``y = Cx + Du`` 

# Fields 
$(TYPEDFIELDS)
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
    Random number generator sensor noise.

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

function LinearSystem(A,B,C,D=[])

    _, _, ny = sizes(A,B,C,D)
    
    μ = zeros(ny)
    Σ = zeros(ny,ny)

    LinearSystem(A,B,C,D,μ,Σ)
end

function LinearSystem(A,B,C,D,μ,Σ)
    
    nx, nu, ny = sizes(A,B,C,D)

    A = number2array(A)
    B = number2array(B)
    C = number2array(C)

    A = reshape(A,nx,nx)
    B = reshape(B,nx,nu)
    C = reshape(C,ny,nx)

    if isempty(D)
        D = zeros(ny,nu)
    else
        D = number2array(D)
        D = reshape(D,ny,nu)
    end
    
    @assert size(μ,1) == ny

    if ny > 1
        @assert size(Σ) == (ny,ny)
    elseif ny == 1
        Σ = reshape(Σ,1,1)
    else
        @error "ny <= 0"
    end

    rng = MvNormal(μ,PSDMat(Σ))
    # PSDMat for zero matrix convariance
    # https://github.com/JuliaStats/Distributions.jl/issues/1602

    LinearSystem(A,B,C,D,μ,Σ,rng,nx,nu,ny)
end

function state_dynamics(x,u,sys::LinearSystem)
    return sys.A * x + sys.B * u 
end

function noisy_measurement(x,u,sys::LinearSystem)
    return sys.C * x + sys.D * u + rand(sys.rng)
end