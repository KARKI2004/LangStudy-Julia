# Test Environment
# Program-ID:   TEnviron.jl
# Language:     Julia (adapted from Kuo-pao Yang's C examples)
# Run:          julia TEnviron.jl
# ENV maps environment-variable names to string values.
# Display selected keys rather than dumping every environment variable.

for name in ("LANG", "USER", "HOME", "SHELL")
    value = get(ENV, name, "(not set)")
    println("$name=$value")
end

# Output depends on the computer and its environment.
