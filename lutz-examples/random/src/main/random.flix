// See `NonDet` usage in main\src\library\Random.flix
def printRandom(gen: Random): Unit \ IO =
    let r = Random.nextNatWithMax(gen, 200);
    println(r)

/// Spawn a process for send and wait, and print the result.
def main(): Int32 \ IO =
    // let args = Environment.getArgs();
    let l = List.range(0, 100);
    let gen = Random.fresh();
    List.forEach(_ -> printRandom(gen), l);
    0
