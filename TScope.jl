# Test Scope: global, local, block, and "static" variables
# Program-ID:   TScope.jl
# Language:     Julia (translated from Kuo-pao Yang's C examples)
# OS:           Ubuntu 26
# Note:
#    $ nano     TScope.jl
#    $ julia    TScope.jl

i = 1                           # global i

# Julia has no `static` local variables. The idiom is a `let` block:
# j is created once, survives between calls (captured by the function),
# and is invisible everywhere else.
func = let j = 4
    () -> begin                 # anonymous function stored in `func`
        println("func() global i = $i")
        j += 1
        println("func() static j = $j")
    end
end

function main()
    i = 2                       # local i (hides global i inside main)
    let i = 3                   # block-scoped i (hides main's i inside the let)
        println("block  i = $i")
    end
    println("main() i = $i")
    func()
    func()
end

main()

#= Output:
block  i = 3
main() i = 2
func() global i = 1
func() static j = 5
func() global i = 1
func() static j = 6
=#
