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

    neg_exp_sum = sum(exp.(-Z_score*N))

    log_ = -log(neg_exp_sum)/N

    return (log_*sigma)+mu

end

function analytic_min_max(X::Array{Float64, 1},N::Int64,case::Int64)

    ## if case == 1 apply analytic_min() else, apply analytic_max()
    q = N*(-1)^case

    mu, sigma = mean(X), std(X)

    Z_score = (X.-mu)./sigma

    neg_exp_sum = sum(exp.(-Z_score*q))

    log_ = log(neg_exp_sum)/q

    return (log_*sigma)+mu

end