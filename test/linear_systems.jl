using ClosedLoop
using Test

# scalar system without D
# ẋ = u 
# y = x 

A = 0.
B = 1.
C = 1.

sys = LinearSystem(A,B,C)

@test sys.A == [0. ;;]
@test sys.B == [1. ;;]
@test sys.C == [1. ;;]
@test sys.D == [0. ;;]
@test sys.μ == [0.]
@test sys.Σ == [0. ;;]
@test sys.nx == 1
@test sys.nu == 1
@test sys.ny == 1

x = 2.
u = 1.

@test state_dynamics(x,u,sys) == [1.;;]
@test noiseless_measurement(x,u,sys) == [2.;;]
@test noisy_measurement(x,u,sys) == [2.;;]

# scalar system with D
# ẋ = u 
# y = x + 2*u

A = 0.
B = 1.
C = 1.
D = 2.

sys = LinearSystem(A,B,C,D)
@test sys.D == [2. ;;]

x = 2.
u = 1.

@test noiseless_measurement(x,u,sys) == [4.;;]
