/// 
/// We can inspect the purity of a function argument.
/// 
def inspect(f: a -> b & ef): Unit \ IO = 
    typematch f {
        case _: a -> b \ {} => println("f is pure")
        case _: a -> b \ ef => println("f is not pure")
        case _: _           => unreachable!()
    }

def inc1(x: Int32): Int32 = x + 1
def inc2(x: Int32): Int32 \ IO = println("Hello"); x + 1

///
/// We can use purity information to safely switch between
/// lazy (or parallel) evaluation. In this case, if f is 
/// pure then perform the map operation lazily.
///
def map(f: a -> b & ef, l: DelayList[a]): DelayList[b] & ef =
    typematch f {
        case g: a -> b \ {} => DelayList.map(g, l)
        case _: a -> b \ ef => DelayList.map(f, l)
        case _: _           => unreachable!()
    }

def main(): Unit \ IO = 
    print("identity : "); inspect(identity);
    print("x -> x+1 : "); inspect(x -> x + 1);
    print("inc1     : "); inspect(inc1);
    print("inc2     : "); inspect(inc2);

	print("map(inc1): "); inspect(map(inc1));
	print("map(inc2): "); inspect(map(inc2))
