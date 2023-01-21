/// Computes the sum of `x` and `y` and sends the result on the channel `c`.
def sum(x: Int32, y: Int32, tx: Sender[Int32, r]): Unit \ IO =
    Channel.send(x + y, tx)

/// Computes the sum of 21 and 42 using a fresh process.
def main(): Int32 \ IO = region r {
    let (tx, rx) = Channel.buffered(r, 1);  // construct a new empty channel for the result.
    spawn sum(21, 42, tx);  // spawn sum to run in a separate process.
    Channel.recv(rx)        // wait for the result to arrive on the channel.
}
