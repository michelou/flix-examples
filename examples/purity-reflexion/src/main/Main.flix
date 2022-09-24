/// 
/// We can inspect the purity of a function argument.
/// 
def inspect(f: a -> b & ef): Unit \ IO = 
    reifyEff(f) {
        case Pure(g) => println("f is pure")
        case _       => println("f is not pure")
    }

def inc1(x: Int32): Int32 = x + 1
def inc2(x: Int32): Int32 \ IO = println("Hello"); x + 1
                       
///
/// We can use purity information to safely switch between
/// lazy (or parallel) evaluation. In this case, if f is 
/// pure then perform the map operation lazily.
///
def map(f: a -> b & ef, l: DelayList[a]): DelayList[b] & ef =
    reifyEff(f) {
        case Pure(g) => DelayList.mapL(g, l)
        case _       => DelayList.mapE(f, l)
    }

def main(): Unit \ IO = 
    inspect(identity);
    inspect(x -> x + 1);
    inspect(inc1);
    inspect(inc2)
