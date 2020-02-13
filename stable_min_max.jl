using Statistics

function analytic_max(X::Array{Float64, 1},N::Int64)

    mu, sigma = mean(X), std(X)

    Z_score = (X.-mu)./sigma

    exp_sum = sum(exp.(Z_score*N))

    log_ = log(exp_sum)/N

    return (log_*sigma)+mu

end

function analytic_min(X::Array{Float64, 1},N::Int64)

    mu, sigma = mean(X), std(X)

    Z_score = (X.-mu)./sigma

    exp_sum = sum(exp.(-Z_score*N))

    log_ = -log(neg_exp_sum)/N

    return (log_*sigma)+mu

end

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

        ## standardise the vector so it has zero mean and unit variance:
        Z_score = (X.-mu)./sigma

        exp_sum = sum(exp.(-Z_score*q))

        log_ = log(exp_sum)/q

        return (log_*sigma)+mu

    end

end