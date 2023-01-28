def f32(): Int32 = 4

def main(): Unit \ IO =
    let a = [1, 2, 3];
    a |> println;

    foreach (i <- a) {
        let a0 = ["***"; i*2];
        a0 |> println
    };
    let a2 = ["hello"; f32()];  // f16() ==> expression has unexpected type.
    a2 |> println;

    region r {
        let x = Array.new(r, "abc", 1);
        x |> println
    }