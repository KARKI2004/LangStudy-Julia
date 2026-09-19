# Test Subprograms: argument sharing, local rebinding, and mutation
# Arguments share objects with the caller. Rebinding a local argument does
# not rebind the caller's variable, even for mutable objects. Mutating a
# shared Array or Ref IS visible to the caller. Int values are immutable.
# Program-ID:   TSub.jl
# Language:     Julia (translated from Kuo-pao Yang's C examples)
# OS:           Ubuntu 26
# Note:
#    $ nano     TSub.jl
#    $ julia    TSub.jl

function func1(i1, j1)
    i1 = i1 + 1              # i1 is an Int: this rebinds the local only
    j1[] = j1[] + 2          # j1 is a Ref (box): the caller sees this change
    println("func1() i1 = $i1, j1 = $(j1[])")
    return i1 + j1[]
end

function func2(i2, j2)
    i2 = i2 + 3
    j2[1] = j2[2] + 4        # j2 is an Array: modified in place
    println("func2() i2 = $i2, j2 = $(j2[1])")
end

# In C, func3 uses pointer syntax instead of array syntax.
# The two C spellings use the same Julia array indexing here.
function func3(i3, j3)
    i3 = i3 + 3
    j3[1] = j3[1 + 1] + 4
    println("func3() i3 = $i3, j3 = $(j3[1])")
end

function main()
    println("Test argument sharing: rebinding versus mutation")
    n1 = 1
    n2 = Ref(2)              # wrap in a Ref so func1 can change it
    n3 = func1(n1, n2)
    println("n1 = $n1, n2 = $(n2[]), n3 = $n3")

    println("Test Array to Subprogram: way 1 (array)")
    a = [10, 20, 30]
    func2(a[2], a)
    for i in 1:3
        print("a[$i] = $(a[i])\t")
    end

    println("\nTest Array to Subprogram: way 2 (same result)")
    a = [10, 20, 30]
    func3(a[2], a)
    for i in 1:3
        print("a[$i] = $(a[i])\t")
    end
    println()
end

main()

#= Output:
Test argument sharing: rebinding versus mutation
func1() i1 = 2, j1 = 4
n1 = 1, n2 = 4, n3 = 6
Test Array to Subprogram: way 1 (array)
func2() i2 = 23, j2 = 24
a[1] = 24       a[2] = 20       a[3] = 30
Test Array to Subprogram: way 2 (same result)
func3() i3 = 23, j3 = 24
a[1] = 24       a[2] = 20       a[3] = 30
=#
