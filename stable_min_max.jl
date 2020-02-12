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