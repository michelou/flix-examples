# <span id="top">Playing with Flix on Windows</span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 8px 0 0;min-width:25%;">
    <a href="https://flix.dev/" rel="external"><img src="./docs/images/flix-logo.png" width="160" alt="Flix project"/></a>
  </td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    This repository gathers <a href="https://flix.dev/" rel="external">Flix</a> code examples coming from various websites.<br/>
    It also includes several build scripts (<a href="https://ant.apache.org/manual/using.html" rel="external">Ant files</a>, <a href="https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_01.html" rel="external">Bash scripts</a>, <a href="https://en.wikibooks.org/wiki/Windows_Batch_Scripting" rel="external">batch files</a>, <a href="https://docs.gradle.org/current/userguide/tutorial_using_tasks.html" rel="external">Gradle scripts</a>, <a href="https://makefiletutorial.com/" rel="external">Make scripts</a>) for experimenting with <a href="https://flix.dev/" rel="external">Flix</a> on a Windows machine.
  </td>
  </tr>
</table>

[Ada][ada_examples], [Akka][akka_examples], [C++][cpp_examples], [COBOL][cobol_examples], [Dafny][dafny_examples], [Dart][dart_examples], [Deno][deno_examples], [Docker][docker_examples], [Erlang][erlang_examples], [Go][golang_examples], [GraalVM][graalvm_examples], [Haskell][haskell_examples], [Kafka][kafka_examples], [Kotlin][kotlin_examples], [LLVM][llvm_examples], [Modula-2][m2_examples], [Node.js][nodejs_examples], [Rust][rust_examples], [Scala 3][scala3_examples], [Spark][spark_examples], [Spring][spring_examples], [Standard ML][sml_examples], [TruffleSqueak][trufflesqueak_examples], [WiX Toolset][wix_examples] and [Zig][zig_examples] are other topics we are continuously monitoring.

> **&#9755;** Read the document <a href="https://github.com/flix/flix/blob/master/docs/DIDYOUKNOW.md">"Did You Know?"</a> from the <a href="https://flix.dev/" rel="external">Flix</a> documentation to know more about the <a href="https://flix.dev/" rel="external">Flix</a> ecosystem.

## <span id="proj_deps">Project dependencies</span>

This project depends on the following external software for the **Microsoft Windows** platform:

- [Apache Maven 3.9][apache_maven] ([requires Java 8+][apache_maven_history])  ([*release notes*][apache_maven_relnotes])
- [Flix 0.55][flix_downloads] ([requires Java 21+][flix_compatibility])  ([*release notes*][flix_relnotes])
- [Git 2.47][git_downloads] ([*release notes*][git_relnotes])
- [Gradle 8.12][gradle_install] ([requires Java 8+][gradle_compatibility]) ([*release notes*][gradle_relnotes])
- [Temurin OpenJDK 21 LTS][temurin_openjdk21] ([*release notes*][temurin_openjdk21_relnotes], [*Shipilev's notes*][temurin_openjdk21_shipilev], [*Java 21 API*][oracle_openjdk21_api])
<!--
- [Temurin OpenJDK 11 LTS][temurin_openjdk11] ([*release notes*][temurin_openjdk11_relnotes], [*Shipilev's notes*][temurin_openjdk11_shipilev], [*bug fixes*][temurin_openjdk11_bugfixes])
-->

Optionally one may also install the following software:

- [Apache Ant 1.10][apache_ant] (requires Java 8) ([*release notes*][apache_ant_relnotes])
- [ConEmu 2023][conemu_downloads] ([*release notes*][conemu_relnotes])
- [Flix nightly builds](https://flix.dev/nightly/) <sup id="anchor_01">[1](#footnote_01)</sup>
- [mdBook 0.4][mdbook_download] <sup id="anchor_02">[2](#footnote_02)</sup> ([*changelog*][mdbook_changelog])
- [MSYS2 2024][msys2_releases] ([*change log*][msys2_changelog])
- [Scala 2.13][scala_download] ([*release notes*][scala_relnotes])
- [Temurin JDK Mission Control 9.0][jmc_download] <sup id="anchor_03">[3](#footnote_03)</sup> ([*release notes*][jmc_relnotes])
- [Visual Studio Code 1.96][vscode_downloads] ([*release notes*][vscode_relnotes])
<!--
- [Temurin OpenJDK 17 LTS][temurin_openjdk17] <sup id="anchor_01">[1](#footnote_01)</sup> ([*release notes*][temurin_openjdk17_relnotes], [*bug fixes*][temurin_openjdk17_bugfixes])
-->

> **&#9755;** ***Installation policy***<br/>
> When possible we install software from a [Zip archive][zip_archive] rather than via a [Windows installer][windows_installer]. In our case we defined **`C:\opt\`** as the installation directory for optional software tools (*in reference to* the [**`/opt/`**][unix_opt] directory on Unix).

For instance our development environment looks as follows (*January 2025*) <sup id="anchor_04">[4](#footnote_04)</sup>:

<pre style="font-size:80%;">
C:\opt\apache-ant\              <i>( 43 MB)</i>
C:\opt\apache-maven\            <i>( 10 MB)</i>
C:\opt\ConEmu\                  <i>( 26 MB)</i>
C:\opt\flix\                    <i>( 37 MB)</i>
C:\opt\Git\                     <i>(393 MB)</i>
C:\opt\gradle\                  <i>(144 MB)</i>
C:\opt\jdk-temurin-21.0.5_11\   <i>(326 MB)</i>
C:\opt\jmc\                     <i>( 99 MB)</i>
C:\opt\mdBook\                  <i>( 10 MB)</i>
C:\opt\msys64\                  <i>(5.5 GB)</i>
C:\opt\scala-2.13.15\           <i>( 25 MB)</i>
C:\opt\VSCode\                  <i>(381 MB)</i>
</pre>

## <span id="structure">Directory structure</span> [**&#x25B4;**](#top)

This project has the following directory structure :

<pre style="font-size:80%;">
bin\
docs\
examples\{<a href="./examples/README.md">README.md</a>, <a href="./examples/areas/">areas</a>, <a href="./examples/arrays/">arrays</a>, <a href="./examples/channels/">channels</a>, ..}
<a href="https://github.com/michelou/flix">flix</a>\     <i>(Git submodule)</i>
lutz-examples\{<a href="./lutz-examples/README.md">README.md</a>, <a href="./lutz-examples/channels/">channels</a>, <a href="./lutz-examples/datalog/">datalog</a>, etc.}
<a href="CONTRIBUTIONS.md">CONTRIBUTIONS.md</a>
<a href="BUILD.md">BUILD.md</a>
<a href="DEPS.md">DEPS.md</a>
<a href="QUICKREF.md">QUICKREF.md</a>
README.md
<a href="RESOURCES.md">RESOURCES.md</a>
<a href="setenv.bat">setenv.bat</a>
<a href="UBUNTU_WSL.md">UBUNTU_WSL.md</a>
</pre>

where

- directory [**`bin\`**](bin/) provides several utility [batch files][windows_batch_file].
- directory [**`docs\`**](docs/) contains [Flix] related papers/articles.
- directory [**`examples\`**](examples/) contains [Flix] code examples (see [**`README.md`**](./examples/README.md)).
- directory **`flix\`** contains our fork of the [`flix/flix`][github_flix_flix] repository as a [Github submodule](.gitmodules).
- directory [**`lutz-examples\`**](lutz-examples/) contains [Flix] code examples from Lutz Hühnken's article (see [**`README.md`**](./lutz-examples/README.md)).
- file [**`CONTRIBUTIONS.md`**](CONTRIBUTIONS.md) presents ongoing works and contributions to the [Flix] project.
- file [**`BUILD.md`**](BUILD.md) presents the [Flix] build.
- file [**`DEPS.md`**](DEPS.md) lists library dependencies of published [Flix] distributions.
- file [**`QUICKREF.md`**](QUICKREF.md) gathers [Flix] language features.
- file [**`README.md`**](README.md) is the [Markdown][github_markdown] document for this page.
- file [**`RESOURCES.md`**](RESOURCES.md) gathers [Flix] related documents.
- file [**`setenv.bat`**](setenv.bat) is the batch script for setting up our environment.
- file [**`UBUNTU_WSL.md`**](UBUNTU_WSL.md) presents a [Flix] code examples in [Ubuntu WSL][wsl].

## <span id="commands">Bash/Batch commands</span> [**&#x25B4;**](#top)

We distinguish different sets of batch commands:

1. [**`setenv.bat`**](setenv.bat) &ndash; This batch command makes external tools such as [**`git.exe`**][git_userguide] and [**`gradle.bat`**][gradle_cli] directly available from the Windows command prompt (see section [**Project dependencies**](#proj_deps)).

   <pre style="font-size:80%;">
   <b>&gt; <a href="./setenv.bat">setenv</a> help</b>
   Usage: setenv { &lt;option&gt; | &lt;subcommand&gt; }
   &nbsp;
     Options:
       -debug      print commands executed by this script
       -verbose    print progress messages
   &nbsp;
     Subcommands:
       help        print this help message
   </pre>

2. [**`examples\*\build.bat`**](examples/areas/build.bat) &ndash; Code examples can be built/run/tested using the [**`build.bat`**](examples/areas/build.bat) command.<br/>

    <pre style="font-size:80%;">
    <b>&gt; <a href="examples/Factorial/build.bat">build</a></b>
    Usage: build { &lt;option&gt; | &lt;subcommand&gt; }
    &nbsp;
    Options:
      -debug      print commands executed by this script
      -nightly    use latest Flix nightly build if locally available
      -verbose    print progress messages
    &nbsp;
    Subcommands:
      clean       delete generated files
      compile     generate program executable
      help        print this help message
      run         execute the generated program "areas"
      test        run the unit tests
    </pre>

3. [**`examples\*\build.gradle`**](examples/areas/build.gradle) &ndash; Code examples can be built/run/tested using the [**`gradle.bat`**][gradle_cli] build tool.

4. [**`examples\*\build.sh`**](examples/areas/build.sh) &ndash; Code examples can be built/run/tested using the [**`bash.exe`**][bash_cli] scripting tool.

   <pre style="font-size:80%;">
   <b>&gt; <a href="https://linux.die.net/man/1/sh" rel="external">sh</a> <a href="examples/Factorial/build.sh">build.sh</a> help</b>
   Usage: build.sh { &lt;option> | &lt;subcommand> }
   &nbsp;
   Options:
     -debug       print commands executed by this script
     -nightly     select latest Flix nightly build if locally available
     -verbose     print progress messages
   &nbsp;
   Subcommands:
     clean        delete generated files
     compile      compile Flix source files
     decompile    decompile generated code with CFR
     help         print this help message
     run          execute Flix program "areas"
     test         run the unit tests
   </pre>

## <span id="usage">Usage examples</span> [**&#x25B4;**](#top)

### `setenv.bat`

We execute command [**`setenv.bat`**](setenv.bat) once to setup our development environment; it makes external tools such as [**`git.exe`**][git_userguide], [**`gradle.bat`**][gradle_cli], [**`make.exe`**][make_cli] and [**`sh.exe`**][sh_cli] directly available from the command prompt:

<pre style="font-size:80%;">
<b>&gt; <a href="setenv.bat">setenv</a></b>
Tool versions:
   java 21.0.5, javac 21.0.5, scalac 2.13.15, flix 0.55.0,
   gradle 8.12, make 3.81, mdbook v0.4.43, mvn 3.9.9,
   git 2.47.1, diff 3.10, bash 5.2.37(1)

<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/where_1">where</a> git gradle make sh</b>
C:\opt\Git\bin\git.exe
C:\opt\Git\mingw64\bin\git.exe
C:\opt\gradle\bin\gradle
C:\opt\gradle\bin\gradle.bat
C:\opt\make-3.81\bin\make.exe
C:\opt\Git\bin\sh.exe
C:\opt\Git\usr\bin\sh.exe
</pre>

Command [**`setenv.bat`**](setenv.bat) with option **`-verbose`** displays additional information:
- the download of the [Flix] nightly build to directory **`%FLIX_HOME%`** (if not yet done),
- the tool paths (which may not contain the version suffix, i.e. **`C:\opt\Git\bin\git.exe`** in some installations),
- the environment variables *defined locally* within this session,
- and the path associations (i.e. **`F:\`** in this case, but other drive names may be displayed as path associations are *globally defined*).

<pre style="font-size:80%;">
<b>&gt; <a href="setenv.bat">setenv</a> -verbose</b>
Assign path C:\Users\michelou\workspace-perso\flix-examples to drive F:
Download file "flix-2025-01-01.jar" to directory "C:\opt\flix"

Tool versions:
   java 21.0.5, javac 21.0.5, scalac 2.13.15, flix 0.55.0,
   gradle 8.12, make 3.81, mdbook v0.4.43, mvn 3.9.9,
   git 2.47.1, diff 3.10, bash 5.2.37(1)
Tool paths:
   C:\opt\jdk-temurin-21.0.5_11\bin\java.exe
   C:\opt\jdk-temurin-21.0.5_11\bin\javac.exe
   C:\opt\scala-2.13.15\bin\scalac.bat
   C:\opt\gradle\bin\gradle.bat
   C:\opt\make-3.81\bin\make.exe
   C:\opt\mdBook\mdbook.exe
   C:\opt\apache-maven\bin\mvn.cmd
   C:\opt\Git\bin\git.exe
   C:\opt\Git\usr\bin\diff.exe
Environment variables:
   "ANT_HOME=C:\opt\apache-ant"
   "FLIX_HOME=C:\opt\flix"
   "GIT_HOME=C:\opt\Git"
   "GRADLE_HOME=C:\opt\gradle"
   "JAVA_HOME=C:\opt\jdk-temurin-21.0.5_11"
   "MAKE_HOME=C:\opt\make-3.81"
   "MAVEN_HOME=C:\opt\apache-maven"
   "MDBOOK_HOME=C:\opt\mdBook"
   "SCALA_HOME=C:\opt\scala-2.13.15"
Path associations:
   F:\: => %USERPROFILE%\workspace-perso\flix-examples
</pre>

<!--=======================================================================-->

## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Flix nightly builds*** [↩](#anchor_01)

<dl><dd>
Our installation directory <code><b>%FLIX_HOME%</b></code> looks as follows on January 1, 2025 : 
<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f c:\opt\flix | <a href="https://man7.org/linux/man-pages/man1/tail.1.html">tail</a> -n +3</b>
C:\opt\flix
    flix-2025-01-01.jar
    flix.jar
</pre>
Command <a href="./examples/areas/build.bat"><code><b>build.bat</b></code></a> in our Flix projects features the <code><b>-nightly</b></code> option to choose the latest <a href="https://flix.dev/">Flix</a> nightly build archive file locally available instead of the release version (archive file <code><b>flix.jar</b></code> above).
</dd></dl>

<span id="footnote_02">[2]</span> ***mdBook*** [↩](#anchor_02)

<dl><dd>
We use <a href="https://github.com/rust-lang/mdBook/releases"><code><b>mdbook.exe</b></code></a> to work on our local copy of the online book "<a href="https://doc.flix.dev">Programming Flix</a>" generated from the GitHub project <a href="https://github.com/flix/book"><code>flix/book</code></a>.
</dd></dl>

<span id="footnote_03">[3]</span> ***JDK Mission Control*** [↩](#anchor_03)

<dl><dd>
Each vendor provides his own distribution of the JDK Mission Control tool, e.g. <a href="https://adoptium.net/jmc" rel="external">Adoptium JDK Mission Control</a> (our choice), <a href="https://www.azul.com/products/zulu-mission-control" rel="external">Zulu Mission Control</a>, <a href="https://bell-sw.com/pages/lmc">Liberica Mission Control</a> or <a href="https://www.oracle.com/java/technologies/jdk-mission-control.html" rel="external">Oracle JDK Mission Control</a>. 
</dd>
<dd>
We use <a href=""><code>jmc.exe</code></a> to investigate issues occuring during the build of our GitHub fork of the <a href="https://github.com/flix/flix"><code>flix/flix</code></a> repository.
<pre style="font-size:80%;">
<b>&gt; %JMC_HOME%\bin\<a href="https://github.com/thegreystone/jmc-tutorial">jmc.exe</a> -vm %JAVA_HOME%\bin</b>
</pre>
</dd></dl>

<span id="footnote_04">[4]</span> ***Downloads*** [↩](#anchor_04)

<dl><dd>
In our case we downloaded the following installation files (see <a href="#proj_deps">section 1</a>):
</dd>
<dd>
<pre style="font-size:80%;">
<a href="https://ant.apache.org/bindownload.cgi" rel="external">apache-ant-1.10.15-bin.zip</a>                         <i>(  9 MB)</i>
<a href="https://maven.apache.org/download.cgi">apache-maven-3.9.9-bin.zip</a>                         <i>( 10 MB)</i>
<a href="https://github.com/Maximus5/ConEmu/releases/tag/v23.07.24" rel="external">ConEmuPack.230724.7z</a>                               <i>(  5 MB)</i>
<a href="https://github.com/flix/flix/releases/" rel="external">flix.jar</a>                                           <i>( 39 MB)</i>
<a href="https://flix.dev/nightly/" rel="external">flix-2025-01-01.jar</a>                                <i>( 39 MB)</i>
<a href="https://gradle.org/install/">gradle-8.12.bin.zip</a>                                <i>(103 MB)</i>
<a href="https://github.com/rust-lang/mdBook/releases">mdbook-v0.4.43-x86_64-pc-windows-msvc.zip</a>          <i>(  4 MB)</i>
<a href="http://repo.msys2.org/distrib/x86_64/">msys2-x86_64-20240727.exe</a>                          <i>( 94 MB)</i>
<a href="https://adoptium.net/jmc/" rel="external">org.openjdk.jmc-9.0.0-win32.win32.x86_64.zip</a>       <i>( 90 MB)</i>
<a href="https://adoptium.net/releases.html?variant=openjdk21&jvmVariant=hotspot">OpenJDK21U-jdk_x64_windows_hotspot_21.0.5_11.zip</a>   <i>(191 MB)</i>
<a href="https://git-scm.com/download/win" rel="external">PortableGit-2.47.1-64-bit.7z.exe</a>                   <i>( 46 MB)</i>
<a href="https://www.scala-lang.org/files/archive/">scala-2.13.15.zip</a>                                  <i>( 22 MB)</i>
<a href="https://code.visualstudio.com/Download#" rel="external">VSCode-win32-x64-1.96.2.zip</a>                        <i>(131 MB)</i>
</pre>
<!--
<a href="https://adoptium.net/releases.html?variant=openjdk11&jvmVariant=hotspot">OpenJDK11U-jdk_x64_windows_hotspot_11.0.21_9.zip</a>   <i>(188 MB)</i>
<a href="https://adoptium.net/releases.html?variant=openjdk17&jvmVariant=hotspot">OpenJDK17U-jdk_x64_windows_hotspot_17.0.9_9.zip</a>    <i>(188 MB)</i>
-->
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/January 2025* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[ada_examples]: https://github.com/michelou/ada-examples#top
[akka_examples]: https://github.com/michelou/akka-examples#top
[apache_ant]: https://ant.apache.org/
[apache_ant_cli]: https://ant.apache.org/manual/running.html
[apache_ant_relnotes]: https://github.com/apache/ant/blob/master/WHATSNEW
[apache_maven]: https://maven.apache.org/download.cgi
[apache_maven_cli]: https://maven.apache.org/ref/current/maven-embedder/cli.html
[apache_maven_history]: https://maven.apache.org/docs/history.html
[apache_maven_relnotes]: https://maven.apache.org/docs/3.9.9/release-notes.html
[bash_cli]: https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_01.html
[cobol_examples]: https://github.com/michelou/cobol-examples#top
[conemu_downloads]: https://github.com/Maximus5/ConEmu/releases
[conemu_relnotes]: https://conemu.github.io/blog/2023/07/24/Build-230724.html
[cpp_examples]: https://github.com/michelou/cpp-examples#top
[dafny_examples]: https://github.com/michelou/dafny-examples#top
[dart_examples]: https://github.com/michelou/dart-examples#top
[deno_examples]: https://github.com/michelou/deno-examples#top
[diff_cli]: https://www.gnu.org/software/diffutils/manual/html_node/Invoking-diff.html
[erlang_examples]: https://github.com/michelou/erlang-examples#top
[deno_examples]: https://github.com/michelou/deno-examples#top
[docker_examples]: https://github.com/michelou/docker-examples#top
[git_cli]: https://git-scm.com/docs/git
[git_downloads]: https://git-scm.com/download/win
[git_exe]: https://git-scm.com/docs/git
[git_relnotes]: https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.47.1.txt
[github_markdown]: https://github.github.com/gfm/
[git_userguide]: https://git-scm.com/docs/git
[flix]: https://flix.dev/
[flix_compatibility]: https://github.com/flix/flix/releases/tag/v0.55.0
[flix_downloads]: https://github.com/flix/flix/releases/
[flix_relnotes]: https://github.com/flix/flix/releases/tag/v0.55.0
[github_flix_flix]: https://github.com/flix/flix
[golang_examples]: https://github.com/michelou/golang-examples#top
[graalvm_examples]: https://github.com/michelou/graalvm-examples#top
[gradle_cli]: https://docs.gradle.org/current/userguide/command_line_interface.html
[gradle_compatibility]: https://docs.gradle.org/current/release-notes.html#upgrade-instructions
[gradle_install]: https://gradle.org/install/
[gradle_relnotes]: https://docs.gradle.org/8.12/release-notes.html
[haskell_examples]: https://github.com/michelou/haskell-examples#top
[jmc_download]: https://adoptium.net/jmc/
[jmc_relnotes]: https://www.oracle.com/java/technologies/javase/jmc8-release-notes.html
[kafka_examples]: https://github.com/michelou/kafka-examples#top
[kotlin_examples]: https://github.com/michelou/kotlin-examples#top
[llvm_examples]: https://github.com/michelou/llvm-examples#top
[m2_examples]: https://github.com/michelou/m2-examples#top
[make_cli]: https://www.gnu.org/software/make/manual/make.html
[mdbook_changelog]: https://github.com/rust-lang/mdBook/blob/master/CHANGELOG.md
[mdbook_download]: https://github.com/rust-lang/mdBook/releases
[msys2_changelog]: https://github.com/msys2/setup-msys2/blob/master/CHANGELOG.md
[msys2_releases]: https://repo.msys2.org/distrib/x86_64/
[nodejs_examples]: https://github.com/michelou/nodejs-examples#top
[oracle_openjdk21]: https://jdk.java.net/21/
[oracle_openjdk21_api]: https://download.java.net/java/early_access/jdk21/docs/api/
[oracle_openjdk21_relnotes]: https://jdk.java.net/21/release-notes
[rust_examples]: https://github.com/michelou/rust-examples#top
[scala_download]: https://www.scala-lang.org/files/archive/
[scala_relnotes]: https://github.com/scala/scala/releases/tag/v2.13.15
[scala3_examples]: https://github.com/michelou/dotty-examples#top
[sh_cli]: https://man7.org/linux/man-pages/man1/sh.1p.html
[sml_examples]: https://github.com/michelou/sml-examples#top
[spark_examples]: https://github.com/michelou/spark-examples#top
[spring_examples]: https://github.com/michelou/spring-examples#top
<!-- #### https://mail.openjdk.org/pipermail/jdk-updates-dev/
11.0.3  -> https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2019-April/000951.html
11.0.4  -> https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2019-July/001423.html
11.0.5  -> https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2019-October/002025.html
11.0.6  -> https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2020-January/002374.html
11.0.7  -> https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2020-April/003019.html
11.0.8  -> https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2020-July/003498.html
11.0.9  -> https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2020-October/004007.html
11.0.10 -> https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2021-January/004689.html
11.0.11 -> https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2021-April/005860.html
11.0.12 -> https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2021-July/006954.html
11.0.13 -> https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2021-October/009368.html
11.0.14 -> https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2022-January/011643.html
11.0.15 -> https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2022-April/014104.html
11.0.16 -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2022-July/016017.html
11.0.17 -> https://www.oracle.com/java/technologies/javase/11-0-17-bugfixes.html
11.0.19 -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-April/021900.html
11.0.20 -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-July/024064.html
11.0.21 -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-October/026351.html
11.0.22 -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2024-January/029215.html
11.0.24 -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2024-July/035797.html
11.0.25 -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2024-October/038512.html
-->
[temurin_openjdk11]: https://adoptium.net/releases.html?variant=openjdk11&jvmVariant=hotspot
[temurin_openjdk11_bugfixes]: https://www.oracle.com/java/technologies/javase/11-0-17-bugfixes.html
[temurin_openjdk11_relnotes]: https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-April/021900.html
[temurin_openjdk11_shipilev]: https://builds.shipilev.net/backports-monitor/release-notes-11.0.22.html
<!--
17.0.2  -> https://www.oracle.com/java/technologies/javase/17-0-2-bugfixes.html
17.0.7  -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-April/021899.html
17.0.8  -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-July/024063.html
17.0.9  -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-October/026352.html
17.0.10 -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2024-January/029089.html
17.0.11 -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2024-April/032197.html
17.0.12 -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2024-July/035798.html
-->
[temurin_openjdk17]: https://adoptium.net/releases.html?variant=openjdk17&jvmVariant=hotspot
[temurin_openjdk17_bugfixes]: https://www.oracle.com/java/technologies/javase/17-0-2-bugfixes.html
[temurin_openjdk17_relnotes]: https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-October/026352.html
<!-- #### https://builds.shipilev.net/backports-monitor/
21_35   -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-October/026351.html
21.0.1  -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-October/026351.html
21.0.2  -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2024-January/029090.html
21.0.3  -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2024-April/032196.html
21.0.4  -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2024-July/035862.html
21.0.5  -> 
-->
[temurin_openjdk21]: https://adoptium.net/releases.html?variant=openjdk21&jvmVariant=hotspot
[temurin_openjdk21_bugfixes]: https://www.oracle.com/java/technologies/javase/17-0-2-bugfixes.html
[temurin_openjdk21_relnotes]: https://jdk.java.net/21/release-notes
[temurin_openjdk21_shipilev]: https://builds.shipilev.net/backports-monitor/release-notes-21.0.3.html
[trufflesqueak_examples]: https://github.com/michelou/trufflesqueak-examples#top
[unix_opt]: https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/opt.html
[vscode_downloads]: https://code.visualstudio.com/#alt-downloads
[vscode_relnotes]: https://code.visualstudio.com/updates/
[windows_batch_file]: https://en.wikibooks.org/wiki/Windows_Batch_Scripting
[windows_installer]: https://docs.microsoft.com/en-us/windows/win32/msi/windows-installer-portal
[windows_limitation]: https://support.microsoft.com/en-gb/help/830473/command-prompt-cmd-exe-command-line-string-limitation
[windows_subst]: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/subst
[wix_examples]: https://github.com/michelou/wix-examples#top
[wsl]: https://ubuntu.com/wsl "Ubuntu WSL"
[zig_examples]: https://github.com/michelou/zig-examples#top
[zip_archive]: https://www.howtogeek.com/178146/htg-explains-everything-you-need-to-know-about-zipped-files/
