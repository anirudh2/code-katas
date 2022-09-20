from dict_to_flat_dict import ff


def test_one():

    my_dict = {
        "vendor": {
            "id": "foo",
            "inventory": {
                "apples": 4,
                "tomatoes": 2,
                "cherries": 1,
            },
        },
        "order": {
            "customer": "bar",
            "items": {
                "oranges": 1
            }
        }
    }

    desired_dict = {
        "id": "foo",
        "apples": 4,
        "tomatoes": 2,
        "cherries": 1,
        "customer": "bar",
        "oranges": 1
    }

    assert ff(my_dict) == desired_dict
