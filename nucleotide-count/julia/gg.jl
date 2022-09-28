"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand::AbstractString)
    # TODO: StaticVectors? cbh
    # Assume only capital A-Z letters

    # Convert char to int.
    # Use int to index counts vector to store count
    lastix = first(Int64.(codeunits("Z")))
    counts = zeros(Int, lastix)
    @inbounds for c in codeunits(strand)
        counts[c] += 1  # TODO: Follow up: mutation of pre-alloc vector
    end
    # Count occurences of ACGT
    letters = ["A", "C", "G", "T"]
    lettersix = codeunits(join(letters))
    nc = counts[lettersix]
    # Check if any other letters occurred
    counts[lettersix] .= 0
    if sum(counts) > 0
        throw(DomainError(strand))
    end
    return Dict(zip(only.(letters), nc))
end
