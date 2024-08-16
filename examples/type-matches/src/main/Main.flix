///
/// The `Tree` type.
///
enum Tree[a] {
    case Leaf(a),
    case Node(Tree[a], Tree[a])
}

def f1(t0: Tree[a]): Bool = typematch t0 {
    case t: Tree[Int32] =>
        match t { case Tree.Leaf(x) => x == 1 case _ => false }  
    case _: _ =>
        false
}

enum Bottle[a] {
    case Unopened,
    case Opened(a)
}

def f(b0: Bottle[a]): Bool = typematch b0 {
    case b: Bottle[Int32] =>
        match b { case Bottle.Opened(x) => x == 1 case _ => false }
    case _: _ =>
        false
}

///
/// The main entry point of this Flix program.
///
def main(): Unit \ IO =
    f1(Tree.Leaf(1)) |> println; // true
    f1(Tree.Node(Tree.Leaf(1), Tree.Leaf(2))) |> println; // false
    "" |> println;
    f(Bottle.Unopened) |> println;    // false
    f(Bottle.Opened(1)) |> println;   // true
    f(Bottle.Opened(2)) |> println;   // false
    f(Bottle.Opened('a')) |> println  // false

/*
def f(): Bool = typematch () {
    case _: Unit => true
    case _: _ => false
}

def g(x: a): Bool = typematch x {
    case _: Unit => false
    case _: a => true
    case _: _ => false
}

enum Weekday {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

def h(d: Weekday): Bool = typematch d {
    case _: Weekday.Monday => true
    case _: _ => false
}

def main(): Unit \ IO =
    "f()   = ${f()}" |> println;

    "g(1)  = ${g(1)}" |> println;
    "g(()) = ${g(())}" |> println;

    "h(Weekday.Monday) = ${h(Weekday.Monday)}" |> println
*/
