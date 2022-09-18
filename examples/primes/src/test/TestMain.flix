@test
def test01(): Bool =
    DelayList.take(5, primes()) |> DelayList.toList == 2 :: 3 :: 5 :: 7 :: 11 :: Nil

@test
def test02(): Bool =
    DelayList.take(5, primes2()) |> DelayList.toList == 2 :: 3 :: 5 :: 7 :: 11 :: Nil
