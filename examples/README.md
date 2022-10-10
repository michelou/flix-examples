# <span id="top">Flix Examples</span> <span style="size:25%;"><a href="../README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 8px 0 0;;min-width:160px;">
    <a href="https://flix.dev/"><img src="../docs/images/flix-logo.png" width="160" alt="Flix project"/></a>
  </td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>examples\</code></strong> contains <a href="https://flix.dev/" rel="external">Flix</a> code examples coming from various websites - mostly from the <a href="https://flix.dev/" rel="external">Flix</a> project.
  </td>
  </tr>
</table>

We provide several ways to build/run our [Flix] code examples:

| Build tool          | Configuration file(s)  | Parent file(s) | Environment(s) |
|---------------------|------------------------|----------------|----------------|
| [**`build.bat`**](areas/build.bat) | &nbsp;                 | &nbsp; | MS Windows |
| **`gradle.exe`**    | [**`build.gradle`**](areas/build.gradle) | [**`common.gradle`**](common.gradle) | Any |
| **`mvn.cmd`**       | [**`pom.xml`**](areas/pom.xml) | [**`pom.xml`**](pom.xml)  | Any |
| [**`make.exe`**][make_cli] | [**`Makefile`**](areas/Makefile) | [**`Makefile.inc`**](./Makefile.inc)  | Any |
<div style="margin:0 15% 0 8px;font-size:90%;">
<sup><b>a)</b></sup></b> Here "Any" means "tested on MS Windows / Cygwin / MSYS2 / Unix".<br/>&nbsp;
</div>

The [Flix] projects presented below share the same directory layout as project `areas`, namely :
1. The project directory `areas\` initially looks as follows :
   <pre style="font-size:80%;">
   <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f areas | <a href="https://man7.org/linux/man-pages/man1/tail.1.html">tail</a> -n +3</b>
   F:\EXAMPLES\AREAS
   |   <a href="./areas/build.bat">build.bat</a>
   \---<b>src</b>
        +---main
        |       <a href="./areas/src/main/Main.flix">Main.flix</a>
        \---test
                <a href="./areas/src/test/TestMain.flix">TestMain.flix</a>
   </pre>

3. Before compilation we run the Flix command `init` <sup id="anchor_01">[1](#footnote_01)</sup> to create a Flix-managed <sup id="anchor_02">[2](#footnote_02)</sup> subdirectory `target\areas\` and we copy the [Flix] source files from the `src\main\` and `src\test\` directories :
   <pre style="font-size:80%;">
   <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f areas | <a href="https://man7.org/linux/man-pages/man1/tail.1.html">tail</a> -n +3</b>
   F:\EXAMPLES\AREAS
   |   <a href="./areas/build.bat">build.bat</a>
   +---<b>src</b>
   |   +---main
   |   |       <a href="./areas/src/main/Main.flix">Main.flix</a>
   |   \---test
   |           <a href="./areas/src/test/TestMain.flix">TestMain.flix</a>
   \---<b>target</b>
       \---areas
           +---build
           +---lib
           +---src\Main.flix       <i>(copied from src\main\)</i>
           \---test\TestMain.flix  <i>(copied from src\test\)</i>
          HISTORY.md, LICENSE.md, README.md  <i>(generated placeholders)</i>
   </pre>

2. During compilation we run the two [Flix] commands `build` <sup id="anchor_01">[1](#footnote_01)</sup> and `build-jar` to successively generate class files in subdirectory `target\areas\build\` and the target file `target\areas\areas.jar` :
   <pre style="font-size:80%;">
   <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f areas |<a href="https://man7.org/linux/man-pages/man1/tail.1.html">tail</a> -n +3</b>
   F:\EXAMPLES\AREAS
   |   <a href="./areas/build.bat">build.bat</a>
   +---<b>src</b>
   |   +---main
   |   |       <a href="./areas/src/main/Main.flix">Main.flix</a>
   |   \---test
   |           <a href="./areas/src/test/TestMain.flix">TestMain.flix</a>
   \---<b>target</b>
       \---areas
           +---build
           |   +---dev
           |   |   \---flix
           |   |       \---runtime\*.class
           |   +---Iterator\*.class
           |   +---List\*.class
           |   \---StringBuilder\*.class
           +---lib
           +---src\Main.flix
           \---test\TestMain.flix
          areas.jar
          HISTORY.md, LICENSE.md, README.md
   </pre>

> <ins>**Note**</ins> : We can just run the batch file [**`examples\clean.bat`**](./clean.bat) to clean up all project directories (i.e. before updating our Github repository [`flix-examples`](https://github.com/michelou/flix-examples) with local changes).

### <span id="areas">Example `areas`</span>

Command [**`build -verbose run`**](./areas/build.bat) generates the target file `target\areas\areas.jar` from the Flix source file [`src\main\Main.flix`](./areas/src/main/Main.flix) and runs the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./areas/build.bat">build</a> -verbose run</b>
Copy 1 Flix source file to directory "target\areas\src\"
Compile 1 Flix source file
Create archive file "target\areas\areas.jar"
Execute Flix program "target\areas\areas.jar"
2 :: 6 :: Nil
2 :: 6 :: Nil
</pre>

Command [**`build -verbose test`**](./areas/build.bat) generates the target file `target\areas\areas.jar` from the Flix source files [`src\main\Main.flix`](./areas/src/main/Main.flix) and [`src\test\TestMain.flix`](./areas/src/test/TestMain.flix) and runs the tests:

<pre style="font-size:80%;">
<b>&gt; <a href="./areas/build.bat">build</a> -verbose test</b>
Copy 1 Flix source file to directory "target\areas\src\"
Copy 1 Flix test source file to directory "target\areas\test\"
Compile 1 Flix source file and 1 Flix test source file
Create archive file "target\areas\areas.jar"
Execute tests for Flix program "target\areas\areas.jar"
Running 2 tests...
&nbsp;
   PASS  test01 415,8us
   PASS  test02 89,5us
&nbsp;
Passed: 2, Failed: 0. Skipped: 0. Elapsed: 4,0ms.
</pre>

> **Note**: We achieve the same result with command [**`make.exe`**][make_cli] which reads its configuration from the two configuration files [**`Makefile`**](./areas/Makefile) and [**`Makefile.inc`**](./Makefile.inc) (we can use option **`--silent`** to hide the executed commands):
> <pre style="font-size:80%;">
> <b>&gt; <a href="https://www.gnu.org/software/make/manual/make.html">make</a> run</b>
> [ -d "target/areas" ] || "C:/opt/Git-2.37.3/usr/bin/mkdir.exe" -p "target/areas"
> cd "target/areas"; \
>         [ -d "build" ] || "C:/opt/jdk-temurin-11.0.16_8/bin/java.exe" -jar "C:\opt\flix-0.31.0/flix.jar" init && \
>         "C:/opt/Git-2.37.3/usr/bin/rm.exe" -f "src/Main.flix" && \
>         "C:/opt/Git-2.37.3/usr/bin/cp.exe" -r "F:/examples/areas/src/main/." src && \
>         "C:/opt/jdk-temurin-11.0.16_8/bin/java.exe" -jar "C:\opt\flix-0.31.0/flix.jar" build && \
>         "C:/opt/jdk-temurin-11.0.16_8/bin/java.exe" -jar "C:\opt\flix-0.31.0/flix.jar" build-jar
> "C:/opt/jdk-temurin-11.0.16_8/bin/java.exe" -Xbootclasspath/a:"%USERPROFILE%/.m2/repository/org/scala-lang/scala-library/2.13.8/scala-library-2.13.8.jar" -jar "target/areas/areas.jar"
> 2 :: 6 :: Nil
> 2 :: 6 :: Nil
> &nbsp;
> <b>&gt; <a href="https://www.gnu.org/software/make/manual/make.html">make</a> --silent test</b>
> Running 2 tests...
> &nbsp;
>    PASS  test01 806,3us
>    PASS  test02 115,4us
> &nbsp;
> Passed: 2, Failed: 0. Skipped: 0. Elapsed: 6,3ms.
> <pre>

### <span id="channels">Example `channels`</span> [**&#x25B4;**](#top)

Command [**`build -verbose run`**](./channels/build.bat) generates the target file `target\channels\channels.jar` from the [Flix] source file [`src\main\Main.flix`](./channels/src/main/Main.flix) and runs the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./channels/build.bat">build</a> -verbose run</b>
Copy 1 Flix source file to directory "target\channels\src\"
Compile 1 Flix source file
Create archive file "target\channels\channels.jar"
Extract Flix runtime from archive file "C:\opt\flix-0.31.0\flix.jar"
Add Flix runtime to archive file "target\channels\channels.jar"
Execute Flix program "target\channels\channels.jar"
1 :: 2 :: 3 :: Nil
</pre>

> **Note**: The [Flix] command <code>build-jar</code> does not add the [Flix] runtime to the generated archive file <code>target\channels\channels.jar</code>, so we need to update it with class files extracted from <code>flix.jar</code> and belonging to package <a href="https://github.com/flix/flix/tree/master/main/src/ca/uwaterloo/flix/runtime"><code>ca.uwaterloo.flix.runtime</code></a>.<br/>Without that additional step we would get the following runtime error :
> <pre style="font-size:80%;">
> <b>&gt; <a href="./channels/build.bat">build</a> -verbose run</b>
> Copy 1 Flix source file to directory "target\channels\src\"
> Compile 1 Flix source file
> Create archive file "target\channels\channels.jar"
> Execute Flix program "target\channels\channels.jar"
> Exception in thread "main" java.lang.NoClassDefFoundError: ca/uwaterloo/flix/runtime/interpreter/Channel
>         at Def%main%.invoke(Unknown Source)
>         at Cont%Obj.unwind(Cont%Obj)
>         at Ns.m_main%(Unknown Source)
>         at Main.main(Main)
> Caused by: java.lang.ClassNotFoundException: ca.uwaterloo.flix.runtime.interpreter.Channel
>         at java.base/jdk.internal.loader.BuiltinClassLoader.loadClass(BuiltinClassLoader.java:581)
>         at java.base/jdk.internal.loader.ClassLoaders$AppClassLoader.loadClass(ClassLoaders.java:178)
>         at java.base/java.lang.ClassLoader.loadClass(ClassLoader.java:522)
>         ... 4 more
> Error: Failed to execute Flix program "target\channels\channels.jar"
> </pre>

### <span id="datalog_constraints">Examples `datalog-constraints`</span>[**&#x25B4;**](#top)

Command [**`build`**](./datalog-constraints/build.bat)` -verbose run` generates the target file `target\datalog-constraints\datalog-constraints.jar` from the [Flix] source file [`src\main\Main.flix`](./datalog-constraints/src/main/Main.flix) and runs the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./datalog-constraints/build.bat">build</a> -verbose run</b>
Copy 1 Flix source file to directory "target\datalog-constraints\src\"
Compile 1 Flix source file
Create archive file "target\datalog-constraints\datalog-constraints.jar"
Execute Flix program "target\datalog-constraints\datalog-constraints.jar"
(C++, x86) :: (MiniScala, C++) :: (MiniScala, x86) :: (Scala, C++) :: (Scala, MiniScala) :: (Scala, x86) :: Nil
</pre>

> **Note**: We need to specify the JVM option [`-Xbootclasspath/a:%SCALA_HOME%\lib\scala-library.jar`](https://docs.oracle.com/cd/E15289_01/JRCLR/optionx.htm#i1021218) at execution time in order to avoid the following runtime error :
> <pre style="font-size:80%;">
> <b>&gt; build -verbose run</b>
> Copy 1 Flix source file to directory "target\datalog-constraints\src\"
> Compile 1 Flix source file
> Create archive file "target\datalog-constraints\datalog-constraints.jar"
> Execute Flix program "target\datalog-constraints\datalog-constraints.jar"
> Exception in thread "main" java.lang.NoClassDefFoundError: scala/math/package$
>         at RedBlackTree.Def%useParallelEvaluation%179199.invoke(Unknown Source)
>         at Cont%Bool.unwind(Cont%Bool)
>         at Fixpoint.Clo%compile%193441.invoke(Unknown Source)
>         at Cont%Obj.unwind(Cont%Obj)
>         at RedBlackTree.Def%foreach%178505.invoke(Unknown Source)
>         at Cont%Obj.unwind(Cont%Obj)
>         at Fixpoint.Clo%solveWithStratification%193157.invoke(Unknown Source)
>         at Cont%Obj.unwind(Cont%Obj)
>         at Fixpoint.Clo%solve%193129.invoke(Unknown Source)
>         at Cont%Obj.unwind(Cont%Obj)
>         at Def%main%.invoke(Unknown Source)
>         at Cont%Obj.unwind(Cont%Obj)
>         at Ns.m_main%(Unknown Source)
>         at Main.main(Main)
> Caused by: java.lang.ClassNotFoundException: scala.math.package$
>         at java.base/jdk.internal.loader.BuiltinClassLoader.loadClass(BuiltinClassLoader.java:581)
>         at java.base/jdk.internal.loader.ClassLoaders$AppClassLoader.loadClass(ClassLoaders.java:178)
>         at java.base/java.lang.ClassLoader.loadClass(ClassLoader.java:522)
>         ... 14 more
> Error: Failed to execute Flix program "target\datalog-constraints\datalog-constraints.jar"
> </pre>
> The command line looks as follows (or run command `build run` with option ` -debug` to get it printed out in the console) :
> <pre style="font-size:80%;">
> "%JAVA_HOME%\bin\java.exe" "-Xbootclasspath/a:%SCALA_HOME%\lib\scala-library.jar" -jar "F:\examples\datalog-constraints\target\datalog-constraints\datalog-constraints.jar"
> (C++, x86) :: (MiniScala, C++) :: (MiniScala, x86) :: (Scala, C++) :: (Scala, MiniScala) :: (Scala, x86) :: Nil
> </pre>

### <span id="fibonacci">Example `fibonacci`</span>[**&#x25B4;**](#top)

Command [**`build -verbose run`**](./fibonacci/build.bat) generates the target file `target\fibonacci\fibonacci.jar` from the [Flix] source file [`src\main\Main.flix`](./fibonacci/src/main/Main.flix) and runs the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./fibonacci/build.bat">build</a> -verbose run</b>
Copy 1 Flix source file to directory "target\fibonacci\src\"
Compile 1 Flix source file
Create archive file "target\fibonacci\fibonacci.jar"
Execute Flix program "target\fibonacci\fibonacci.jar"
0 :: 1 :: 1 :: 2 :: 3 :: 5 :: 8 :: 13 :: 21 :: 34 :: Nil
</pre>

Command [**`build -verbose test`**](./fibonacci/build.bat) generates the target file `target\fibonacci\fibonacci.jar` from the [Flix] source files [`src\main\Main.flix`](./fibonacci/src/main/Main.flix) and [`src\test\TestMain.flix`](./fibonacci/src/test/TestMain.flix) and runs the tests:

<pre style="font-size:80%;">
<b>&gt; <a href="./fibonacci/build.bat">build</a> -verbose test</b>
Copy 1 Flix source file to directory "target\fibonacci\src\"
Copy 1 Flix test source file to directory "target\fibonacci\test\"
Compile 1 Flix source file and 1 Flix test source file
Create archive file "target\fibonacci\fibonacci.jar"
Execute tests for Flix program "target\fibonacci\fibonacci.jar"
Running 1 tests...

   PASS  test01 1,0ms
&nbsp;
Passed: 1, Failed: 0. Skipped: 0. Elapsed: 5,8ms.
</pre>

### <span id="lambda">Example `lambda-calculus`</span>

This code example is slightly more complex than the other examples presented on this page because it contains a [Scala] source file.

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f . | <a href="https://man7.org/linux/man-pages/man1/tail.1.html">tail</a> -n +3</b>
F:\EXAMPLES\LAMBDA-CALCULUS
|   <a href="./lambda-calculus/build.bat">build.bat</a>
|
\---src
    +---main
    |       <a href="./lambda-calculus/src/main/Counter.scala">Counter.scala</a>
    |       <a href="./lambda-calculus/src/main/lambda-calculus.flix">lambda-calculus.flix</a>
    |       <a href="./lambda-calculus/src/main/Main.flix">Main.flix</a>
    |
    \---test
            <a href="./lambda-calculus/src/test/TestMain.flix<">TestMain.flix</a>
</pre>

Concretely we perform two additional steps before calling the [Flix] commands **`build`** and **`build-jar`**:
- we compile **`Counter.scala`** into directory  **`target\lambda-calculus\lib\`** with the Scala command **`scalac`**. 
- we create **`target\lambda-calculus\lib\lib-lambda-calculus.jar`** with the Java command **`jar`**.

<pre style="font-size:80%;">
<b>&gt; <a href="./lambda-calculus/build.bat">build</a> -debug clean run</b>
[build] Properties : _PROJECT_NAME=lambda-calculus
[build] Options    : _NIGHTLY=0 _VERBOSE=0
[build] Subcommands: _COMMANDS= clean compile run
[build] Variables  : "FLIX_HOME=C:\opt\flix-0.31.0"
[build] Variables  : "JAVA_HOME=C:\opt\jdk-temurin-11.0.16_8"
[build] Variables  : "SCALA_HOME=C:\opt\scala-2.13.9"
[build] rmdir /s /q "F:\examples\lambda-calculus\target"
[build] 00000000000000 Target : 'F:\examples\lambda-calculus\target\lambda-calculus\lambda-calculus.jar'
[build] 20220924220123 Sources: 'F:\examples\lambda-calculus\src\main\*.flix'
[build] _ACTION_REQUIRED=1
[build] "C:\opt\jdk-temurin-11.0.16_8\bin\java.exe" -jar "C:\opt\flix-0.31.0\flix.jar" init
[build] xcopy /s /y "F:\examples\lambda-calculus\src\main" "F:\examples\lambda-calculus\target\lambda-calculus\src\" 1>NUL
[build] "C:\opt\scala-2.13.9\bin\scalac.bat" -cp "C:\opt\flix-0.31.0\flix.jar" -d "F:\examples\lambda-calculus\target\lambda-calculus\lib"  "F:\examples\lambda-calculus\target\lambda-calculus\src\Counter.scala"
[build] "C:\opt\jdk-temurin-11.0.16_8\bin\jar.exe" cf "F:\examples\lambda-calculus\target\lambda-calculus\lib\lib-lambda-calculus.jar" -C "F:\examples\lambda-calculus\target\lambda-calculus\lib" .
[build] "C:\opt\jdk-temurin-11.0.16_8\bin\java.exe" -cp "F:\examples\lambda-calculus\target\lambda-calculus\build" -jar "C:\opt\flix-0.31.0\flix.jar" build --explain
[build] "C:\opt\jdk-temurin-11.0.16_8\bin\java.exe" -jar "C:\opt\flix-0.31.0\flix.jar" build-jar
[build] "C:\opt\jdk-temurin-11.0.16_8\bin\java.exe" "-Xbootclasspath/a:C:\opt\scala-2.13.9\lib\scala-library.jar;F:\examples\lambda-calculus\target\lambda-calculus\lib\lib-lambda-calculus.jar" -jar "F:\examples\lambda-calculus\target\lambda-calculus\lambda-calculus.jar"
Abs(1, Abs(0, Var(0)))
[build] _EXITCODE=0
</pre>

### <span id="mutability">Example `mutability`</span>[**&#x25B4;**](#top)

Command [`build`](./mutability/build.bat)` -debug run` generates the target file `target\mutability\mutability.jar` from the [Flix] source file [`src\Main.flix`](./mutability/src/Main.flix) and runs the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./mutability/build.bat">build -debug run</a></b>
[build] Properties : _PROJECT_NAME=mutability
[build] Options    : _NIGHTLY=0 _VERBOSE=0
[build] Subcommands: _COMMANDS= compile run
[build] Variables  : "FLIX_HOME=C:\opt\flix-0.31.0"
[build] Variables  : "JAVA_HOME=C:\opt\jdk-temurin-11.0.16_8"
[build] Variables  : "SCALA_HOME=C:\opt\scala-2.13.9"
[build] 00000000000000 Target : 'F:\examples\mutability\target\mutability\mutability.jar'
[build] 20220908185859 Sources: 'F:\examples\mutability\src\*.flix'
[build] _ACTION_REQUIRED=1
[build] "C:\opt\jdk-temurin-11.0.16_8\bin\java.exe" -jar "C:\opt\flix-0.31.0\flix.jar" init
[build] xcopy /s /y "F:\examples\mutability\src" "F:\examples\mutability\target\mutability\src\" 1>NUL
[build] "C:\opt\jdk-temurin-11.0.16_8\bin\java.exe" -jar "C:\opt\flix-0.31.0\flix.jar" build
[build] "C:\opt\jdk-temurin-11.0.16_8\bin\java.exe" -jar "C:\opt\flix-0.31.0\flix.jar" build-jar
[build] "C:\opt\jdk-temurin-11.0.16_8\bin\java.exe"  -jar "F:\examples\mutability\target\mutability\mutability.jar"
1 :: 2 :: 3 :: Nil
[build] _EXITCODE=0
</pre>

### <span id="primes">Example `primes`</span>

Command [`build run`](./primes/build.bat) generates the target file `target\primes\primes.jar` from the [Flix] source file [`src\main\Main.flix`](./primes/src/main/Main.flix) and runs the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./primes/build.bat">build</a> run</b>
Using 'primes'
2 :: 3 :: 5 :: 7 :: 11 :: 13 :: 17 :: 19 :: 23 :: 29 :: Nil
Using 'primes2'
2 :: 3 :: 5 :: 7 :: 11 :: 13 :: 17 :: 19 :: 23 :: 29 :: Nil
</pre>

Command [**`build -verbose test`**](./primes/build.bat) generates the target file `target\primes\primes.jar` from the [Flix] source files [`src\main\Main.flix`](./primes/src/main/Main.flix) and [`src\test\TestMain.flix`](./primes/src/test/TestMain.flix) and runs the tests:

<pre style="font-size:80%;">
<b>&gt; <a href="./primes/build.bat">build</a> -verbose test</b>
Running 2 tests...
&nbsp;
   PASS  test01 892,4us
   PASS  test02 278,4us

Passed: 2, Failed: 0. Skipped: 0. Elapsed: 5,7ms.
</pre>

<!--=======================================================================-->

## <span id="footnotes">Footnotes</span>[**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Flix commands*** [↩](#anchor_01)

<dl><dd>
We give option <code><b>--help</b></code> to display the Flix commands :
<pre style="font-size:80%;">
<b>&gt; "%JAVA_HOME%\bin\java.exe" -jar "%FLIX_HOME%\flix.jar" --help</b>
The Flix Programming Language v0.31.0
Usage: flix [init|check|build|build-jar|build-pkg|run <b>↲</b><br/>&emsp;|benchmark|test|repl|install|lsp] [options] &lt;args&gt;...
&nbsp;
Command: <a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/tools/Packager.scala#L76"><b>init</b></a>
  creates a new project in the current directory.
Command: <a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/tools/Packager.scala#L155"><b>check</b></a>
  checks the current project for errors.
Command: <a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/tools/Packager.scala#L174"><b>build</b></a>
  builds (i.e. compiles) the current project.
Command: <a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/tools/Packager.scala#L237"><b>build-jar</b></a>
  builds a jar-file from the current project.
Command: <a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/tools/Packager.scala#L275"><b>build-pkg</b></a>
  builds a fpkg-file from the current project.
Command: <a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/tools/Packager.scala#L316"><b>run</b></a>
  runs main for the current project.
Command: <a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/tools/Packager.scala#L330"><b>benchmark</b></a>
  runs the benchmarks for the current project.
Command: <a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/tools/Packager.scala#L340"><b>test</b></a>
  runs the tests for the current project.
Command: <b>repl</b>
  starts a repl for the current project, or provided Flix source files.
Command: <b>install project</b>
  installs the Flix package from the given GitHub <owner>/<repo>
  project
Command: <b>lsp port</b>
  starts the LSP server and listens on the given port.
  port
&nbsp;
  --args &lt;a1, a2, ...>     arguments passed to main. Must be a single quoted string.
  --benchmark              runs benchmarks.
  --doc                    generates HTML documentation.
  --entrypoint &lt;value>     specifies the main entry point.
  --explain                provides suggestions on how to solve a problem
  --help                   prints this usage information.
  --json                   enables json output.
  --listen &lt;port>          starts the socket server and listens on the given port.
  --lsp &lt;port>             starts the LSP server and listens on the given port.
  --output &lt;value>         specifies the output directory for JVM bytecode.
  --test                   runs unit tests.
  --threads &lt;value>        number of threads to use for compilation.
  --version                prints the version number.
&nbsp;
The following options are experimental:
  --Xbenchmark-code-size   [exp.] benchmarks the size of the generated JVM files.
  --Xbenchmark-incremental
                           [exp.] benchmarks the performance of each compiler phase in incremental mode.
  --Xbenchmark-phases      [exp.] benchmarks the performance of each compiler phase.
  --Xbenchmark-throughput  [exp.] benchmarks the performance of the entire compiler.
  --Xdebug                 [exp.] enables compiler debugging output.
  --Xlib &lt;value>           [exp.] controls the amount of std. lib. to include (nix, min, all).
  --Xno-bool-table         [exp.] disables Boolean minimization via tabling.
  --Xstatistics            [exp.] prints compilation statistics.
  --Xstrictmono            [exp.] enable strict monomorphization.
  --Xno-set-effects        [exp.] disable set effects
  --Xno-bool-effects       [exp.] disable bool effects
&nbsp;
  &lt;file&gt;...                input Flix source code files, Flix packages, and Java archives.
</pre>
</dd></dl>

<span id="footnote_02">[2]</span> ***Flix-managed project directory*** [↩](#anchor_02)

<dl><dd>
Flix project directories must have a special layout enforced by the Flix command <code>init</code>. In particular the documentation files <code>HISTORY.md</code>, <code>LICENSED.md</code> and <code>README.md</code> must exist inside the project directory in order to run the Flix commands <code>build</code>, <code>build-jar</code>, etc.
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/October 2022* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- href links -->

[flix]: https://flix.dev/
[make_cli]: https://www.gnu.org/software/make/manual/make.html
[scala]: https://www.scala-lang.org/
