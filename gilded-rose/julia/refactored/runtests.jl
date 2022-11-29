using Test

# To run the tests, include this file into your REPL
# julia> include("runtests.jl")

include("gilded_rose.jl")

@testset "gilded_rose.jl" begin

    @testset "Aged Brie" begin
        @testset "update" begin
            i = Item("Aged Brie", 2, 0)
            update!(Val(aged_brie_sym), i)
            @test i.sellin == 1
            @test i.quality == 1

            i = Item("Aged Brie", 10, 50)
            update!(Val(aged_brie_sym), i)
            @test i.sellin == 9
            @test i.quality == 50

            i = Item("Aged Brie", 0, 20)
            update!(Val(aged_brie_sym), i)
            @test i.sellin == -1
            @test i.quality == 22  # inc by 2 past sell date
        end

        @testset "update_quality" begin
            items = [Item("Aged Brie", 2, 0)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == 1
            @test items[1].quality == 1

            items = [Item("Aged Brie", 10, 50)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == 9
            @test items[1].quality == 50

            items = [Item("Aged Brie", 0, 20)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == -1
            @test items[1].quality == 22  # inc by 2 past sell date
        end
    end

    @testset "Elixir of the Mongoose" begin
        @testset "update" begin
            i = Item("Elixir of the Mongoose", 5, 7)
            update!(Val(:elixir), i)
            @test i.sellin == 4
            @test i.quality == 6

            i = Item("Elixir of the Mongoose", 5, 0)
            update!(Val(:elixir), i)
            @test i.sellin == 4
            @test i.quality == 0  # quality never negative

            i = Item("Elixir of the Mongoose", 0, 10)
            update!(i)
            @test i.sellin == -1
            @test i.quality == 8  # quality dec by 2x
        end
        @testset "update_quality" begin
            items = [Item("Elixir of the Mongoose", 5, 7)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == 4
            @test items[1].quality == 6

            items = [Item("Elixir of the Mongoose", 5, 0)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == 4
            @test items[1].quality == 0  # quality never negative

            items = [Item("Elixir of the Mongoose", 0, 10)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == -1
            @test items[1].quality == 8  # quality dec by 2x
        end
    end

    @testset "Sulfuras" begin
        @testset "update" begin
            i = Item("Sulfuras, Hand of Ragnaros", 0, 80)
            update!(Val(sulfuras_sym), i)
            @test i.sellin == 0
            @test i.quality == 80

            i = Item("Sulfuras, Hand of Ragnaros", -1, 80)
            update!(Val(sulfuras_sym), i)
            @test i.sellin == -1
            @test i.quality == 80
        end
        @testset "update_quality" begin
            items = [Item("Sulfuras, Hand of Ragnaros", 0, 80)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == 0
            @test items[1].quality == 80

            items = [Item("Sulfuras, Hand of Ragnaros", -1, 80)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == -1
            @test items[1].quality == 80
        end
    end

    @testset "Backstage" begin
        @testset "update" begin
            i = Item("Backstage passes to a TAFKAL80ETC concert", 15, 20)
            update!(Val(backstage_sym), i)
            @test i.sellin == 14
            @test i.quality == 21  # quality inc 1

            i = Item("Backstage passes to a TAFKAL80ETC concert", 9, 20)
            update!(Val(backstage_sym), i)
            @test i.sellin == 8
            @test i.quality == 22  # quality inc 2

            i = Item("Backstage passes to a TAFKAL80ETC concert", 9, 49)
            update!(Val(backstage_sym), i)
            @test i.sellin == 8
            @test i.quality == 50  # quality inc 2, but max quality 50

            i = Item("Backstage passes to a TAFKAL80ETC concert", 5, 20)
            update!(Val(backstage_sym), i)
            @test i.sellin == 4
            @test i.quality == 23  # quality inc 3

            i = Item("Backstage passes to a TAFKAL80ETC concert", 5, 49)
            update!(Val(backstage_sym), i)
            @test i.sellin == 4
            @test i.quality == 50  # quality inc 3, but max quality 50

            i = Item("Backstage passes to a TAFKAL80ETC concert", 0, 50)
            update!(Val(backstage_sym), i)
            @test i.sellin == -1
            @test i.quality == 0  # quality to 0 after concert
        end
        @testset "update_quality" begin
            items = [Item("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == 14
            @test items[1].quality == 21  # quality inc 1

            items = [Item("Backstage passes to a TAFKAL80ETC concert", 9, 20)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == 8
            @test items[1].quality == 22  # quality inc 2

            items = [Item("Backstage passes to a TAFKAL80ETC concert", 9, 49)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == 8
            @test items[1].quality == 50  # quality inc 2, but max quality 50

            items = [Item("Backstage passes to a TAFKAL80ETC concert", 5, 20)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == 4
            @test items[1].quality == 23  # quality inc 3

            items = [Item("Backstage passes to a TAFKAL80ETC concert", 5, 49)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == 4
            @test items[1].quality == 50  # quality inc 3, but max quality 50

            items = [Item("Backstage passes to a TAFKAL80ETC concert", 0, 50)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == -1
            @test items[1].quality == 0  # quality to 0 after concert
        end
    end

    @testset "Conjured Mana Cake" begin
        @testset "update" begin
            i = Item("Conjured Mana Cake", 5, 7)
            update!(Val(conjured_sym), i)
            @test i.sellin == 4
            @test i.quality == 5

            i = Item("Conjured Mana Cake", 5, 0)
            update!(Val(conjured_sym), i)
            @test i.sellin == 4
            @test i.quality == 0  # quality never negative

            i = Item("Conjured Mana Cake", 0, 10)
            update!(Val(conjured_sym), i)
            @test i.sellin == -1
            @test i.quality == 6  # quality dec by 2x
        end
        @testset "update_quality" begin
            items = [Item("Conjured Mana Cake", 5, 7)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == 4
            @test items[1].quality == 5

            items = [Item("Conjured Mana Cake", 5, 0)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == 4
            @test items[1].quality == 0  # quality never negative

            items = [Item("Conjured Mana Cake", 0, 10)]
            gr = GildedRose(items)
            update_quality!(gr)
            @test items[1].sellin == -1
            @test items[1].quality == 6  # quality dec by 2x
        end
    end
end
