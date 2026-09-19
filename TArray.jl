# Test Arrays: vectors, matrices, slicing, copies, and comprehensions
# Program-ID:   TArray.jl
# Language:     Julia
# Run:          julia TArray.jl
# Reference:    https://docs.julialang.org/en/v1/manual/arrays/

function main()
    println("Test Vector")
    a = [10, 20, 30, 40]
    # Ordinary Julia Arrays start at index 1; end means the last index.
    println("a = $a")
    println("First = $(a[1]), last = $(a[end]), length = $(length(a))")
    println("a[2:3] = $(a[2:3])")
    push!(a, 50)                 # ! conventionally marks a mutating function
    println("After push!: $a")
    removed = pop!(a)
    println("Popped $removed; a = $a")

    println("\nTest Slice Copy")
    part = a[2:3]               # this range slice creates a new array
    part[1] = 999
    println("Changed slice = $part")
    println("Original a = $a")   # changing this slice does not change a

    println("\nTest Matrix")
    # Spaces separate columns; semicolons separate rows.
    b = [1 2 3; 4 5 6]
    println("b = $b")
    println("size(b) = $(size(b))")
    println("b[2,3] = $(b[2, 3])")
    println("Row 1 = $(b[1, :])")
    println("Column 2 = $(b[:, 2])")

    println("\nTest Comprehensions")
    squares = [n^2 for n in 1:5]
    evens = [n for n in 1:6 if iseven(n)]
    println("Squares = $squares")
    println("Even numbers = $evens")
end

main()

#= Output:
Test Vector
a = [10, 20, 30, 40]
First = 10, last = 40, length = 4
a[2:3] = [20, 30]
After push!: [10, 20, 30, 40, 50]
Popped 50; a = [10, 20, 30, 40]

Test Slice Copy
Changed slice = [999, 30]
Original a = [10, 20, 30, 40]

Test Matrix
b = [1 2 3; 4 5 6]
size(b) = (2, 3)
b[2,3] = 6
Row 1 = [1, 2, 3]
Column 2 = [2, 5]

Test Comprehensions
Squares = [1, 4, 9, 16, 25]
Even numbers = [2, 4, 6]
=#
