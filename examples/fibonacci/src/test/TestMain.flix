@test
def test01(): Bool =
    let fib5 = DelayList.toList(DelayList.take(5, fibs()));
    fib5 == 0 :: 1 :: 1 :: 2 :: 3 :: Nil
