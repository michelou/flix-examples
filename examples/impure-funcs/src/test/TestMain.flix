@test
def test01(): Bool = twice3(inc1, 0) == 2

@test
def test02(): Bool \ IO =
    twice3(inc1, 0) + twice3(inc2, 0) == 4
