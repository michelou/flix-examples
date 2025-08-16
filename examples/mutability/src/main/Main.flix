///
/// We can implement a *pure* `sort` function which 
/// internally converts an immutable list to an array,
/// sorts the array in-place, and then converts it 
/// back to an immutable list.
/// 
def sort(l: List[a]): List[a] with Order[a] = 
    region r {
        List.toArray(r, l) !> Array.sort |> Array.toList
    }

///
/// We can also write a *pure* `toString` function which 
/// internally uses a mutable StringBuilder. 
///
def toString(l: List[a]): String with ToString[a] = 
    region r {
        let sb = StringBuilder.StringBuilder();  // up to 0.35 : new StringBuilder(r);
        //for (x <- List.iterator(r, l)) yield {
        //    StringBuilder.appendString!("${x} :: ", sb)
        //};
        List.forEach(x -> StringBuilder.appendString("${x} :: ", sb), l);
        StringBuilder.appendString("Nil", sb);
        StringBuilder.toString(sb)
    }

///
/// We can define pure functions that use
/// internal mutability (impurity) with regions.
/// Regions encapsulate mutability to its declared scope.
///
def deduplicate(l: List[a]): List[a] with Order[a] =
    /// Declare a new region `r`.
    region r {

        // Create a new `MutSet` at region `r`.
        // This will be used to keep track of
        // unique elements in `l`.
        let s = MutSet.MutSet(r);  // up to 0.35 : new MutSet(r);

        // The lambda used in the call to `filter`
        // would be impure without a region.
        List.filter(x -> {
            if (MutSet.memberOf(x, s))
                false // `x` has already been seen.
            else {
                MutSet.add(x, s);
                true
            }
        }, l)
    }

///
/// Create a list `xs` with duplicates and
/// call `deduplicate` that returns a new list
/// with only unique elements.
///
def main(): Unit \ IO =
    let xs = 1 :: 2 :: 3 :: 2 :: 3 :: 1 :: Nil;
    println("xs=" + toString(xs));
    println("sort(xs)=" + toString(sort(xs)));
    println("deduplicate(xs)=" + toString(deduplicate(xs)))
