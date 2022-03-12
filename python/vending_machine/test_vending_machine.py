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


def test_coin_is_valid():
    w = 1.0
    s = 2.0
    assert not vm.is_valid(weight=w, size=s)

