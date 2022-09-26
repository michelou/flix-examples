@test
def test01(): Bool =
    let xs = 0 :: 1 :: 1 :: 2 :: 3 :: Nil;
    length(xs) == 5
