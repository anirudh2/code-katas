from typing import Literal, NamedTuple


class Inventory(NamedTuple):
    soda: int
    chips: int
    candy: int


class Coin(NamedTuple):
    size: float
    weight: float


Display = Literal["SOLD OUT", "INSERT COIN"]


def valid_coins() -> tuple[Coin, Coin, Coin]:

    nickel = Coin(size=5.0, weight=55.0)
    dime = Coin(size=10.0, weight=1010.0)
    quarter = Coin(size=25.0, weight=2525.0)

    return (nickel, dime, quarter)


def is_valid(size: float, weight: float) -> bool:

    return Coin(size=size, weight=weight) in valid_coins()


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
