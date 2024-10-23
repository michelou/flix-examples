use Time.Duration.fromSeconds;

// Eine Funktion, die  Arbeit (z.B. einen Aufruf an ein externes System) "simuliert"
def doSomething(c: Sender[Int32, c], x: Int32, gen: Random): Unit \ c + IO =
    let delay = Int64.modulo(abs(Random.nextInt64(gen)), 2000i64);  // old: Int64.mod (< version 0.50)
    let d = Option.getWithDefault(1000, Int64.tryToInt32(delay));
    Thread.sleep(fromSeconds(d)); // <- Channel/Timer.milliseconds(delay);
    Channel.send(x, c)  // OLD: c <- x; ()

// "Horcht" auch einem Channel und gibt ankommende Nachrichten aus. Falls 5 Sekunden
// nichts kommt, wird es beendet.
def printResults(rc: Region[r], rx: Receiver[Int32, r]): Unit \ r + IO =
    let t = Channel.timeout(rc, fromSeconds(5i32));
    select {
        case x <- Channel.recv(rx) => println(x); printResults(rc, rx)
        case _ <- Channel.recv(t)  => println("done")  // seconds(5i64) => println("done")
    }

def abs(i: Int64): Int64 \ {} = if (i < 0i64) Neg.neg(i) else i

/// Spawn a process for send and wait, and print the result.
def main(): Unit \ IO = region rc {
    let gen = Random.fresh();  // old: Random.new (< version 0.50)
    let (tx, rx) = Channel.buffered(rc, 100);  // chan Int32 100;
    let l = List.range(0, 100);
    spawn printResults(rc, rx) @ rc;
    // OLD: List.foreach(x -> spawn doSomething(results, x, gen), l);
    foreach(x <- l) { spawn doSomething(tx, x, gen) @ rc };
    Thread.sleep(fromSeconds(10i32)) // <- Concurrent/Channel/Timer.seconds(10i64)
}
