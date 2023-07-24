def f32(): Int32 = 4

def main(): Unit \ IO =
/*
    region r {
        let arr = Array#{1, 2, 3} @ r;  // [1, 2, 3];
        println(arr);  // a |> println;
    }

    foreach (i <- a) {
        let a0 = ["***"; i*2];
        a0 |> println
    };

    region r {
        let a2 = Array#{"hello", f32()} @ r;  // f16() ==> expression has unexpected type.
        a2 |> println;
    }

    region r {
        let x = Array.new(r, "abc", 1);
        x |> println
    }
*/
    region r {
        let fruits = Array#{"Apple", "Pear", "Mango"} @ r;
        let result = Array.slice(r, start = 1, end = 2, fruits);
        println(Array.toString(result));

        let arr = Array.repeat(r, 1_00, 42);
        println(Array.toString(arr));

        let fruitList = List#{"Apple", "Pear", "Mango"};
        let fruitArray = List.toArray(r, fruitList);
        println(Array.toString(fruitArray));
    }
