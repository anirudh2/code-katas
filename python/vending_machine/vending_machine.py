from typing import Literal, NamedTuple


class Inventory(NamedTuple):
    soda: int
    chips: int
    candy: int


class Coin(NamedTuple):
    size: float
    weight: float


class Nickel(Coin):
    size = 5.0
    weight = 55.0


class Dime(Coin):
    size: float = 10.0
    weight: float = 1010.0

    # size = 10.0
    # weight = 1010.0


class Quarter(Coin):
    size = 25.0
    weight = 2525.0


Display = Literal["SOLD OUT", "INSERT COIN"]


def valid_coins() -> tuple[Coin, Coin, Coin]:
    n = Nickel()
    d = Dime()
    q = Quarter()
    return (n, d, q)


def is_valid(size: float, weight: float) -> bool:
    c0 = Coin(size=size, weight=weight)

    breakpoint()
    if c0 in (valid_coins()):
        return True
    else:
        return False


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
