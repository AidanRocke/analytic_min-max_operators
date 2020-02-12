using Statistics

function numerical_stability(method,type::Int64)

	relative_errors = zeros(100)

	for i = 1:100

		X = (2*rand(100).-1.0)*1000

		if type == 1

			max_ = maximum(X)

			relative_errors[i] = abs(max_-method(X,i))/max_

		else 

			min_ = minimum(X)

			relative_errors[i] = abs(min_-method(X,i))/min_

		end

	end

	return mean(relative_errors)

end

