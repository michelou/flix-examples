@test
def test01(): Bool =
    map(x -> x * x, tree()) == Tree.Node(Tree.Leaf(1), Tree.Leaf(4))
