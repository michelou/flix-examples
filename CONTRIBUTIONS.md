# <span id="top">Contributions to the Flix project</span> <span style="size:25%;"><a href="README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:60px;max-width:100px;">
    <a href="https://flix.dev/" rel="external"><img style="border:0;width:80px;" src="./docs/images/flix-logo.png" alt="Flix project" /></a>
  </td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    This document presents ongoing works, pull requests and issues we have submitted so far to the <a href="https://flix.dev/" rel="external">Flix</a> project.<br/>&nbsp;
  </td>
  </tr>
</table>

## <span id="issues">Reported Issues</span>

*none*

## <span id="pull_requests">Pull Requests</span>

| Id     | Opened | Closed | Description | Action |
|:-------|:-------|:-------|:------------|:------|
| [#4896](https://github.com/flix/flix/pull/4896) | 14.11.2022 | 14.11.2022 | chore: update Scala 2 version | Reverted by [#4916](https://github.com/flix/flix/pull/4916) |

## <span id="wip">Work in Progress</span> [**&#x25B4;**](#top)

This section presents some of our unpublished works to improve the [Flix] software.

1. <del>**Supported Scala 2 version**</del> *(obsolete since October 7th 2022)*
   
   > **Note:** [Commit 61d7e00](https://github.com/flix/flix/commit/61d7e00) from Magnus makes this local change obsolete.

   [Flix] is currently built upon Scala 2.13.5 (see [**`build.gradle`**](https://github.com/flix/flix/blob/master/build.gradle)). Moving to current [Scala 2.13.9][scala_2_13_9] requires to rename all occurences of **`enum`** to **`enum0`** (i.e. parameter names), **`enumSym`** (i.e. case classes) or **`enumDecl`** (i.e. local vars). The reason is straightforward: the latest Scala 2 distributions now defines **`enum`** as a reserved keyword in order to ease the migration to [Scala 3][scala_3].
   
   Concretely we have updated the following [Scala] source files in directory **`main\src\ca\uwaterloo\flix\`**:

   <pre style="font-size:80%;">
   api/lsp/<a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/lsp/LocationLink.scala#L56">LocationLink.scala</a>
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

2. **Build dependencies**

   Build dependencies are defined in [**`build.gradle`**](https://github.com/flix/flix/blob/master/build.gradle) and are currently outdated (October 2022).
   
   A quick modification shows that only two external libraries require the [Flix] source code to be updated, namely [**`json4s`**][json4s] and [**`scalatest/scalactic`**][scalatest].

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
     <b>implementation files</b>('lib/<a href="https://mvnrepository.com/artifact/org.java-websocket/Java-WebSocket/1.5.3">org.java_websocket-1.5.3.jar</a>')
     <b>implementation files</b>('lib/<a href="https://mvnrepository.com/artifact/org.jline/jline/3.21.0">org.jline-3.21.0.jar</a>')
     <b>implementation files</b>('lib/org.json4s-ast-3.5.5.jar')    <span style="color:green;">// unchanged</span>
     <b>implementation files</b>('lib/org.json4s-core-3.5.5.jar')   <span style="color:green;">// unchanged</span>
     <b>implementation files</b>('lib/org.json4s-native-3.5.5.jar') <span style="color:green;">// unchanged</span>
     <b>implementation files</b>('lib/<a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.4" rel="external">org.objectweb.asm-9.4.jar</a>') 
     <b>implementation files</b>('lib/<a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.4.1" rel="external">org.parboiled_2.13-2.4.1.jar</a>')
     <b>implementation files</b>('lib/org.scalactic-3.0.8.jar')     <span style="color:green;">// unchanged</span>
     <b>implementation files</b>('lib/org.scalatest-3.0.8.jar')     <span style="color:green;">// unchanged</span>
     <b>implementation files</b>('lib/<a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/1.0.4" rel="external">scala-parallel-collections_2.13-1.0.4.jar</a>')
     <b>implementation files</b>('lib/<a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/2.1.0">scala-xml_2.13-2.1.0.jar</a>')
     <b>implementation files</b>('lib/<a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/4.1.0">scopt_2.13-4.1.0.jar</a>')
     <b>implementation files</b>('lib/<a href="https://mvnrepository.com/artifact/com.chuusai/shapeless_2.13/2.3.10">shapeless_2.13-2.3.10.jar</a>')
   }
   </pre>

3. Major issue with build times

   | Scala&nbsp;Version | Build&nbsp;Times             | Average |
   |--------------------|------------------------------|---------|
   | 2.13.5 (*current*) | 1:52, 1:53, 1:56, 1:52, 1:55, 1:58, 1:55 |   1:54  |
   | 2.13.6             | 7:52, 7:40, 7:53             |   7:46  |
   | 2.13.7             | 7:37, 6:52, 7:07             |   7:00  |
   | 2.13.8             | 7:49 | 7:49 |
   | 2.13.9             | 7:23 | 7:23 |
   | 2.13.10            | 7:31 | 7:31 |

   **Workaround 1 (*provisory*)** Disable pattern matching analysis by writing `"-Xno-patmat-analysis"` instead of `"-Ypatmat-exhaust-depth", "400"` in build file [`build.gradle`](https://github.com/flix/flix/blob/master/build.gradle).

<!--
   <pre style="font-size:80%;">
   Search "XnoPatmatAnalysis" (6 hits in 3 files of 325 searched)
   X:\scala-2.13.10\src\compiler\scala\tools\nsc\settings\ScalaSettings.scala (1 hit)
	 Line 140:   val XnoPatmatAnalysis = BooleanSetting ("-Xno-patmat-analysis", "Don't perform exhaustivity/unreachability analysis. Also, ignore @switch annotation.")
   X:\scala-2.13.10\src\compiler\scala\tools\nsc\transform\patmat\MatchTranslation.scala (3 hits)
	 Line 193:       if (!settings.XnoPatmatAnalysis.value) checkMatchVariablePatterns(nonSyntheticCases)
	 Line 232:         if (!settings.XnoPatmatAnalysis.value) unreachableTypeSwitchCase(caseDefs).foreach(cd => reportUnreachable(cd.body.pos))
	 Line 258:             if (settings.XnoPatmatAnalysis.value) Suppression.FullSuppression
   X:\scala-2.13.10\src\compiler\scala\tools\nsc\transform\patmat\MatchTreeMaking.scala (2 hits)
	 Line 617:       if (settings.XnoPatmatAnalysis.value) Suppression.FullSuppression
	 Line 631:       if (settings.XnoPatmatAnalysis.value) false
   Search "-Xno-patmat-analysis" (1 hit in 1 file of 325 searched)
   X:\scala-2.13.10\src\compiler\scala\tools\nsc\settings\ScalaSettings.scala (1 hit)
	 Line 140:   val XnoPatmatAnalysis = BooleanSetting ("-Xno-patmat-analysis", "Don't perform exhaustivity/unreachability analysis. Also, ignore @switch annotation.")
   Search "-Xno-patmat-analysis" (0 hits in 0 files of 11 searched)
</pre>
-->

<!--=======================================================================-->

<!--
## <span id="footnotes">Footnotes</span>

<sup id="anchor_01">[1](#footnote_01)</sup>

<span id="footnote_01">[1]</span> ***Batch files*** [↩](#anchor_01)

<dl><dd>
</dd></dl>
-->

***

*[mics](https://lampwww.epfl.ch/~michelou/)/April 2023* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

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
