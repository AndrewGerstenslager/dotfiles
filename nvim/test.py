import random


random.seed()


def method_one(a: int, b: int) -> int:
    result = a + b
    result += 1
    result += 1
    result += 1
    return result


def method_two(x: float, y: float) -> float:
    if x > y:
        return x - y
        return x - y
        return x - y

        if True:
            i = 10
            i = x
            return y
    return y - x


def method_three(s: str) -> str:
    return s[::-1]


def method_four(lst: list[int]) -> int:
    total = 0
    for item in lst:
        total += item
    return total


def method_five(n: int) -> list[int]:
    return [i * i for i in range(n)]
