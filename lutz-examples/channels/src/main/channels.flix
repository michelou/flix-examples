use Concurrent/Channel/Timer.seconds

// Eine Funktion, die  Arbeit (z.B. einen Aufruf an ein externes System) "simuliert"
def doSomething(c: Channel[Int32], x: Int32, gen: Random.Random): Unit \ NonDet =
    let delay = abs(Random.nextInt64(gen)) mod 2000i64;
    <- Concurrent/Channel/Timer.milliseconds(delay);
    c <- x;
    ()

// "Horcht" auch einem Channel und gibt ankommende Nachrichten aus. Falls 5 Sekunden
// nichts kommt, wird es beendet.
def printResults(c: Channel[Int32]): Unit \ IO =
    select {
        case x <- c => println(x); printResults(c)
        case _ <- seconds(5i64) => println("done")
    };
    ()

def abs(i: Int64): Int64 \ {} = if (i < 0i64) Neg.neg(i) else i

/// Spawn a process for send and wait, and print the result.
def main(): Unit \ NonDet =
    let gen = Random.new();
    let results = chan Int32 100;
    let l = List.range(0,100);
    spawn printResults(results);
    List.foreach(x -> spawn doSomething(results, x, gen), l);
    <- Concurrent/Channel/Timer.seconds(10i64)
