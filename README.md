# <span id="top">Playing with Flix on Windows</span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 8px 0 0;min-width:25%;"><a href="https://flix.dev/" rel="external"><img src="./docs/images/flix-logo.png" width="160" alt="Flix project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">This repository gathers <a href="https://flix.dev/" rel="external">Flix</a> code examples coming from various websites and books.<br/>
  It also includes several <a href="https://en.wikibooks.org/wiki/Windows_Batch_Scripting" rel="external">batch files</a> for experimenting with <a href="https://flix.dev/" rel="external">Flix</a> on a Windows machine.
  </td>
  </tr>
</table>

> **Hint**: Read the document <a href="https://github.com/flix/flix/blob/master/docs/DIDYOUKNOW.md">"Did You Know?"</a> from the <a href="https://flix.dev/" rel="external">Flix</a> documentation to know more about the <a href="https://flix.dev/" rel="external">Flix</a> ecosystem.

[Ada][ada_examples], [Akka][akka_examples], [C++][cpp_examples], [Deno][deno_examples], [GraalVM][graalvm_examples], [Haskell][haskell_examples], [Kotlin][kotlin_examples], [LLVM][llvm_examples], [Node.js][nodejs_examples], [Rust][rust_examples], [Scala 3][scala3_examples], [Spark][spark_examples], [Spring][spring_examples], [TruffleSqueak][trufflesqueak_examples] and [WiX][wix_examples] are other topics we are continuously monitoring.

## <span id="proj_deps">Project dependencies</span>

This project depends on the following external software for the **Microsoft Windows** platform:

- [Flix 0.31][flix_downloads] ([*release notes*][flix_relnotes])
- [Git 2.37][git_downloads] ([*release notes*][git_relnotes])
- [Temurin OpenJDK 11 LTS][temurin_opendjk11] ([*release notes*][temurin_opendjk11_relnotes], [*bug fixes*][temurin_opendjk11_bugfixes])

Optionally one may also install the following software:

- [Flix nightly builds](https://flix.dev/nightly/)
- [Gradle 7.5][gradle_install] ([requires Java 8 or newer][gradle_compatibility]) ([*release notes*][gradle_relnotes])
- [Scala 2.13][scala_download] ([*release notes*][scala_relnotes])

For instance our development environment looks as follows (*September 2022*) <sup id="anchor_01">[1](#footnote_01)</sup>:

<pre style="font-size:80%;">
C:\opt\flix-0.31.0\             <i>( 35 MB)</i>
C:\opt\Git-2.37.3\              <i>(289 MB)</i>
C:\opt\gralde-7.5.1\            <i>(127 MB)</i>
C:\opt\jdk-temurin-11.0.16_8\   <i>(301 MB)</i>
C:\opt\scala-2.13.9\            <i>( 24 MB)</i>
</pre>

## <span id="structure">Directory structure</span>

This project is organized as follows:

<pre style="font-size:80%;">
docs\
examples\{<a href="./examples/README.md">README.md</a>, <a href="./examples/areas/">areas</a>, <a href="./examples/channels/">channels</a>, ..}
<a href="BUILD.md">BUILD.md</a>
<a href="DEPS.md">DEPS.md</a>
<a href="QUICKREF.md">QUICKREF.md</a>
README.md
<a href="RESOURCES.md">RESOURCES.md</a>
<a href="setenv.bat">setenv.bat</a>
</pre>

where

- directory [**`docs\`**](docs/) contains [Flix] related papers/articles.
- directory [**`examples\`**](examples/) contains [Flix] code examples.
- file [**`BUILD.md`**](BUILD.md) presents the [Flix] build.
- file [**`DEPS.md`**](DEPS.md) lists library dependencies of published [Flix] distributions.
- file [**`QUICKREF.md`**](QUICKREF.md) gathers [Flix] language features.
- file [**`README.md`**](README.md) is the [Markdown][github_markdown] document for this page.
- file [**`RESOURCES.md`**](RESOURCES.md) gathers [Flix] related documents.
- file [**`setenv.bat`**](setenv.bat) is the batch script for setting up our environment.

## <span id="commands">Batch commands</span>

We distinguish different sets of batch commands:

1. [**`setenv.bat`**](setenv.bat) - This batch command makes external tools such as [**`git.exe`**][git_userguide] and [**`gradle.bat`**][gradle_cli] directly available from the command prompt (see section [**Project dependencies**](#proj_deps)).

   <pre style="font-size:80%;">
   <b>&gt; <a href="./setenv.bat">setenv</a> help</b>
   Usage: setenv { &lt;option&gt; | &lt;subcommand&gt; }
   &nbsp;
     Options:
       -debug      show commands executed by this script
       -verbose    display environment settings
   &nbsp;
     Subcommands:
       help        display this help message
   </pre>

2. [**`examples\*\build.bat`**](examples/areas/build.bat) - Each example can be built/run using the [**`build`**](examples/areas/build.bat) command.<br/>

    <pre style="font-size:80%;">
    <b>&gt; <a href="examples/Factorial/build.bat">build</a></b>
    Usage: build { &lt;option&gt; | &lt;subcommand&gt; }
    &nbsp;
    Options:
      -debug      show commands executed by this script
      -nightly    use Flix nightly build if locally available
      -verbose    display progress messages
    &nbsp;
    Subcommands:
      clean       delete generated files
      compile     generate program executable
      help        display this help message
      run         execute the generated program
    </pre>

## <span id="usage">Usage examples</span>

### `setenv.bat`

Command [**`setenv`**](setenv.bat) is executed once to setup our development environment; it makes external tools such as [**`git.exe`**][git_userguide] directly available from the command prompt:

<pre style="font-size:80%;">
<b>&gt; <a href="setenv.bat">setenv</a></b>
Tool versions:
   java 11.0.16, javac 11.0.16, scalac 2.13.9, flix v0.31.0
   git 2.37.3.windows.1, diff 3.8, gradle 7.5.1

<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/where_1">where</a> git gradle</b>
C:\opt\Git-2.37.3\bin\git.exe
C:\opt\Git-2.37.3\mingw64\bin\git.exe
C:\opt\gradle-7.5.1\bin\gradle
C:\opt\gradle-7.5.1\bin\gradle.bat
</pre>

Command [**`setenv -verbose`**](setenv.bat) also displays the tool paths and defined variables:

<pre style="font-size:80%;">
<b>&gt; <a href="setenv.bat">setenv</a> -verbose</b>
Tool versions:
   java 11.0.16, javac 11.0.16, scalac 2.13.9, flix v0.31.0
   git 2.37.3.windows.1, diff 3.8, gradle 7.5.1
Tool paths:
   C:\opt\jdk-temurin-11.0.16_8\bin\java.exe
   C:\opt\jdk-temurin-11.0.16_8\bin\javac.exe
   C:\opt\scala-2.13.9\bin\scalac.bat
   C:\opt\Git-2.37.3\bin\git.exe
   C:\opt\Git-2.37.3\mingw64\bin\git.exe
   C:\opt\Git-2.37.3\usr\bin\diff.exe
   C:\opt\gradle-7.5.1\bin\gradle.bat
Environment variables:
   "FLIX_HOME=C:\opt\flix-0.31.0"
   "GIT_HOME=C:\opt\Git-2.37.3"
   "GRADLE_HOME=C:\opt\gradle-7.5.1"
   "JAVA_HOME=C:\opt\jdk-temurin-11.0.16_8"
   "SCALA_HOME=C:\opt\scala-2.13.9"
Path associations:
   F:\: => %USERPROFILE%\workspace-perso\flix-examples
</pre>

<!--=======================================================================-->

## <span id="footnotes">Footnotes</span>[**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Downloads*** [↩](#anchor_01)

<dl><dd>
In our case we downloaded the following installation files (see <a href="#proj_deps">section 1</a>):
</dd>
<dd>
<pre style="font-size:80%;">
<a href="https://github.com/flix/flix/releases/" rel="external">flix.jar</a>                          <i>( 35 MB)</i>
<a href="https://flix.dev/nightly/" rel="external">flix-2022-09-23.jar</a>               <i>( 35 MB)</i>
<a href="https://gradle.org/install/">gradle-7.5.1-bin.zip</a>              <i>(103 MB)</i>
<a href="https://git-scm.com/download/win" rel="external">PortableGit-2.37.3-64-bit.7z.exe</a>  <i>( 41 MB)</i>
<a href="https://www.scala-lang.org/files/archive/">scala-2.13.9.zip</a>                  <i>( 22 MB)</i>
</pre>
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/September 2022* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[ada_examples]: https://github.com/michelou/ada-examples
[akka_examples]: https://github.com/michelou/akka-examples
[cpp_examples]: https://github.com/michelou/cpp-examples
[deno_examples]: https://github.com/michelou/deno-examples
[diff_cli]: https://www.gnu.org/software/diffutils/manual/html_node/Invoking-diff.html
[git_cli]: https://git-scm.com/docs/git
[git_downloads]: https://git-scm.com/download/win
[git_exe]: https://git-scm.com/docs/git
[git_relnotes]: https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.37.3.txt
[github_markdown]: https://github.github.com/gfm/
[git_userguide]: https://git-scm.com/docs/git
[flix]: https://flix.dev/
[flix_downloads]: https://github.com/flix/flix/releases/
[flix_relnotes]: https://github.com/flix/flix/releases/tag/v0.31.0
[graalvm_examples]: https://github.com/michelou/graalvm-examples
[gradle_cli]: https://docs.gradle.org/current/userguide/command_line_interface.html
[gradle_compatibility]: https://docs.gradle.org/current/release-notes.html#upgrade-instructions
[gradle_install]: https://gradle.org/install/
[gradle_relnotes]: https://docs.gradle.org/7.5.1/release-notes.html
[haskell_examples]: https://github.com/michelou/haskell-examples
[kotlin_examples]: https://github.com/michelou/kotlin-examples
[llvm_examples]: https://github.com/michelou/llvm-examples
[nodejs_examples]: https://github.com/michelou/nodejs-examples
[rust_examples]: https://github.com/michelou/rust-examples
[scala_download]: https://www.scala-lang.org/download/2.13.9.html
[scala_relnotes]: https://github.com/scala/scala/releases/tag/v2.13.9
[scala3_examples]: https://github.com/michelou/dotty-examples
[spark_examples]: https://github.com/michelou/spark-examples
[spring_examples]: https://github.com/michelou/spring-examples
[temurin_opendjk11_bugfixes]: https://www.oracle.com/java/technologies/javase/11-0-16-bugfixes.html
[temurin_opendjk11_relnotes]: https://mail.openjdk.org/pipermail/jdk-updates-dev/2022-July/016017.html
[temurin_opendjk11]: https://adoptium.net/releases.html?variant=openjdk11&jvmVariant=hotspot
[trufflesqueak_examples]: https://github.com/michelou/trufflesqueak-examples
[wix_examples]: https://github.com/michelou/wix-examples
