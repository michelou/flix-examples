/// Datalog constraints enriched with lattice semantics is one
/// of the more advanced features of Flix and requires some
/// background knowledge of lattice theory and fixpoints.
def main(): Unit & Impure =
    let p = #{
        /// Parts and the components they depend on.
        PartDepends("Car",       "Chassis").
        PartDepends("Car",       "Engine").
        PartDepends("Engine",    "Piston").
        PartDepends("Engine",    "Ignition").

        /// Time required to assemble a part from its components.
        AssemblyTime("Car",     7).
        AssemblyTime("Engine",  2).

        /// Expected delivery date for certain components.
        DeliveryDate("Chassis";  2).
        DeliveryDate("Piston";   1).
        DeliveryDate("Ignition"; 7).

        /// A part is ready when it is delivered.
        ReadyDate(part; date) :-
            DeliveryDate(part; date).

        /// Or when it can be assembled from its components.
        ReadyDate(part; assemblyTime + componentDate) :-
            PartDepends(part, component),
            AssemblyTime(part, assemblyTime),
            ReadyDate(component; componentDate).
    };

    // Computes the delivery date for each component.
    let r = query p select (c, d) from ReadyDate(c; d);
    r |> println
