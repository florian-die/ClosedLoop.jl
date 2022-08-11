A = 0.
B = 1.
C = 1.

nx, nu, ny = sizes(A,B,C)

@test nx == 1
@test nu == 1
@test ny == 1

A = 0.
B = []
C = 1.

nx, nu, ny = sizes(A,B,C)

@test nx == 1
@test nu == 0
@test ny == 1