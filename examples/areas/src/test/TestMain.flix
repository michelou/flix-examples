@test
def test01(): Bool = area({x = 1, y = 2}) == 2

@test
def test02(): Bool = areas() == 2 :: 6 :: Nil
