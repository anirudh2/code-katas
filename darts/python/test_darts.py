from darts import score


def test_darts():
    assert score(-9, 9) == 0
    assert score(0, 10) == 1
    assert score(-5, 0) == 5
    assert score(0, -1) == 10
    assert score(0, 0) == 10
    assert score(-0.1, -0.1) == 10
    assert score(0.7, 0.7) == 10
    assert score(0.8, -0.8) == 5
    assert score(-3.5, 3.5) == 5
    assert score(-3.6, -3.6) == 1
    assert score(-7.0, 7.0) == 1
    assert score(7.1, -7.1) == 0
    assert score(0.5, -4) == 5
