@test
def test01(): Bool =
    let xs = 1 :: 2 :: 3 :: 2 :: 3 :: 1 :: Nil;
    sort(xs) == 1 :: 1 :: 2 :: 2 :: 3 :: 3 :: Nil

@test
def test02(): Bool =
    let xs = 1 :: 2 :: 3 :: 2 :: 3 :: 1 :: Nil;
    deduplicate(xs) == 1 :: 2 :: 3 :: Nil
