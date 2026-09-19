# Test reading input from the keyboard
# Demo inputs: 1, 2.2, 3.3, abcd (one per prompt).
# Invalid numeric text raises a parse error; there is no retry loop.
# Program-ID:   TScanf.jl
# Language:     Julia (translated from Kuo-pao Yang's C examples)
# OS:           Ubuntu 26
# Note:
#    $ nano     TScanf.jl
#    $ julia    TScanf.jl

function main()
    # readline() always gives a String; parse() converts it to the type you want.
    print("Enter integer i: ")
    i = parse(Int, readline())
    println("i = $i")

    print("Enter float f: ")
    f = parse(Float32, readline())     # Float32 = C float
    println("f = $f")

    print("Enter double d: ")
    d = parse(Float64, readline())     # Float64 = C double
    println("d = $d")

    print("Enter string s: ")
    s = readline()                     # no numeric parsing; reads the whole line
    println("s = $s")
    # String indices are UTF-8 byte positions; index 2 may not start a character.
    # chop removes one Unicode character (code point), including safely on "".
    println("Without first character = $(chop(s; head=1, tail=0))")
end

main()

#= Output:
Enter integer i: 1
i = 1
Enter float f: 2.2
f = 2.2
Enter double d: 3.3
d = 3.3
Enter string s: abcd
s = abcd
Without first character = bcd
=#
