
mod Core { // namespace Core {  // up to version 0.34.0
    mod Math {
        use Int32.toFloat64;

        // pub def sum(x: Int32, y: Int32): Int32 = x + y

        mod Stats {
            pub def median(xs: List[Int32]): Int32 = (List.length(xs) + 1) / 2
        }

        def rieman(a: Float64, b: Float64, steps: Int32): Float64 = region r {
            import static java.lang.Math.pow(Float64, Float64): Float64 \ {};
            let h = ref 0.0f64 @ r;
            let dX = (b - a) / toFloat64(steps);
            let fn = { i ->
                 let x = a + toFloat64(i-1) * dX;
                 h := (deref h) + (x - pow(x, 2.0f64))
            };
            Array.forEach(fn, Array.range(r, 1, steps));
            (deref h) * dX
        }

        pub def integral(a: Int32, b: Int32): Float64 =
            rieman(toFloat64(a), toFloat64(b), /*steps*/100)
    }
}

mod Core.Math {
    pub def sum(x: Int32, y: Int32): Int32 = x + y
}

mod A {
    sealed class Primitive[a]
}

mod A {
    instance Primitive[Bool]
    instance Primitive[Int32]
    instance Primitive[Float64]
    // ... and so on
}

def main(): Unit \ IO =
    // We refer to definitions from a mod by their fully-qualified name
    Core.Math.sum(21, 42) |> println;

    let xs = 3 :: 6 :: 2 :: 1 :: 4 :: 5 :: Nil;
    Core.Math.Stats.median(List.sort(xs)) |> println;

    // The use construct allows us to "import" definitions from another namespace.
    use Core.Math.sum;
    sum(21, 42) |> println;
    
    use Core.Math.integral;
    integral(0, 2) |> println
