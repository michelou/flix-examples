/// An algebraic data type for binary trees with leaves.
enum Tree[a] {
    case Leaf(a),
    case Node(Tree[a], Tree[a])
}

/// see file flix-0.31.0\main\src\library\Down.flix
instance Eq[Tree[a]] with Eq[a] {
    pub def eq(x: Tree[a], y: Tree[a]): Bool = match (x, y) {
        case (Leaf(x1), Leaf(x2)) => Eq.eq(x1, x2)
        case (Node(t1), Node(t2)) => Eq.eq(t1, t2)
        case _ => false
    }
}

/// A higher-order function that transforms a tree with
/// elements of type `a` to a tree with elements of type `b`.
def map(f: a -> b, t: Tree[a]): Tree[b] = match t {
    case Leaf(x)    => Leaf(f(x))
    case Node(l, r) => Node(map(f, l), map(f, r))
}

/// A function that computes the sum of all leaves in a tree.
def sum(t: Tree[Int32]): Int32 = match t {
    case Leaf(x)    => x
    case Node(l, r) => sum(l) + sum(r)
}

def main(): Unit & Impure =
    let t1 = Node(Leaf("Hello"), Leaf("World"));
    let t2 = map(String.length, t1);
    println(sum(t2))
