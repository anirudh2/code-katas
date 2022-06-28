# Smoothing

## Goals

* Leverage notebooks called Pluto via `add Pluto`
  * For future: Pluto.jl (alpha preview) v0.1.2 VS Code extension
* Do smoothing example, already in Python, in Julia

Postpone:

* IO
* Package management

## Methods

### Input

Reference: https://github.com/sandialabs/sibl/blob/master/geo/data/mesh/four_quads_nonseq.inp

```bash
********************************** N O D E S **********************************
*NODE, NSET=ALLNODES
101, 1.0, 1.0
2, 2.5, 1.0
103, 3.0, 1.0
4, 1.0, 2.5
105, 2.5, 2.5
6, 3.0, 2.5
13, 1.0, 3.0
23, 2.5, 3.0
33, 3.0, 3.0
********************************** E L E M E N T S ****************************
*ELEMENT, TYPE=CPE4, ELSET=EB1
1, 101, 2, 105, 4
20, 2, 103, 6, 105
31, 105, 6, 33, 23
44, 4, 105, 23, 13
********************************** B O U N D A R Y ****************************
*BOUNDARY
101, 1, 2
2, 2
103, 1, 2
4, 1
6, 1
13, 1, 2
23, 2
33, 1, 2
** END OF MODEL
```

## Findings

* Find auto-reload option of the notebook.
* Turns out we really need to create a library in Julia (like we did in Python), so we don't bloat up a Julia Pluto notebook.
* Julia notebooks can be run directly from the command line.
* The data structures converting the mixed [int and floats] into a dictionary seemed artificial and wrong.  Better for Python to have NamedTuple, and better in Julia to have struct.
* For this subject as a kata, it should be broken up into several katas, because the final product prototype from Python was actually several days of code (and it too did not fit into one kata time frame).

