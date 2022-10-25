def f(x: Int32, y: Int32): Int32 = x + y
def g(x: Int32): Int32 -> Int32 = y -> x + y

class Addable[a] {
    pub def myadd(x1: a, x2: a): a
}

instance Addable[Int32] {
    pub def myadd(x1: Int32, x2: Int32): Int32 = x1 + x2
}

def f1(x: a, y: a): a with Addable[a] = Addable.myadd(x, y)
def g1(x: a): a -> a with Addable[a] = y -> Addable.myadd(x, y)

def main(): Unit \ IO =
    f(1, 2) |> println;
    f(1)(2) |> println;
    g(1, 2) |> println;
    g(1)(2) |> println;

    f1(1, 2) |> println;
    f1(1)(2) |> println;
    g1(1, 2) |> println;
    g1(1)(2) |> println
