"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand::AbstractString)
    iter = ['A', 'C', 'G', 'T']
    counts = [count(x, uppercase("asdf")) for x in ['A', 'C', 'G', 'T']]
end
