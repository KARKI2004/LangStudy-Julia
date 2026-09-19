# Test References and Object Addresses (comparison with C pointers)
# Program-ID:   TPointer.jl
# Language:     Julia (translated from Kuo-pao Yang's C examples)
# OS:           Ubuntu 26
# Note:
#    $ nano     TPointer.jl
#    $ julia    TPointer.jl

function main()
    # Julia supports raw Ptr values. Here Ref provides managed mutable storage.
    # A Ref is not a raw C pointer; p[] accesses its stored value.
    p1 = Ref(5)
    p2 = Ref(7)
    p3 = Ref(p1[] + p2[])

    # pointer_from_objref gives the memory address of the box itself
    println("Address\t\t\t\t Dereference")
    println("-------\t\t\t\t -----------")
    GC.@preserve p1 p2 p3 begin
        println("p1 = $(pointer_from_objref(p1))\t p1[] = $(p1[])")
        println("p2 = $(pointer_from_objref(p2))\t p2[] = $(p2[])")
        println("p3 = $(pointer_from_objref(p3))\t p3[] = $(p3[])")
    end
end

main()

#= Output (addresses will vary):
Address                          Dereference
-------                          -----------
p1 = Ptr{Nothing} @0x00007f3c1a2b3c40    p1[] = 5
p2 = Ptr{Nothing} @0x00007f3c1a2b3c50    p2[] = 7
p3 = Ptr{Nothing} @0x00007f3c1a2b3c60    p3[] = 12
=#
