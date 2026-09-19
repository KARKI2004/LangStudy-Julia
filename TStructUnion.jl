# Test Struct and Union
# Program-ID:   TStructUnion.jl
# Language:     Julia (translated from Kuo-pao Yang's C examples)
# OS:           Ubuntu 26
# Note:
#    $ nano     TStructUnion.jl
#    $ julia    TStructUnion.jl

mutable struct DemoDate      # `mutable` allows fields to be changed after creation
    y::Int
    m::Int
    d::Int
end

function main()
    b = [DemoDate(1980, 10, 12), DemoDate(1986, 11, 22)]   # constructor takes fields in order

    p = b[1]             # p refers to the SAME object as b[1] (no copy is made)
    println("Test Struct and Reference")
    # C's (*p).y and p->y are both simply p.y in Julia
    println("b[1].y = $(b[1].y)\t p.y = $(p.y)")
    println("b[1].m = $(b[1].m)\t p.m = $(p.m)")
    println("b[1].d = $(b[1].d)\t p.d = $(p.d)")
    p = b[2]             # rebind p to the next object; no pointer arithmetic
    println("b[2].y = $(b[2].y)\t p.y = $(p.y)")
    println("b[2].m = $(b[2].m)\t p.m = $(p.m)")
    println("b[2].d = $(b[2].d)\t p.d = $(p.d)")

    # Julia has no C-style union (two names for the same memory).
    # A Julia Union is a TYPE that lets a variable hold either kind of value.
    # (To view the same bytes as a different type, see `reinterpret`.)
    println("Test Union type")
    q::Union{Int, String} = 20
    println("q = $q\t typeof(q) = $(typeof(q))")
    q = "thirty"
    println("q = $q\t typeof(q) = $(typeof(q))")
end

main()

#= Output:
Test Struct and Reference
b[1].y = 1980    p.y = 1980
b[1].m = 10      p.m = 10
b[1].d = 12      p.d = 12
b[2].y = 1986    p.y = 1986
b[2].m = 11      p.m = 11
b[2].d = 22      p.d = 22
Test Union type
q = 20           typeof(q) = Int64
q = thirty       typeof(q) = String
=#
