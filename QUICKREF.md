# <span id="top">Flix Quick Reference</span> <span style="size:25%;"><a href="README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:60px;max-width:100px;">
    <a href="https://flix.dev/" rel="external"><img style="border:0;width:80px;" src="./docs/images/flix-logo.png" alt="Flix project" /></a>
  </td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    This document gathers a few reference informations about the <a href="https://flix.dev/" rel="external">Flix</a> programming language.<br/>&nbsp;
  </td>
  </tr>
</table>

> **Hint**: Read the document <a href="https://github.com/flix/flix/blob/master/docs/DIDYOUKNOW.md">"Did You Know?"</a> from the <a href="https://flix.dev/" rel="external">Flix</a> documentation to know more about the <a href="https://flix.dev/" rel="external">Flix</a> ecosystem.

[Flix] language features can be split into two categories :
- *features shared with other languages* : [ADTs] and pattern matching, extensible records, type classes, HKTs, type inference, channel and process-based concurrency (like [Go][go_concurrency]).
- *unique features* : polymorphic effect system, region-based local mutation, purity reflection and first-class Datalog constraints.

## <span id="annotations">Annotations</span>

| Annotation      | Definition / Usage |
|:----------------|:-------------------|
| `@Experimental` | [`ca\uwaterloo\flix\language\ast\Ast.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L147) |
| `@Internal`     | [`ca\uwaterloo\flix\language\ast\Ast.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L156) |
| `@Lazy`         | [`ca\uwaterloo\flix\language\ast\Ast.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L184) |
| `@LazyWhenPure` | [`ca\uwaterloo\flix\language\ast\Ast.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L193) |
| `@Parallel`     | |
| `@ParallelWhenPure` | |
| `@Space(n)`     | |
| `@Time(n)`      | |
| `@Unsafe`       | [`library\Reflect.flix`](https://github.com/flix/flix/blob/master/main/src/library/Reflect.flix#L8) |
| `@benchmark`    | |
| `@test`         | |

## <span id="keywords">Keywords</span>

The list of [Flix] keywords is available from several locations :
- [Online Flix documentation](https://doc.flix.dev/identifiers.html?highlight=instance#reserved-identifiers)
- GitHub: [`src\ca\uwaterloo\flix\language\phase\Weeder.scala`](https://github.com/flix/flix/blob/8adacde4dc23ab355850aeeb94f24c17eb30dd0a/main/src/ca/uwaterloo/flix/language/phase/Weeder.scala#L42).

Each keyword below points to a usage example from the [Flix] library :

| Keyword | Description |
|:--------|:------------|
| [`alias`](https://github.com/flix/flix/blob/master/main/src/library/File.flix#L145) | [Short-hand name for a type](https://doc.flix.dev/type-aliases.html) |
| [`and`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L81) | |
| [`as`](https://github.com/flix/flix/blob/master/main/src/library/Console.flix#L34) | |
| [`case`](https://) | |
| [`catch`](https://github.com/flix/flix/blob/master/main/src/library/BigInt.flix#L101) | |
| [`chan`](https://github.com/flix/flix/blob/master/main/src/library/Concurrent/Channel/Ticker.flix#L100) | |
| [`choose`](https://github.com/flix/flix/blob/master/main/src/library/Choice.flix#L33) | |
| [`class`](https://github.com/flix/flix/blob/master/main/src/library/Add.flix#L20) | |
| [`def`](https://github.com/flix/flix/blob/master/main/src/library/Add.flix#L24) | |
| [`deref`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L59) | [To access a reference cell](https://doc.flix.dev/references.html?highlight=deref#dereference) |
| [`discard`](https://github.com/flix/flix/blob/master/main/src/library/StringBuilder.flix#L53) | |
| [`do`]() | |
| [`eff`]() | |
| [`else`]() | |
| [`enum`]() | |
| [`false`]() | |
| [`fix`]() | |
| [`for`]() | |
| [`forall`]() | |
| [`force`]() | |
| [`foreach`]() | |
| [`from`]() | |
| [`get`]() | |
| [`if`]() | |
| [`import`](https://github.com/flix/flix/blob/master/main/src/library/Add.flix#L57) | |
| [`inject`](https://github.com/flix/flix/blob/master/main/src/library/Graph.flix#L22) | |
| [`inline`]() | |
| [`instance`]() | |
| [`into`](https://github.com/flix/flix/blob/master/main/src/library/Graph.flix#L22) | |
| [`lat`]() | |
| [`law`]() | |
| [`lawful`](https://github.com/flix/flix/blob/master/main/src/library/Eq.flix#L22) | |
| [`lazy`](https://github.com/flix/flix/blob/master/main/src/library/DelayList.flix#L430) | [Lazy evaluation of an expression](https://doc.flix.dev/laziness.html?highlight=lazy#laziness) |
| [`let`]() | |
| [`match`]() | |
| [`namespace`]() | |
| [`new`]() | |
| [`not`]() | |
| [`null`]() | |
| [`opaque`]() | |
| [`or`]() | |
| [`override`]() | |
| [`par`]() | |
| [`project`]() | |
| [`pub`]() | |
| [`query`]() | |
| [`ref`]() | |
| [`region`]() | |
| [`reify`]() | |
| [`reifyBool`]() | |
| [`reifyEff`]() | |
| [`reifyType`]() | |
| [`rel`]() | |
| [`resume`]() | |
| [`sealed`]() | |
| [`select`]() | |
| [`set`]() | |
| [`solve`]() | |
| [`spawn`](https://github.com/flix/flix/blob/master/main/src/library/DelayMap.flix#L469) | |
| [`static`](https://github.com/flix/flix/blob/master/main/src/library/Char.flix#L41) | |
| [`true`]() | |
| [`try`]() | |
| [`type`]() | |
| [`upcast`](https://github.com/flix/flix/blob/master/main/src/library/Prelude.flix#L298) | |
| [`use`]() | |
| [`where`]() | |
| [`with`]() | |
| [`without`]() | |
| [`yield`]() | |

## <span id="buildin_functions">Built-in Functions</span>

The [Flix] built-in functions are defined in file [`Flix.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/Flix.scala) (value [`coreLibrary`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/Flix.scala#L71)) :

| Namespace | Function(s) |
|:----------|:------------|
| [`Bool`](https://github.com/flix/flix/blob/master/main/src/library/Bool.flix) | [`∨`](https://) |
| [`Boxable`](https://github.com/flix/flix/blob/master/main/src/library/Boxable.flix) | |
| [`Boxed`](https://github.com/flix/flix/blob/master/main/src/library/Boxed.flix) | |
| [`Channel`](https://github.com/flix/flix/blob/master/main/src/library/Channel.flix) | [`buffered`](https://github.com/flix/flix/blob/master/main/src/library/Channel.flix#L23), [`recv`](https://github.com/flix/flix/blob/master/main/src/library/Channel.flix#L37), [`send`](https://github.com/flix/flix/blob/master/main/src/library/Channel.flix#L44), [`timeout`](https://github.com/flix/flix/blob/master/main/src/library/Channel.flix#L60), [`unbuffered`](https://github.com/flix/flix/blob/master/main/src/library/Channel.flix#L30) |
| [`Comparison`](https://github.com/flix/flix/blob/master/main/src/library/Comparison.flix) | |
| [`Debug`](https://github.com/flix/flix/blob/master/main/src/library/Debug.flix) | |
| [`Eq`](https://github.com/flix/flix/blob/master/main/src/library/Eq.flix) | |
| [`Hash`](https://github.com/flix/flix/blob/master/main/src/library/Hash.flix) | |
| [`Reflect`](https://github.com/flix/flix/blob/master/main/src/library/Reflect.flix) | [`default`](https://github.com/flix/flix/blob/master/main/src/library/Reflect.flix#L9) |
| [`Sendable`](https://github.com/flix/flix/blob/master/main/src/library/Sendable.flix) | |
| [`Order`](https://github.com/flix/flix/blob/master/main/src/library/Order.flix) | |
| [`Thread`](https://github.com/flix/flix/blob/master/main/src/library/Thread.flix) | |
| [`Time`](https://github.com/flix/flix/blob/master/main/src/library/Time.flix) | |
| [`ToString`](https://github.com/flix/flix/blob/master/main/src/library/ToString.flix) | |

## <span id="standard_functions">Standard Functions</span>

The [Flix] standard functions are defined in file [`Flix.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/Flix.scala) (value [`standardLibrary`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/Flix.scala#L120)) :

| Namespace | Function(s) |
|:----------|:------------|
| [`Array`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix) | [`head`](https://github.com/flix/flix/blob/3993789c43308c892d8c6cf49c869901d7e1bb44/main/src/library/Array.flix#L205), [`isEmpty`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L99), [`last`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L221), [`toList`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L119), etc. |
| [`Assert`](https://github.com/flix/flix/blob/master/main/src/library/Assert.flix) | [`eq`](https://github.com/flix/flix/blob/master/main/src/library/Assert.flix#L23) |
| [`Benchmark`](https://github.com/flix/flix/blob/master/main/src/library/Benchmark.flix) | [`runAll`](https://), [`runBenchmark`](https://), [`runBenchmarkOnce`](https://), [`loop`](https://) |
| [`Bigdecimal`](https:) | |
| [`BigInt`](https://github.com/flix/flix/blob/master/main/src/library/BigInt.flix) | [`fromString`](https://github.com/flix/flix/blob/master/main/src/library/BigInt.flix#L97), [`min`](https://github.com/flix/flix/blob/master/main/src/library/BigInt.flix#L22), [`toString`](https://github.com/flix/flix/blob/master/main/src/library/BigInt.flix#L91), etc. |
| [`Chain`](https://github.com/flix/flix/blob/master/main/src/library/Chain.flix) | |
| [`Char`](https://github.com/flix/flix/blob/master/main/src/library/Char.flix) |[`isLetter`](https://github.com/flix/flix/blob/master/main/src/library/Char.flix#L40), [`isLowerCase`](https://github.com/flix/flix/blob/master/main/src/library/Char.flix#L86), etc. |
| [`Choice`](https://github.com/flix/flix/blob/master/main/src/library/Choice.flix#L20) | Defines the enumeration values [`Absent`](https://github.com/flix/flix/blob/master/main/src/library/Choice.flix#L21) and [`Present`](https://github.com/flix/flix/blob/master/main/src/library/Choice.flix#L22). |
| [`Console`](https://github.com/flix/flix/blob/master/main/src/library/Console.flix/) | [`readLine`](https://github.com/flix/flix/blob/master/main/src/library/Console.flix#L33), [`print`](https://github.com/flix/flix/blob/master/main/src/library/Console.flix#L61), [`printLine`](https://github.com/flix/flix/blob/master/main/src/library/Console.flix#L77) |
| [`Environment`](https://github.com/flix/flix/blob/master/main/src/library/Environment.flix) | [`getEnv`](https://github.com/flix/flix/blob/master/main/src/library/Environment.flix#L30), [`getProp`](https://github.com/flix/flix/blob/master/main/src/library/Environment.flix#L58), [`getVar`](https://github.com/flix/flix/blob/master/main/src/library/Environment.flix#L30) |
| [`File`](https://github.com/flix/flix/blob/master/main/src/library/File.flix) | [`accessTime`](https://) |
| [`Float32`](https://github.com/flix/flix/blob/master/main/src/library/Float32.flix) | |
| [`Float64`](https://github.com/flix/flix/blob/master/main/src/library/Float64.flix) | 64-bit float |
| [`Int8`](https://github.com/flix/flix/blob/master/main/src/library/Int8.flix) |  8-bit integer |
| [`Int16`](https://github.com/flix/flix/blob/master/main/src/library/Int16.flix) | |
| [`Int32`](https://github.com/flix/flix/blob/master/main/src/library/Int32.flix) | |
| [`Int64`](https://github.com/flix/flix/blob/master/main/src/library/Int64.flix) | [`bitCount`](https://github.com/flix/flix/blob/master/main/src/library/Int64.flix#L105),  [`factorial`](https://github.com/flix/flix/blob/master/main/src/library/Int64.flix#L261), [`fromString`](https://github.com/flix/flix/blob/master/main/src/library/Int64.flix#L281), [`log2`](https://github.com/flix/flix/blob/master/main/src/library/Int64.flix#L250) |
| [`Iterable`](https://github.com/flix/flix/blob/master/main/src/library/Iterable.flix) | [`enumerator`](https://github.com/flix/flix/blob/master/main/src/library/Iterable.flix#L30), [`iterator`](https://github.com/flix/flix/blob/master/main/src/library/Iterable.flix#L25) |
| [`Iterator`](https://github.com/flix/flix/blob/master/main/src/library/Iterator.flix) | [`isEmpty`](https://), [`next`](https://github.com/flix/flix/blob/master/main/src/library/Iterator.flix#L87), [`range`](https://github.com/flix/flix/blob/master/main/src/library/Iterator.flix#L109), etc. |
| [`List`](https://github.com/flix/flix/blob/master/main/src/library/List.flix) | [`head`](https://github.com/flix/flix/blob/master/main/src/library/List.flix#L138), [`isEmpty`](https://github.com/flix/flix/blob/master/main/src/library/List.flix#L138), [`toString`](https://github.com/flix/flix/blob/master/main/src/library/List.flix#L127) |
| [`StringBuilder`](https://github.com/flix/flix/blob/master/main/src/library/StringBuilder.flix) | [`append!`](https://github.com/flix/flix/blob/master/main/src/library/StringBuilder.flix#L42), [`length`](https://github.com/flix/flix/blob/master/main/src/library/StringBuilder.flix#L132), [`toString`](https://github.com/flix/flix/blob/master/main/src/library/StringBuilder.flix#L140) |
| [`Concurrent/Channel`](https://github.com/flix/flix/blob/master/main/src/library/Concurrent/Channel.flix) | |
| [`Concurrent/Condition`](https://github.com/flix/flix/blob/master/main/src/library/Concurrent/Condition.flix) | Condition functions are [`await`](https://github.com/flix/flix/blob/master/main/src/library/Concurrent/Condition.flix#L35), [`signal`](https://github.com/flix/flix/blob/master/main/src/library/Concurrent/Condition.flix#L75), etc. |


## <span id="operators">Predefined Operators</span>

| Operator | Description |
|:---------|:------------|
| [`<-`]() | |
| [`=>`]() | |
| [`@`]() | |
| [`:`]() | |
| [`:::`]() | The infix operator `:::` is an alias for [`List.append(xs, ys)`](https://github.com/flix/flix/blob/master/main/src/library/List.flix#L184). |

## <span id="grammar">Flix Grammar (WIP)</span> <sup id="anchor_01">[1](#footnote_01)</sup>

GitHub: [`src\ca\uwaterloo\flix\language\phase\Parser.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/phase/Parser.scala#L128)
<pre style="font-size:80%;">
Program       = UsesOrImports { Declaration }

UsesOrImports = ( Use | Import ) { Use | Import }

Use           = <b>use</b> ( NQualifiedType '.' NTag
                   | NQualifiedType '.{' { TagAndAlias1 { ',' TagAndAlias1 } } '}'
                   | NNamespace '.' UseName
                   | NNamespace '.{' NameAndAlias1 { ',' NameAndAlias1 } } '}'
                   ) ';'

TagAndAlias1  = <i>NTag</i> [ '=>' <i>NTag</i> ].

NameAndAlias1 = UseName [ '=>' UseName ].

UseName       = NLowerCaseName | NUpperCaseName
              | NGreekName | NMathName | NOperatorName. 

Import      = <b>import</b> <i>NJavaName</i>
              [ '.{' { NameAndAlias { ',' NameAndAlias } } '}' ].

Declaration = Namespace | Def | Law | Enum
            | TypeAlias | Relation | Lattice
            | Class | Instance | Effect.

Namespace   = <b>namespace</b> <i>NNamespace</i> '{' Program '}'.

Def         = Documentation Annotations Modifiers
              <b>def</b> <i>NDefinition</i> TypeParams FormalParamList ':' TypeAndEffect OptTypeConstraintList '=' Stmt.

Sig         = Documentation Annotations Modifiers
              <b>def</b> <i>NDefinition</i> TypeParams FormalParamList ':' TypeAndEfect OptTypeConstraintList [ '=' Stmt ].

Law         = Documentation Annotations Modifiers
              <b>law</b> <i>NDefinition</i> ':'

Enum        = Documentation Annotations Modifiers
              <b>enum</b> <i>NType</i> TypeParams [ <i>TTuple</i> ]
              Derivations Body.

TypeAlias   = Documentation Modifiers
              <b>type</b> <b>alias</b> <i>NType</i> TypeParams '=' Type.

Relation    = Documentation Modifiers
              <b>rel</b> <i>NPredicate</i> TypeParams AttributeList.

Lattice     = Documentation Modifiers
              <b>lat</b> <i>NPredicate</i> TypeParams AttributeList.

Class       = Documentation Annotations Modifiers
              <b>class</b> <i>NClass</i> '[' TypeParam ']'
              [ '{' Law | Sig '}' ].

Instance    = Documentation Modifiers
              <b>instance</b> <i>NQualifiedClass</i> '[' Type ']' OptTypeConstraintList [ '{' { Def } '}' ].

Effect      = Documentation Modifiers
              <b>eff</b> <i>NEffect</i> TypeParams [ '{' { Op } '}' ].

TypeParams  = [ '[' TyeParam { ',' TypeParam } ']' ].

TypeParam   = <i>NVariable</i> [ ':' Kind ].

</pre>

<!--============================================================-->

## <span id="options">Compiler Options</span>

GitHub: [`test\ca\uwaterloo\flix\TestMain.scala`](https://github.com/flix/flix/blob/master/main/test/ca/uwaterloo/flix/TestMain.scala)

<!--============================================================-->

## <span id="footnotes">Footnotes</span>

<span id="footnote_01">[1]</span> ***Flix versus Scala*** [↩](#anchor_01)

<dl><dd>
Extract from the <a href="https://flix.dev/faq/" rel="external">Flix FAQ</a> :
<blockquote>
<p>
<a href="https://flix.dev/" rel="external">Flix</a> looks quite similar to <a href="https://www.scala-lang.org/" rel="external">Scala</a>. How are the two languages related?</p>
<p>
Flix borrows a lot of syntax from <a href="https://www.scala-lang.org/" rel="external">Scala</a>, hence the two languages have a similar feel. We think Scala made many good design choices with respect to syntax, including:<br/>&ensp;<b>a)</b> the use of short keywords,<br/>&ensp;<b>b)</b> the <code>x : T</code> syntax for type annotations,<br/>&ensp;<b>c)</b> the <code>List[Int32]</code> syntax for type parameters, and<br/>&ensp;<b>d)</b> <code>if</code>, <code>match</code>, etc. as expressions.
</p>
Other than syntax, the two languages are very different:
<ul>
<li><a href="https://www.scala-lang.org/" rel="external">Scala</a> is object-oriented, <a href="https://flix.dev/" rel="external">Flix</a> is not.</li>
<li>Scala has sub-typing, Flix does not.</li>
<li>The Scala type system is unsound and has imperfect type inference, whereas the <a href="https://flix.dev/" rel="external">Flix</a> type system is both sound and supports type inference.</li>
</ul>
</blockquote>
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/December 2022* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[adts]: https://wiki.haskell.org/Algebraic_data_type
[flix]: https://flix.dev/
[go_concurrency]: https://www.golang-book.com/books/intro/10
