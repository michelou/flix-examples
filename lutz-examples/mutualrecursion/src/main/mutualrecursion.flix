
def isOdd(n: Int32): Bool =
    if (n == 0) false else isEven(n - 1)

def isEven(n: Int32): Bool =
    if (n == 0) true else isOdd(n - 1)

// Gibt keinen Stack Overflow!!
def main(): Int32 \ IO =
    println(isEven(25000));
    0