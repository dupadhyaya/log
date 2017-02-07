
# Set up objective.
#
ex.obj <- c( 592, 381, 273, 55, 48, 37, 23)
#
# The constraint needs to be a matrix.
#
ex.con <- matrix (c(3534, 2356, 1767, 589, 528, 451, 304), nrow=1)
#
# Create the sign and the right-hand side of the constraint.
#
ex.sign <- "<="
ex.rhs <- 119567
#
# Require all seven variables to be integers. In general this
# vector will contain the indices of the integer variables.
#
ex.int <- 1:7
#
# Solve the linear program. By default print only the objective
#
library(lpSolve)
lp("max", ex.obj, ex.con, ex.sign, ex.rhs, int.vec=ex.int)
#Success: the objective function is 19979

# Solve and print the vector of optimal values.
#
lp ("max", ex.obj, ex.con, ex.sign, ex.rhs, int.vec=ex.int)$solution
#[1] 32 2 1 0 0 0 0
#
# Require only variables 1 and 3 to be integer
#
lp("max", ex.obj, ex.con, ex.sign, ex.rhs, int.vec=c(1, 3))$solution
#[1] 33.00 1.25 0.00 0.00 0.00 0.00 0.00

#---------------
#
# Set up cost matrix
#
costs <- matrix (10000, 8, 5); costs[4,1] <- costs[-4,5] <- 0
costs[1,2] <- costs[2,3] <- costs[3,4] <- 7
costs[1,3] <- costs[2,4] <- 7.7
costs[5,1] <- costs[7,3] <- 8; costs[1,4] <- 8.4; costs[6,2] <- 9
costs[8,4] <- 10; costs[4,2:4] <- c(.7, 1.4, 2.1)
#
# Set up constraint signs and right-hand sides.
#
row.signs <- rep ("<", 8)
row.rhs <- c(200, 300, 350, 200, 100, 50, 100, 150)
col.signs <- rep (">", 5)
col.rhs <- c(250, 100, 400, 500, 200)

# Now run. lp.transport() converts the "solution" into a matrix.
#
lp.transport (costs, row.signs, row.rhs, col.signs, col.rhs)
#Success: the objective function is 7790
lp.transport (costs, row.signs, row.rhs, col.signs, col.rhs)$solution
