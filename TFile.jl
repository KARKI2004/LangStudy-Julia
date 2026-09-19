# Test File I/O: read records, transform fields, and write records
# Program-ID:   TFile.jl
# Language:     Julia
# Based on:     Kuo-pao Yang's TFile.cob example
# Run:          julia TFile.jl
# Input:        TFileIn.dat, beside this script
# Output:       TFileOut.dat, beside this script (replaced on each run)
# Reference:    https://docs.julialang.org/en/v1/base/io-network/

function main()
    # @__DIR__ locates this script even when run from another directory.
    input_path = joinpath(@__DIR__, "TFileIn.dat")
    output_path = joinpath(@__DIR__, "TFileOut.dat")
    records = readlines(input_path)  # one String per line, without newline

    # The supplied format is four ASCII letters and four decimal digits.
    # Validate before opening the output so bad input cannot truncate it.
    for (number, record) in enumerate(records)
        occursin(r"\A[A-Za-z]{4}[0-9]{4}\z", record) ||
            error("Line $number must contain four ASCII letters and four digits.")
        o = parse(Int, record[5:6])
        p = parse(Int, record[7:8])
        (o <= 98 && p >= 2) ||
            error("Line $number: fields must allow o + 1 and p - 2 within 00..99.")
    end

    # "w" creates or replaces the output. The do block closes it automatically,
    # including if an exception occurs inside the block.
    open(output_path, "w") do output
        for record in records
            # ASCII validation above makes these fixed string indices valid.
            m = record[1:2]
            n = record[3:4]
            o = parse(Int, record[5:6])
            p = parse(Int, record[7:8])
            t = o + 1
            u = p - 2
            println("m = $m,n = $n,o = $o,p = $p")
            println("r = $m,s = $n,t = $t,u = $u")
            # Preserve two digits, including leading zeros when needed.
            println(output, m, n, lpad(string(t), 2, '0'), lpad(string(u), 2, '0'))
        end
    end
    println("Wrote $(length(records)) records to TFileOut.dat")
end

main()

#= Output:
m = ab,n = cd,o = 12,p = 34
r = ab,s = cd,t = 13,u = 32
m = ef,n = gh,o = 56,p = 78
r = ef,s = gh,t = 57,u = 76
Wrote 2 records to TFileOut.dat
=#
