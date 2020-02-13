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

    """
        An analytic approximation to the min and max operators

        Inputs: 
            X: a vector from R^n where n is unknown

            N: an integer such that the approximation of max(X) 
               improves with increasing N.

            case: If case == 1 apply analytic_min(), otherwise 
                  apply analytic_max() if case == 2

        Output: 

            An approximation to min(X) if case == 1, and max(X) if 
            case == 2
    """

    if (case != 1)*(case != 2)

        return print("Error: case isn't well defined")

    else

        ## q is the degree of the approximation: 
        q = N*(-1)^case

        mu, sigma = mean(X), std(X)

        ## rescale vector so it has zero mean and unit variance:
        Z_score = (X.-mu)./sigma

        exp_sum = sum(exp.(-Z_score*q))

        log_ = log(exp_sum)/q

        return (log_*sigma)+mu

    end

end
```

## Discussion: 

It took me about an hour to come up with my solution so I doubt this method is either original or state-of-the-art. 
If you know of a more robust method, feel free to join the discussion on the [MathOverflow](https://mathoverflow.net/questions/352548/analytic-approximations-of-the-min-and-max-operators).

## Relevant articles:  
1. [analytic approximations of the min and max operators](https://mathoverflow.net/questions/352548/analytic-approximations-of-the-min-and-max-operators)
2. [Differentiable approximations to the min and max operators](https://keplerlounge.com/applied-math/2020/02/13/analytic-min-max.html)