### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 7524d263-e1b2-459c-a69d-894e6faaf2cb
begin
    a = 3
    b = 4
end

# ╔═╡ 9422ed6a-b311-4e82-8ae8-06cb0ffd79a1
println(a)

# ╔═╡ 23fc72d1-fcd0-4b34-9335-1691b2a6b181
println(b)

# ╔═╡ 2d66d9ac-7831-47f7-866b-fd0b4432da86


# ╔═╡ 02839973-cc6e-447a-8383-745a37299859
begin
    nodes = [
        [101 1.0 1.0],
        [2 2.5 1.0],
        [103 3.0 1.0],
        [4 1.0 2.5],
        [105 2.5 2.5],
        [6 3.0 2.5],
        [13 1.0 3.0],
        [23 2.5 3.0],
        [33 3.0 3.0]
	]
    elements = [
        [1 101 2 105 4],
        [20 2 103 6 105],
        [31 105 6 33 23],
        [44 4 105 23 13]
    ]
	boundaries = [
		[101 1 2],
		[2 2],
		[103 1 2],
		[4 1],
		[6 1],
		[13 1 2],
		[23 2],
		[33 1 2]
	]
end

# ╔═╡ 6c21379a-0b9f-4a87-92db-3299624100da
nodes_dict = Dict(x[1] => x[2:end] for x in nodes)

# ╔═╡ e762c216-2b19-45be-ac7b-7e77d32c7185
elements_dict = Dict(x[1] => x[2:end] for x in elements)

# ╔═╡ e6468126-e7aa-4508-bd5b-173d64b7cb65
boundaries_dict = Dict(x[1] => x[2:end] for x in boundaries)

# ╔═╡ ed82accc-210e-4566-bbc8-5b12a9c09a27


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╠═7524d263-e1b2-459c-a69d-894e6faaf2cb
# ╠═9422ed6a-b311-4e82-8ae8-06cb0ffd79a1
# ╠═23fc72d1-fcd0-4b34-9335-1691b2a6b181
# ╠═2d66d9ac-7831-47f7-866b-fd0b4432da86
# ╠═02839973-cc6e-447a-8383-745a37299859
# ╠═6c21379a-0b9f-4a87-92db-3299624100da
# ╠═e762c216-2b19-45be-ac7b-7e77d32c7185
# ╠═e6468126-e7aa-4508-bd5b-173d64b7cb65
# ╠═ed82accc-210e-4566-bbc8-5b12a9c09a27
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
