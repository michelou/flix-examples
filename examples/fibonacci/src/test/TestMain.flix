@test
def test01(): Bool =
    DelayList.toList(DelayList.take(5, fibs())) == 0 :: 1 :: 1 :: 2 :: 3 :: Nil
