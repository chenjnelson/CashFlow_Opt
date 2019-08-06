library(linprog)

#Insert the price,coupon, and maturity of each bond at t = 0. Note if the coupon is annualized or not.
Price = c()
Coupon = c()
Maturity = c()

#Insert the liabilities at each discrete time step
Liability = c()

#Insert par value for each bond, which typically is 100 for bonds
Par = c()

time_count = length(Liability)
bond_count = length(Price)

Constraints = matrix(0,nrow = time_count,ncol=bond_count)

for(i in 1:time_count)
{
  for(j in 1:bond_count)
  {
    if(Maturity[j] > i)
    {
      Constraints[i,j] = Coupon[j]
    }
    else
    {
      if(Maturity[j] == i)
        {
        Constraints[i,j] = Par[j] + Coupon[j]
      }
    }
  }
}

solution = lp(const.dir=rep(">=",time_count),objective.in=Price,const.mat=Constraints,direction="min",
       const.rhs=Liability,compute.sens=TRUE)

#The total cost and the allocation of each bond to purchase in the portfolio
solution$objval; solution$solution




