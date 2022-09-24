@test
def test01(): Bool =
    let e = eval(Abs(0, Abs(1, Var(0))));
    e == Abs(0, Abs(1, Var(0)))

