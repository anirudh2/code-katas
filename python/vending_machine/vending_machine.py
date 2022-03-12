from typing import Literal, NamedTuple


class Inventory(NamedTuple):
    soda: int
    chips: int
    candy: int


Display = Literal["SOLD OUT", "INSERT COIN"]


def update_inventory(
    *,
    inventory: Inventory,
    selected_soda: bool,
    selected_candy: bool,
    selected_chips: bool
) -> tuple[Inventory, Display]:
    def update_item(qty: int, dqty: int) -> tuple[int, bool]:
        new_qty = qty - dqty
        return new_qty, new_qty >= 0

    usoda, soda_ok = update_item(inventory.soda, int(selected_soda))
    uchips, chips_ok = update_item(inventory.chips, int(selected_chips))
    ucandy, candy_ok = update_item(inventory.candy, int(selected_candy))
    updated = inventory
    display: Display = "SOLD OUT"
    if all((soda_ok, chips_ok, candy_ok)):
        updated = Inventory(
            soda=usoda,
            chips=uchips,
            candy=ucandy,
        )
        display = "INSERT COIN"

    return updated, display
