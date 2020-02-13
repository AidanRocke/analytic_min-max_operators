using Statistics

function smooth_max(X::Array{Float64, 1},N::Int64)

	## implementation of the smooth maximum: 
	## https://en.wikipedia.org/wiki/Smooth_maximum

	exp_ = exp.(X*N)

	return sum(X.*exp_)/sum(exp_)

end

function GM(X::Array{Float64, 1},N::Int64)

	## generalised mean: https://en.wikipedia.org/wiki/Generalized_mean

	## this method returns a type error unless all elements of X are positive:
	## https://math.stackexchange.com/questions/317528/how-do-you-compute-negative-numbers-to-fractional-powers/317546#317546

	return mean(X.^N)^(1/N)

end

function exp_GM(X::Array{Float64, 1},N::Int64)

	### This method is terrible. Overflow errors everywhere. 

	exp_ = mean(exp.(N*X))

	return (1/N)*log(exp_)

end