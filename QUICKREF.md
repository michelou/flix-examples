# <span id="top">Flix Quick Reference</span> <span style="size:25%;"><a href="README.md#top">↩</a></span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
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

[Flix] annotations are defined in file [`language\ast\Ast.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala) :

| Definition      | Usage&nbsp;examples |
|:----------------|:---------------|
| [`@Benchmark`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L152) | [`benchmark/BenchmarkConstraint.flix`](https://github.com/flix/flix/blob/master/main/src/resources/benchmark/BenchmarkConstraint.flix#L6)<br/>[`benchmark/BenchmarkList.flix`](https://github.com/flix/flix/blob/master/main/src/resources/benchmark/BenchmarkList.flix#L6) |
| [`@Deprecated`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L161) | *unused* |
| [`@Experimental`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L170) | [`library/Benchmark.flix`](https://github.com/flix/flix/blob/master/main/src/library/Benchmark.flix#L49)<br/> [`library/Choice.flix`](https://github.com/flix/flix/blob/master/main/src/library/Choice.flix#L33) |
| [`@Internal`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L177) | [`library/Debug.flix`](https://github.com/flix/flix/blob/master/main/src/library/Debug.flix#L34) |
| [`@Lazy`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L205) | [`library/DelayList.flix`](https://github.com/flix/flix/blob/master/main/src/library/DelayList.flix#L200)<br/>[`library/DelayMap.flix`](https://github.com/flix/flix/blob/master/main/src/library/DelayMap.flix#L371) |
| [`@LazyWhenPure`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L214) | [`library/DelayList.flix`](https://github.com/flix/flix/blob/master/main/src/library/DelayList.flix#L415)<br/>[`library/DelayMap.flix`](https://github.com/flix/flix/blob/master/main/src/library/DelayMap.flix#L352) |
| [`@MustUse`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L223) | |
| [`@Parallel`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L187) | [`library/DelayMap.flix`](https://github.com/flix/flix/blob/master/main/src/library/DelayMap.flix#L440) |
| [`@ParallelWhenPure`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L196) | [`library/DelayMap.flix`](https://github.com/flix/flix/blob/master/main/src/library/DelayMap.flix#L155) |
| [`@Skip`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L234) | *unused* |
| [`@Test`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L247) | [`library/TestApplicative.flix`](https://github.com/flix/flix/blob/master/main/test/ca/uwaterloo/flix/library/TestApplicative.flix#L26)<br/>[`library/TestArray.flix`](https://github.com/flix/flix/blob/master/main/test/ca/uwaterloo/flix/library/TestArray.flix#L25) |
<!-- dropped on May 11, 2023, see https://github.com/flix/flix/pull/5909 -->
<!--
| [`@Unsafe`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/ast/Ast.scala#L252) | [`library/Object.flix`](https://github.com/flix/flix/blob/master/main/src/library/Object.flix#L44),<br/>[`library/Reflect.flix`](https://github.com/flix/flix/blob/master/main/src/library/Reflect.flix#L8) |
-->

## <span id="keywords">Keywords</span> [**&#x25B4;**](#top)

The list of [Flix] keywords is available from several locations :
- [Online Flix documentation](https://doc.flix.dev/identifiers.html?highlight=instance#reserved-identifiers)
- [Flix] compiler: [`src\ca\uwaterloo\flix\language\phase\Weeder.scala`](https://github.com/flix/flix/blob/8adacde4dc23ab355850aeeb94f24c17eb30dd0a/main/src/ca/uwaterloo/flix/language/phase/Weeder.scala#L42).
<!--
- [Flix] API: [`src\ca\uwaterloo\flix\api\lsp\provider\CompletionProvider.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/lsp/provider/CompletionProvider.scala#L241).
-->

<!--
| `choose` | | <span style="font-size:80%;">[`library/Choice.flix`](https://github.com/flix/flix/blob/master/main/src/library/Choice.flix#L33)</span> |
-->

| Keyword | Description | Usage examples |
|:--------|:------------|:---------------|
| `alias` | [Short-hand name for a type](https://doc.flix.dev/type-aliases.html).<br/>See `type` | <span style="font-size:80%;">[`library/File.flix`](https://github.com/flix/flix/blob/master/main/src/library/File.flix#L139)</span><br/>[`library\Fixpoint\Interpreter.flix`](https://github.com/flix/flix/blob/master/main/src/library/Fixpoint/Interpreter.flix#L22) |
| `and`   | | <span style="font-size:80%">[`library/Array.flix`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L1138)<br/>[`library/Bool.flix`](https://github.com/flix/flix/blob/master/main/src/library/Bool.flix#L30)<br/>[`library/Eq.flix`](https://github.com/flix/flix/blob/master/main/src/library/Eq.flix#L47)</span> |
| `as` | See `import`. | <span style="font-size:80%;">[`library/Console.flix`](https://github.com/flix/flix/blob/master/main/src/library/Console.flix#L34)</span> |
| `case` | See `match`. | <span style="font-size:80%;">[`library/Array.flix`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L325)</span> |
| `catch` | See `try`. | <span style="font-size:80%;">[`library/BigInt.flix`](https://github.com/flix/flix/blob/master/main/src/library/BigInt.flix#L174)</span> |
| `class` | | <span style="font-size:80%;">[`library/Add.flix`](https://github.com/flix/flix/blob/master/main/src/library/Add.flix#L20)</span> |
| <span id="def">`def`</span> | | <span style="font-size:80%;">[`library/Add.flix`](https://github.com/flix/flix/blob/master/main/src/library/Add.flix#L24)</span> |
| `deref` | [To access a reference cell](https://doc.flix.dev/references.html?highlight=deref#dereference). | <span style="font-size:80%;">[`library/Array.flix`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L51)</span> |
| `discard` | | <span style="font-size:80%;">[`library/Array.flix`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L627)<br/>[`library/StringBuilder.flix`](https://github.com/flix/flix/blob/master/main/src/library/StringBuilder.flix#L53)</span> |
| `eff` | Only two usages found in `Prelude.flix` | <span style="font-size:80%;">[`library/Prelude.flix`](https://github.com/flix/flix/blob/master/main/src/library/Prelude.flix#L24)</span> |
| `else` | See [`if`](#if). | <span style="font-size:80%;">[`library/Array.flix`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L29)</span> |
| `enum` | Flix [enumerated types](https://doc.flix.dev/enums.html) (recurive and polymorphic). | <span style="font-size:80%;">[`library/Comparison.flix`](https://github.com/flix/flix/blob/master/main/src/library/Comparison.flix#L17)</span> |
| `false` | | <span style="font-size:80%;">[`library/Array.flix`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L698)</span> |
| `fix` | Used in Datalog constraints (i.e. in a `#{...}` block). | <span style="font-size:80%;">[`library/Graph.flix`](https://github.com/flix/flix/blob/master/main/src/library/Graph.flix#L89)</span> |
| `forall` | Used together with [`law`](#law) | <span style="font-size:80%;">[`library/Applicative.flix`](https://github.com/flix/flix/blob/master/main/src/library/Applicative.flix#L79)</span> |
| `force` | | <span style="font-size:80%;">[`library/Bool.flix`](https://github.com/flix/flix/blob/master/main/src/library/Bool.flix#L60)</span> |
| `foreach` | | <span style="font-size:80%;">[`library/List.flix`](https://github.com/flix/flix/blob/master/main/src/library/List.flix#L134)</span> |
| `forM`  | | <span style="font-size:80%;">[`library/BigInt.flix`](https://github.com/flix/flix/blob/master/main/src/library/BigInt.flix#L257)</span> |
| `from` | See [`select`](#select). | <span style="font-size:80%;">[`library/Graph.flix`](https://github.com/flix/flix/blob/master/main/src/library/Graph.flix#L33)</span>|
| <span id="if">`if`</span> | Flix supports the usual [`if-then-else`](https://doc.flix.dev/if-then-else.html) expression. | <span style="font-size:80%;">[`library/Array.flix`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L25)</span> |
| <span id="import">`import`</span> | Interoperability with Java.<br/>Usage cases are :<br/><ul style="padding-left:18px;"><li>Import a Java class/interface (to <a href="https://doc.flix.dev/extending-classes-and-interfaces.html">create objects</a>).</li><li>Access a Java instance method.</li><li>Create a Java instance</li><li>Access a Java static method.</li></ul> | &nbsp;<br/>&nbsp;<br/><ul style="list-style-type:none;padding-left:0;"><li><i>(no usage found in Flix library)</i></li><li><span style="font-size:80%;">[`library/BigDecimal.flix`](https://github.com/flix/flix/blob/master/main/src/library/BigDecimal.flix#L112)</span></li><li><span style="font-size:80%;">[`library/BigDecimal.flix`](https://github.com/flix/flix/blob/master/main/src/library/BigDecimal.flix#L74)</span></li><li><span style="font-size:80%;">[`library/BigDecimal.flix`](https://github.com/flix/flix/blob/master/main/src/library/BigDecimal.flix#L113)</span></ul> |
| <span id="inject">`inject`</span> | | <span style="font-size:80%;">[`library/Graph.flix`](https://github.com/flix/flix/blob/master/main/src/library/Graph.flix#L30)</span> |
| `instance` | | <span style="font-size:80%;">[`library/Add.flix`](https://github.com/flix/flix/blob/master/main/src/library/Add.flix#L27)</span> |
| `into` | See [`inject`](#inject). | <span style="font-size:80%;">[`library/Graph.flix`](https://github.com/flix/flix/blob/master/main/src/library/Graph.flix#L22)</span> |
| `lat` | Datalog lattice variable (defined in a `#{..}` block). | <span style="font-size:80%;">[`larger-examples/introduction.flix`](https://github.com/flix/flix/blob/master/examples/larger-examples/introduction.flix#L20) |
| <span id="law">`law`</span> | | <span style="font-size:80%;">[`library/Applicative.flix`](https://github.com/flix/flix/blob/master/main/src/library/Applicative.flix#L79)</span> |
| `lawful` | Class modifier | <span style="font-size:80%;">[`library/Applcative.flix`](https://github.com/flix/flix/blob/master/main/src/library/Applicative.flix#L37)</span> |
| `lazy` | [Lazy evaluation of an expression](https://doc.flix.dev/laziness.html?highlight=lazy#laziness) | <span style="font-size:80%;">[`library/DelayList.flix`](https://github.com/flix/flix/blob/master/main/src/library/DelayList.flix#L430)</span> |
| `let` | |  <span style="font-size:80%;">[`library/Array.flix`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L23)</span> |
| `match` | | <span style="font-size:80%;">[`library/Array.flix`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L326)</span> |
| `mod` | Flix [modules](https://doc.flix.dev/modules.html). | <span style="font-size:80%;">[`library/Applicative.flix`](https://github.com/flix/flix/blob/master/main/src/library/Applicative.flix#L125)</span> |
| `not` | | <span style="font-size:80%;">[`library/Bool.flix`](https://github.com/flix/flix/blob/master/main/src/library/Bool.flix#L40)</span> |
| `null` | | [library/Files.flix](https://github.com/flix/flix/blob/master/main/src/library/Files.flix#L385) |
| `or` | | |
| `override` | See [`def`](#def). | <span style="font-size:80%;">[`library/List.flix`](https://github.com/flix/flix/blob/master/main/src/library/List.flix#L81)</span> |
| <span id="par">`par`</span> | Flix [parallelism](https://doc.flix.dev/parallelism.html). | <span style="font-size:80%;">[`library/DelayMap.flix`](https://github.com/flix/flix/blob/master/main/src/library/DelayMap.flix#L466)</span> |
| `pub` | | [library/Array.flix](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L22) |
| <span id="query">`query`</span> | | <span style="font-size:80%;">[`library/Graph.flix`](https://github.com/flix/flix/blob/master/main/src/library/Graph.flix#L31)</span> |
| `ref` | | [library/Array.flix](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L46) |
| `region` | | [library/Array.flix](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L44) |
| `reify` | | |
| `reifyBool` | | |
| `reifyEff` | | |
| `reifyType` | | |
| `rel` | | |
| `resume` | Flix [effect system](https://doc.flix.dev/effects.html) (*unused in library*) | |
| `sealed` | | |
| <span id="select">`select`</span> | See [`query`](#query). | <span style="font-size:80%;">[`library/Graph.flix`](https://github.com/flix/flix/blob/master/main/src/library/Graph.flix#L32)</span> |
| `set` | | |
| `solve` | | [library/Graph.flix](https://github.com/flix/flix/blob/master/main/src/library/Graph.flix#L187) |
| `spawn` | | <span style="font-size:80%;">[`library/DelayMap.flix`](https://github.com/flix/flix/blob/master/main/src/library/DelayMap.flix#L469)</span> |
| `static` | See [`import`](#import). | <span style="font-size:80%;">[`Char.flix`](https://github.com/flix/flix/blob/master/main/src/library/Char.flix#L37)</span> |
| `true` | | |
| `try` | For [interoperability with Java](https://doc.flix.dev/exceptions.html), Flix supports the `try-catch` mechanism. | [library/BigDecimal.flix](https://github.com/flix/flix/blob/master/main/src/library/BigDecimal.flix#L72) |
| `type` | *Unused in library* | |
| `typematch` | | <span style="font-size:80%;">[`library/Array.flix`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L1600)</span> |
| `upcast` | | <span style="font-size:80%;">[`library/Prelude.flix`](https://github.com/flix/flix/blob/master/main/src/library/Prelude.flix#L298)</span> |
| `use` | | [library/Channel.flix](https://github.com/flix/flix/blob/master/main/src/library/Channel.flix#L18) |
| `where` | See [`select`](#select). | <span style="font-size:80%;">[`library/Graph.flix`](https://github.com/flix/flix/blob/master/main/src/library/Graph.flix#L144)</span> |
| `with` | | <span style="font-size:80%;">[`library/Console.flix`](https://github.com/flix/flix/blob/master/main/src/library/Console.flix#L61) |
| `without` | *Unused in library*. | |
| `yield` | See [`forM`](#forM) and [`par`](#par). | <span style="font-size:80%;">[`library/BigInt.flix`](https://github.com/flix/flix/blob/master/main/src/library/BigInt.flix#L261)<br/>[`library/DelayMap.flix`](https://github.com/flix/flix/blob/master/main/src/library/DelayMap.flix#L470)</span> |

## <span id="intrinsic_functions">Intrinsic Functions</span>

Intrinsic functions can appear in [Flix] source code and are translated directly to the underlying JVM operations.
> **Note**: Intrinsic functions are rewritten in method [`VisitExp`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/phase/Weeder.scala#L598) in Scala source file [`ca/uwaterloo/flix/language/phase/Weeder.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/phase/Weeder.scala).

| Intrinsic function | Usage example |
|:-------------------|:--------------|
| [`$ARRAY_LENGTHs$`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L95) | [`library/Array.flix`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L95) |
| [`$ARRAY_LOAD$`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L360) | [`library/Array.flix`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L70) |
| [`$ARRAY_NEW$`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L360) | [`library/Array.flix`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L64) |
| [`$ARRAY_STORE$`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L360) | [`library/Array.flix`](https://github.com/flix/flix/blob/master/main/src/library/Array.flix#L76) |
| [`$BOOL_EQ$`](https://github.com/michelou/flix/blob/master/main/src/ca/uwaterloo/flix/language/phase/Weeder.scala#L504) | [`library/Eq.flix`](https://github.com/flix/flix/blob/master/main/src/library/Eq.flix#L60) |
| [`$BOOL_NEQ$`](https://github.com/michelou/flix/blob/master/main/src/ca/uwaterloo/flix/language/phase/Weeder.scala#L505) | [`library/Eq.flix`](https://github.com/flix/flix/blob/master/main/src/library/Eq.flix#L61) |
| ... | ... |

## <span id="buildin_functions">Built-in Functions</span>

The [Flix] built-in functions are defined in file [`Flix.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/Flix.scala) (value [`coreLibrary`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/Flix.scala#L71)) :

| Namespace | Functions |
|:----------|:----------|
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

## <span id="standard_functions">Standard Functions</span> [**&#x25B4;**](#top)

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

## <span id="grammar">Flix Grammar (WIP)</span> [**&#x25B4;**](#top)

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

Declaration = Namespace | Def | Law | Enum | RestrictedEnum
            | TypeAlias | Class | Instance | Effect.

Namespace   = <b>mod</b> <i>NNamespace</i> '{' Program '}'.

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

## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

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

*[mics](https://lampwww.epfl.ch/~michelou/)/October 2023* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[adts]: https://wiki.haskell.org/Algebraic_data_type
[flix]: https://flix.dev/
[go_concurrency]: https://www.golang-book.com/books/intro/10
