# Julia source review and presentation guide

## Assignment coverage

| Item in the supplied assignment | Status |
|---|---|
| Source demonstrations such as TSimple, TVar, TSel, TLoop, TSub, and others | All five named examples plus twelve supporting examples are included. |
| MS PowerPoint presentation | Separate team deliverable; not supplied or reviewed here. |
| MS Word manual: installation/run instructions, references, and source copies | Separate team deliverable; incorporate these final scripts and the README instructions/references. |
| Submit lang.zip; presentation based on that submission | Combine source, PowerPoint, and Word manual in the final archive; keep the presentation consistent with the submitted code. |
| Professor's reported suggestion to include AI | TAI provides a small neural-network computation. The exact suggestion was not provided, so this is a proposed interpretation, not confirmation of an unseen rubric. |

The assignment gives no required source-file count. Seventeen is this team's
chosen scope. More files alone do not improve the presentation.

## What each example contributes

| File | Main teaching point |
|---|---|
| TSimple | Print a message; basic script execution. |
| TVar | Values, basic types, explicit conversion, interpolation. |
| TSel | Conditions and Boolean operators. |
| TLoop | while/for, nested loops, ordinary array indexing. |
| TSub | Functions, returns, local rebinding versus shared-object mutation. |
| TScanf | Keyboard input, parsing, Unicode-aware character removal. |
| TStrtok | Split a string and enumerate its tokens. |
| TScope | Global/local scope and a closure that retains state. |
| TStructUnion | Mutable records, references, and Julia Union types. |
| TPointer | Managed Ref storage and a limited object-address comparison. |
| TEnviron | Read selected environment variables. |
| TSystem | Execute an external command on Ubuntu. |
| TArray | Slicing, slice copies, growing vectors, comprehensions. |
| TDispatch | Choose a method from both argument types. |
| TBroadcast | Apply operations element by element; distinguish matrix multiplication. |
| TFile | Read, transform, and write the supplied sample records. |
| TAI | Combine functions, matrices, and broadcasting in a neural-network forward pass. |

TLoop teaches iteration; TArray adds array operations. TSub teaches arguments
and mutation; TDispatch adds type-based method selection. These distinctions
keep the supporting examples from repeating the same lesson.

## Corrections made during this review

- **TVar:** removed the incorrect claim that C has no Boolean type, qualified
  the size of Int, and corrected misleading conversion comments.
- **TLoop/TPointer:** corrected the claim that Julia lacks raw pointers or
  pointer arithmetic. The pointer example distinguishes Ref from Ptr, initializes
  each Ref directly, and preserves the objects while displaying their addresses.
- **TScanf:** replaced `s[2:end]`, which fails when byte 2 is inside a multibyte
  character, with `chop(s; head=1, tail=0)`. Documented numeric input behavior.
- **TSub:** explained Julia's argument sharing accurately: rebinding and mutation
  have different effects. Updated the displayed lesson title accordingly.
- **TStructUnion:** renamed the illustrative type to DemoDate to avoid confusion
  with Dates.Date, and clarified that selecting b[2] is rebinding a reference.
- **TEnviron:** displays selected ordinary settings, which is suitable for a demo
  without printing every environment variable.
- **TSystem:** clarified that run executes a command directly and that ls is
  an external dependency available on the intended Ubuntu setup.
- **TAI:** added an explicit, small AI example with visible intermediate results.

TArray, TDispatch, TBroadcast, TFile, and TAI extend the professor-derived
examples with focused Julia topics. Their behavior and sample output are
checked in `TEST_RESULTS.txt` in this folder.

## Suggested live demonstration: approximately 4-5 minutes

Adjust this sequence to the time your team is actually given.

1. Briefly show the topic list and explain that each file runs independently.
2. **TArray:** highlight 1-based indexing and how a slice can be a separate copy.
3. **TDispatch:** keep the first argument fixed and change the second argument's
   type. Point out the different selected method. Explain that both types matter.
4. **TBroadcast:** compare `a * b` with `a .* b`; then point out `f.(values)`.
5. **TAI:** connect those array and function features to the forward pass below.

Use the basic examples and file-handling example as supporting material or for
questions. Rehearse a few clear examples rather than trying to explain all
seventeen files during a short time slot.

## Explaining TAI clearly

“XOR returns 1 when its two binary inputs differ. We use two inputs, two hidden
neurons, and one output neuron. The weights are set by hand so we can follow
every calculation. This demonstrates the forward pass; training would be a
separate process that adjusts weights from examples.”

The computation is:

- `z1 = W1 * x + b1`: matrix multiplication computes both hidden weighted sums.
- `hidden = relu.(z1)`: broadcasting applies ReLU to each sum.
- `z2 = W2 * hidden + b2`: compute the output weighted sum.
- `sigmoid(z2[1])`: obtain a score, then apply the 0.5 classification threshold.

For input `[1, 0]`, the hidden weighted sums are `[1, -1]`. ReLU produces
`[1, 0]`. The output weighted sum is `0.5`, so the sigmoid score is approximately
`0.6225` and the predicted class is 1. For `[0, 0]`, the output sum is `-0.5`,
the score is approximately `0.3775`, and the predicted class is 0.

The target labels are displayed for comparison; they are not used by
`forward_pass`. Passing these four hand-designed examples is not evidence of
learning, generalization, or practical predictive accuracy. The example shows
how Julia expresses the numerical operations behind a small network.

## Questions to prepare for

- **Why is this relevant to Julia?** Arrays, matrix multiplication, functions,
  and broadcasting express the network calculation directly.
- **Did the network learn?** No. Its weights were chosen by hand; it runs inference.
- **What would training add?** A loss function and an optimization procedure to
  update weights and biases, commonly using backpropagation for gradients.
- **Why ReLU?** It introduces a nonlinear transformation; here it clips negative sums.
- **Is 0.6225 a measured confidence?** No. It is the sigmoid output of this toy network.
- **Is Julia's Union the same as a C union?** No. Here it describes allowed types;
  the example does not reproduce a C union's shared-memory layout.

## Remaining checks for the team

Run the final scripts on the presentation computer, agree who explains each
example, update the Word manual and slides to match this folder, and confirm
the professor's exact AI suggestion. A request for training, an AI package,
or documented AI-assisted development would need a different addition.
