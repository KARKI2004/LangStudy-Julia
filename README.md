# Julia language-study source demonstrations

Runnable Julia examples for CMPS 4010, *Survey of Programming Languages*.
They are adapted from Kuo-pao Yang's C examples where noted; original
attribution remains in the source files. This repository supplies the
source-code component only. The final `lang.zip` must also include the team's
PowerPoint presentation and Word manual.

## Requirements

The intended course environment is Ubuntu ARM64. These examples need:

- A current stable Julia release.
- A terminal and Ubuntu's standard `ls` command for `TSystem.jl`.
- Permission to read this folder and write `TFileOut.dat` beside `TFile.jl`.

They use only Julia's built-in functionality. There are **no Julia packages to
install**: do not run `Pkg.add`, `Pkg.instantiate`, or create a `Project.toml`
for these scripts. They also do not need network access after Julia itself is
installed.

## Ubuntu ARM64 setup

On the Ubuntu VM or presentation computer, first confirm the operating system
and CPU architecture. `aarch64` is the normal name for 64-bit ARM on Ubuntu:

```sh
uname -s
uname -m
```

Install Julia using the [official Julia installation instructions](https://docs.julialang.org/en/v1/manual/installation/).
When `curl` is available, Julia's official Juliaup installer can be started
with:

```sh
curl -fsSL https://install.julialang.org | sh
```

Open a new terminal after installation, then verify that Julia is on `PATH`:

```sh
command -v julia
julia --version
```

Obtain this folder by cloning the future GitHub repository or by extracting the
team's source folder. After replacing the placeholders below with the actual
repository URL and directory name, change into it:

```sh
git clone <repository-url>
cd <repository-directory>
```

Keep `TFile.jl`, `TFileIn.dat`, and the retained `TFileOut.dat` fixture
together. Run each file in a separate Julia process; do not paste all scripts
into one REPL session because several define `main()`.

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

## Before presenting

On the actual Ubuntu ARM64 presentation machine, run `julia --version` and
execute every command in the run list once. Confirm that `TSystem.jl` can run
`ls`, `TFile.jl` can write its output, and the Word manual and PowerPoint use
these final source copies. The current local checks and earlier reported Linux
check are recorded in [TEST_RESULTS.txt](TEST_RESULTS.txt); the Ubuntu ARM64
rehearsal remains the final environment check.

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
