using Statistics

function numerical_stability(method,type::Int64)

	"""
		A simple test for numerical stability with respect to the relative error. 

		Input: 
			
			method: the approximation used

			type: 1 for min() and 2 for max()

		Output: 

			Check that the average relative error is less than 10%.  

	"""

	## test will be run 100 times 
	relative_errors = zeros(100)

	for i = 1:100

		## a vector sampled uniformly from [-1000,1000]^100
		X = (2*rand(100).-1.0)*1000

		## the test for min operators
		if type == 1

			min_ = minimum(X)

			relative_errors[i] = abs(min_-method(X,i))/abs(min_)

		## the test for max operators
		else 

			max_ = maximum(X)

			relative_errors[i] = abs(max_-method(X,i))/abs(max_)

		end

	end

	return mean(relative_errors) < 0.1

end

