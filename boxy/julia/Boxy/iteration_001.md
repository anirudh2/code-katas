# Iteration 001: Create and Test a Package

We first *create* a package, then implement a simple single-line test, then a simple single-line implementation.  Then we check in the code as incremental development cycle.  Then we start to expand the library through this iterative cycle of `test` -> `code`.

## Create a Package

This method follows the [Create A Package](https://github.com/hovey/jlschool/blob/main/create-a-package.md) tutorial on the jlschool repo.

Verify that `PkgTemplates` exists:

```bash
# vscode cmd + shift + p, Julia: Start REPL
julia> ; # semicolon to enter shell mode

shell> pwd
/Users/cbh/code-katas

shell> cd boxy/julia/
/Users/cbh/code-katas/boxy/julia

julia> using PkgTemplates
          # if PkgTemplates is installed, then nothing (no error) is returned
julia> 
```

If an error is returned, the install PkgTemplates using this [tutorial](https://github.com/hovey/jlschool/blob/main/PkgTemplates.md) on jlschool.

```bash
# help on PkgTemplates
julia> ?PkgTemplates

  Interactive Generation
  ––––––––––––––––––––––––

  You can fully customize your package interactively with:

  using PkgTemplates
  Template(interactive=true)("MyPkg")
```

```bash
shell> pwd
/Users/cbh/code-katas/boxy/julia

julia> Template(interactive=true)("Boxy.jl")
# keywords: dir, plugins
# value for 'dir': "~/code-katas/boxy/julia"
# deselect: CompatHelper, Git, and TagBot.
# ProjectFile keywords to customize: "None", and "None" for all the remaining options
```

Review the new file structure:

```bash
shell> ls
Boxy

shell> cd Boxy/
/Users/cbh/code-katas/boxy/julia/Boxy

shell> ls
LICENSE         Manifest.toml   Project.toml    README.md       src             test
```

Activate the new environment:

```bash
(@v1.7) pkg> activate .
  Activating project at `~/code-katas/julia/Boxy`

(Boxy) pkg> 
```

The boilerplate `boxy/julia/Boxy/test/runtests.jl` file appears as:

```bash
using Boxy
using Test

@testset "Boxy.jl" begin
    # Write your tests here.
end

```

The boilerplate `boxy/julia/Boxy/src/Boxy.jl` file appears as:

```bash
module Boxy

# Write your package code here.

end
```

Modify the `runtests.jl` test file to appear as follows:

```bash
using Boxy
using Test

@testset "Boxy.jl" begin
    # Write your tests here.
    @test 4 ± 2 == [2, 6]
end
```

Run the test to verify the test passes (actually fails):

```bash
(bbox) pkg> test
bbox.jl: Error During Test at /Users/cbh/code-katas/boxy/julia/Boxy/test/runtests.jl:6
  Test threw exception
  Expression: 4 ± 2 == [2, 6]
  UndefVarError: ± not defined
  Stacktrace:
  ...
```

Now create the `plus/minus function` as in the `Boxy.jl` source file:

```bash
module Boxy

export ±

# Write your package code here.

# one-line function definition for plus/minus
±(a, b) = [a - b, a + b]

end # module Boxy
```

Run the test to verify the test (now) passes:

```bash
(Boxy) pkg> test
     Testing Boxy
      Status `/private/var/folders/b8/h5wsr6gn7yxc6crqxbbgdhb80000gn/T/jl_8PeLNT/Project.toml`
  [dd0d5e91] Boxy v0.1.0 `~/code-katas/boxy/julia/Boxy`
  [8dfed614] Test `@stdlib/Test`
      Status `/private/var/folders/b8/h5wsr6gn7yxc6crqxbbgdhb80000gn/T/jl_8PeLNT/Manifest.toml`
  [dd0d5e91] Boxy v0.1.0 `~/code-katas/boxy/julia/Boxy`
  [2a0f44e3] Base64 `@stdlib/Base64`
  [b77e0a4c] InteractiveUtils `@stdlib/InteractiveUtils`
  [56ddb016] Logging `@stdlib/Logging`
  [d6f4376e] Markdown `@stdlib/Markdown`
  [9a3f8284] Random `@stdlib/Random`
  [ea8e919c] SHA `@stdlib/SHA`
  [9e88b42a] Serialization `@stdlib/Serialization`
  [8dfed614] Test `@stdlib/Test`
Precompiling project...
  1 dependency successfully precompiled in 1 seconds
     Testing Running tests...
Test Summary: | Pass  Total
Boxy.jl       |    1      1
     Testing bbox tests passed 

(Boxy) pkg> 
```

Use the functionality interactively in the `REPL` as follows:

```bash
julia> using Boxy

julia> ±(4, 5) # to get ± symbox, type \pm + [tab]
2-element Vector{Int64}:
 -1
  9
```

Check in the code to the GitHub repo as an incremental progress point.

**Iteration 1** is now completed. Congratulations!

[Index](README.md)

[Next](iteration_002.md)