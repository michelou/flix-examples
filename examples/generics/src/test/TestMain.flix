@test
def test01(): Bool =
    map(x -> x * x, tree()) == Node(Leaf(1), Leaf(4))
