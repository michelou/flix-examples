# <span id="top">Playing with Flix on Windows</span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 8px 0 0;min-width:25%;"><a href="https://flix.dev/" rel="external"><img src="./docs/images/flix-logo.png" width="160" alt="Flix project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">This repository gathers <a href="https://flix.dev/" rel="external">Flix</a> code examples coming from various websites.<br/>
  It also includes several build scripts (<a href="https://ant.apache.org/manual/using.html" rel="external">Ant files</a>, <a href="https://en.wikibooks.org/wiki/Windows_Batch_Scripting" rel="external">batch files</a>, <a href="https://makefiletutorial.com/" rel="external">Make scripts</a>, <a href="https://docs.gradle.org/current/userguide/tutorial_using_tasks.html" rel="external">Gradle scripts</a>, <a href="https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_01.html" rel="external">Bash scripts</a>) for experimenting with <a href="https://flix.dev/" rel="external">Flix</a> on a Windows machine.
  </td>
  </tr>
</table>

> **&#9755;** Read the document <a href="https://github.com/flix/flix/blob/master/docs/DIDYOUKNOW.md">"Did You Know?"</a> from the <a href="https://flix.dev/" rel="external">Flix</a> documentation to know more about the <a href="https://flix.dev/" rel="external">Flix</a> ecosystem.

[Ada][ada_examples], [Akka][akka_examples], [C++][cpp_examples], [Dart][dart_examples], [Deno][deno_examples], [GraalVM][graalvm_examples], [Haskell][haskell_examples], [Kafka][kafka_examples], [Kotlin][kotlin_examples], [LLVM][llvm_examples], [Node.js][nodejs_examples], [Rust][rust_examples], [Scala 3][scala3_examples], [Spark][spark_examples], [Spring][spring_examples], [TruffleSqueak][trufflesqueak_examples] and [WiX Toolset][wix_examples] are other topics we are continuously monitoring.

## <span id="proj_deps">Project dependencies</span>

This project depends on the following external software for the **Microsoft Windows** platform:

- [Apache Maven 3.9][apache_maven] ([requires Java 8+][apache_maven_history])  ([*release notes*][apache_maven_relnotes])
- [Flix 0.37][flix_downloads] ([*release notes*][flix_relnotes])
- [Git 2.40][git_downloads] ([*release notes*][git_relnotes])
- [Temurin OpenJDK 11 LTS][temurin_opendjk11] ([*release notes*][temurin_opendjk11_relnotes], [*bug fixes*][temurin_opendjk11_bugfixes])

Optionally one may also install the following software:

- [Apache Ant 1.10][apache_ant] (requires Java 8) ([*release notes*][apache_ant_relnotes])
- [Flix nightly builds](https://flix.dev/nightly/) <sup id="anchor_01">[1](#footnote_01)</sup>
- [GNU Make 3.81][make_install]
- [Gradle 8.1][gradle_install] ([requires Java 8+][gradle_compatibility]) ([*release notes*][gradle_relnotes])
- [mdBook 0.4][mdbook_download] <sup id="anchor_02">[2](#footnote_02)</sup> ([*changelog*][mdbook_changelog])
- [Scala 2.13][scala_download] ([*release notes*][scala_relnotes])
- [Temurin JDK Mission Control 8.3][jmc_download] <sup id="anchor_03">[3](#footnote_03)</sup> ([*release notes*][jmc_relnotes])

> **&#9755;** ***Installation policy***<br/>
> When possible we install software from a [Zip archive][zip_archive] rather than via a [Windows installer][windows_installer]. In our case we defined **`C:\opt\`** as the installation directory for optional software tools (*in reference to* the [**`/opt/`**][unix_opt] directory on Unix).

For instance our development environment looks as follows (*May 2023*) <sup id="anchor_04">[4](#footnote_04)</sup>:

<pre style="font-size:80%;">
C:\opt\apache-ant-1.10.13\      <i>( 43 MB)</i>
C:\opt\apache-maven-3.9.2\      <i>( 10 MB)</i>
C:\opt\flix-0.37.0\             <i>( 37 MB)</i>
C:\opt\Git-2.40.1\              <i>(315 MB)</i>
C:\opt\gradle-8.1.1\            <i>(131 MB)</i>
C:\opt\jdk-temurin-11.0.19_7\   <i>(301 MB)</i>
C:\opt\jmc-8.3.0\               <i>( 99 MB)</i>
C:\opt\make-3.81\               <i>(  2 MB)</i>
C:\opt\mdBook-0.4.29\           <i>(  9 MB)</i>
C:\opt\scala-2.13.10\           <i>( 24 MB)</i>
</pre>

## <span id="structure">Directory structure</span> [**&#x25B4;**](#top)

This project is organized as follows:

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

## <span id="commands">Bash/Batch commands</span>

We distinguish different sets of batch commands:

1. [**`setenv.bat`**](setenv.bat) &ndash; This batch command makes external tools such as [**`git.exe`**][git_userguide] and [**`gradle.bat`**][gradle_cli] directly available from the Windows command prompt (see section [**Project dependencies**](#proj_deps)).

   <pre style="font-size:80%;">
   <b>&gt; <a href="./setenv.bat">setenv</a> help</b>
   Usage: setenv { &lt;option&gt; | &lt;subcommand&gt; }
   &nbsp;
     Options:
       -debug      display commands executed by this script
       -verbose    display environment settings
   &nbsp;
     Subcommands:
       help        display this help message
   </pre>

2. [**`examples\*\build.bat`**](examples/areas/build.bat) &ndash; Code examples can be built/run/tested using the [**`build.bat`**](examples/areas/build.bat) command.<br/>

    <pre style="font-size:80%;">
    <b>&gt; <a href="examples/Factorial/build.bat">build</a></b>
    Usage: build { &lt;option&gt; | &lt;subcommand&gt; }
    &nbsp;
    Options:
      -debug      display commands executed by this script
      -nightly    use latest Flix nightly build if locally available
      -verbose    display progress messages
    &nbsp;
    Subcommands:
      clean       delete generated files
      compile     generate program executable
      help        display this help message
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
     -debug       display commands executed by this script
     -nightly     select latest Flix nightly build if locally available
     -verbose     display progress messages
   &nbsp;
   Subcommands:
     clean        delete generated files
     compile      compile Scala/Flix source files
     decompile    decompile generated code with CFR
     help         display this help message
     run          execute Flix program "areas"
     test         run the unit tests
   </pre>

## <span id="usage">Usage examples</span> [**&#x25B4;**](#top)

### `setenv.bat`

Command [**`setenv.bat`**](setenv.bat) is executed once to setup our development environment; it makes external tools such as [**`git.exe`**][git_userguide], [**`gradle.bat`**][gradle_cli] and [**`make.exe`**][make_cli] directly available from the command prompt:

<pre style="font-size:80%;">
<b>&gt; <a href="setenv.bat">setenv</a></b>
Tool versions:
   java 11.0.19, javac 11.0.19, scalac 2.13.10, flix v0.37.0,
   gradle 8.1, make 3.81, mdbook v0.4.29, mvn 3.9.2,
   git 2.40.1.windows.1, diff 3.9

<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/where_1">where</a> git gradle make sh</b>
C:\opt\Git-2.40.1\bin\git.exe
C:\opt\Git-2.40.1\mingw64\bin\git.exe
C:\opt\gradle-8.1.1\bin\gradle
C:\opt\gradle-8.1.1\bin\gradle.bat
C:\opt\make-3.81\bin\make.exe
C:\opt\Git-2.40.1\bin\sh.exe
C:\opt\Git-2.40.1\usr\bin\sh.exe
</pre>

Command [**`setenv.bat`**](setenv.bat) with option **`-verbose`** displays additional information:
- the download of the [Flix] nightly build to directory **`%FLIX_HOME%`** (if not yet done),
- the tool paths (which may not contain the version suffix, i.e. **`C:\opt\Git\bin\git.exe`** in some installations),
- the environment variables *defined locally* within this session,
- and the path associations (i.e. **`F:\`** in this case, but other drive names may be displayed as path associations are *globally defined*).

<pre style="font-size:80%;">
<b>&gt; <a href="setenv.bat">setenv</a> -verbose</b>
Assign path C:\Users\michelou\workspace-perso\flix-examples to drive F:
Download file "flix-2023-05-04.jar" to directory "C:\opt\flix-0.37.0"

Tool versions:
   java 11.0.19, javac 11.0.19, scalac 2.13.10, flix v0.37.0,
   gradle 8.1.1, make 3.81, mdbook v0.4.29, mvn 3.9.2,
   git 2.40.1.windows.1, diff 3.9, bash 5.2.15(1)-release
Tool paths:
   C:\opt\jdk-temurin-11.0.19_7\bin\java.exe
   C:\opt\jdk-temurin-11.0.19_7\bin\javac.exe
   C:\opt\scala-2.13.10\bin\scalac.bat
   C:\opt\gradle-8.1.1\bin\gradle.bat
   C:\opt\make-3.81\bin\make.exe
   C:\opt\mdBook-0.4.29\mdbook.exe
   C:\opt\apache-maven-3.9.2\bin\mvn.cmd
   C:\opt\Git-2.40.1\bin\git.exe
   C:\opt\Git-2.40.1\usr\bin\diff.exe
Environment variables:
   "ANT_HOME=C:\opt\apache-ant-1.10.13"
   "FLIX_HOME=C:\opt\flix-0.37.0"
   "GIT_HOME=C:\opt\Git-2.40.1"
   "GRADLE_HOME=C:\opt\gradle-8.1.1"
   "JAVA_HOME=C:\opt\jdk-temurin-11.0.19_7"
   "MAKE_HOME=C:\opt\make-3.81"
   "MAVEN_HOME=C:\opt\apache-maven-3.9.2"
   "MDBOOK_HOME=C:\opt\mdBook-0.4.29"
   "SCALA_HOME=C:\opt\scala-2.13.10"
Path associations:
   F:\: => %USERPROFILE%\workspace-perso\flix-examples
</pre>

<!--=======================================================================-->

## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Flix nightly builds*** [↩](#anchor_01)

<dl><dd>
Our installation directory <code><b>%FLIX_HOME%</b></code> looks as follows on May 19, 2023 : 
<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f c:\opt\flix-0.37.0 | <a href="https://man7.org/linux/man-pages/man1/tail.1.html">tail</a> -n +3</b>
C:\opt\flix-0.37.0
    flix-2023-05-24.jar
    flix.jar
</pre>
Command <a hfef="./examples/areas/build.bat"><code><b>build.bat</b></code></a> in our Flix projects features the <code><b>-nightly</b></code> option to choose the latest <a href="https://flix.dev/">Flix</a> nightly build archive file locally available instead of the release version (archive file <code><b>flix.jar</b></code> above).
</dd></dl>

<span id="footnote_02">[2]</span> ***mdBook*** [↩](#anchor_02)

<dl><dd>
We use <a href="https://github.com/rust-lang/mdBook/releases"><code>mdbook.exe</code></a> to work on our local copy of the online book "<a href="https://doc.flix.dev">Programming Flix</a>" generated from the GitHub project <a href="https://github.com/flix/book"><code>flix/book</code></a>.
</dd></dl>

<span id="footnote_03">[3]</span> ***JDK Mission Control*** [↩](#anchor_03)

<dl><dd>
Each vendor provides his own distribution of the JDK Mission Control tool, e.g. <a href="https://adoptium.net/jmc" rel="external">Adoptium JDK Mission Control</a> (our choice), <a href="https://www.azul.com/products/zulu-mission-control" rel="external">Zulu Mission Control</a>, <a href="https://bell-sw.com/pages/lmc">Liberica Mission Control</a> or <a href="https://www.oracle.com/java/technologies/jdk-mission-control.html" rel="external">Oracle JDK Mission Control</a>. 
</dd>
<dd>
We use <a href=""><code>jmc.exe</code></a> to investigate issues occuring during the build of our GitHub fork of the <a href="https://github.com/flix/flix"><code>flix/flix</code></a> repository.
<pre style="font-size:80%;">
<b>&gt; %JMC_HOME%\bin\jmc.exe -vm %JAVA_HOME%\bin</b>
</pre>
</dd></dl>

<span id="footnote_04">[4]</span> ***Downloads*** [↩](#anchor_04)

<dl><dd>
In our case we downloaded the following installation files (see <a href="#proj_deps">section 1</a>):
</dd>
<dd>
<pre style="font-size:80%;">
<a href="https://ant.apache.org/bindownload.cgi" rel="external">apache-ant-1.10.13-bin.zip</a>                         <i>(  9 MB)</i>
<a href="https://maven.apache.org/download.cgi">apache-maven-3.9.2-bin.zip</a>                         <i>( 10 MB)</i>
<a href="https://github.com/flix/flix/releases/" rel="external">flix.jar</a>                                           <i>( 39 MB)</i>
<a href="https://flix.dev/nightly/" rel="external">flix-2023-05-04.jar</a>                                <i>( 39 MB)</i>
<a href="https://gradle.org/install/">gradle-8.1.1-bin.zip</a>                               <i>(103 MB)</i>
<a href="https://sourceforge.net/projects/gnuwin32/files/make/3.81/">make-3.81-bin.zip</a>                                  <i>( 10 MB)</i>
<a href="https://github.com/rust-lang/mdBook/releases">mdbook-v0.4.29-x86_64-pc-windows-msvc.zip</a>          <i>(  4 MB)</i>
<a href="https://adoptium.net/releases.html?variant=openjdk11&jvmVariant=hotspot">OpenJDK11U-jdk_x64_windows_hotspot_11.0.19_7.zip</a>   <i>(188 MB)</i>
<a href="https://git-scm.com/download/win" rel="external">PortableGit-2.40.1-64-bit.7z.exe</a>                   <i>( 46 MB)</i>
<a href="https://adoptium.net/jmc/" rel="external">org.openjdk.jmc-8.3.0-win32.win32.x86_64.zip</a>       <i>( 87 MB)</i>
<a href="https://www.scala-lang.org/files/archive/">scala-2.13.10.zip</a>                                  <i>( 22 MB)</i>
</pre>
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/June 2023* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[ada_examples]: https://github.com/michelou/ada-examples
[akka_examples]: https://github.com/michelou/akka-examples
[apache_ant]: https://ant.apache.org/
[apache_ant_cli]: https://ant.apache.org/manual/running.html
[apache_ant_relnotes]: https://github.com/apache/ant/blob/master/WHATSNEW
[apache_maven]: https://maven.apache.org/download.cgi
[apache_maven_cli]: https://maven.apache.org/ref/current/maven-embedder/cli.html
[apache_maven_history]: https://maven.apache.org/docs/history.html
[apache_maven_relnotes]: https://maven.apache.org/docs/3.9.2/release-notes.html
[bash_cli]: https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_01.html
[cpp_examples]: https://github.com/michelou/cpp-examples
[dart_examples]: https://github.com/michelou/dart-examples
[deno_examples]: https://github.com/michelou/deno-examples
[diff_cli]: https://www.gnu.org/software/diffutils/manual/html_node/Invoking-diff.html
[git_cli]: https://git-scm.com/docs/git
[git_downloads]: https://git-scm.com/download/win
[git_exe]: https://git-scm.com/docs/git
[git_relnotes]: https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.40.1.txt
[github_markdown]: https://github.github.com/gfm/
[git_userguide]: https://git-scm.com/docs/git
[flix]: https://flix.dev/
[flix_downloads]: https://github.com/flix/flix/releases/
[flix_relnotes]: https://github.com/flix/flix/releases/tag/v0.37.0
[github_flix_flix]: https://github.com/flix/flix
[graalvm_examples]: https://github.com/michelou/graalvm-examples
[gradle_cli]: https://docs.gradle.org/current/userguide/command_line_interface.html
[gradle_compatibility]: https://docs.gradle.org/current/release-notes.html#upgrade-instructions
[gradle_install]: https://gradle.org/install/
[gradle_relnotes]: https://docs.gradle.org/8.1.1/release-notes.html
[haskell_examples]: https://github.com/michelou/haskell-examples
[jmc_download]: https://adoptium.net/jmc/
[jmc_relnotes]: https://www.oracle.com/java/technologies/javase/jmc8-release-notes.html
[kafka_examples]: https://github.com/michelou/kafka-examples
[kotlin_examples]: https://github.com/michelou/kotlin-examples
[llvm_examples]: https://github.com/michelou/llvm-examples
[make_cli]: https://www.gnu.org/software/make/manual/make.html
[make_install]: https://sourceforge.net/projects/gnuwin32/files/make/3.81/
[mdbook_changelog]: https://github.com/rust-lang/mdBook/blob/master/CHANGELOG.md
[mdbook_download]: https://github.com/rust-lang/mdBook/releases
[nodejs_examples]: https://github.com/michelou/nodejs-examples
[rust_examples]: https://github.com/michelou/rust-examples
[scala_download]: https://www.scala-lang.org/files/archive/
[scala_relnotes]: https://github.com/scala/scala/releases/tag/v2.13.10
[scala3_examples]: https://github.com/michelou/dotty-examples
[spark_examples]: https://github.com/michelou/spark-examples
[spring_examples]: https://github.com/michelou/spring-examples
<!--
11.0.18+10 -> https://github.com/openjdk/jdk11u/releases/tag/jdk-11.0.18%2B10
11.0.19+7  -> https://github.com/openjdk/jdk11u/releases/tag/jdk-11.0.19%2B7
-->
[temurin_opendjk11_bugfixes]: https://www.oracle.com/java/technologies/javase/11-0-17-bugfixes.html
<!--
11.0.9  -> https://www.oracle.com/java/technologies/javase/11-0-9-bugfixes.html
11.0.16 -> https://www.oracle.com/java/technologies/javase/11-0-16-bugfixes.html
11.0.17 -> https://www.oracle.com/java/technologies/javase/11-0-17-bugfixes.html
-->

[temurin_opendjk11_relnotes]: https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-April/021900.html
<!--
11.0.9  -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2020-October/004007.html
11.0.13 -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2021-October/009368.html
11.0.16 -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2022-July/016017.html
11.0.17 -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2022-October/018119.html
11.0.18 -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-January/020111.html
11.0.19 -> https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-April/021900.html
-->
[temurin_opendjk11]: https://adoptium.net/releases.html?variant=openjdk11&jvmVariant=hotspot
[trufflesqueak_examples]: https://github.com/michelou/trufflesqueak-examples
[unix_opt]: https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/opt.html
[windows_batch_file]: https://en.wikibooks.org/wiki/Windows_Batch_Scripting
[windows_installer]: https://docs.microsoft.com/en-us/windows/win32/msi/windows-installer-portal
[windows_limitation]: https://support.microsoft.com/en-gb/help/830473/command-prompt-cmd-exe-command-line-string-limitation
[windows_subst]: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/subst
[wix_examples]: https://github.com/michelou/wix-examples
[wsl]: https://ubuntu.com/wsl "Ubuntu WSL"
[zip_archive]: https://www.howtogeek.com/178146/htg-explains-everything-you-need-to-know-about-zipped-files/
