# Julia language-study source demonstrations

Runnable Julia examples for CMPS 4010, *Survey of Programming Languages*.
They are adapted from Kuo-pao Yang's C examples where noted; original
attribution remains in the source files. This repository supplies the
source-code component only. The final `lang.zip` must also include the team's
PowerPoint presentation and Word manual.

## Requirements

Install a current Julia release for the computer used to run the examples,
then verify it:

```sh
julia --version
```

These scripts use only Julia's built-in functionality. There are **no Julia
packages to install**, no `Project.toml`, and no network requirement. Run each
file in a separate Julia process from this directory. The intended course
environment is Ubuntu; `TSystem.jl` also requires Ubuntu's standard `ls`
command.

## Run

```sh
julia TSimple.jl
julia TVar.jl
julia TSel.jl
julia TLoop.jl
julia TSub.jl
julia TScanf.jl
julia TStrtok.jl
julia TScope.jl
julia TStructUnion.jl
julia TPointer.jl
julia TEnviron.jl
julia TSystem.jl
julia TArray.jl
julia TDispatch.jl
julia TBroadcast.jl
julia TFile.jl
julia TAI.jl
```

For `TScanf.jl`, enter `1`, `2.2`, `3.3`, and `abcd` at its four prompts.
Invalid numeric input intentionally raises a parse error. `TEnviron.jl`,
`TPointer.jl`, and `TSystem.jl` have computer-dependent output.

`TFile.jl` reads [TFileIn.dat](TFileIn.dat) beside the script and creates or
replaces [TFileOut.dat](TFileOut.dat). The committed output file is a retained
expected-output fixture for the supplied input: `abcd1332` and `efgh5776`.
It accepts only four ASCII letters followed by four digits; malformed input is
rejected before the output file is opened.

## Topic map

| Files | Topic |
| --- | --- |
| `TSimple`, `TVar`, `TSel`, `TLoop` | Basic execution, values, selection, and iteration |
| `TSub`, `TScope`, `TStructUnion`, `TPointer` | Functions, scope, records/types, and managed references |
| `TScanf`, `TStrtok`, `TEnviron`, `TSystem` | Input, strings, environment, and an external command |
| `TArray`, `TDispatch`, `TBroadcast`, `TFile` | Arrays, multiple dispatch, broadcasting, and file I/O |
| `TAI` | XOR neural-network forward pass using arrays, functions, and broadcasting |

The assignment's named examples (`TSimple`, `TVar`, `TSel`, `TLoop`, and
`TSub`) are all present. The assignment does not specify a mandatory example
count or additional mandatory topics.

## AI example

`TAI.jl` calculates a small XOR forward pass with hand-set weights. It shows
matrix multiplication, a broadcast ReLU, and a sigmoid output. It does not
train a model, use an AI package or API, use a dataset, or claim predictive
accuracy. The displayed score is not calibrated confidence.

## Suggested presentation sequence

Start with `TArray` (Julia's 1-based indexing), then `TDispatch` (methods
chosen from argument types), then `TBroadcast` (for example, `a * b` versus
`a .* b`), and finish with `TAI` to connect arrays, functions, and broadcasting
to one numerical calculation. Use the basic and file-I/O examples as support
for questions.

## References

- [Julia documentation](https://docs.julialang.org/en/v1/)
- [Installing Julia](https://docs.julialang.org/en/v1/manual/installation/)
- [Arrays and broadcasting](https://docs.julialang.org/en/v1/manual/arrays/)
- [Methods and multiple dispatch](https://docs.julialang.org/en/v1/manual/methods/)
- [Functions and argument passing](https://docs.julialang.org/en/v1/manual/functions/)
- [Strings](https://docs.julialang.org/en/v1/manual/strings/)
- [Pointers and references](https://docs.julialang.org/en/v1/base/c/)
- [File I/O](https://docs.julialang.org/en/v1/base/io-network/)
- [Neural-network activation functions](https://developers.google.com/machine-learning/crash-course/neural-networks/activation-functions)

See [REVIEW_AND_PRESENTATION.md](REVIEW_AND_PRESENTATION.md) for detailed
teaching notes and [TEST_RESULTS.txt](TEST_RESULTS.txt) for executed checks.
