using Distributed

square_of_sum(i::Integer) = sum(1:i)^2

sum_of_squares(i::Integer) = sum(pmap(x -> x^2, 1:i))

# difference(i::Integer) = square_of_sum(i) - sum_of_squares(i)
