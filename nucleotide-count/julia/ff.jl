"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand::AbstractString)
  
  letters = ['A', 'C', 'G', 'T']

  if any(x -> !(x in letters), strand)
    # There are no 'A', 'C, 'G', 'T' in the strand
    throw(DomainError(strand))

  else
    # non-edge cases, input is valid
    counts = [count(x, strand) for x in letters]
    return Dict(zip(letters, counts))

  end

end
