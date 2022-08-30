abstract type AbstractSimulation end

function simulate(sys::AbstractSystem,x0,u,t,p=[])

    @assert size(x0,1) == sys.nx 
    @assert size(u(x0,p,t[1]),1) == sys.nu

    dyn(x,p,t) = state_dynamics(x,u(x,p,t),sys)[:]

    ode = ODEProblem(dyn,x0,[t[1],t[end]])

    sol = solve(ode)

    return sol(t)
    
end


include("simulations/static_controller_simulation.jl")