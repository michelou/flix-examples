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

## <span id="annotations">Annotations</span>

| Annotation      | Description |
|:----------------|:------------|
| `@Experimental` | [`ca\uwaterloo\flix\language\ast\Ast.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L114) |
| `@Internal`     | [`ca\uwaterloo\flix\language\ast\Ast.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L123) |
| `@Lazy`         | |
| `@LazyWhenPure` | |
| `@Parallel`     | |
| `@ParallelWhenPure` | |
| `@Space(n)`     | |
| `@Time(n)`      | |
| `@Unsafe`       | [`library\Reflect.flix`](https://github.com/flix/flix/blob/master/main/src/library/Reflect.flix#L8) |
| `@benchmark`    | |
| `@test`         | |

## <span id="keywords">Keywords</span>

GitHub: [`src\ca\uwaterloo\flix\language\phase\Weeder.scala`](https://github.com/flix/flix/blob/8adacde4dc23ab355850aeeb94f24c17eb30dd0a/main/src/ca/uwaterloo/flix/language/phase/Weeder.scala#L42).

Each keyword below points to a usage example from the [Flix] library :

| Keyword | Description |
|:--------|:------------|
| [`alias`](https://github.com/flix/flix/blob/master/main/src/library/File.flix#L145)
| [`and`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L81)
| [`as`](https://github.com/flix/flix/blob/master/main/src/library/Console.flix#L34)
| [`case`](https://)
| [`catch`](https://github.com/flix/flix/blob/master/main/src/library/BigInt.flix#L101)
| [`chan`](https://github.com/flix/flix/blob/master/main/src/library/Concurrent/Channel/Ticker.flix#L100)
| [`choose`](https://github.com/flix/flix/blob/master/main/src/library/Choice.flix#L33)
| [`class`](https://github.com/flix/flix/blob/master/main/src/library/Add.flix#L20)
| [`def`](https://github.com/flix/flix/blob/master/main/src/library/Add.flix#L24)
| [`deref`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L59)
| [`discard`](https://github.com/flix/flix/blob/master/main/src/library/StringBuilder.flix#L53)
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
| [`lazy`](https://github.com/flix/flix/blob/master/main/src/library/DelayList.flix#L430) | |
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

## <span id="buildin_types">Built-in Types and Functions</span>

The [Flix] built-in types and functions are defined in file [`Flix.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/Flix.scala) (value [`coreLibrary`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/Flix.scala#L71)) :

| Type | Description |
|:-----|:------------|
| [`Bool`](https://github.com/flix/flix/blob/master/main/src/library/Bool.flix) | |
| [`Boxable`](https://github.com/flix/flix/blob/master/main/src/library/Boxable.flix) | |
| [`Boxed`](https://github.com/flix/flix/blob/master/main/src/library/Boxed.flix) | |
| [`ToString`](https://github.com/flix/flix/blob/master/main/src/library/ToString.flix) | |

## <span id="standard_types">Standard Types</span>

The [Flix] standard types are defined in file [`Flix.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/Flix.scala) (value [`standardLibrary`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/Flix.scala#L120)) :

| Type | Description |
|:-----|:------------|
| [`Array`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix) | Array functions are [`head`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L212), [`isEmpty`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L99), [`last`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L221), [`toList`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L119), etc. |
| [`BigInt`](https://github.com/flix/flix/blob/master/main/src/library/BigInt.flix) | BigInt functions are [`fromString`](https://github.com/flix/flix/blob/master/main/src/library/BigInt.flix#L97), [`min`](https://github.com/flix/flix/blob/master/main/src/library/BigInt.flix#L22), [`toString`](https://github.com/flix/flix/blob/master/main/src/library/BigInt.flix#L91), etc. |
| [`Char`](https://github.com/flix/flix/blob/master/main/src/library/Char.flix) | Char functions are [`isLetter`](https://github.com/flix/flix/blob/master/main/src/library/Char.flix#L40), [`isLowerCase`](https://github.com/flix/flix/blob/master/main/src/library/Char.flix#L86), etc. |
| [`Choice`](https://github.com/flix/flix/blob/master/main/src/library/Choice.flix#L20) | Defines the enumeration values [`Absent`](https://github.com/flix/flix/blob/master/main/src/library/Choice.flix#L21) and [`Present`](https://github.com/flix/flix/blob/master/main/src/library/Choice.flix#L22). |
| [`Eff`]() | |
| [`Float32`](https://github.com/flix/flix/blob/master/main/src/library/Float32.flix) | |
| [`Float64`](https://github.com/flix/flix/blob/master/main/src/library/Float64.flix) | 64-bit float |
| [`Int8`](https://github.com/flix/flix/blob/master/main/src/library/Int8.flix) |  8-bit integer |
| [`Int16`](https://github.com/flix/flix/blob/master/main/src/library/Int16.flix) | |
| [`Int32`](https://github.com/flix/flix/blob/master/main/src/library/Int32.flix) | |
| [`Int64`](https://github.com/flix/flix/blob/master/main/src/library/Int64.flix) | |
| [`Iterable`](https://github.com/flix/flix/blob/master/main/src/library/Iterable.flix) | [`enumerator`](https://github.com/flix/flix/blob/master/main/src/library/Iterable.flix#L30), [`iterator`](https://github.com/flix/flix/blob/master/main/src/library/Iterable.flix#L25) |
| [`Iterator`](https://github.com/flix/flix/blob/master/main/src/library/Iterator.flix) | Iterator functions are [`next`](https://github.com/flix/flix/blob/master/main/src/library/Iterator.flix#L87), etc. |
| [`Nil`]() | |
| [`Predicate`]() | |
| [`Pure`]() | |
| [`Read`]() | |
| [`RecordNow`]() | |
| [`Region`]() | |
| [`SchemaNow`]() | |
| [`Static`]() | |
| [`Type`]() | |
| [`Write`]() | |
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
Extract from the Flix FAQ :
<blockquote>
<p>
<a href="https://flix.dev/" rel="external">Flix</a> looks quite similar to <a href="https://www.scala-lang.org/" rel="external">Scala</a>. How are the two languages related?</p>
<p>
Flix borrows a lot of syntax from Scala, hence the two languages have a similar feel. We think Scala made many good design choices with respect to syntax, including:<br/>&ensp;<b>(a)</b> the use of short keywords,<br/>&ensp;<b>(b)</b> the <code>x : T</code> syntax for type annotations,<br/>&ensp;<b>(c)</b> the <code>List[Int32]</code> syntax for type parameters, and<br/>&ensp;<b>(d)</b> <code>if</code>, <code>match</code>, etc. as expressions.
</p>
Other than syntax, the two languages are very different:
<ul>
<li><a href="https://www.scala-lang.org/" rel="external">Scala</a> is object-oriented, <a href="https://flix.dev/" rel="external">Flix</a> is not.</li>
<li>Scala has sub-typing, Flix does not.</li>
<li>The Scala type system is unsound and has imperfect type inference, whereas the Flix type system is both sound and supports type inference.</li>
</ul>
</blockquote>
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/November 2022* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[adts]: https://wiki.haskell.org/Algebraic_data_type
[flix]: https://flix.dev/
