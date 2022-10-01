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
- *features shared with other languages* : [ADTs] and pattern matching, extensible records, type classes, HKTs, type inference, channel and process-based concurrency (like Go).
- *unique features* : polymorphic effect system, region-based local mutation, purity reflection and first-class Datalog constraints.

## <span id="annots">Annotations</span>

`@Experimental`
`@Internal`
`@Lazy`
`@LazyWhenPure`
`@Parallel`
`@ParallelWhenPure`
`@Space(n)`
`@Time(n)`
`@Unsafe`
`@benchmark`
`@test`

## <span id="keywords">Keywords</span>

GitHub: [`src\ca\uwaterloo\flix\language\phase\Weeder.scala`](https://github.com/flix/flix/blob/8adacde4dc23ab355850aeeb94f24c17eb30dd0a/main/src/ca/uwaterloo/flix/language/phase/Weeder.scala#L42).

Each keyword below points to a usage example from the [Flix] library :

[`alias`](https://github.com/flix/flix/blob/master/main/src/library/File.flix#L145)
[`and`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L81)
[`as`](https://github.com/flix/flix/blob/master/main/src/library/Console.flix#L34)
[`case`](https://)
[`catch`](https://github.com/flix/flix/blob/master/main/src/library/BigInt.flix#L101)
[`chan`](https://github.com/flix/flix/blob/master/main/src/library/Concurrent/Channel/Ticker.flix#L100)
[`choose`](https://github.com/flix/flix/blob/master/main/src/library/Choice.flix#L33)
[`class`](https://github.com/flix/flix/blob/master/main/src/library/Add.flix#L20)
[`def`](https://github.com/flix/flix/blob/master/main/src/library/Add.flix#L24)
[`deref`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L59)
[`discard`](https://github.com/flix/flix/blob/master/main/src/library/StringBuilder.flix#L53)
`do
eff
else
enum
false
fix
for
forall
force
foreach
from
get
if`
[`import`](https://github.com/flix/flix/blob/master/main/src/library/Add.flix#L57)
[`inject`](https://github.com/flix/flix/blob/master/main/src/library/Graph.flix#L22)
`inline
instance`
[`into`](https://github.com/flix/flix/blob/master/main/src/library/Graph.flix#L22)
[`lat`]()
[`law`]()
[`lawful`](https://github.com/flix/flix/blob/master/main/src/library/Eq.flix#L22)
[`lazy`](https://github.com/flix/flix/blob/master/main/src/library/DelayList.flix#L430)
`let
match
namespace
new
not
null
opaque
or
override
par
project
pub
query
ref
region
reify
reifyBool
reifyEff
reifyType
rel
resume
sealed
select
set
solve`
[`spawn`](https://github.com/flix/flix/blob/master/main/src/library/DelayMap.flix#L469)
[`static`](https://github.com/flix/flix/blob/master/main/src/library/Char.flix#L41)
`true
try
type
upcast
use
where
with
without
yield`

## <span id="buildin_types">Built-in Types</span>

GitHub: [`src/ca/uwaterloo/flix/api/lsp/provider/CompletionProvider.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/lsp/provider/CompletionProvider.scala#L50).

`Array`
`BigInt`
`Bool`
`Channel`
`Char`
`Float32`
`Float64`
`Int8`
`Int16`
`Int32`
`Int64`
`Lazy`
`Ref`
`String`
`Unit`

## <span id="standard_types">Standard Types</span>

[`Absent`](https://github.com/flix/flix/blob/master/main/src/library/Choice.flix#L21)
`Eff`
`Impure`
`Nil`
`Predicate`
`Present`
`Pure`
`Read`
`RecordNow`
`Region`
`SchemaNow`
`Static`
`Type`
`Write`

## <span id="operators">Predefined Operators</span>

`<-
=>
@
:`

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
Extract from the Flix FAQ :
<blockquote>
<p>
<a href="https://flix.dev/">Flix</a> looks quite similar to <a href="https://www.scala-lang.org/">Scala</a>. How are the two languages related?</p>
<p>
Flix borrows a lot of syntax from Scala, hence the two languages have a similar feel. We think Scala made many good design choices with respect to syntax, including:<br/>&ensp;<b>(a)</b> the use of short keywords,<br/>&ensp;<b>(b)</b> the <code>x : T</code> syntax for type annotations,<br/>&ensp;<b>(c)</b> the <code>List[Int32]</code> syntax for type parameters, and<br/>&ensp;<b>(d)</b> <code>if</code>, <code>match</code>, etc. as expressions.
</p>
Other than syntax, the two languages are very different:
<ul>
<li>Scala is object-oriented, Flix is not.</li>
<li>Scala has sub-typing, Flix does not.</li>
<li>The Scala type system is unsound and has imperfect type inference, whereas the Flix type system is both sound and supports type inference.</li>
</ul>
</blockquote>
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/October 2022* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[adts]: https://wiki.haskell.org/Algebraic_data_type
[flix]: https://flix.dev/
