# Iteration 002: Using `MeshIO` and related libraries

* Start a Julia REPL, change to shell mode, and navigate to `~/code-katas/bounding_box/julia/bbox/`.
* Exit shell mode, enter package mode, and activate the `bbox` environment:

```bash
(@v1.7) pkg> activate .
  Activating project at `~/code-katas/bounding_box/julia/bbox`

(bbox) pkg> 
```

Check the status:

```bash
(bbox) pkg> status
     Project bbox v0.1.0
      Status `~/code-katas/bounding_box/julia/bbox/Project.toml`
```

Add libraries:

```bash
(bbox) pkg> add MeshIO FileIO GeometryBasics
```

View updated status:

```bash
(bbox) pkg> status
     Project bbox v0.1.0
      Status `~/code-katas/bounding_box/julia/bbox/Project.toml`
  [5789e2e9] FileIO v1.15.0
  [5c1252a2] GeometryBasics v0.4.2
  [7269a6da] MeshIO v0.4.10
```

Verify the `Project.toml` now has this dependencies section:

```bash
[deps]
FileIO = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
GeometryBasics = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
MeshIO = "7269a6da-0436-5bbc-96c2-40638cbb6118"
```

## Implement a MeshIO Test

Implement the test from https://github.com/hovey/MeshIO.jl/blob/master/test/runtests.jl on
[line 57](https://github.com/hovey/MeshIO.jl/blob/master/test/runtests.jl#L57), which reads in `cube.stl`. 

In the `bbox/test` folder, we create a `testfiles` subfolder, so we can directly use the `MeshIO` code.

* Copy the `cube.stl` file into the `testfiles` folder.
* Copy the `sphere.stl` file into the `testfiles` folder too.  This file source was [discussed previously](../../README.md#materials) in the Materials section.
