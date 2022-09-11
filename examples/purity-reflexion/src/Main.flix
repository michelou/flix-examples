/// 
/// We can inspect the purity of a function argument.
/// 
def inspect(f: a -> b & ef): Unit & Impure = 
    reifyEff(f) {
        case Pure(g) => println("f is pure")
        case _       => println("f is not pure")
    }
                            
///
/// We can use purity information to safely switch between
/// lazy (or parallel) evaluation. In this case, if f is 
/// pure then perform the map operation lazily.
///
def map(f: a -> b & ef, l: LazyList[a]): LazyList[b] & ef =
    reifyEff(f) {
        case Pure(g) => mapL(g, l)
        case _       => mapE(f, l)
    }

def main(): Unit & Impure = 
    println
