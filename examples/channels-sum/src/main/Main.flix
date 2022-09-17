/// Computes the sum of `x` and `y` and sends the result on the channel `c`.
def sum(x: Int32, y: Int32, c: Channel[Int32]): Unit \ IO =
    c <- (x + y); ()

/// Computes the sum of 21 and 42 using a fresh process.
def main(): Unit \ IO =
    let c = chan Int32 1;     // construct a new empty channel for the result.
    spawn sum(21, 42, c);     // spawn sum to run in a separate process.
    discard <- c;             // wait for the result to arrive on the channel.
    ()
