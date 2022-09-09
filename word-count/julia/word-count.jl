sentence = " .\n,\t!^&*()~@#\$%{}[]:;'/<>"

function wordcount(sentence::AbstractString)
  # isalpha(x) = issubset(x, 'a':'z')
  # isalpha_num(x) = issubset(x, 'a':'z') || issubset(x, 0:9)
  isalpha_num(x) = issubset(x, 'a':'z') || issubset(parse(Int, x), 0:9)
  isspace_ext(x) = isspace(x) || (x == ',')

  removals = ['\"', '\'', '\`', '?', '!', ':', '.', ',', '&', '@', '\\', '$', '%', '^']

  println("\ninput: $sentence")
  aa = strip(lowercase(sentence))
  # bb = split(aa, isspace, keepempty=false)
  # bb1 = split(aa, isspace, keepempty=false)
  bb = split(aa, isspace_ext, keepempty=false)
  #
  # cc = [rstrip(x, removals) for x in bb]
  # bb2 = split(bb1, ',', keepempty=false)
  # cc = [rstrip(x, removals) for x in bb2]
  cc = [rstrip(x, removals) for x in bb]
  dd = [lstrip(x, removals) for x in cc]
  #
  # ddset = Set(filter(isalpha, dd))
  ddset = Set(filter(isalpha_num, dd))
  ee = filter(!isempty, ddset)
  # counts = [count(x == y for x in dd) for y in ddset]
  counts = [count(x == y for x in dd) for y in ee]
  results = Dict(zip(ddset, counts))
end
