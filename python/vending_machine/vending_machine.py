import functools
import itertools
import math
from typing import Literal, NamedTuple


class Inventory(NamedTuple):
    soda: int
    chips: int
    candy: int


class Coin(NamedTuple):
    size: float
    weight: float
    value: float


class Bank(NamedTuple):
    nickels: int
    dimes: int
    quarters: int


Display = Literal["SOLD OUT", "INSERT COIN"]


def quarter() -> Coin:
    return Coin(size=25.0, weight=2525.0, value=0.25)


def dime() -> Coin:
    return Coin(size=10.0, weight=1010.0, value=0.10)


def nickel() -> Coin:
    return Coin(size=5.0, weight=55.0, value=0.05)


def valid_coins() -> tuple[Coin, Coin, Coin]:

    ni = nickel()
    di = dime()
    qu = quarter()

    return (ni, di, qu)


def coin_value(*, size: float, weight: float) -> float:
    def conditional_value(size, weight, coin) -> float:
        value = 0.0  # default value
        if size == coin.size and weight == coin.weight:
            value = coin.value  # overwrite
        return value

    # example of currying, cv = conditional_value curried function
    cv = functools.partial(conditional_value, size, weight)
    return sum(map(cv, valid_coins()))


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
        updated = Inventory(soda=usoda, chips=uchips, candy=ucandy,)
        display = "INSERT COIN"

    return updated, display


def change(*, amount_paid: float, bank: Bank, price: float) -> tuple[Coin, ...]:
    overage = round(amount_paid - price, 2)

    num_quarters = min(math.floor(overage / 0.25), bank.quarters)
    overage = round(overage - (num_quarters * 0.25), 2)
    num_dimes = min(math.floor(overage / 0.1), bank.dimes)
    overage = round(overage - (num_dimes * 0.1), 2)
    num_nickels = min(math.floor(overage / 0.05), bank.nickels)

    return tuple(
        itertools.chain(
            itertools.repeat(nickel(), num_nickels),
            itertools.repeat(dime(), num_dimes),
            itertools.repeat(quarter(), num_quarters),
        )
    )
