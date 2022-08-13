import numpy as np
import trimesh

# attach to logger so trimesh messages will be printed to console
trimesh.util.attach_to_log()


# mesh objects can be loaded from a file name or from a buffer
# you can pass any of the kwargs for the `Trimesh` constructor
# to `trimesh.load`, including `process=False` if you would like
# to preserve the original loaded data without merging vertices
# STL files will be a soup of disconnected triangles without
# merging vertices however and will not register as watertight
# mesh = trimesh.load('../models/featuretype.STL')

mesh = trimesh.load('../julia/Boxy/test/testfiles/cube.stl')
# [2022-08-13 16:46:14] DEBUG   (load.py:224) loaded <trimesh.Trimesh(vertices.shape=(8, 3), faces.shape=(12, 3))> using load_stl
# [2022-08-13 16:46:14] DEBUG   (constants.py:154) load_mesh executed in 0.0037 seconds.

mesh.is_watertight
# True

mesh.bounding_box.extents
# [2022-08-13 16:48:09] DEBUG   (primitives.py:688) creating mesh for Box primitive
# [2022-08-13 16:48:09] DEBUG   (base.py:2442) mesh transformed by matrix
# array([10., 10., 10.])

mesh = trimesh.load('../julia/Boxy/test/testfiles/sphere.stl')
# load_mesh executed in 0.1310 seconds.

mesh.is_watertight
# True

mesh.bounding_box.extents
# array([0.99923, 0.99895, 0.99889])

mesh = trimesh.load('../julia/Boxy/test/testfiles/bunny.stl')
# load_mesh executed in 0.210 seconds.

mesh.is_watertight
# True

mesh.bounding_box.extents
# array([1.99924, 1.97313, 1.54571])

mesh = trimesh.load('../julia/Boxy/test/testfiles/stl_brain.stl')
# load_mesh executed in 0.3760 seconds.

mesh.is_watertight
# False

mesh.bounding_box.extents
# array([173., 179., 142.])

mesh = trimesh.load('../julia/Boxy/test/testfiles/stl_outer.stl')
# load_mesh executed in 0.3760 seconds.

mesh.is_watertight
# True

mesh.bounding_box.extents
# array([244., 210., 206.])

