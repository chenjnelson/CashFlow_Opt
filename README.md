#Cash Flow Matching Program
------
[Cash flow matching](https://www.investopedia.com/articles/investing/022615/portfolio-immunization-vs-cash-flow-matching.asp) is a portfolio construction technique used to manage liabilities in the future. It's a dedication strategy where the intent is to form a portfolio  at an onset, typically of bonds, where the cash inflows are met with cash outflows - thus absolving the need to buy or sell assets in the future.


This technique can be implemented through linear programming, which can adhere to this formulation: 

![](https://latex.codecogs.com/gif.latex?\text{min.&space;}&space;$c^Tx;&space;&&space;\\&space;&&space;&&space;\text{s.t.&space;}&space;$Ax&space;&&space;{}\ge&space;b)

In this context, the *c* vector denotes the price of each bond in consideration of the portfolio. As part of the objective function, the goal is to minimize the cost of implementing such a strategy. *b* denotes the liabilities in the future at a certain discrete point in time, which is what the constraint matrix must meet at minimum. *A* is the constraint matrix and requires the maturity and coupon of each bond to construct.

Three scenarios occur at each discrete time interval, *i*, which impact the *A* matrix differently.

* The bond does not mature. This means only the coupon is obtained.

* The bonds mature at this year. Matching liabilities is assumed to be instantaneous and delivered. This means both the coupon and par value are obtained.

* The bond matured and no longer exists. Nothing is collected.

We can solve this using `linprog` in R.

In practice, this method poses certain risks. A typical requirement is that the portfolio comprises of risk-free, non-callable bonds since future cash flows have to be known. Empirically, duration- or convexity- hedged ("immunized") portfolios are cheaper to construct due to empirical interest rate changes. Though it stands that dedicated portfolios do not need to be managed after they are created, and immunized portfolios still need to be actively managed. 




