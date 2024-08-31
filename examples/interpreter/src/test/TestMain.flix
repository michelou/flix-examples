@test
def test01(): Bool =
    let r = evalAExp(
        AExp.IfThenElse(BExp.Neq(AExp.Cst(1), AExp.Cst(2)), AExp.Cst(42), AExp.Cst(21))
    );
    r == 42
