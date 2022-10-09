function wordcount(sentence)
    allwords =
        sentence .|>
        lowercase |>
        s -> eachmatch(r"[a-z]+'[a-z]+|[a-z0-9]+", s) |>
             ms -> map(m -> m.match, ms)
    Dict([(w, count(x -> x == w, allwords)) for w in unique(allwords)])
end