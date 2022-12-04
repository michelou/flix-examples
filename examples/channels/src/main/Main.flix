/// A function that sends every element of a list
def sendAll(l: List[Int32], o: Sender[Int32, r]): Unit \ IO =
    match l {
        case Nil     => ()
        case x :: xs => Channel.send(x, o); sendAll(xs, o)
    }

/// A function that receives n elements
/// and collects them into a list.
def recvN(n: Int32, i: Receiver[Int32, r]): List[Int32] \ IO =
    match n {
        case 0 => Nil
        case _ => Channel.recv(i) :: recvN(n - 1, i)
    }

/// A function that calls receive and sends the result on d.
def wait(i: Receiver[Int32, r], n: Int32, d: Sender[List[Int32], r]): Unit \ IO =
    Channel.send(recvN(n , i), d);
    ()

/// Spawn a process for send and wait, and print the result.
def main(): Unit \ IO =
    let l = 1 :: 2 :: 3 :: Nil;
    let (s1, r1) = Channel.buffered(Static, 100);
    let (s2, r2) = Channel.buffered(Static, 100);
    spawn sendAll(l, s1);
    spawn wait(r1, List.length(l), s2);
    println(Channel.recv(r2))
