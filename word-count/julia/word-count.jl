sentence = " .\n,\t!^&*()~@#\$%{}[]:;'/<>"

function wordcount(sentence::AbstractString)

  println("input: $sentence")
  aa = strip(lowercase(sentence))
  bb = split(aa, isspace, keepempty=false)
  isalpha(x) = issubset(x, 'a':'z')
  # bb = [filter(isalpha, bb)]
  removals = ['\"', '\'', '\`', '?', '!', ':', '.', ',']
  cc = [rstrip(x, removals) for x in bb]
  dd = [lstrip(x, removals) for x in cc]
  ddset = Set(filter(isalpha, dd))
  ee = filter(!isempty, ddset)
  # counts = [count(x == y for x in dd) for y in ddset]
  counts = [count(x == y for x in dd) for y in ee]
  results = Dict(zip(ddset, counts))
end
