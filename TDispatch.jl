# Test Multiple Dispatch: method selection using BOTH argument types
# Program-ID:   TDispatch.jl
# Language:     Julia
# Run:          julia TDispatch.jl
# Reference:    https://docs.julialang.org/en/v1/manual/methods/

# These are four methods of ONE function, demo_add.
# :: restricts the argument types accepted by a method.
# Integer and AbstractFloat are subtypes of Real.
function demo_add(x::Integer, y::Integer)
    println("Selected: Integer, Integer")
    return x + y
end

function demo_add(x::Integer, y::AbstractFloat)
    println("Selected: Integer, AbstractFloat")
    return x + y
end

function demo_add(x::AbstractFloat, y::Integer)
    println("Selected: AbstractFloat, Integer")
    return x + y
end

# This more general method also accepts two floating-point arguments.
# Julia chooses the most specific applicable method, not the last defined.
function demo_add(x::Real, y::Real)
    println("Selected: Real, Real (general method)")
    return x + y
end

function main()
    # Changing just the second argument selects a different method.
    println("demo_add(2, 3)")
    println("Result = $(demo_add(2, 3))")
    println("\ndemo_add(2, 3.5)")
    println("Result = $(demo_add(2, 3.5))")

    # Changing the first argument also matters; argument order matters.
    println("\ndemo_add(2.5, 3)")
    println("Result = $(demo_add(2.5, 3))")
    println("\ndemo_add(2.5, 3.5)")
    println("Result = $(demo_add(2.5, 3.5))")
end

main()

#= Output:
demo_add(2, 3)
Selected: Integer, Integer
Result = 5

demo_add(2, 3.5)
Selected: Integer, AbstractFloat
Result = 5.5

demo_add(2.5, 3)
Selected: AbstractFloat, Integer
Result = 5.5

demo_add(2.5, 3.5)
Selected: Real, Real (general method)
Result = 6.0
=#
