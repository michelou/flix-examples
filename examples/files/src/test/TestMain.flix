@test
def test01(): Bool \ IO =
    // see test\ca\uwaterloo\flix\library\TestFile.flix
    File.exists("README.md") == Ok(true)
