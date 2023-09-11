@test
def test01(): Bool =
    hasSecretCode(0 :: 1 :: 2 :: 3 :: 4 :: 5 :: Nil)

@test
def test02(): Bool =
    match initializePlayer(1) {
        case Player.Player(r1, r2) => r1.id  == 1 and r2.score == 0
    }
