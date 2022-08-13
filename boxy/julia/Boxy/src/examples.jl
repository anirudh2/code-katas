using Boxy, FileIO, GeometryBasics, MeshIO


mesh = load("test/testfiles/cube.stl");  # 1 kB
println("\nTiming test for $mesh")
@time thebox_version_001(mesh)
# result:
#  0.000006 seconds (1 allocation: 64 bytes)
# ((0.0, 10.0), (0.0, 10.0), (0.0, 10.0))

mesh = load("test/testfiles/sphere.stl");  # 4.4 MB
println("\nTiming test for $mesh")
@time thebox_version_001(mesh)
# result:
# 0.000332 seconds (1 allocation: 64 bytes)
# ((-0.49966439604759216, 0.49957019090652466), (-0.49947699904441833, 0.49947279691696167), (-0.4995025098323822, 0.49939000606536865))

mesh = load("test/testfiles/bunny.stl");  # 7.5 MB
println("\nTiming test for $mesh")
@time thebox_version_001(mesh)
# result:
# 0.000561 seconds (1 allocation: 64 bytes)
# ((-0.999530017375946, 0.999705970287323), (-0.9862689971923828, 0.986856997013092), (-0.7714009881019592, 0.7743120193481445))

# mesh = load("test/testfiles/stl_brain.stl");  # 16.3 MB, not checked into repo
# println("\nTiming test for $mesh")
# @time thebox_version_001(mesh)
# result:
# 0.006387 seconds (1 allocation: 64 bytes)
# ((0.0, 208.5), (0.0, 235.5), (0.0, 183.5))

# mesh = load("test/testfiles/stl_outer.stl");  # 22.1 MB, not checked into repo
# println("\nTiming test for $mesh")
# @time thebox_version_001(mesh)
# result:
#  0.008637 seconds (1 allocation: 64 bytes)
# ((0.0, 265.5), (0.0, 240.5), (0.0, 216.5))

