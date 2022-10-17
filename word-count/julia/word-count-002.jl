function wordcount(sentence::AbstractString)
  regs = sentence |> lowercase |> s -> eachmatch(r"[a-z]+'[a-z]+|[a-z0-9]+", s) |> collect
  ww = [m.match for m in regs]  # all words
  ks = ww |> Set # words as a set (eliminate any duplicate words)
  # counts = [count(x, sentence) for x in ks] # nope, catches car as subset of carpet
  counts = [sum([x == y for y in ww]) for x in ks]
  return Dict(zip(ks, counts))
end
