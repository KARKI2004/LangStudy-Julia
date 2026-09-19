# Test Loop: while, for, nested loops (1-D Array and 2-D Array)
# Program-ID:   TLoop.jl
# Language:     Julia (translated from Kuo-pao Yang's C examples)
# OS:           Ubuntu 26
# Note:
#    $ nano     TLoop.jl
#    $ julia    TLoop.jl

function main()
    a = [1, 2, 3]            # 1-D array (Vector)
    b = [10 20 30;           # 2-D array (Matrix): spaces separate columns,
         40 50 60;           #                     semicolons separate rows
         70 80 90]

    println("\nTest while loop: 1-D Array")
    i = 1                    # ordinary Julia Arrays use 1-based indexing
    while i <= 3
        print("a[$i] = $(a[i])\t")
        i += 1
    end

    println("\nTest for loop: 2-D Array")
    for j in 1:3             # 1:3 is a range: 1, 2, 3
        print("b[2,$j] = $(b[2, j])\t")   # row 2 here = row 1 in C
    end

    print("\nTest nested loop: 2-D Array")
    for i in 1:3
        println()
        for j in 1:3
            print("b[$i,$j] = $(b[i, j])\t")
        end
    end
    println()

    # Use ordinary linear indexing here; raw pointer arithmetic is unnecessary.
    # Julia supports low-level pointers too, but this example uses Arrays.
    # These matrices are column-major, so b[k] walks DOWN the columns.
    println("\nTest linear indexing: 2-D Array (column-major)")
    for k in 1:9
        print("b[$k] = $(b[k])\t")
    end
    println()
end

main()

#= Output:

Test while loop: 1-D Array
a[1] = 1        a[2] = 2        a[3] = 3
Test for loop: 2-D Array
b[2,1] = 40     b[2,2] = 50     b[2,3] = 60
Test nested loop: 2-D Array
b[1,1] = 10     b[1,2] = 20     b[1,3] = 30
b[2,1] = 40     b[2,2] = 50     b[2,3] = 60
b[3,1] = 70     b[3,2] = 80     b[3,3] = 90

Test linear indexing: 2-D Array (column-major)
b[1] = 10       b[2] = 40       b[3] = 70       b[4] = 20       b[5] = 50       b[6] = 80       b[7] = 30       b[8] = 60       b[9] = 90
=#
