
def main(): Int32 \ IO =
    import java_new java.io.File(String): ##java.io.File \ IO as newFile;
    import java.io.File.exists(): Bool \ IO;
    let f = newFile("HelloWorld.txt");
    println(exists(f));
    0
