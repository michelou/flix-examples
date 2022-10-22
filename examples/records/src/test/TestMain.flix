@test
def test01(): Bool =
    let r1 = { x = 1, y = 2 };
    "${Rec2(r1)}" == "{ 1, 2 }"
