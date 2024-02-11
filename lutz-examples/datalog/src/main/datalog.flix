// OLD: 1. The relationships we're interested in.
//rel Father(child: String, father: String)
//rel Mother(child: String, mother: String)
//rel ParentOf(child: String, parent: String)
//rel Child(parent: String, child: String)
//rel AncestorOf(person: String, ancestor: String)

// 2. The direct relationships as facts
def getFacts(): #{ Father(String, String), Mother(String, String), ParentOf(String, String), Child(String, String), AncestorOf(String, String) } = #{
    Father("Zeus", "Kronos").
    Mother("Zeus", "Rhea").
    Father("Ares", "Zeus").
    Mother("Ares", "Hera").
    Father("Apollo", "Zeus").
    Mother("Apollo", "Leto").
}

// 3. relationships that can be deduced
def getRules(): #{ Father(String, String), Mother(String, String), ParentOf(String, String), Child(String, String), AncestorOf(String, String) } = #{
    ParentOf(x, y) :- Father(x, y). 
    ParentOf(x, y) :- Mother(x, y).
    Child(x, y) :- ParentOf(y, x). 
    AncestorOf(x, y) :- ParentOf(x, y).
    AncestorOf(x, z) :- AncestorOf(x, y), AncestorOf(y, z).
}

// 4. Now we can query the knowledge base, e.g.
// who are the children of Zeus?
def main(): Int32 \ IO =
    let a = query getFacts(), getRules() select (x) from Child("Zeus", x);
    let b = query getFacts(), getRules() select (y) from AncestorOf("Apollo", y);
    println("Children of Zeus = ${a}");
    println("Ancestors of Apollo = ${b}");
    0 // exit code

