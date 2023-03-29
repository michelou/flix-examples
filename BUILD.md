# <span id="top">Building Flix on Windows</span> <span style="size:25%;"><a href="README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;;min-width:120px;"><a href="https://flix.dev/" rel="external"><img src="./docs/images/flix-logo.png" width="120" alt="Flix project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">Source code of the <a href="https://flix.dev/" rel="external">Flix project</a> is hosted on <a href="https://github.com/flix/flix" rel="external">Github</a>.<br/>Continuous integration relies on <a href="https://gradle.org/" rel="external">Gradle</a> and runs on the runner image <a href="https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners#supported-runners-and-hardware-resources" rel="external"><code>ubuntu-latest</code></a>.
  </td>
  </tr>
</table>

> **:mag_right:** Generating the [Flix library][flix_releases] using [Gradle][gradle_userguide] is fast and simple ! We find a few examples of [Gradle][gradle_cli] commands in the GitHub Actions file [**`build.yaml`**](https://github.com/flix/flix/blob/master/.github/workflows/build.yaml), i.e. `clean`, `compileTestScala` and `test`.
>

## <span id="build_tools">Build Tools</span>

Currently we can build/run/test the [Flix library][flix_releases] in three different ways :

| Build tool          | Configuration file     | Environment(s) |
|---------------------|------------------------|----------------|
| [**`build.bat`**](bin/flix/build.bat) | &nbsp; | MS Windows |
| [**`build.sh`**](bin/flix/build.sh) | &nbsp; | Cygwin / MSYS2 |
[**`gradle.exe`**][gradle_cli] | [**`build.gradle`**](flix/build.gradle) | Any <sup><b>a)</b></sup> |
<div style="margin:0 15% 0 8px;font-size:90%;">
<sup><b>a)</b></sup> Here "Any" means "tested on MS Windows / Cygwin / MSYS2 / Unix".<br/>&nbsp;
</div>

> **&#9755;** Unlike other [Flix contributors](https://flix.dev/contribute/) who work exclusively with [**`build.gradle`**](flix/build.gradle) we also run our own batch/bash scripts which give us more control over the build process i.e. when dealing with misbehaviors and potential bugs.
<!--
https://docs.gradle.org/current/userguide/scala_plugin.html
-->

### <span id="batch">Batch file</span>

Command [**`build.bat run`**](./bin/flix/build.bat) generates the [fat jar](https://stackoverflow.com/questions/11947037/what-is-an-uber-jar) file **`build\libs\flix.jar`** and executes it with argument **`--version`** :

<pre style="font-size:80%;">
<b>&gt; <a href="bin/flix/build.bat">build</a> -verbose run</b>
Compile 1 Java source file to directory "build\classes"
Compile 253 Scala source files to directory "build\classes"
Create Java archive "build\libs\flix.jar"
Update archive "build\libs\flix.jar" (Flix sources)
Update archive "build\libs\flix.jar" ("C:\opt\scala-2.13.5\lib\scala-library.jar")
Update archive "build\libs\flix.jar" ("C:\opt\scala-2.13.5\lib\scala-reflect.jar")
Update archive "build\libs\flix.jar" ("lib\<a href="https://mvnrepository.com/artifact/org.java-websocket/Java-WebSocket/1.3.9" rel="external">org.java_websocket-1.3.9.jar</a>")
Update archive "build\libs\flix.jar" ("lib\<a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1" rel="external">org.jline-3.5.1.jar</a>")
Update archive "build\libs\flix.jar" ("lib\<a href="https://mvnrepository.com/artifact/org.json4s/json4s-ast_2.13/3.5.5" rel="external">org.json4s-ast-3.5.5.jar</a>")
Update archive "build\libs\flix.jar" ("lib\<a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.5.5" rel="external">org.json4s-core-3.5.5.jar</a>")
Update archive "build\libs\flix.jar" ("lib\<a href="https://mvnrepository.com/artifact/org.json4s/json4s-native_2.13/3.5.5" rel="external">org.json4s-native-3.5.5.jar</a>")
Update archive "build\libs\flix.jar" ("lib\<a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2" rel="external">org.objectweb.asm-9.2.jar</a>")
Update archive "build\libs\flix.jar" ("lib\<a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.2.1" rel="external">org.parboiled-2.2.1.jar</a>")
Update archive "build\libs\flix.jar" ("lib\<a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.0.8" rel="external">org.scalactic-3.0.8.jar</a>")
Update archive "build\libs\flix.jar" ("lib\<a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.0.8" rel="external">org.scalatest-3.0.8.jar</a>")
Update archive "build\libs\flix.jar" ("lib\<a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">scala.collection.parallel-0.2.0.jar</a>")
Update archive "build\libs\flix.jar" ("lib\<a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/1.2.0" rel="external">scala.xml-1.2.0.jar</a>")
Update archive "build\libs\flix.jar" ("lib\<a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/4.0.1" rel="external">scopt_2.13-4.0.1.jar</a>")
Update archive "build\libs\flix.jar" ("lib\<a href="https://mvnrepository.com/artifact/com.chuusai/shapeless_2.13/2.3.3" rel="external">shapeless-2.3.3.jar</a>")
Add manifest to archive "build\libs\flix.jar"
Execute program file "build\libs\flix.jar" with arguments --version
The Flix Programming Language v0.34.0
</pre>

### <span id="gradle">Gradle</span>

Command [**`gradle.bat test`**][gradle_cli] runs the test suite (e.g. after updating some source files of our local copy of the [Flix Github repository][flix_github]) :

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.gradle.org/current/userguide/command_line_interface.html" rel="external">gradle</a> test <a href="https://docs.gradle.org/current/userguide/command_line_interface.html#sec:command_line_customizing_log_format" rel="external">--console=plain</a></b>
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

Command [**`gradle jar`**][gradle_cli] <sup id="anchor_02">[2](#footnote_01)</sup> generates the [Flix] Java archive :
<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.gradle.org/current/userguide/command_line_interface.html" rel="external">gradle</a> jar</b>

BUILD SUCCESSFUL in 3m 7s
2 actionable tasks: 2 executed

<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/where" rel="external">where</a> /r . flix*.jar</b>
F:\flix\build\libs\flix.jar
</pre>

> **:mag_right:** The [Flix] library generated **locally** on September 19th 2022, is indeed the same as the corresponding [Flix nightly build][flix_nightly] :
> <pre style="font-size:80%;">
> <b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/where" rel="external">where</a> /t "%FLIX_HOME%:*.jar" build\libs:*.jar</b>
>   36614213   19.09.2022      20:26:29  c:\opt\flix-0.31.0\flix-2022-09-19.jar
>   36594654   17.09.2022      14:20:22  c:\opt\flix-0.31.0\flix.jar
>   36614213   19.09.2022      23:00:34  F:\flix\build\libs\flix.jar
> </pre>

<!--=======================================================================-->
 
## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Console output of command*** **`gradle test`** [↩](#anchor_01)

<dl><dd>
We observe the extensive <a href="https://en.wikipedia.org/wiki/Code_coverage" rel="external"><i>code coverage</i></a> ot the <a href="https://flix.dev/" rel="external">Flix</a> test suite :
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

<span id="footnote_02">[2]</span> ***Gradle `compileClasspath`*** [↩](#anchor_02)

<dl><dd>
We can add a <a href="https://docs.gradle.org/current/dsl/org.gradle.api.Task.html">Gradle task</a> "<code>debug</code>" to the file <a href="flix/build.gradle"><code>build.gradle</code></a> to display the compile classpath :
<pre style="font-size:80%;">
<span style="color:green;">// Adapted from
// https://discuss.gradle.org/t/gradle-cannot-infer-scala-class-path-despite-the-scala-library-being-declared-as-a-compile-dependency/7388/5</span>
<b>task debug</b> {
    println configurations.compileClasspath.findAll { it.name.endsWith(".jar") }
}
</pre>

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.gradle.org/current/userguide/command_line_interface.html" rel="external">gradle</a> debug</b>
&nbsp;
> Configure project :
[F:\flix\lib\org.java_websocket-1.3.9.jar, F:\flix\lib\org.jline-3.5.1.jar, F:\flix\lib\org.json4s-ast-3.5.5.jar, F:\flix\lib\org.json4s-core-3.5.5.jar, F:\flix\lib\org.json4s-native-3.5.5.jar, F:\flix\lib\org.objectweb.asm-9.2.jar, F:\flix\lib\org.parboiled-2.2.1.jar, F:\flix\lib\org.scalactic-3.0.8.jar, F:\flix\lib\org.scalatest-3.0.8.jar, F:\flix\lib\scala.collection.parallel-0.2.0.jar, F:\flix\lib\scala.xml-1.2.0.jar, F:\flix\lib\scopt_2.13-4.0.1.jar, F:\flix\lib\shapeless-2.3.3.jar, %USERPROFILE%\.gradle\caches\modules-2\files-2.1\org.scala-lang\scala-reflect\2.13.5\8dee4d8c5374920f2db2f5f55d9dd6ecd4194cc\scala-reflect-2.13.5.jar, %USERPROFILE%\.gradle\caches\modules-2\files-2.1\org.scala-lang\scala-library\2.13.5\d0df6e78b6ccb0102cb0395bfa8cb806e9e81b61\scala-library-2.13.5.jar]
&nbsp;
BUILD SUCCESSFUL in 2s
</pre>
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/April 2023* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- href links -->

[flix]: https://flix.dev/
[flix_github]: https://github.com/flix/flix
[flix_releases]: https://github.com/flix/flix/releases
[flix_nightly]: https://flix.dev/nightly/
[gradle_cli]: https://docs.gradle.org/current/userguide/command_line_interface.html
[gradle_userguide]: https://docs.gradle.org/current/userguide/userguide.html
[json4s]: https://mvnrepository.com/artifact/org.json4s
[scala]: https://www.scala-lang.org
[scala_2_13_9]: https://www.scala-lang.org/download/2.13.9.html
[scala_3]: https://docs.scala-lang.org/scala3/new-in-scala3.html
[scalatest]: https://mvnrepository.com/artifact/org.scalatest/scalatest
