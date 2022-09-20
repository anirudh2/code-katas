def ff(input: dict) -> dict:

    # breakpoint()
    leaves = {}

    for k, v in input.items():
        if isinstance(v, dict):
            leaves.update(ff(v))
        else:
            leaves[k] = v

    return leaves

    # return {"a": "hello", "b": "world"}
