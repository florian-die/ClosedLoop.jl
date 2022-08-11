# using ClosedLoop
# using Test

# scalar system without D

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

# scalar system with D

D = 2.0

sys = LinearSystem(A,B,C,D)
@test sys.D == [2. ;;]