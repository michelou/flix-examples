/// A function that sends every element of a list
def sendAll(l: List[Int32], s: Sender[Int32, r]): Unit \ IO =
    match l {
        case Nil     => ()
        case x :: xs => Channel.send(x, s); sendAll(xs, s)
    }

/// A function that receives n elements
/// and collects them into a list.
def recvN(n: Int32, r: Receiver[Int32, r]): List[Int32] \ IO =
    match n {
        case 0 => Nil
        case _ => Channel.recv(r) :: recvN(n - 1, r)
    }

/// A function that calls receive and sends the result on d.
def wait(i: Receiver[Int32, r], n: Int32, d: Sender[List[Int32], r]): Unit \ IO =
    Channel.send(recvN(n , i), d);
    ()

/// Spawn a process for send and wait, and print the result.
def main(): Unit \ IO = region rc {
    let l = 1 :: 2 :: 3 :: Nil;
    let (s1, r1) = Channel.buffered(rc, 100);
    let (s2, r2) = Channel.buffered(rc, 100);
    spawn sendAll(l, s1) @ rc;
    spawn wait(r1, List.length(l), s2) @ rc;
    println(Channel.recv(r2))
}
