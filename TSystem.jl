# Test running an external command (Ubuntu; requires ls)
# Program-ID:   TSystem.jl
# Language:     Julia (translated from Kuo-pao Yang's C examples)
# OS:           Ubuntu 26
# Note:
#    $ nano     TSystem.jl
#    $ julia    TSystem.jl

run(`ls -al`)     # a Cmd object is executed directly; no shell is started

#= Output:
drwxrwxr-x 2 yang yang 4096 Sep 24 02:35 .
drwxrwxr-x 6 yang yang 4096 Sep 24 01:45 ..
-rw-rw-r-- 1 yang yang  856 Sep 24 02:35 TEnviron.jl
-rw-rw-r-- 1 yang yang 1662 Sep 24 02:28 TLoop.jl
...
=#
