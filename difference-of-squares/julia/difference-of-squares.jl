"Square the sum of the first `n` positive integers"
function square_of_sum(n)
    sum(range(1, step=1, stop=n))^2
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n)
    sum([x^2 for x in range(1, step=1, stop=n)])
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n)
    square_of_sum(n) - sum_of_squares(n)
end
