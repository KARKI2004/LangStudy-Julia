# Test Data types and variables
# Int, Float32, Float64, Char, String
# Julia has a built-in Bool type with values true and false.
# Program-ID:   TVar.jl
# Language:     Julia (translated from Kuo-pao Yang's C examples)
# OS:           Ubuntu 26
# Note:
#    $ nano     TVar.jl
#    $ julia    TVar.jl

function main()
    i1 = 1; i2 = 2          # Int is 64-bit on a 64-bit Julia build
    f1 = 3.3f0; f2 = 4.4f0  # Float32 = C float  (note the f0 suffix)
    d  = 5.5                # Float64 = C double (the default for decimals)
    c  = 'a'                # Char   (single quotes)
    s  = "bcd"              # String (double quotes) - a real type, not char[]
    t  = s                  # t refers to the same string as s
    b  = true               # Bool

    # For this untyped local, `f1 = i1` would rebind f1 to an Int.
    # Typed variables/fields and array assignments can invoke conversion.
    f1 = Float32(i1)        # explicit conversion to Float32 (not generally lossless)
    i2 = trunc(Int, f2)     # narrowing must be explicit; Int(4.4f0) is an error

    println("i1 = $i1")     # $ interpolates a variable into a string
    println("f1 = $f1")
    println("d  = $d")
    println("f2 = $f2")
    println("i2 = $i2")
    println("c  = $c")
    println("s  = $s")
    println("t  = $t")
    println("b  = $b")
end

main()

#= Output:
i1 = 1
f1 = 1.0
d  = 5.5
f2 = 4.4
i2 = 4
c  = a
s  = bcd
t  = bcd
b  = true
=#
