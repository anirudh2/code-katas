# import pytest

import vending_machine as vm

def test_update_inventory_sold_out():
    inventory_0 = vm.Inventory(soda=0, chips=1, candy=2)

    inventory_1, display = vm.update_inventory(
        inventory=inventory_0,
        selected_soda=True,
        selected_chips=False,
        selected_candy=False,
    )

    assert inventory_1.soda == 0
    assert inventory_1.chips == 1
    assert inventory_1.candy == 2
    assert display == "SOLD OUT"

def test_update_inventory_decrement():
    inventory_0 = vm.Inventory(soda=0, chips=1, candy=2)

    inventory_1, display = vm.update_inventory(
        inventory=inventory_0,
        selected_soda=False,
        selected_chips=True,
        selected_candy=False,
    )

    assert inventory_1.soda == 0
    assert inventory_1.chips == 0
    assert inventory_1.candy == 2
    assert display == "INSERT COIN"


def test_bad_coin():
    s, w = 5.0, 5.0
    assert vm.coin_value(size=s, weight=w) == 0.0


def test_dime():
    s = 10.0
    w = 1010.0
    assert vm.coin_value(weight=w, size=s) == 0.10

