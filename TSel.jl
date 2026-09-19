# Test Selections:      if, if-else, if-elseif
# Logical Operators:    &&, ||, !
# Relational Operators: <, >, ==, <=, >=, !=
# Program-ID:   TSel.jl
# Language:     Julia (translated from Kuo-pao Yang's C examples)
# OS:           Ubuntu 26
# Note:
#    $ nano     TSel.jl
#    $ julia    TSel.jl

function main()
    i1, i2, i3, i4, i5, i6 = 1, 2, 3, 4, 5, 6   # multiple assignment

    # Test a simple if: no parentheses or braces, block ends with `end`
    if i4 > i1
        println("i4 >  i1")
    end

    # Test if-else
    if i5 < i2 && i3 >= i2
        println("(i5 <  i2) && (i3 >= i2)")
    else
        println("(i5 >= i2) || (i3 <  i2)")
    end

    # Test nested if-else: Julia has `elseif`, so no nesting needed
    if i1 != i2
        println("(i1 != i2)")
    elseif i4 == i5 || i5 != i6
        println("(i1 == i2) && ((i4 == i5) || (i5 != i6))")
    end
end

main()

#= Output:
i4 >  i1
(i5 >= i2) || (i3 <  i2)
(i1 != i2)
=#
