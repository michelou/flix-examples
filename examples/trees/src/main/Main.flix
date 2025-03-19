/// An algebraic data type for binary trees with leaves.
enum Tree[a] {
    case Leaf(a),
    case Node(Tree[a], Tree[a])
}

/// see file flix-0.31.0\main\src\library\Down.flix
instance Eq[Tree[a]] with Eq[a] {
    pub def eq(x: Tree[a], y: Tree[a]): Bool = match (x, y) {
        case (Tree.Leaf(x1), Tree.Leaf(x2)) => Eq.eq(x1, x2)
        case (Tree.Node(t1, _), Tree.Node(t2, _)) => Eq.eq(t1, t2)
        case _ => false
    }
}

/// A higher-order function that transforms a tree with
/// elements of type `a` to a tree with elements of type `b`.
def map(f: a -> b, t: Tree[a]): Tree[b] = match t {
    case Tree.Leaf(x)    => Tree.Leaf(f(x))
    case Tree.Node(l, r) => Tree.Node(map(f, l), map(f, r))
}

/// A function that computes the sum of all leaves in a tree.
def sum(t: Tree[Int32]): Int32 = match t {
    case Tree.Leaf(x)    => x
    case Tree.Node(l, r) => sum(l) + sum(r)
}

def main(): Unit \ IO =
    let t1 = Tree.Node(Tree.Leaf("Hello"), Tree.Leaf("World"));
    let t2 = map(String.length, t1);
    println(sum(t2))
