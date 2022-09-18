@test
def test01(): Bool =
    let t1 = Leaf("Hello");
    map(String.length, t1) == Leaf(5)

@test
def test02(): Bool =
    let t1 = Node(Leaf("Hello"), Leaf("World"));
    let t2 = map(String.length, t1);
    sum(t2) == 10
