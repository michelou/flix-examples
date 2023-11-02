
// Example: Flix Effect System

// 1. pure functions with no side effects
def isEven(x: Int32): Bool \ {} = Int32.mod(x, 2) == 0
def double(x: Int32): Int32 \ {} = x * 2


// 2. a function that only has a side effect. If you wonder about the
// type of the argument: it accepts everything that can be converted
// to a string (more formally: for which an instance of the type class
// "ToString" exists.
def write(s: t): Unit \ IO with ToString[t] = println(s)


def main(): Int32 \ IO =
    let list = (1 :: 2 :: 3 :: 4 :: Nil);

    // 3. List.count requires the argument to be a pure function
    let noOfEvens = List.count(isEven, list);
    write(noOfEvens);
    write("");

    // 4. Foreach is about executing a side effect on every element.
    // Thus, it requires an impure function as argument.
    List.forEach(write, list);
    write("");

    // 5. List.map demonstrates effect polymorphism. If the passed 
    // function is pure, so is map,if the passed function is 
    //impure, map is impure.
    let doubled = List.map(double, list);
    discard List.map(write, doubled);
    0 // exit code
