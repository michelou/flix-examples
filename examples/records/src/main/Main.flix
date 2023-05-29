/// https://doc.flix.dev/records.html
/// Records are immutable.

/// A ToString instance for a 2-fields record.
/// The following is not (yet) supported:
/// instance ToString[{ x = a, y = b }] with ToString[a], ToString[b] {

enum Rec2({ x = Int32, y = Int32 })

instance ToString[Rec2] {
    pub def toString(r0: Rec2): String = match r0 {
        case Rec2.Rec2(r) => "{ ${r.x}, ${r.y} }"
    }
}

def main(): Unit \ IO =
    // The order of fields within a record type does not matter.
    let r1 = { x = 1, y = 2 };
    let r2 = { y = 2, x = 1 };

    println("r1 = { ${r1.x}, ${r1.y} }");
    println("r2 = { ${r2.x}, ${r2.y} }");
    println("r1 == r2: ${r1.x == r2.x and r1.y == r2.y}");

    // While records are immutable, we can construct a new record
    // with an updated field value:
    let r3 = { x = 3 | r1 };

    println("r3 = ${Rec2.Rec2(r3)}")
