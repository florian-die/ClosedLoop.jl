"""
    sizes(A,B,C,D=[])
"""
function sizes(A,B,C,D=[])

    nx = size(A,1)
    nu = 0
    ny = size(C,1)

    @assert size(A,2) == nx
    @assert size(C,2) == nx
    
    if !isempty(B)
        nu = size(B,2)
        @assert size(B,1) == nx 
    end

    if !isempty(D)
        @assert size(D,1) == ny 
        
        if !isempty(B)
            @assert size(D,2) == nu
        else
            nu = size(D,2)
        end
    end

    return nx, nu, ny
end

number2array(x) = x isa Number ? [x] : x