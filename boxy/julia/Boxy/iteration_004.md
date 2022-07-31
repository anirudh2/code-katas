# Run `Boxy` from a Client

From a terminal, start a Julia REPL, navigate to the Boxy folder, activate the environment, and run the previous test case as a client, verify that `((0.0, 10.0), (0.0, 10.0), (0.0, 10.0))` is returned:

```bash
~> cd code-katas/boxy/julia/Boxy/
~/code-katas/boxy/julia/Boxy(git:main)✔> ls
LICENSE           README.md         iteration_003.md  test/
Manifest.toml     iteration_001.md  iteration_004.md
Project.toml      iteration_002.md  src/
~/code-katas/boxy/julia/Boxy(git:main)✔> julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.7.2 (2022-02-06)
 _/ |\__'_|_|_|\__'_|  |  HEAD/bf53498635 (fork: 461 commits, 417 days)
|__/                   |

shell> pwd
/Users/cbh/code-katas/boxy/julia/Boxy

(@v1.7) pkg> activate .
  Activating project at `~/code-katas/boxy/julia/Boxy`

(Boxy) pkg> using Boxy
ERROR: `using` is not a recognized command. Type ? for help with available commands # nope!  Exit the package manager, return to Julia

julia> using Boxy

(Boxy) pkg> status
     Project Boxy v0.1.0
      Status `~/code-katas/boxy/julia/Boxy/Project.toml`
  [5789e2e9] FileIO v1.15.0
  [5c1252a2] GeometryBasics v0.4.2
  [7269a6da] MeshIO v0.4.10

julia> using FileIO

julia> using MeshIO

julia> using GeometryBasics

julia> mesh = load("test/testfiles/cube.stl")
Mesh{3, Float32, Triangle}:
 Triangle(Float32[0.0, 0.0, 10.0], Float32[0.0, 10.0, 10.0], Float32[0.0, 0.0, 0.0])
 Triangle(Float32[0.0, 0.0, 0.0], Float32[0.0, 10.0, 10.0], Float32[0.0, 10.0, 0.0])
 ...
 Triangle(Float32[10.0, 0.0, 10.0], Float32[10.0, 0.0, 0.0], Float32[10.0, 10.0, 10.0])

julia> thebox_version_001(mesh)
index: 1 vertex Float32[0.0, 0.0, 10.0]
index: 2 vertex Float32[0.0, 10.0, 10.0]
index: 3 vertex Float32[0.0, 0.0, 0.0]
...
index: 36 vertex Float32[10.0, 10.0, 10.0]
((0.0, 10.0), (0.0, 10.0), (0.0, 10.0))

julia>
```

Success!


[Index](README.md)

[Previous](iteration_004.md)

Next - to come.
