# Test Broadcasting: element-wise operators, functions, and assignment
# Program-ID:   TBroadcast.jl
# Language:     Julia
# Run:          julia TBroadcast.jl
# Reference:    https://docs.julialang.org/en/v1/manual/arrays/#Broadcasting

# A scalar function; calling it with . applies it element by element.
add_bonus(score) = score + 5

function main()
    println("Test Dotted Operators")
    x = [1, 2, 3]
    y = [10, 20, 30]
    println("x = $x")
    println("y = $y")
    println("x .+ 10 = $(x .+ 10)")  # scalar 10 is used for each element
    println("x .* y = $(x .* y)")
    println("x .^ 2 = $(x .^ 2)")

    println("\nTest Dotted Function Call")
    scores = [70, 80, 90]
    println("add_bonus.(scores) = $(add_bonus.(scores))")
    println("Original scores = $scores")

    println("\nTest In-place Broadcasting")
    result = zeros(Int, length(x))
    # .= writes into result; the dotted operations form a fused broadcast.
    result .= 2 .* x .+ 1
    println("result = $result")

    println("\nTest Matrix Multiplication versus Element-wise Multiplication")
    a = [1 2; 3 4]
    b = [5 6; 7 8]
    println("a * b = $(a * b)")      # matrix product
    println("a .* b = $(a .* b)")    # multiply corresponding entries
end

main()

#= Output:
Test Dotted Operators
x = [1, 2, 3]
y = [10, 20, 30]
x .+ 10 = [11, 12, 13]
x .* y = [10, 40, 90]
x .^ 2 = [1, 4, 9]

Test Dotted Function Call
add_bonus.(scores) = [75, 85, 95]
Original scores = [70, 80, 90]

Test In-place Broadcasting
result = [3, 5, 7]

Test Matrix Multiplication versus Element-wise Multiplication
a * b = [19 22; 43 50]
a .* b = [5 12; 21 32]
=#
