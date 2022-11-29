import Base

const aged_brie_sym = Symbol("Aged Brie")
const sulfuras_sym = Symbol("Sulfuras, Hand of Ragnaros")
const backstage_sym = Symbol("Backstage passes to a TAFKAL80ETC concert")
const conjured_sym = Symbol("Conjured Mana Cake")

mutable struct Item{T<:Integer}
    name::String
    sellin::T
    quality::T
end

Base.show(io::IO, x::Item) = print(io, "$(x.name), $(x.sellin), $(x.quality)")

struct GildedRose{T<:Integer}
    items::Vector{Item{T}}
end

function update!(::Val{aged_brie_sym}, i::Item{T}) where {T<:Integer}
    i.sellin -= 1
    inc = i.sellin < 0 ? 2 : 1
    i.quality = min(i.quality + inc, 50)
    return nothing
end

update!(i::Item{T}) where {T<:Integer} = update!(Val(Symbol(i.name)), i)

function update!(::Val, i::Item{T}) where {T<:Integer}
    i.sellin -= 1
    inc = i.sellin < 0 ? -2 : -1
    i.quality = max(i.quality + inc, 0)
end

function update!(::Val{conjured_sym}, i::Item{T}) where {T<:Integer}
    i.sellin -= 1
    inc = i.sellin < 0 ? -4 : -2
    i.quality = max(i.quality + inc, 0)
end

function update!(::Val{sulfuras_sym}, i::Item{T}) where {T<:Integer}
    return nothing
end

function update!(::Val{backstage_sym}, i::Item{T}) where {T<:Integer}
    i.sellin -= 1
    inc = 1
    if i.sellin ≤ 0
        inc = -i.quality
    elseif i.sellin ≤ 5
        inc = 3
    elseif i.sellin ≤ 10
        inc = 2
    end
    i.quality = max(min(i.quality + inc, 50), 0)
    return nothing
end

function update_quality!(gr::GildedRose)
    update!.(gr.items)
    return nothing
end

# Technically, julia espouses a REPL-driven workflow, so the preferred way to run this
# would be from the REPL. However, if you'd like to run this function from the
# commandline, run `$ julia -e 'include("gilded_rose.jl"); main(;days=3)'` or whatever
# number you want for `days`.
function main(; days::Int64=2)
    println("OMGHAI!")
    items = [
        Item("+5 Dexterity Vest", 10, 20),
        Item("Aged Brie", 2, 0),
        Item("Elixir of the Mongoose", 5, 7),
        Item("Sulfuras, Hand of Ragnaros", 0, 80),
        Item("Sulfuras, Hand of Ragnaros", -1, 80),
        Item("Backstage passes to a TAFKAL80ETC concert", 15, 20),
        Item("Backstage passes to a TAFKAL80ETC concert", 10, 49),
        Item("Backstage passes to a TAFKAL80ETC concert", 5, 49),
        Item("Conjured Mana Cake", 3, 6),
    ]
    for day in 1:days
        println("-------- day $day --------")
        println("name, sellin, quality")
        for item in items
            println(item)
        end
        update_quality!(GildedRose(items))
    end
end
