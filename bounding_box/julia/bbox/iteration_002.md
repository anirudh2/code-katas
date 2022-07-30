# Iteration 002: Using `MeshIO` and related libraries

## Add Packages

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

### Run the Tests

```bash

(bbox) pkg> test
┌ Warning: The active manifest file is an older format with no julia version entry. Dependencies may have been resolved with a different julia version.
└ @ ~/code-katas/bounding_box/julia/bbox/Manifest.toml:0
     Testing bbox
      Status `/private/var/folders/b8/h5wsr6gn7yxc6crqxbbgdhb80000gn/T/jl_76MnDs/Project.toml`
  [5789e2e9] FileIO v1.15.0
  [5c1252a2] GeometryBasics v0.4.2
  [7269a6da] MeshIO v0.4.10
  [dd0d5e91] bbox v0.1.0 `~/code-katas/bounding_box/julia/bbox`
  [8dfed614] Test `@stdlib/Test`
      Status `/private/var/folders/b8/h5wsr6gn7yxc6crqxbbgdhb80000gn/T/jl_76MnDs/Manifest.toml`
  [79e6a3ab] Adapt v3.4.0
  [3da002f7] ColorTypes v0.11.4
  ...
  [8e850b90] libblastrampoline_jll `@stdlib/libblastrampoline_jll`
  [8e850ede] nghttp2_jll `@stdlib/nghttp2_jll`
  [3f19e933] p7zip_jll `@stdlib/p7zip_jll`
     Testing Running tests...
Test Summary: | Pass  Total
bbox.jl       |    9      9
     Testing bbox tests passed 

(bbox) pkg> 
```

[Index](README.md)

[Previous](iteration_001.md)

[Next](iteration_003.md)
