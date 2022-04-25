import os

import anagrams as an


def test_should_contain_three_expected_lines():

    # create three expected lines
    given = ("Hello\n", "!world\n", "Ångstrom\n")
    expected = ("Hello", "!world", "Ångstrom")

    fs = "test.txt"

    # create a file
    with open(fs, "w") as fout:
        fout.writelines(given)

    # use anagrams to read the file
    found = an.readfile(fs)

    # test has correct number of lines
    assert len(found) == 3

    # test contents are correct
    assert all(tuple(a == b for a, b in zip(expected, found)))

    # delete the file from IO operations
    os.remove(fs)


def test_rots_and_sort():
    # given = ("o", "r", "s", "t")
    user_input = "rots"
    database = ("Hello", "!world", "Ångstrom", "sort")

    found = an.anagram(user_input, database)
    assert len(found) == 1
    expected = ("sort",)

    assert all(tuple(a == b for a, b in zip(found, expected)))

