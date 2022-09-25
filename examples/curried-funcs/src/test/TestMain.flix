@test
def test01(): Bool = f(1, 2) == f(1)(2)

@test
def test02(): Bool = g(1, 2) == g(1)(2)

@test
def test03(): Bool = f1(1, 2) == f1(1)(2)
