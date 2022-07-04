import temperature as tt


def test_to_F():
    """Given any input, assure output is in F units."""
    freezing_F = tt.F(32.0)  # F
    freezing_C = tt.C(0.0)  # C
    assert tt.to_F(freezing_C) == freezing_F
    assert tt.to_F(freezing_F) == freezing_F

    boiling_F = tt.F(212.0)  # F
    boiling_C = tt.C(100.0)  # C
    assert tt.to_F(boiling_C) == boiling_F
    assert tt.to_F(boiling_F) == boiling_F


def test_to_C():
    """Given any input, assure output is in C units."""
    freezing_F = tt.F(32.0)  # F
    freezing_C = tt.C(0.0)  # C
    assert tt.to_C(freezing_C) == freezing_C
    assert tt.to_C(freezing_F) == freezing_C

    boiling_F = tt.F(212.0)  # F
    boiling_C = tt.C(100.0)  # C
    assert tt.to_C(boiling_C) == boiling_C
    assert tt.to_C(boiling_F) == boiling_C

    pointtest_F = tt.F(180.0)  # F
    assert tt.to_C(pointtest_F).value == pytest.approx(82.22222)


def test_equals():
    """Tests of equality between point combinations of C and F."""
    freezing_F = tt.F(32.0)  # F
    freezing_C = tt.C(0.0)  # C

    # homogeneous cases
    assert tt.equals(freezing_F, freezing_F)
    assert tt.equals(freezing_C, freezing_C)

    # heterogeneous cases
    assert tt.equals(freezing_F, freezing_C)
    assert tt.equals(freezing_C, freezing_F)


def test_addition():
    """Given two types of heterogeneous and homogeneous nature, add them."""
    freezing_F = tt.F(32.0)  # F
    freezing_C = tt.C(0.0)  # C
    # freezing_K = tt.K(273.0)  # K

    # update water from freezing to boiling in F
    delta_F = tt.F(180.0)  # from 32.0 to 212.0 is 180.0 F
    boiling_F = tt.F(212.0)

    # update water from freezing to boiling in F
    delta_C = tt.C(100.0)  # from 0.0 to 100.0 is 100.0 F
    boiling_C = tt.C(100.0)

    assert tt.equals(tt.plus(freezing_F, delta_F), boiling_F)  # 32.0 F + 180.0 F = 212.0 F
    aa = tt.plus(freezing_C, delta_F)
    bb = tt.equals(aa, boiling_C)
    breakpoint()

    assert tt.equals(tt.plus(freezing_C, delta_F), boiling_C)  # 0.0 C + 180.0 F = 100.0 C

    assert tt.equals(tt.plus(freezing_F, delta_C), boiling_C)  # 32.0 F + 100.0 C = 100.0 C
    assert tt.equals(tt.plus(freezing_C, delta_C), boiling_C)  # 0.0 C + 100.0 C = 100.0 C
