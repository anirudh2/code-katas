function wordcount(sentence::AbstractString)
# function ff(sentence::AbstractString)
  println("input: $sentence")
  aa = strip(lowercase(sentence))
  bb = split(aa, isspace, keepempty=false)
  println("bb: $bb")
  removals = ['\"', '\'', '!', ':', '.', ',']
  # return cc = [lstrip(x, ['\'', '!']) for x in bb]
  cc = [lstrip(x, removals) for x in bb]
  dd = [rstrip(x, removals) for x in cc]
  ddset = Set(dd)
  counts = [count(x == y for x in dd) for y in ddset]
  results = Dict(zip(ddset, counts))
end
