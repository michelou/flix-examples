use Time.Duration.fromSeconds;

// Eine Funktion, die  Arbeit (z.B. einen Aufruf an ein externes System) "simuliert"
def doSomething(c: Sender[Int32], x: Int32, gen: Random.Random): Unit \ NonDet =
    let delay = abs(Random.nextInt64(gen)) `mod` 2000i64;
    let d = Option.getWithDefault(1000, Int64.tryToInt32(delay));
    Thread.sleep(fromSeconds(d)); // <- Channel/Timer.milliseconds(delay);
    Channel.send(x, o)  // old: c <- x; ()

// "Horcht" auch einem Channel und gibt ankommende Nachrichten aus. Falls 5 Sekunden
// nichts kommt, wird es beendet.
def printResults(c: Receiver[Int32, Static]): Unit \ IO =
    let t = Channel.timeout(fromSeconds(5i32));
    select {
        case x <- Channel.recv(c) => println(x); printResults(c)
        case _ <- Channel.recv(t) => println("done")  // seconds(5i64) => println("done")
    }

def abs(i: Int64): Int64 \ {} = if (i < 0i64) Neg.neg(i) else i

/// Spawn a process for send and wait, and print the result.
def main(): Unit \ NonDet =
    let gen = Random.new();
    let (results, r1) = Channel.buffered(Static, 100);  // chan Int32 100;
    let l = List.range(0, 100);
    spawn printResults(results)
    List.foreach(x -> spawn doSomething(results, x, gen), l);
    Thread.sleep(fromSeconds(10i32)) // <- Concurrent/Channel/Timer.seconds(10i64)
