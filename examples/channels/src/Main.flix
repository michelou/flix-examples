/// A function that sends every element of a list
def send(o: Channel[Int32], l: List[Int32]): Unit & Impure =
    match l {
        case Nil     => ()
        case x :: xs => o <- x; send(o, xs)
    }

/// A function that receives n elements
/// and collects them into a list.
def recv(i: Channel[Int32], n: Int32): List[Int32] & Impure =
    match n {
        case 0 => Nil
        case _ => (<- i) :: recv(i, n - 1)
    }

/// A function that calls receive and sends the result on d.
def wait(i: Channel[Int32], n: Int32, d: Channel[List[Int32]]): Unit & Impure =
    d <- recv(i, n);
    ()

/// Spawn a process for send and wait, and print the result.
def main(): Unit & Impure =
    let l = 1 :: 2 :: 3 :: Nil;
    let c = chan Int32 100;
    let d = chan List[Int32] 100;
    spawn send(c, l);
    spawn wait(c, List.length(l), d);
    println(<- d)
