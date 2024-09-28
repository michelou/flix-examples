@test
def test01(): Bool =
    let facts = #{
        Interpreter("x86").
        Compiler("C++", "x86", "x86").
    };
    let rules = #{
        // Bootstrapping Compilation
        Compiler(src1, dst1, dst2) :-
            Compiler(src1, dst1, lang1),
            Compiler(lang1, dst2, lang2),
            Interpreter(lang2).
    };
    query facts, rules
        select (src, dst) from Compiler(src, _, dst) == List.toVector(("C++", "x86") :: Nil)
