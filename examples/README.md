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

We currently support five ways to build/run/test our [Flix] code examples:

| Build tool          | Configuration file(s)  | Parent file(s) | Environment(s) |
|---------------------|------------------------|----------------|----------------|
| [**`build.bat`**](areas/build.bat) | &nbsp;                 | &nbsp; | MS Windows |
| [**`build.sh`**](areas/build.sh) | &nbsp;                 | &nbsp; | Cygwin / MSYS2 / Unix |
| [**`ant.bat`**][apache_ant_cli] | [**`build.xml`**](./areas/build.xml) | &nbsp; | Any <sup><b>a)</b></sup> |
| [**`gradle.exe`**][gradle_cli] | [**`build.gradle`**](areas/build.gradle) | [**`common.gradle`**](common.gradle) | Any  |
| [**`make.exe`**][make_cli] | [**`Makefile`**](areas/Makefile) | [**`Makefile.inc`**](./Makefile.inc)  | Any |
<div style="margin:0 15% 0 8px;font-size:90%;">
<sup><b>a)</b></sup> Here "Any" means "tested on MS Windows / Cygwin / MSYS2 / Unix".<br/>&nbsp;
</div>

The [Flix] projects presented below share the same directory layout as project `areas`, namely :
1. Project directory `areas\` initially looks as follows :
   <pre style="font-size:80%;">
   <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f areas | <a href="https://man7.org/linux/man-pages/man1/tail.1.html">tail</a> -n +3</b>
   F:\EXAMPLES\AREAS
   |   <a href="./areas/build.bat">build.bat</a>
   |   <a href="./areas/build.sh">build.sh</a>
   |   <a href="./areas/build.gradle">build.gradle</a>  <i>(<a href="./common.gradle">..\common.gradle</a>)</i>
   |   <a href="./areas/gradle.properties">gradle.properties</a>
   |   <a href="./areas/Makefile">Makefile</a>      <i>(<a href="./Makefile.inc">..\Makefile.inc</a>)</i>
   \---<b>src</b>
        +---<b>main</b>
        |       <a href="./areas/src/main/Main.flix">Main.flix</a>
        \---<b>test</b>
                <a href="./areas/src/test/TestMain.flix">TestMain.flix</a>
   </pre>

3. Before compilation we run the [Flix] command `init` <sup id="anchor_01">[1](#footnote_01)</sup> to create a Flix-managed <sup id="anchor_02">[2](#footnote_02)</sup> subdirectory `target\areas\` and we populate it with the [Flix] source files from the `src\main\` and `src\test\` directories :
   <pre style="font-size:80%;">
   <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f areas | <a href="https://man7.org/linux/man-pages/man1/tail.1.html">tail</a> -n +3</b>
   F:\EXAMPLES\AREAS
   |   <a href="./areas/build.bat">build.bat</a>
   |   <a href="./areas/build.sh">build.sh</a>
   |   <a href="./areas/build.gradle">build.gradle</a>   <i>(<a href="./common.gradle">..\common.gradle</a>)</i>
   |   <a href="./areas/gradle.properties">gradle.properties</a>
   |   <a href="./areas/Makefile">Makefile</a>       <i>(<a href="./Makefile.inc">..\Makefile.inc</a>)</i>
   +---<b>src</b>
   |   +---<b>main</b>
   |   |       <a href="./areas/src/main/Main.flix">Main.flix</a>
   |   \---<b>test</b>
   |           <a href="./areas/src/test/TestMain.flix">TestMain.flix</a>
   \---<b>target</b>
       \---<b>areas</b>
           +---build
           +---lib
           +---src\Main.flix       <i>(copied from src\main\)</i>
           \---test\TestMain.flix  <i>(copied from src\test\)</i>
           LICENSE.md, README.md   <i>(generated placeholders)</i>
   </pre>

2. During compilation we run the two [Flix] commands `build` <sup id="anchor_01">[1](#footnote_01)</sup> and `build-jar` to successively generate the Java class files in subdirectory `target\areas\build\` and the target file `target\areas\areas.jar` :
   <pre style="font-size:80%;">
   <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f areas |<a href="https://man7.org/linux/man-pages/man1/tail.1.html">tail</a> -n +3</b>
   F:\EXAMPLES\AREAS
   |   <a href="./areas/build.bat">build.bat</a>
   |   <a href="./areas/build.sh">build.sh</a>
   |   <a href="./areas/build.gradle">build.gradle</a>   <i>(<a href="./common.gradle">..\common.gradle</a>)</i>
   |   <a href="./areas/gradle.properties">gradle.properties</a>
   |   <a href="./areas/Makefile">Makefile</a>       <i>(<a href="./Makefile.inc">..\Makefile.inc</a>)</i>
   +---<b>src</b>
   |   +---<b>main</b>
   |   |       <a href="./areas/src/main/Main.flix">Main.flix</a>
   |   \---<b>test</b>
   |           <a href="./areas/src/test/TestMain.flix">TestMain.flix</a>
   \---<b>target</b>
       \---<b>areas</b>   <i>(Flix-managed directory)</i>
           +---<b>build</b>
           |   +---<b>dev</b>
           |   |   \---<b>flix</b>
           |   |       \---runtime\*.class
           |   +---Iterator\*.class
           |   +---List\*.class
           |   \---StringBuilder\*.class
           +---<b>lib</b>
           +---src\Main.flix       <i>(copied from src\main\)</i>
           \---test\TestMain.flix  <i>(copied from src\main\)</i>
           areas.jar
           LICENSE.md, README.md
   </pre>

> **:mag_right:** Command [**`examples\build.bat`**](./build.bat) allows us to clean, build and run all projects in directory **`examples\`**, for instance before updating our Github repository [`flix-examples`](https://github.com/michelou/flix-examples) with local changes.

### <span id="areas">Example `areas`</span>

Command [**`build.bat -verbose run`**](./areas/build.bat) <sup id="anchor_03">[3](#footnote_03)</sup> generates the target file `target\areas\areas.jar` from the [Flix] source file [`src\main\Main.flix`](./areas/src/main/Main.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./areas/build.bat">build</a> -verbose run</b>
Copy 1 Flix source file to directory "target\areas\src\"
Compile 1 Flix source file into directory "target\areas\build\"
Create archive file "target\areas\areas.jar"
Execute Flix program "target\areas\areas.jar"
2 :: 6 :: Nil
2 :: 6 :: Nil
</pre>

Command [**`build.bat -verbose test`**](./areas/build.bat) generates the target file `target\areas\areas.jar` from the [Flix] source files [`src\main\Main.flix`](./areas/src/main/Main.flix) and [`src\test\TestMain.flix`](./areas/src/test/TestMain.flix) and runs the tests:

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

> **:mag_right:** We provide other ways to build/run/test our [Flix] code examples :
> 1. Command [**`make.exe`**][make_cli] reads its configuration from the two configuration files [**`Makefile`**](./areas/Makefile) and [**`Makefile.inc`**](./Makefile.inc) (we can use option **`--silent`** to hide the executed commands):
>    <pre style="font-size:80%;">
>     <b>&gt; <a href="https://www.gnu.org/software/make/manual/make.html">make</a> run</b>
>    [ -d "target/areas" ] || "C:/opt/Git-2.39.0/usr/bin/mkdir.exe" -p "target/areas"
>    cd "target/areas"; \
>         [ -d "build" ] || "C:/opt/jdk-temurin-11.0.17_8/bin/java.exe" -jar "C:\opt\flix-0.34.0/flix.jar" init && \
>         "C:/opt/Git-2.39.0/usr/bin/rm.exe" -f "src/Main.flix" && \
>         "C:/opt/Git-2.39.0/usr/bin/cp.exe" -r "F:/examples/areas/src/main/." src && \
>         "C:/opt/jdk-temurin-11.0.17_8/bin/java.exe" -jar "C:\opt\flix-0.34.0/flix.jar" build && \
>         "C:/opt/jdk-temurin-11.0.17_8/bin/java.exe" -jar "C:\opt\flix-0.34.0/flix.jar" build-jar
>    "C:/opt/jdk-temurin-11.0.17_8/bin/java.exe"  -jar "target/areas/areas.jar"
>    2 :: 6 :: Nil
>    2 :: 6 :: Nil
>    &nbsp;
>    <b>&gt; <a href="https://www.gnu.org/software/make/manual/make.html">make</a> --silent test</b>
>    Running 2 tests...
>    &nbsp;
>       PASS  test01 806,3us
>       PASS  test02 115,4us
>    &nbsp;
>    Passed: 2, Failed: 0. Skipped: 0. Elapsed: 6,3ms.
>    </pre>
> 2. Command [**`gradle.bat`**][gradle_cli] reads its configuration from the two configuration files [**`build.gradle`**](./areas/build.gradle) and [**`common.gradle`**](./common.gradle) :
>    <pre style="font-size:80%";>
>    <b>&gt; <a href="https://docs.gradle.org/current/userguide/command_line_interface.html" rel="external">gradle</a> run</b>
>    &nbsp;
>    &gt; Task :compileFlix
>    &nbsp;
>    &gt; Task :run
>    2 :: 6 :: Nil
>    2 :: 6 :: Nil
>    &nbsp;
>    BUILD SUCCESSFUL in 15s
>    7 actionable tasks: 7 executed
>    </pre>
> 3. Command [**`bash.exe`**][bash_cli] targets a Unix-like environment in the same way as <code><b>build.bat</b></code> targets the Windows environment:
>    <pre style="font-size:80%;">
>    <b>&gt; <a href="https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_01.html" rel="external">bash</a> <a href="./areas/build.sh">build.sh</a> -verbose run</b>
>    Initialize directory "target/areas"
>    Copy Flix source files to directory "target/areas/src"
>    Copy Flix test source files to directory "target/areas/test"
>    Compile 1 Flix source file to directory "target/areas/build"
>    Create archive file "target/areas/areas.jar"
>    Execute the JAR file "target/areas/areas.jar"
>    2 :: 6 :: Nil
>    2 :: 6 :: Nil
>    </pre>

### <span id="channels">Example `channels`</span> [**&#x25B4;**](#top)

Command [**`build.bat -verbose run`**](./channels/build.bat) generates the target file `target\channels\channels.jar` from the [Flix] source file [`src\main\Main.flix`](./channels/src/main/Main.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./channels/build.bat">build</a> -verbose run</b>
Copy 1 Flix source file to directory "target\channels\src\"
Compile 1 Flix source file to directory "target\channels\src\"
Create archive file "target\channels\channels.jar"
Extract Flix runtime from archive file "C:\opt\flix-0.34.0\flix.jar"
Add Flix runtime to archive file "target\channels\channels.jar"
Execute Flix program "target\channels\channels.jar"
1 :: 2 :: 3 :: Nil
</pre>

> **Note**: The [Flix] command <code>build-jar</code> does not add the [Flix] runtime to the generated archive file <code>target\channels\channels.jar</code>, so we need to update it with class files extracted from <code>flix.jar</code> and belonging to package <a href="https://github.com/flix/flix/tree/master/main/src/ca/uwaterloo/flix/runtime"><code>ca.uwaterloo.flix.runtime</code></a>.<br/>Without that additional step we get the following runtime error :
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

Command [**`build.bat -verbose run`**](./datalog-constraints/build.bat) generates the target file `target\datalog-constraints\datalog-constraints.jar` from the [Flix] source file [`src\main\Main.flix`](./datalog-constraints/src/main/Main.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./datalog-constraints/build.bat">build</a> -verbose run</b>
Copy 1 Flix source file to directory "target\datalog-constraints\src\"
Compile 1 Flix source file into directory "target\datalog-constraints\build\"
Create archive file "target\datalog-constraints\datalog-constraints.jar"
Execute Flix program "target\datalog-constraints\datalog-constraints.jar"
(C++, x86) :: (MiniScala, C++) :: (MiniScala, x86) :: (Scala, C++) :: (Scala, MiniScala) :: (Scala, x86) :: Nil
</pre>
<!-- workaround is no more needed with 0.34.0 and newer -->
<!--
> **Note**: We need to specify the JVM option [`-Xbootclasspath/a:%SCALA_HOME%\lib\scala-library.jar`](https://docs.oracle.com/cd/E15289_01/JRCLR/optionx.htm#i1021218) at execution time in order to avoid the runtime error `java.lang.NoClassDefFoundError: scala/math/package$` :
> <pre style="font-size:80%;">
> <b>&gt; <a href="./datalog-constraints/build.bat">build</a> -verbose run</b>
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
-->
### <span id="fibonacci">Example `fibonacci`</span>[**&#x25B4;**](#top)

Command [**`build.bat -verbose run`**](./fibonacci/build.bat) generates the target file `target\fibonacci\fibonacci.jar` from the [Flix] source file [`src\main\Main.flix`](./fibonacci/src/main/Main.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./fibonacci/build.bat">build</a> -verbose run</b>
Copy 1 Flix source file to directory "target\fibonacci\src\"
Compile 1 Flix source file into directory "target\fibonacci\build\"
Create archive file "target\fibonacci\fibonacci.jar"
Execute Flix program "target\fibonacci\fibonacci.jar"
0 :: 1 :: 1 :: 2 :: 3 :: 5 :: 8 :: 13 :: 21 :: 34 :: Nil
</pre>

Command [**`build.bat -verbose test`**](./fibonacci/build.bat) generates the target file `target\fibonacci\fibonacci.jar` from the [Flix] source files [`src\main\Main.flix`](./fibonacci/src/main/Main.flix) and [`src\test\TestMain.flix`](./fibonacci/src/test/TestMain.flix) and runs the tests:

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

### <span id="lambda_calculus">Example `lambda-calculus`</span>

This example is slightly more complex than the other examples because it contains several source files, including the [Scala] source file [`Counter.scala`](./lambda-calculus/src/main/Counter.scala).

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f . | <a href="https://man7.org/linux/man-pages/man1/tail.1.html">tail</a> -n +3</b>
F:\EXAMPLES\LAMBDA-CALCULUS
|   <a href="./lambda-calculus/build.bat">build.bat</a>
|   <a href="./lambda-calculus/build.sh">build.sh</a>
|   <a href="./lambda-calculus/build.gradle">build.gradle</a>   <i>(<a href="./common.gradle">..\common.gradle</a>)</i>
|   <a href="./lambda-calculus/gradle.properties">gradle.properties</a>
|   <a href="./lambda-calculus/Makefile">Makefile</a>       <i>(<a href="./Makefile.inc">..\Makefile.inc</a>)</i>
\---<b>src</b>
    +---<b>main</b>
    |       <a href="./lambda-calculus/src/main/Counter.scala">Counter.scala</a>
    |       <a href="./lambda-calculus/src/main/lambda-calculus.flix">lambda-calculus.flix</a>
    |       <a href="./lambda-calculus/src/main/Main.flix">Main.flix</a>
    \---<b>test</b>
            <a href="./lambda-calculus/src/test/TestMain.flix<">TestMain.flix</a>
</pre>

> **:mag_right:** [`Counter.scala`](./lambda-calculus/src/main/Counter.scala) implements the stateful object `Counter` with one single method `getNext()`. In source file [`lambda-calculus.flix`](./lambda-calculus/src/main/lambda-calculus.flix) we call `getNext()` instead of [`???`](https://stackoverflow.com/questions/47717583/what-is-in-scala) (the "unimplemented" function) inside function `freshVar()` in order to obtain a runnable example :
> <pre style="font-size:80%;">
> <b>def</b> freshVar(): Int32 = // <a href="https://stackoverflow.com/questions/47717583/what-is-in-scala">???</a>
>     <b>import static</b> Counter.getNext(): Int32 \ {};
>     getNext()
> </pre>

Concretely we perform two additional steps before calling the [Flix] commands **`build`** and **`build-jar`**:
- we compile **`Counter.scala`** into directory  **`target\lambda-calculus\lib\`** with the Scala command [**`scalac.bat`**][scalac_cli]. 
- we create **`target\lambda-calculus\lib\lib-lambda-calculus.jar`** with the Java command [**`jar.exe`**][jar_cli].

<pre style="font-size:80%;">
<b>&gt; <a href="./lambda-calculus/build.bat">build</a> -debug clean run</b>
[build] Properties : _PROJECT_NAME=lambda-calculus
[build] Options    : _NIGHTLY=0 _VERBOSE=0
[build] Subcommands: _COMMANDS= clean compile run
[build] Variables  : "FLIX_HOME=C:\opt\flix-0.34.0"
[build] Variables  : "JAVA_HOME=C:\opt\jdk-temurin-11.0.17_8"
[build] Variables  : "SCALA_HOME=C:\opt\scala-2.13.10"
[build] rmdir /s /q "F:\examples\lambda-calculus\target"
[build] 00000000000000 Target : 'F:\examples\lambda-calculus\target\lambda-calculus\lambda-calculus.jar'
[build] 20220924220123 Sources: 'F:\examples\lambda-calculus\src\main\*.flix'
[build] _ACTION_REQUIRED=1
[build] "C:\opt\jdk-temurin-11.0.17_8\bin\java.exe" -jar "C:\opt\flix-0.34.0\flix.jar" init
[build] xcopy /s /y "F:\examples\lambda-calculus\src\main" "F:\examples\lambda-calculus\target\lambda-calculus\src\" 1>NUL
[build] "C:\opt\scala-2.13.10\bin\scalac.bat" -cp "C:\opt\flix-0.34.0\flix.jar" -d "F:\examples\lambda-calculus\target\lambda-calculus\lib"  "F:\examples\lambda-calculus\target\lambda-calculus\src\Counter.scala"
[build] "C:\opt\jdk-temurin-11.0.17_8\bin\jar.exe" cf "F:\examples\lambda-calculus\target\lambda-calculus\lib\lib-lambda-calculus.jar" -C "F:\examples\lambda-calculus\target\lambda-calculus\lib" .
[build] "C:\opt\jdk-temurin-11.0.17_8\bin\java.exe" -cp "F:\examples\lambda-calculus\target\lambda-calculus\build" -jar "C:\opt\flix-0.34.0\flix.jar" build --explain
[build] "C:\opt\jdk-temurin-11.0.17_8\bin\java.exe" -jar "C:\opt\flix-0.34.0\flix.jar" build-jar
[build] "C:\opt\jdk-temurin-11.0.17_8\bin\java.exe" "-Xbootclasspath/a:F:\examples\lambda-calculus\target\lambda-calculus\lib\lib-lambda-calculus.jar" -jar "F:\examples\lambda-calculus\target\lambda-calculus\lambda-calculus.jar"
Abs(1, Abs(0, Var(0)))
[build] _EXITCODE=0
</pre>

### <span id="mutability">Example `mutability` </span>[**&#x25B4;**](#top)

Command [`build.bat`](./mutability/build.bat)` -debug run` generates the target file `target\mutability\mutability.jar` from the [Flix] source file [`src\Main.flix`](./mutability/src/Main.flix) and runs the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./mutability/build.bat">build -debug run</a></b>
[build] Properties : _PROJECT_NAME=mutability
[build] Options    : _NIGHTLY=0 _VERBOSE=0
[build] Subcommands: _COMMANDS= compile run
[build] Variables  : "FLIX_HOME=C:\opt\flix-0.34.0"
[build] Variables  : "JAVA_HOME=C:\opt\jdk-temurin-11.0.17_8"
[build] Variables  : "SCALA_HOME=C:\opt\scala-2.13.10"
[build] 00000000000000 Target : 'F:\examples\mutability\target\mutability\mutability.jar'
[build] 20220908185859 Sources: 'F:\examples\mutability\src\*.flix'
[build] _ACTION_REQUIRED=1
[build] "C:\opt\jdk-temurin-11.0.17_8\bin\java.exe" -jar "C:\opt\flix-0.34.0\flix.jar" init
[build] xcopy /s /y "F:\examples\mutability\src" "F:\examples\mutability\target\mutability\src\" 1>NUL
[build] "C:\opt\jdk-temurin-11.0.17_8\bin\java.exe" -jar "C:\opt\flix-0.34.0\flix.jar" build
[build] "C:\opt\jdk-temurin-11.0.17_8\bin\java.exe" -jar "C:\opt\flix-0.34.0\flix.jar" build-jar
[build] "C:\opt\jdk-temurin-11.0.17_8\bin\java.exe"  -jar "F:\examples\mutability\target\mutability\mutability.jar"
1 :: 2 :: 3 :: Nil
[build] _EXITCODE=0
</pre>

### <span id="named_arguments">Example `named-arguments`</span> </span>[**&#x25B4;**](#top)

Command [`gradle.bat run`][gradle_cli] ([`build.gradle`](./named-arguments/build.gradle)/[`common.gradle`](./common.gradle)) generates the target file `target\named-arguments\named-arguments.jar` from the [Flix] source file [`src\main\named-arguments.flix`](./named-arguments/src/main/named-arguments.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.gradle.org/current/userguide/command_line_interface.html">gradle</a> -Dnightly clean run</b>
&nbsp;
&gt; Configure project :
Nightly build 'flix-2023-01-01.jar' was selected
&nbsp;
&gt; Task :compileFlix
&nbsp;
&gt; Task :run
Player(1, 0)
&nbsp;
BUILD SUCCESSFUL in 18s
8 actionable tasks: 8 executed
</pre>

### <span id="primes">Example `primes`</span>

Command [`build.bat run`](./primes/build.bat) generates the target file `target\primes\primes.jar` from the [Flix] source file [`src\main\Main.flix`](./primes/src/main/Main.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./primes/build.bat">build</a> run</b>
Using 'primes'
2 :: 3 :: 5 :: 7 :: 11 :: 13 :: 17 :: 19 :: 23 :: 29 :: Nil
Using 'primes2'
2 :: 3 :: 5 :: 7 :: 11 :: 13 :: 17 :: 19 :: 23 :: 29 :: Nil
</pre>

Command [**`build.bat -verbose test`**](./primes/build.bat) generates the target file `target\primes\primes.jar` from the [Flix] source files [`src\main\Main.flix`](./primes/src/main/Main.flix) and [`src\test\TestMain.flix`](./primes/src/test/TestMain.flix) and runs the tests:

<pre style="font-size:80%;">
<b>&gt; <a href="./primes/build.bat">build</a> -verbose test</b>
Running 2 tests...
&nbsp;
   PASS  test01 892,4us
   PASS  test02 278,4us

Passed: 2, Failed: 0. Skipped: 0. Elapsed: 5,7ms.
</pre>

### <span id="records">Example `records`</span> [**&#x25B4;**](#top)

Command [`build.bat run`](./records/build.bat) generates the target file `target\records\records.jar` from the [Flix] source file [`src\main\Main.flix`](./records/src/main/Main.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./records/build.bat">build</a> run</b>
r1 = { 1, 2 }
r2 = { 1, 2 }
r1 == r2: true
r3 = { 3, 2 }
</pre>

### <span id="trees">Example `trees`</span>

Command [`build.bat run`](./trees/build.bat) generates the target file `target\trees\trees.jar` from the [Flix] source file [`src\main\Main.flix`](./trees/src/main/Main.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./trees/build.bat">build</a> run</b>
10
</pre>

### <span id="type-aliases">Example `type-aliases`</span>

Command [`build.bat run`](./type-aliases/build.bat) generates the target file `target\type-aliases\type-aliases.jar` from the [Flix] source file [`src\main\Main.flix`](./type-aliases/src/main/Main.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./type-aliases/build.bat">build</a> run</b>
Map#{1 => Hello, 2 => World}
Map#{1 => Ok(123), 2 => Err(Hello)}
</pre>

<!--=======================================================================-->

## <span id="footnotes">Footnotes</span>[**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Flix commands*** [↩](#anchor_01)

<dl><dd>
We give option <code><b>--help</b></code> to display the Flix commands :
<pre style="font-size:80%;">
<b>&gt; "%JAVA_HOME%\bin\java.exe" -jar "%FLIX_HOME%\flix.jar" --help</b>
The Flix Programming Language v0.34.0
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
<a href="https://flix.dev/" rel="external">Flix</a> project directories must have a special layout enforced by the Flix command <a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/tools/Packager.scala#L76" rel="external"><code>init</code></a>. For instance the documentation files <code>LICENSE.md</code> and <code>README.md</code> must exist inside the project directory in order to run the <a href="https://flix.dev/" rel="external">Flix</a> commands <a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/tools/Packager.scala#L174" rel="external"><code>build</code></a>, <a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/tools/Packager.scala#L237" rel="external"><code>build-jar</code></a>, etc.
<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /a /f . | <a href="https://man7.org/linux/man-pages/man1/tail.1.html" rel="external">tail</a> -n +3</b>
F:\EXAMPLES\SAMPLE
|   LICENSE.md, README.md
+---<b>build</b>
+---<b>lib</b>
+---<b>src</b>
|       Main.flix
\---<b>test</b>
        TestMain.flix
</pre>
</dd></dl>

<span id="footnote_03">[3]</span> ***Flix nightly builds*** [↩](#anchor_03)

<dl><dd>
We can select the latest nightly build of the <a href="https://flix.dev/" rel="external">Flix</a> library instead of the release version to generate the target JAR file for each of the above examples :
<ul>
<li><code><b>build.bat</b></code> supports the <code>-nightly</code> option.</li>
<li><code><b>make.exe</b></code> supports the <code>NIGHTLY=1</code> property.</li>
<li><code><b>gradle.bat</b></code> supports the <code>-Dnightly</code> property.</li>
</ul>
Here is how it works with the <code>areas</code> example :
<pre style="font-size:80%;">
<b>&gt; <a href="./areas/build.bat">build</a> -verbose -nightly clean run</b>
Nightly build "flix-2023-01-01.jar" was selected
Delete directory "target"
Initialize Flix project directory "target\areas"
Copy 1 Flix source file to directory "target\areas\src\"
Compile 1 Flix source file into directory "target\areas\build\"
Create archive file "target\areas\areas.jar"
Execute Flix program "target\areas\areas.jar"
2 :: 6 :: Nil
2 :: 6 :: Nil
</pre>

<pre style="font-size:80%;">
<b>&gt; <a href="https://www.gnu.org/software/make/manual/make.html" rel="external">make</a> NIGHTLY=1 run</b>
[ -d "target/areas" ] || "C:/opt/Git-2.39.0/usr/bin/mkdir.exe" -p "target/areas"
cd "target/areas"; \
        [ -d "build" ] || "C:/opt/jdk-temurin-11.0.17_8/bin/java.exe" -jar "C:\opt\flix-0.34.0/flix-2022-10-29.jar" init && \
        "C:/opt/Git-2.39.0/usr/bin/rm.exe" -f "src/Main.flix" && \
        "C:/opt/Git-2.39.0/usr/bin/cp.exe" -r "F:/examples/areas/src/main/." src && \
        "C:/opt/jdk-temurin-11.0.17_8/bin/java.exe" -jar "C:\opt\flix-0.34.0/flix-2022-10-12.jar" build && \
        "C:/opt/jdk-temurin-11.0.17_8/bin/java.exe" -jar "C:\opt\flix-0.34.0/flix-2022-10-12.jar" build-jar
"C:/opt/jdk-temurin-11.0.17_8/bin/java.exe"  -jar "target/areas/areas.jar"
2 :: 6 :: Nil
2 :: 6 :: Nil
</pre>
<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.gradle.org/current/userguide/command_line_interface.html" rel="external">gradle</a> -Dnightly run</b>
&nbsp;
&gt; Configure project :
Nightly build 'flix-2022-10-29.jar' was selected
&nbsp;
&g; Task :compileFlix
&nbsp;
&gt; Task :run
2 :: 6 :: Nil
2 :: 6 :: Nil

BUILD SUCCESSFUL in 15s
7 actionable tasks: 7 executed
</pre>

</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/January 2023* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- href links -->

[apache_ant_cli]: https://ant.apache.org/manual/running.html
[bash_cli]: https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_01.html
[flix]: https://flix.dev/
[gradle_cli]: https://docs.gradle.org/current/userguide/command_line_interface.html
[jar_cli]: https://docs.oracle.com/en/java/javase/13/docs/specs/man/jar.html
[make_cli]: https://www.gnu.org/software/make/manual/make.html
[scala]: https://www.scala-lang.org/
[scalac_cli]: https://docs.scala-lang.org/overviews/compiler-options/index.html
