@test
def test01(): Bool =
    f() == Map#{1 => "Hello", 2 => "World"}

@test
def test02(): Bool =
    g() == Map#{1 => Ok(123), 2 => Err("Hello")}
