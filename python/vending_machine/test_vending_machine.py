from vending_machine import *


def test_update_inventory_sold_out():
    inventory_0 = Inventory(soda=0, chips=1, candy=2)
    inventory_1, display = update_inventory(
        inventory=inventory_0,
        selected_soda=True,
        selected_chips=False,
        selected_candy=False,
    )
    assert inventory_1.soda == 0
    assert inventory_1.chips == 1
    assert inventory_1.candy == 2
    assert display == "SOLD OUT"
