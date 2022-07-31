# Bouding Box

## Objective

The goal of this kata is to `code` and `test` a command line script (in Julia or Python or both)
that takes as input a well-formed (water-tight and orientable) 3D boundary 
representation as a `.stl` file and returns the bounding box as 
`[xmin, ymin, zmin], [xmax, ymax, zmax]`, two lists of `float` type.

A future kata may exercise the `deploy` leg of the three-legged DevOps CI/CD workflow 
of `code` + `test` + `deploy`.

In this kata, we actually will attempt to use test driven design ("TDD") principles, 
so the workflow will be `test` -> `code` -> `deploy`.

## Materials

The `.stl` test file is a simple sphere, [`sphere.stl`](https://github.com/sandialabs/sibl/blob/c1ed37fecb6f0a856073a530bf92d97c5cc6f60e/geo/data/stl/sphere.stl), taken from the 
GitHub SIBL repo at the `sibl/geo/data/stl/sphere.stl` location.

## Methods

* We will use Julia and/or Python.
* We will package the implementation as a library (service), so that others (clients) can use our functionality as a library.
* We will 
  * write tests, 
  * show the tests fail (because no implementation has yet been created), 
  * write implementation, then finally
  * show the tests succeed (TDD).

## Implementations

* [Julia](julia/Boxy/README.md)
* Python: To come.
