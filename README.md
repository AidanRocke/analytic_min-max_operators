## analytic_min-max_operators

Within the context of optimisation, analytic approximations of the min and max operators 
are very useful. I found a few proposed solutions on the [MathOverflow](https://mathoverflow.net/questions/35191/a-differentiable-approximation-to-the-minimum-function) 
and after analysing their numerical stability decided to formulate my own variant inspired
by the [infinity norm](https://en.wikipedia.org/wiki/Lp_space#The_p-norm_in_finite_dimensions). 

## To improve numerical stability my method does the following:

1. Standardises random vectors: https://www.britannica.com/topic/standardized-random-variable
2. Maps vectors from R^n to R+^n, which is necessary for methods inspired by the infinity norm to work. 

```julia
function analytic_min_max(X::Array{Float64, 1},N::Int64,case::Int64)

    ## if case == 1 apply analytic_min() otherwise apply analytic_max()
    q = N*(-1)^case

    mu, sigma = mean(X), std(X)

    Z_score = (X.-mu)./sigma

    neg_exp_sum = sum(exp.(-Z_score*q))

    log_ = log(neg_exp_sum)/q

    return (log_*sigma)+mu

end
```