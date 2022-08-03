# Refactors

## Upgrade the Manifest

In response to the `Manifest.toml` warning that the Manifest was out of date, upgrade the Manifest.

```julia
julia> Pkg.resolve()
┌ Warning: The active manifest file at `/Users/cbh/code-katas/boxy/julia/Boxy/Manifest.toml` has an old format that is being maintained.
│ To update to the new format run `Pkg.upgrade_manifest()` which will upgrade the format without re-resolving.
└ @ Pkg.Types /Users/sabae/src/julia/usr/share/julia/stdlib/v1.7/Pkg/src/manifest.jl:287
  No Changes to `~/code-katas/boxy/julia/Boxy/Project.toml`
  No Changes to `~/code-katas/boxy/julia/Boxy/Manifest.toml`

julia> Pkg.upgrade_manifest()
     Updated Format of manifest file at `/Users/cbh/code-katas/boxy/julia/Boxy/Manifest.toml` updated from v1.0 to v2.0

julia> 
```

## REPL foo

As in *Kung Foo* not `Foobar()`...

```julia
julia> @edit load("test/testfiles/cube.stl")

julia> @edit coordinates(load("test/testfiles/cube.stl"))
```

> Admonishment on Macros: Macros are the extreme case, perhaps a red flag of a Julia package with a lot of macros.  Julia base has very few macros.

The exception:  But `lazy` implements many ease-of-use macros, which is fine.

## Revision Implementation

## To Do

* `@btime` from BenchmarkTools to compare Julia to Python.

[Previous](iteration_004.md)
