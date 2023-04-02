@test
def test01(): Bool =
    let t1 = Tree.Leaf("Hello");
    map(String.length, t1) == Tree.Leaf(5)

@test
def test02(): Bool =
    let t1 = Tree.Node(Tree.Leaf("Hello"), Tree.Leaf("World"));
    let t2 = map(String.length, t1);
    sum(t2) == 10
