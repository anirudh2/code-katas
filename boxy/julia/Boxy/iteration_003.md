# Expand the `Boxy` package

Add the following implementation to `Boxy.jl`:

```julia
function thebox_version_001(mesh)
    # for i in coordinates(mesh)
    xmin, xmax = 0.0, 0.0 # initial values
    ymin, ymax = 0.0, 0.0 # initial values
    zmin, zmax = 0.0, 0.0 # initial values
    ix, iy, iz = 1, 2, 3 # integer indexes

    for (index, value) in enumerate(coordinates(mesh))
        println("index: $index vertex $value")
        xmin = min(xmin, value[ix])
        xmax = max(xmax, value[ix])
        ymin = min(ymin, value[iy])
        ymax = max(ymax, value[iy])
        zmin = min(zmin, value[iz])
        zmax = max(zmax, value[iz])
    end
    return ((xmin, xmax), (ymin, ymax), (zmin, zmax))
end
```

Add the following implementation to `runtests.jl`:

```julia
@test thebox_version_001(mesh) == ((0.0, 10.0), (0.0, 10.0), (0.0, 10.0))
```

From the package manager, run the tests, verify they pass:

```bash
(Boxy) pkg> test
     Testing Boxy
      Status `/private/var/folders/b8/h5wsr6gn7yxc6crqxbbgdhb80000gn/T/jl_vTEZIb/Project.toml`
  [bc8dd39e] Boxy v0.1.0 `~/code-katas/boxy/julia/Boxy`
  [5789e2e9] FileIO v1.15.0
  [5c1252a2] GeometryBasics v0.4.2
  [7269a6da] MeshIO v0.4.10
  [8dfed614] Test `@stdlib/Test`
      Status `/private/var/folders/b8/h5wsr6gn7yxc6crqxbbgdhb80000gn/T/jl_vTEZIb/Manifest.toml`
  [79e6a3ab] Adapt v3.4.0
  [bc8dd39e] Boxy v0.1.0 `~/code-katas/boxy/julia/Boxy`
  [3da002f7] ColorTypes v0.11.4
  ...
  [3f19e933] p7zip_jll `@stdlib/p7zip_jll`
Precompiling project...
  1 dependency successfully precompiled in 1 seconds (26 already precompiled)
  1 dependency precompiled but a different version is currently loaded. Restart julia to access the new version
     Testing Running tests...
index: 1 vertex Float32[0.0, 0.0, 10.0]
index: 2 vertex Float32[0.0, 10.0, 10.0]
index: 3 vertex Float32[0.0, 0.0, 0.0]
...
index: 36 vertex Float32[10.0, 10.0, 10.0]
Test Summary: | Pass  Total
Boxy.jl       |   10     10
     Testing Boxy tests passed 
```

[Index](README.md)

[Previous](iteration_002.md)

[Next](iteration_004.md)
