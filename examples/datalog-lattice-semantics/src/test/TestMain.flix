@test
def test01(): Bool =
    let p = #{
        DeliveryDate("Chassis"; 2).

        ReadyDate(part; date) :-
            DeliveryDate(part; date).
    };
    let r = query p select (c, d) from ReadyDate(c; d);
    r == ("Chassis", 2) :: Nil