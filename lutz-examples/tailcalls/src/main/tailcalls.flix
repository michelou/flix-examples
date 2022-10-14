def sumup(n: Int32): Int32 = tailsum(0, n)

def tailsum(m: Int32, n: Int32): Int32 =
    match n {
        case 0 => m
        case _ => tailsum(m + n, n - 1)
    }

// Gibt keinen Stack Overflow!!
def main(): Int32 \ IO =
    println(sumup(25000));
    0
