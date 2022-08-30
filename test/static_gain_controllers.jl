using ClosedLoop
using Test

K = 1.

ctrl = StaticGainController(K)

@test ctrl.K == [1.;;]
@test ctrl.nx == 1
@test ctrl.nu == 1