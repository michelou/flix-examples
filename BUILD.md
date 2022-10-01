# <span id="top">Building Flix on Windows</span> <span style="size:25%;"><a href="README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;;min-width:120px;"><a href="https://flix.dev/"><img src="./docs/images/flix-logo.png" width="120" alt="Flix project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">Source code of the <a href="https://flix.dev/" rel="external">Flix project</a> is hosted on <a href="https://github.com/flix/flix" rel="external">Github</a>.<br/>The Gradle build is used for continuous integration on GitHub.
  </td>
  </tr>
</table>

Generating the [Flix] library using [Gradle][gradle_userguide] is fast and simple !

We simply start the following command to execute the test suite after we have made the desired changes to our local copy of the [Flix Github repository][flix_github]:

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.gradle.org/current/userguide/command_line_interface.html">gradle</a> test --console=plain</b>
> Task :clean
> Task :compileJava NO-SOURCE
> Task :compileScala
> Task :processResources NO-SOURCE
> Task :classes
> Task :compileTestJava NO-SOURCE
> Task :compileTestScala

> Task :testAll
Run starting. Expected test count is: <b>1267</b>
[<i>...(more details in <a id="anchor_01" href="#footnote_01">footnote 1</a></span>)...</i>]

Run completed in 6 minutes, 40 seconds.
Total number of tests run: 1267
Suites: completed 34, aborted 0
Tests: succeeded 1267, failed 0, canceled 0, ignored 0, pending 0
All tests passed.

> Task :test

BUILD SUCCESSFUL in 6m 44s
4 actionable tasks: 2 executed, 2 up-to-date
</pre>

We subsequently run the command **`gradle jar`** to generate the [Flix] Java archive :
<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.gradle.org/current/userguide/command_line_interface.html">gradle</a> jar</b>

BUILD SUCCESSFUL in 3m 7s
2 actionable tasks: 2 executed

<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/where">where</a> /r . flix*.jar</b>
F:\flix\build\libs\flix.jar
</pre>

> **Note** : The [Flix] library generated **locally** on September 19, 2022, is indeed the same as the corresponding [Flix nightly build][flix_nightly] :
> <pre style="font-size:80%;">
> <b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/where">where</a> /t "%FLIX_HOME%:*.jar" build\libs:*.jar</b>
>   36614213   19.09.2022      20:26:29  c:\opt\flix-0.31.0\flix-2022-09-19.jar
>   36594654   17.09.2022      14:20:22  c:\opt\flix-0.31.0\flix.jar
>   36614213   19.09.2022      23:00:34  F:\flix\build\libs\flix.jar
> </pre>

## <span id="wip">Work in Progess</span> [**&#x25B4;**](#top)

This section presents some of our unpublished works to improve the [Flix] software.

1. **Supported Scala 2 version**
   
   [Flix] is currently built upon Scala 2.13.5 (see [**`build.gradle`**](https://github.com/flix/flix/blob/master/build.gradle)). Moving to current [Scala 2.13.9][scala_2_13_9] requires to rename all occurences of **`enum`** to **`enum0`** (i.e. parameter names) or **`enumSym`** (i.e. case classes). The reason is reasonable: the latest Scala 2 distributions now defines **`enum`** as a reserved keyword in order to ease the migration to [Scala 3][scala_3].
   
   Concretely we need to update the following Scala source files from directory **`main/src/ca/uwaterloo/flix\`**:

   <pre style="font-size:80%;">
   api/lsp/LocationLink.scala
   api/lsp/provider/FindReferencesProvider.scala
   api/lsp/provider/HighlightProvider.scala
   language/ast/Symbol.scala
   language/phase/Inliner.scala
   language/phase/Namer.scala
   language/phase/PatternExhaustiveness.scala
   language/phase/Redundancy.scala
   language/phase/Resolver.scala
   language/phase/Typer.scala
   language/phase/Weeder.scala
   language/phase/jvm/GenExpression.scala
   language/phase/jvm/JvmOps.scala
   language/phase/util/PredefinedClasses.scala
   </pre>

2. **Build dependencies** (see [**`build.gradle`**](https://github.com/flix/flix/blob/master/build.gradle))

   All build dependencies are currently outdated.
   
   A quick modification shows that only two external libraries require the [Flix] code to be updated, namely [**`json4s`**][json4s] and [**`scalatest/scalactic`**][scalatest].

   Current dependencies:
   <pre style="font-size:80%;">
   <b>dependencies</b> {
     <span style="color:green;">// ...</span>
     <b>implementation files</b>('lib/org.java_websocket-1.3.9.jar')
     <b>implementation files</b>('lib/org.jline-3.5.1.jar')
     <b>implementation files</b>('lib/org.json4s-ast-3.5.5.jar')
     <b>implementation files</b>('lib/org.json4s-core-3.5.5.jar')
     <b>implementation files</b>('lib/org.json4s-native-3.5.5.jar')
     <b>implementation files</b>('lib/org.objectweb.asm-9.2.jar')
     <b>implementation files</b>('lib/org.parboiled-2.2.1.jar')
     <b>implementation files</b>('lib/org.scalactic-3.0.8.jar')
     <b>implementation files</b>('lib/org.scalatest-3.0.8.jar')
     <b>implementation files</b>('lib/scala.collection.parallel-0.2.0.jar')
     <b>implementation files</b>('lib/scala.xml-1.2.0.jar')
     <b>implementation files</b>('lib/scopt_2.13-4.0.1.jar')
     <b>implementation files</b>('lib/shapeless-2.3.3.jar')
   }
   </pre>
  
   Updated dependencies:
   <pre style="font-size:80%;">
   <b>dependencies</b> {
     <span style="color:green;">// ...</span>
     <b>implementation files</b>('lib/Java-WebSocket-1.5.3.jar')
     <b>implementation files</b>('lib/jline-3.21.0.jar')
     <b>implementation files</b>('lib/org.json4s-ast-3.5.5.jar')    <span style="color:green;">// unchanged</span>
     <b>implementation files</b>('lib/org.json4s-core-3.5.5.jar')   <span style="color:green;">// unchanged</span>
     <b>implementation files</b>('lib/org.json4s-native-3.5.5.jar') <span style="color:green;">// unchanged</span>
     <b>implementation files</b>('lib/asm-9.3.jar') 
     <b>implementation files</b>('lib/parboiled_2.13-2.4.0.jar')
     <b>implementation files</b>('lib/org.scalactic-3.0.8.jar')     <span style="color:green;">// unchanged</span>
     <b>implementation files</b>('lib/org.scalatest-3.0.8.jar')     <span style="color:green;">// unchanged</span>
     <b>implementation files</b>('lib/scala-parallel-collections_2.13-1.0.4.jar')
     <b>implementation files</b>('lib/scala-xml_2.13-2.1.0.jar')
     <b>implementation files</b>('lib/scopt_2.13-4.1.0.jar')
     <b>implementation files</b>('lib/shapeless_2.13-2.3.10.jar')
   }
   </pre>

3. *(to be completed)*

<!--=======================================================================-->
 
## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> Console output of **`gradle test`** [↩](#anchor_01)

<dl><dd>
We observe the nice <a href="https://en.wikipedia.org/wiki/Code_coverage"><i>code coverage</i></a> ot the Flix test suite :
<pre style="font-size:80%;">
&gt; Task :compileJava NO-SOURCE
&gt; Task :compileScala UP-TO-DATE
&gt; Task :processResources NO-SOURCE
&gt; Task :classes UP-TO-DATE
&gt; Task :compileTestJava NO-SOURCE
&gt; Task :compileTestScala UP-TO-DATE
&gt; Task :processTestResources NO-SOURCE
&gt; Task :testClasses UP-TO-DATE
&nbsp;
&gt; Task :testAll
Run starting. Expected test count is: 1267
<b>CompilerSuite:</b>
- Test.Currying.flix
- Test.Dec.Class.flix
  [...(176 more tests)...]
<b>ExperimentalSuite:</b>
<b>ExampleSuite:</b>
- algebraic-data-types-and-pattern-matching.flix
- an-interpreter-for-a-trivial-expression-language.flix
  [...(56 more tests)...]
<b>TestEntryPoint:</b>
- Test.IllegalEntryPointArg.Main.01
- Test.IllegalEntryPointArg.Main.02
  [...(14 more tests)...]
<b>TestInstances:</b>
- Test.OverlappingInstance.01
- Test.OverlappingInstance.02
  [...(41 more tests)...]
<b>TestKinder:</b>
- MismatchedTypeParamKind.Implicit.01
- MismatchedTypeParamKind.Implicit.02
  [...]
<b>TestNamer:</b>
- AmbiguousVarOrUse.01
- AmbiguousVarOrUse.02
  [...]
<b>TestParser:</b>
- ParseError.Int.01
- ParseError.Int.02
  [...]
<b>TestPatExhaustiveness:</b>
- Pattern.Literal.Char.01
- Pattern.Literal.Int32.01
  [...]
<b>TestRedundancy:</b>
- HiddenVarSym.Let.01
- HiddenVarSym.Lambda.01
  [...]
<b>TestRegions:</b>
- RegionVarEscapes.01
- RegionVarEscapes.02
<b>TestResolver:</b>
- AmbiguousTag.01
- AmbiguousTag.02
  [...]
<b>TestSafety:</b>
- NonPositivelyBoundVariable.01
- NonPositivelyBoundVariable.02
  [...]
<b>TestStratifier:</b>
- Stratification.01
- Stratification.02
  [...]
<b>TestTyper:</b>
- TestLeq01
- TestLeq02
  [...]
<b>TestWeeder:</b>
- DuplicateAnnotation.01
- DuplicateFormal.01
  [...]
<b>TestBoolFormulaTable:</b>
- Minimize.True.01
- Minimize.True.02
  [...]
<b>TestIncremental:</b>
- Incremental.01
- Incremental.02
  [...]
<b>TestSetUnification:</b>
- Test.SetUnification.01
- Test.SetUnification.02
  [...]
<b>TestUnification:</b>
- Substitution.Empty.01
- Substitution.Empty.02
  [...(53 more tests)]
<b>TestFlixErrors:</b>
- HoleError.01
- HoleError.02
<b>TestFormatType:</b>
- FormatType.Type.Record.External.01
- FormatType.Record.External.02
  [...(43 more tests)]
<b>LibrarySuite:</b>
- TestApplicative.flix
- TestArray.flix
  [...(59 more tests)]
<b>TestPackager:</b>
- init
- check
  [...(10 more tests)]
<b>TestGraph:</b>
- topSort.Cycle.01
- topSort.Cycle.02
  [...(5 more tests)]
<b>TestResult:</b>
- get01
- get02
  [...(13 more tests)]
<b>TestValidation:</b>
- map01
- map02
  [...(13 more tests)]
<b>TestMain:</b>
- init
- build
   [...(27 more tests]]
<b>TestTutorials:</b>
- interpreter.flix
- introduction.flix
- lambda-calculus.flix
Run completed in 6 minutes, 40 seconds.
Total number of tests run: 1267
Suites: completed 34, aborted 0
Tests: succeeded 1267, failed 0, canceled 0, ignored 0, pending 0
All tests passed.
&nbsp;
&gt; Task :test
&nbsp;
BUILD SUCCESSFUL in 6m 44s
4 actionable tasks: 2 executed, 2 up-to-date
</pre>
</dd></dl>


***

*[mics](https://lampwww.epfl.ch/~michelou/)/October 2022* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- href links -->

[flix]: https://flix.dev/
[flix_github]: https://github.com/flix/flix
[flix_nightly]: https://flix.dev/nightly/
[gradle_userguide]: https://docs.gradle.org/current/userguide/userguide.html
[json4s]: https://mvnrepository.com/artifact/org.json4s
[scala_2_13_9]: https://www.scala-lang.org/download/2.13.9.html
[scala_3]: https://docs.scala-lang.org/scala3/new-in-scala3.html
[scalatest]: https://mvnrepository.com/artifact/org.scalatest/scalatest
