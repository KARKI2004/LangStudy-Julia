# Test splitting a string into tokens by separators (delimiters)
# Program-ID:   TStrtok.jl
# Language:     Julia (translated from Kuo-pao Yang's C examples)
# OS:           Ubuntu 26
# Note:
#    $ nano     TStrtok.jl
#    $ julia    TStrtok.jl

cmd  = "ls -al"
args = split(cmd)                  # splits on whitespace (space, tab, newline)
                                   # by default; split(cmd, ",") uses commas, etc.
for (i, arg) in enumerate(args)    # enumerate gives (index, value) pairs, 1-based
    println("args[$i] = $arg")
end

#= Output:
args[1] = ls
args[2] = -al
=#
