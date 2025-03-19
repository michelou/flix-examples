@test
def test01(): Bool =
    let e = eval(Expression.Abs(0, Expression.Abs(1, Expression.Var(0))));
    e == Expression.Abs(0, Expression.Abs(1, Expression.Var(0)))

