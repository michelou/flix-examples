@test
def test01(): Bool =
    let r = evalAExp(
        IfThenElse(Neq(Cst(1), Cst(2)), Cst(42), Cst(21))
    );
    r == 42
