// An algebraic data type for binary trees where each leaf carries a value of type a.
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

/// A ToString instance for Tree.
instance ToString[Tree[a]] with ToString[a] {
    pub def toString(t: Tree[a]): String = match t {
        case Leaf(a)    => "Leaf(${a})"
        case Node(l, r) => "Node(${l}, ${r})"
    }
}

/// A higher-order function that transforms a tree with
/// elements of type a to a tree with elements of type b.
def map(f: a -> b, t: Tree[a]): Tree[b] = match t {
    case Leaf(x)    => Leaf(f(x))
    case Node(l, r) => Node(map(f, l), map(f, r))
  }

/// Returns a simple tree with two leafs.
def tree(): Tree[Int32] = Node(Leaf(1), Leaf(2))

/// Squares all elements in the simple tree.
def main(): Unit & Impure =
    map(x -> x * x, tree()) |> println
