import pytest

import currency as cc


def test_to_usd():
    """Given any input, assure output is in usd units."""
    one_usd = cc.U(1.0)
    one_eur = cc.E(1.0)

    assert cc.equals(cc.to_E(one_usd), cc.E(0.50))
    assert cc.equals(cc.to_U(one_eur), cc.U(2.00))

    assert cc.equals(cc.to_U(one_usd), cc.U(1.00))
    assert cc.equals(cc.to_E(one_eur), cc.E(1.00))


def test_equals():
    """Tests of equality between point combinations of U and E."""
    two_usd = cc.U(2.0)  # U
    one_eur = cc.E(1.0)  # E

    # homogeneous cases
    assert cc.equals(two_usd, two_usd)
    assert cc.equals(one_eur, one_eur)

    # heterogeneous cases
    assert cc.equals(two_usd, one_eur)
    assert cc.equals(one_eur, two_usd)


def test_addition():
    """Given two types of heterogeneous and homogeneous nature, add them."""
    two_usd = cc.U(2.0)  # U
    one_eur = cc.E(1.0)  # E

    delta_usd = cc.U(20.0)
    delta_eur = cc.E(10.0)

    cc.equals(cc.plus(two_usd, delta_usd), cc.U(22.0))   # 2 + 20 = 22
    cc.equals(cc.plus(two_usd, delta_eur), cc.E(11.0))  # 1 + 10 = 11

    cc.equals(cc.plus(one_eur, delta_eur), cc.U(11.0))   # 1 + 10 = 11
    cc.equals(cc.plus(one_eur, delta_usd), cc.E(11.0))  # 1 + 10 = 11
