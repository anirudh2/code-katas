# Graphs Kata

## Introduction

* Graph is composed of nodes and edges.  A node generally has a (x, y, z) -- though this could be just (x), or just (x, y).  The nodes don't have overlapping positions.  Edges connect two nodes.  Edges can be directed, for but this exercise, they are non-directed, so a connection, e.g., between nodes 42 and 23 could be called an edge of (23, 42) and equally well as (42, 23).

* With graphs, there is a concept of an adjacency matrix, A, symmetric matrix for the non-directed special case, for nodes that don't self-connect, the $A_{ii}$ component is zero.   These are generally sparse, nicer to collect in a list, indices pairs (i, j) for non-zero (e.g., identically 1), as a 1 indicates a connection between nodes.  

* In the finite element analysis (FEA) context, there is a concept of `mesh`, which is similar to a graph.

* All nodes must belong to at least one element (or edge).

## Goal

* Convert a mesh connectivity data set to an equivalent upper-diagonal list of non-zero components of the adjacency matrix.

## Example

```bash
  4     5      6
  *-----*------*
  |     |      |
  | (1) | (2)  |
  |     |      |
  *-----*------*
  1     2      3

given:

The example mesh connectivity, arbitrary first node
1, 2, 5, 4  # some counter-clockwise (right-hand rule) perimeter description
6, 5, 2, 3  
```

which therefore has the adjacency matrix:

```bash
Aij = [[ 0  1  0  1  0  0],
       [ 1  0  1  0  1  0],
       [ 0  1  0  0  0  1],
       [ 1  0  0  0  1  0],
       [ 0  1  0  1  0  1],
       [ 0  0  1  0  1  0]]
```


```bash
find:
((1, 2), (1, 4), (2, 3), (2, 5), (3, 6), (4, 5), (5, 6))
```


## Notes

* Do not create `src` and `source` and `tests`, just use the Julia standard templates.  So CBH just needed to create `/graphs/julia` folder.
  * From command line, open the Julia repl.
  * Install Package templates for the first time.

* Verify PkgTemplates does not exist:

```bash
julia> using PkgTemplates
 │ Attempted to find missing packages in package registries but no registries are installed.
 └ Use package mode to install a registry. `pkg> registry add` will install the default registries.

ERROR: ArgumentError: Package PkgTemplates not found in current path:
- Run `import Pkg; Pkg.add("PkgTemplates")` to install the PkgTemplates package.

Stacktrace:
 [1] require(into::Module, mod::Symbol)
   @ Base ./loading.jl:967

julia> ]
? is help in the terminal

(@v1.7) pkg> ? length
ERROR: invalid input: `length` is not a command

help?> ?length
search: length

implementation of length using the macro of @edit

julia> @edit length([1, 2])

julia>

semi-colon for a quick shell mode in julia repl

backspace to exit the shell mode or the help mode

```

### PkgTemplates 

Pkg mode is like the conda package manager, just better.
Currently, Julia has decided not to include PkgTemplates, despite everyone using it on JuliaHub.

Install PkgTemplates to the General Julia global installation.

```bash
julia> ]

(@v1.7) pkg> add PkgTemplates
  Installing known registries into `~/.julia`
    Updating registry at `~/.julia/registries/General.toml`
   Resolving package versions...
   Installed TableTraits ───────────────── v1.0.1
   Installed DataAPI ───────────────────── v1.10.0
   Installed IteratorInterfaceExtensions ─ v1.0.0
   Installed Mocking ───────────────────── v0.7.3
   Installed DataValueInterfaces ───────── v1.0.0
   Installed Mustache ──────────────────── v1.0.13
   Installed Tables ────────────────────── v1.7.0
   Installed PkgTemplates ──────────────── v0.7.28
   Installed UnPack ────────────────────── v1.0.2
   Installed Compat ────────────────────── v3.45.0
   Installed OrderedCollections ────────── v1.4.1
   Installed ExprTools ─────────────────── v0.1.8
   Installed Parameters ────────────────── v0.12.3
    Updating `~/.julia/environments/v1.7/Project.toml`
  [14b8a8f1] + PkgTemplates v0.7.28
    Updating `~/.julia/environments/v1.7/Manifest.toml`
  [34da2185] + Compat v3.45.0
  [9a962f9c] + DataAPI v1.10.0
  [e2d170a0] + DataValueInterfaces v1.0.0
  [e2ba6199] + ExprTools v0.1.8
  [82899510] + IteratorInterfaceExtensions v1.0.0
  [78c3b35d] + Mocking v0.7.3
  [ffc61752] + Mustache v1.0.13
  [bac558e1] + OrderedCollections v1.4.1
  [d96e819e] + Parameters v0.12.3
  [14b8a8f1] + PkgTemplates v0.7.28
  [3783bdb8] + TableTraits v1.0.1
  [bd369af6] + Tables v1.7.0
  [3a884ed6] + UnPack v1.0.2
  [0dad84c5] + ArgTools
  [56f22d72] + Artifacts
  [2a0f44e3] + Base64
  [ade2ca70] + Dates
  [8bb1440f] + DelimitedFiles
  [8ba89e20] + Distributed
  [f43a241f] + Downloads
  [b77e0a4c] + InteractiveUtils
  [b27032c2] + LibCURL
  [76f85450] + LibGit2
  [8f399da3] + Libdl
  [37e2e46d] + LinearAlgebra
  [56ddb016] + Logging
  [d6f4376e] + Markdown
  [a63ad114] + Mmap
  [ca575930] + NetworkOptions
  [44cfe95a] + Pkg
  [de0858da] + Printf
  [3fa0cd96] + REPL
  [9a3f8284] + Random
  [ea8e919c] + SHA
  [9e88b42a] + Serialization
  [1a1011a3] + SharedArrays
  [6462fe0b] + Sockets
  [2f01184e] + SparseArrays
  [10745b16] + Statistics
  [fa267f1f] + TOML
  [a4e569a6] + Tar
  [8dfed614] + Test
  [cf7118a7] + UUIDs
  [4ec0a83e] + Unicode
  [e66e0078] + CompilerSupportLibraries_jll
  [deac9b47] + LibCURL_jll
  [29816b5a] + LibSSH2_jll
  [c8ffd9c3] + MbedTLS_jll
  [14a3606d] + MozillaCACerts_jll
  [4536629a] + OpenBLAS_jll
  [83775a58] + Zlib_jll
  [8e850b90] + libblastrampoline_jll
  [8e850ede] + nghttp2_jll
  [3f19e933] + p7zip_jll
Precompiling project...
  19 dependencies successfully precompiled in 3 seconds

(@v1.7) pkg>
```

In general to add a package a client (not dev)

```bash
pkg> add SomePackage
pkg> add GitHub or GitLab URL (public, not private repo)
```

In general to add a package a developer (every time I run my code, it recompiles the other packages)

```bash
pkg> dev SomePackage
pkg> dev GitHub or GitLab URL (public, not private repo)
```

Recommend against any other general adding of packages for global.

## Create a new Julia package

* For concrete connection with Python, this will equilvalently create `src` and `test` and other files and folders, which is a Julia package.

```bash
julia> using PkgTemplates

julia>
```
* verifies that PkgTemplates is now successfully installed.

```bash
julia> ?PkgTemplates # for the Julia help, and discovered this item:

  Usage
  =======

  Interactive Generation
  ––––––––––––––––––––––––

  You can fully customize your package interactively with:

  using PkgTemplates
  Template(interactive=true)("MyPkg")
```

Could also do `?Template` for more details on the `Template`.

```bash
julia> Template(interactive=true)("KataGraph.jl")
Template keywords to customize:
[press: d=done, a=all, n=none]
   [ ] user
   [ ] authors
   [X] dir
   [ ] host
   [ ] julia
 > [X] plugins
d
Enter value for 'dir' (String, default="~/.julia/dev"):
Enter value for 'dir' (String, default="~/.julia/dev"): "~/code-katas/graphs/julia"
```

Since we are already in code-katas which has Git, for this time only, we 
* Deselect Git, TagBot, CompatHelper
* We added `BlueStyleBadge` (Python Black equivalent) 


```bash
[ Info: Running prehooks
[ Info: Running hooks
  Activating project at `~/code-katas/graphs/julia/KataGraph`
    Updating registry at `~/.julia/registries/General.toml`
┌ Warning: The active manifest file at `/Users/cbh/code-katas/graphs/julia/KataGraph/Manifest.toml` has an old format that is being maintained.
│ To update to the new format run `Pkg.upgrade_manifest()` which will upgrade the format without re-resolving.
└ @ Pkg.Types /Users/sabae/src/julia/usr/share/julia/stdlib/v1.7/Pkg/src/manifest.jl:287
  No Changes to `~/code-katas/graphs/julia/KataGraph/Project.toml`
  No Changes to `~/code-katas/graphs/julia/KataGraph/Manifest.toml`
Precompiling project...
  1 dependency successfully precompiled in 1 seconds
[ Info: We haven't cleaned this depot up for a bit, running Pkg.gc()...
      Active manifest files: 2 found
      Active artifact files: 0 found
      Active scratchspaces: 0 found
     Deleted no artifacts, repos, packages or scratchspaces
  Activating project at `~/.julia/environments/v1.7`
[ Info: Running posthooks
[ Info: New package is at /Users/cbh/code-katas/graphs/julia/KataGraph

julia>
```


## Using the Package

```bash
julia> ;
shell> cd KataGraph
(@v1.7) pkg> activate .  # if not in this `KataGraph` directory, then could do activate path_to_directory
  Activating project at `~/code-katas/graphs/julia/KataGraph`

(KataGraph) pkg>
```

## Add a Package for Blue Style

```bash
julia> 
pkg> add JuliaFormatter
```

Look at `Project.toml` dependencies to be updated, and it is.
```bash
[deps]
JuliaFormatter = "98e50ef6-434e-11e9-1051-2b60c6c9e899"
```

## Run the Package

```bash
?format
julia> using JuliaFormatter
> 
julia> format("src")
true
julia> format("src", verbose=true)
Formatting src/KataGraph.jl
true
julia> format(".", verbose=true)
Formatting src/KataGraph.jl
Formatting test/runtests.jl
true
```

Future reading, using the BlueStyle formatter via a `.toml` file.

## Implementation

### Tests

* See comments in source `.jl` files.

```bash
shell> pwd
/Users/cbh/code-katas/graphs/julia/KataGraph

shell>

(KataGraph) pkg> activate .
  Activating project at `~/code-katas/graphs/julia/KataGraph`

(KataGraph) pkg> test
     Testing KataGraph
```
