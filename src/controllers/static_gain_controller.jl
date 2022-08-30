struct StaticGainController <: AbstractStaticController
    K
    nx
    nu
end

function StaticGainController(K)

    K = number2array(K)

    nx = size(K,2)
    nu = size(K,1)

    K = reshape(K,nu,nx)

    StaticGainController(K,nx,nu)
end