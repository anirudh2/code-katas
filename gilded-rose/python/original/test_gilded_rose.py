#!/usr/bin/env python3

from gilded_rose import Item, GildedRose

def test_foo():
    items = [Item("foo", 0, 0)]
    gr = GildedRose(items)
    gr.update_quality()
    assert items[0].name == "fixme"
