# <span id="top">Flix Examples</span> <span style="size:25%;"><a href="../README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 8px 0 0;;min-width:160px;">
    <a href="https://flix.dev/" rel="external"><img src="../docs/images/flix-logo.png" width="160" alt="Flix project"/></a>
  </td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>examples\</code></strong> contains <a href="https://flix.dev/" rel="external">Flix</a> code examples coming from various websites - mostly from the <a href="https://flix.dev/" rel="external">Flix</a> project.
  </td>
  </tr>
</table>

We currently support five ways to build/run/test our [Flix] code examples:

| Build&nbsp;tool     | Build&nbsp;file | Parent&nbsp;file | Environment(s) |
|---------------------|-----------------|------------------|----------------|
| [**`cmd.exe`**][cmd_cli] | [`build.bat`](areas/build.bat) | &nbsp; | MS Windows |
| [**`sh.exe`**][sh_cli] | [`build.sh`](areas/build.sh) | &nbsp; | Any <sup><b>a)</b></sup> |
| [**`ant.bat`**][apache_ant_cli] | [`build.xml`](./areas/build.xml) | &nbsp; | Any |
| [**`gradle.exe`**][gradle_cli] | [`build.gradle`](areas/build.gradle) | [`common.gradle`](common.gradle) | Any  |
| [**`make.exe`**][make_cli] <sup><b>b)</b></sup> | [`Makefile`](areas/Makefile) | [`Makefile.inc`](./Makefile.inc)  | Any |
<div style="margin:0 15% 0 10px;font-size:80%;">
<sup><b>a)</b></sup> Here "Any" means "tested on MS Windows / Cygwin / MSYS2 / Unix"<br/>
<sup><b>b)</b></sup> Default shell is <code><b>/bin/sh</b></code> as described in the online document <a href="https://www.gnu.org/software/make/manual/html_node/Choosing-the-Shell.html">Choosing the Shell</a>.<br/>
&nbsp;
</div>

> **:mag_right:** Command [**`examples\build.bat`**](./build.bat) allows us to clean, build and run all projects in directory **`examples\`**, for instance before updating our Github repository [`flix-examples`](https://github.com/michelou/flix-examples) with local changes.

### <span id="areas">`areas` Example</span> [**&#x25B4;**](#top)

Project directory `areas\` initially looks as follows :

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f . | <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/findstr">findstr</a> /v /b [A-Z]</b>
|   <a href="./areas/build.bat">build.bat</a>
|   <a href="./areas/build.gradle">build.gradle</a>  <i>(<a href="./common.gradle">..\common.gradle</a>)</i>
|   <a href="./areas/build.sh">build.sh</a>
|   <a href="./areas/build.xml">build.xml</a>
|   <a href="./areas/gradle.properties">gradle.properties</a>
|   <a href="./areas/Makefile">Makefile</a>      <i>(<a href="./Makefile.inc">..\Makefile.inc</a>)</i>
|   <a href="./areas/pom.xml">pom.xml</a>
\---<b>src</b>
    +---<b>main</b>
    |       <a href="./areas/src/main/Main.flix">Main.flix</a>
    \---<b>test</b>
            <a href="./areas/src/test/TestMain.flix">TestMain.flix</a>
</pre>

Command [**`build.bat -verbose run`**](./areas/build.bat) <sup id="anchor_03">[3](#footnote_03)</sup> generates the target file `areas.jar` from the [Flix] source file [`src\main\Main.flix`](./areas/src/main/Main.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./areas/build.bat">build</a> -verbose run</b>
Copy 1 Flix source file to directory "target\areas\src\"
Compile 1 Flix source file into directory "target\areas\build\"
Create archive file "target\areas\artifact\areas.jar"
Execute Flix program "target\areas\artifact\areas.jar"
2 :: 6 :: Nil
2 :: 6 :: Nil
</pre>

During compilation we run the two [Flix] commands `build` <sup id="anchor_01">[1](#footnote_01)</sup> and `build-jar` to successively generate the Java class files in subdirectory `target\areas\build\` and the target file `target\areas\artifact\areas.jar` :

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f areas |<a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tree">findstr</a> /v /b [A-Z]</b>
\---areas
   |   .gitignore
   |   areas.jar-test.txt
   |   flix.toml
   |   LICENSE.md
   |   README.md
   +---artifact
   |       areas.jar
   +---build
   |   \---class  (<i>*.class</i>)
   +---lib
   |   \---cache
   +---src
   |       Main.flix
   \---test
           TestMain.flix
</pre>

Command [**`build.bat -verbose test`**](./areas/build.bat) generates the target file `target\areas\areas.jar` from the [Flix] source files [`src\main\Main.flix`](./areas/src/main/Main.flix) and [`src\test\TestMain.flix`](./areas/src/test/TestMain.flix) and runs the tests:

<pre style="font-size:80%;">
<b>&gt; <a href="./areas/build.bat">build</a> -verbose test</b>
Copy 1 Flix source file to directory "target\areas\src\"
Copy 1 Flix test source file to directory "target\areas\test\"
Compile 1 Flix source file and 1 Flix test source file
Create archive file "target\areas\artifact\areas.jar"
Execute tests for Flix program "target\areas\artifact\areas.jar"
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
>    [ -d "target/areas" ] || "C:/opt/Git/usr/bin/mkdir.exe" -p "target/areas"
>    cd "target/areas"; \
>         [ -d "build" ] || "C:/opt/jdk-temurin-21.0.2_13/bin/java.exe" -jar "C:\opt\flix-0.44.0/flix.jar" init && \
>         "C:/opt/Git/usr/bin/rm.exe" -f "src/Main.flix" && \
>         "C:/opt/Git/usr/bin/cp.exe" -r "F:/examples/areas/src/main/." src && \
>         "C:/opt/jdk-temurin-21.0.2_13/bin/java.exe" -jar "C:\opt\flix-0.44.0/flix.jar" build && \
>         "C:/opt/jdk-temurin-21.0.2_13/bin/java.exe" -jar "C:\opt\flix-0.44.0/flix.jar" build-jar
>    "C:/opt/jdk-temurin-21.0.2_13/bin/java.exe"  -jar "target/areas/artifact/areas.jar"
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
> 3. Command [**`sh.exe`**][bash_cli] targets a Unix-like environment in the same way as <code><b>build.bat</b></code> targets the Windows environment:
>    <pre style="font-size:80%;">
>    <b>&gt; <a href="https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_01.html" rel="external">sh</a> <a href="./areas/build.sh">./build.sh</a> -verbose run</b>
>    Initialize directory "target/areas"
>    Copy Flix source files to directory "target/areas/src"
>    Copy Flix test source files to directory "target/areas/test"
>    Compile 1 Flix source file to directory "target/areas/build"
>    Create archive file "target/areas/artifact/areas.jar"
>    Execute the JAR file "target/areas/artifact/areas.jar"
>    2 :: 6 :: Nil
>    2 :: 6 :: Nil
>    </pre>

### <span id="channels">`channels` Example</span> [**&#x25B4;**](#top)

Project directory `channels\` initally looks as follows :

<pre style="font-size:80%;">
<b>&gt; <a href="">tree</a> /a /f . | <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/findstr">findstr</a> /v /b [A-Z]</b>
|   <a href="./channels/build.bat">build.bat</a>
|   <a href="./channels/build.gradle">build.gradle</a>
|   <a href="./channels/build.sh">build.sh</a>
|   <a href="./channels/build.xml">build.xml</a>
|   <a href="./channels/gradle.properties">gradle.properties</a>
|   <a href="./channels/Makefile">Makefile</a>
|
\---src
    +---main
    |       <a href="./channels/src/main/Main.flix">Main.flix</a>
    |
    \---test
            <a href="./channels/src/test/TestMain.flix">TestMain.flix</a>
</pre>

Command [**`build.bat -verbose run`**](./channels/build.bat) generates the target file `target\channels\artifact\channels.jar` from the [Flix] source file [`src\main\Main.flix`](./channels/src/main/Main.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./channels/build.bat">build</a> -verbose run</b>
Copy 1 Flix source file to directory "target\channels\src\"
Compile 1 Flix source file to directory "target\channels\build\"
Create archive file "target\channels\artifact\channels.jar"
Extract Flix runtime from archive file "C:\opt\flix-0.44.0\flix.jar"
Add Flix runtime to archive file "target\channels\artifact\channels.jar"
Execute Flix program "target\channels\artifact\channels.jar"
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
> Error: Failed to execute Flix program "target\channels\artifact\channels.jar"
> </pre>

### <span id="datalog_constraints">`datalog-constraints` Example</span>[**&#x25B4;**](#top)

Command [**`build.bat -verbose run`**](./datalog-constraints/build.bat) generates the target file `target\datalog-constraints\datalog-constraints.jar` from the [Flix] source file [`src\main\Main.flix`](./datalog-constraints/src/main/Main.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./datalog-constraints/build.bat">build</a> -verbose run</b>
Copy 1 Flix source file to directory "target\datalog-constraints\src\"
Compile 1 Flix source file into directory "target\datalog-constraints\build\"
Create archive file "target\datalog-constraints\datalog-constraints.jar"
Execute Flix program "target\datalog-constraints\datalog-constraints.jar"
(C++, x86) :: (MiniScala, C++) :: (MiniScala, x86) :: (Scala, C++) :: (Scala, MiniScala) :: (Scala, x86) :: Nil
</pre>
<!-- workaround is no more needed with 0.39.0 and newer -->
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
> "%JAVA_HOME%\bin\java.exe" "-Xbootclasspath/a:%SCALA_HOME%\lib\scala-library.jar" -jar "F:\examples\datalog-constraints\target\datalog-constraints\artifact\datalog-constraints.jar"
> (C++, x86) :: (MiniScala, C++) :: (MiniScala, x86) :: (Scala, C++) :: (Scala, MiniScala) :: (Scala, x86) :: Nil
> </pre>
-->
### <span id="fibonacci">`fibonacci` Example</span> [**&#x25B4;**](#top)

Command [**`build.bat -verbose run`**](./fibonacci/build.bat) generates the target file `target\fibonacci\fibonacci.jar` from the [Flix] source file [`src\main\Main.flix`](./fibonacci/src/main/Main.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./fibonacci/build.bat">build</a> -verbose run</b>
Copy 1 Flix source file to directory "target\fibonacci\src\"
Compile 1 Flix source file into directory "target\fibonacci\build\"
Create archive file "target\fibonacci\artifact\fibonacci.jar"
Execute Flix program "target\fibonacci\artifact\fibonacci.jar"
0 :: 1 :: 1 :: 2 :: 3 :: 5 :: 8 :: 13 :: 21 :: 34 :: Nil
</pre>

Command [**`build.bat -verbose test`**](./fibonacci/build.bat) generates the target file `target\fibonacci\fibonacci.jar` from the [Flix] source files [`src\main\Main.flix`](./fibonacci/src/main/Main.flix) and [`src\test\TestMain.flix`](./fibonacci/src/test/TestMain.flix) and runs the tests:

<pre style="font-size:80%;">
<b>&gt; <a href="./fibonacci/build.bat">build</a> -verbose test</b>
Copy 1 Flix source file to directory "target\fibonacci\src\"
Copy 1 Flix test source file to directory "target\fibonacci\test\"
Compile 1 Flix source file and 1 Flix test source file
Create archive file "target\fibonacci\artifact\fibonacci.jar"
Execute tests for Flix program "target\fibonacci\artifact\fibonacci.jar"
Running 1 tests...

   PASS  test01 1,0ms
&nbsp;
Passed: 1, Failed: 0. Skipped: 0. Elapsed: 5,8ms.
</pre>

### <span id="lambda_calculus">`lambda-calculus` Example</span>

This example is slightly more complex than the other examples because it contains several source files, including the [Scala] source file [`Counter.scala`](./lambda-calculus/src/main/Counter.scala).

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f . | <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/findstr">findstr</a> /v /b [A-Z]</b>
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
[build] Variables  : "FLIX_HOME=C:\opt\flix-0.44.0"
[build] Variables  : "JAVA_HOME=C:\opt\jdk-temurin-21.0.2_13"
[build] Variables  : "SCALA_HOME=C:\opt\scala-2.13.12"
[build] rmdir /s /q "F:\examples\lambda-calculus\target"
[build] 00000000000000 Target : 'F:\examples\lambda-calculus\target\lambda-calculus\lambda-calculus.jar'
[build] 20220924220123 Sources: 'F:\examples\lambda-calculus\src\main\*.flix'
[build] _ACTION_REQUIRED=1
[build] "C:\opt\jdk-temurin-21.0.2_13\bin\java.exe" -jar "C:\opt\flix-0.44.0\flix.jar" init
[build] xcopy /s /y "F:\examples\lambda-calculus\src\main" "F:\examples\lambda-calculus\target\lambda-calculus\src\" 1>NUL
[build] "C:\opt\scala-2.13.12\bin\scalac.bat" -cp "C:\opt\flix-0.44.0\flix.jar" -d "F:\examples\lambda-calculus\target\lambda-calculus\lib"  "F:\examples\lambda-calculus\target\lambda-calculus\src\Counter.scala"
[build] "C:\opt\jdk-temurin-21.0.2_13\bin\jar.exe" cf "F:\examples\lambda-calculus\target\lambda-calculus\lib\lib-lambda-calculus.jar" -C "F:\examples\lambda-calculus\target\lambda-calculus\lib" .
[build] "C:\opt\jdk-temurin-21.0.2_13\bin\java.exe" -cp "F:\examples\lambda-calculus\target\lambda-calculus\build" -jar "C:\opt\flix-0.44.0\flix.jar" build --explain
[build] "C:\opt\jdk-temurin-21.0.2_13\bin\java.exe" -jar "C:\opt\flix-0.44.0\flix.jar" build-jar
[build] "C:\opt\jdk-temurin-21.0.2_13\bin\java.exe" "-Xbootclasspath/a:F:\examples\lambda-calculus\target\lambda-calculus\lib\lib-lambda-calculus.jar" -jar "F:\examples\lambda-calculus\target\lambda-calculus\lambda-calculus.jar"
Abs(1, Abs(0, Var(0)))
[build] _EXITCODE=0
</pre>

### <span id="mutability">`mutability` Example</span> [**&#x25B4;**](#top)

Command [`build.bat`](./mutability/build.bat)` -debug run` generates the target file `target\mutability\mutability.jar` from the [Flix] source file [`src\Main.flix`](./mutability/src/Main.flix) and runs the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./mutability/build.bat">build -debug run</a></b>
[build] Properties : _PROJECT_NAME=mutability
[build] Options    : _NIGHTLY=0 _VERBOSE=0
[build] Subcommands: _COMMANDS= compile run
[build] Variables  : "FLIX_HOME=C:\opt\flix-0.44.0"
[build] Variables  : "JAVA_HOME=C:\opt\jdk-temurin-21.0.2_13"
[build] Variables  : "SCALA_HOME=C:\opt\scala-2.13.12"
[build] 00000000000000 Target : 'F:\examples\mutability\target\mutability\mutability.jar'
[build] 20220908185859 Sources: 'F:\examples\mutability\src\*.flix'
[build] _ACTION_REQUIRED=1
[build] "C:\opt\jdk-temurin-21.0.2_13\bin\java.exe" -jar "C:\opt\flix-0.44.0\flix.jar" init
[build] xcopy /s /y "F:\examples\mutability\src" "F:\examples\mutability\target\mutability\src\" 1>NUL
[build] "C:\opt\jdk-temurin-21.0.2_13\bin\java.exe" -jar "C:\opt\flix-0.44.0\flix.jar" build
[build] "C:\opt\jdk-temurin-21.0.2_13\bin\java.exe" -jar "C:\opt\flix-0.44.0\flix.jar" build-jar
[build] "C:\opt\jdk-temurin-21.0.2_13\bin\java.exe"  -jar "F:\examples\mutability\target\mutability\mutability.jar"
1 :: 2 :: 3 :: Nil
[build] _EXITCODE=0
</pre>

### <span id="named_arguments">`named-arguments` Example</span> </span>[**&#x25B4;**](#top)

Command [`gradle.bat run`][gradle_cli] ([`build.gradle`](./named-arguments/build.gradle)/[`common.gradle`](./common.gradle)) generates the target file `target\named-arguments\named-arguments.jar` from the [Flix] source file [`src\main\named-arguments.flix`](./named-arguments/src/main/named-arguments.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.gradle.org/current/userguide/command_line_interface.html">gradle</a> -Dnightly clean run</b>
&nbsp;
&gt; Configure project :
Nightly build 'flix-2024-02-10.jar' was selected
&nbsp;
&gt; Task :compileFlix
&nbsp;
&gt; Task :run
Player(1, 0)
&nbsp;
BUILD SUCCESSFUL in 18s
8 actionable tasks: 8 executed
</pre>

### <span id="primes">`primes` Example</span>

Command [**`build.bat run`**](./primes/build.bat) generates the target file `target\primes\primes.jar` from the [Flix] source file [`src\main\Main.flix`](./primes/src/main/Main.flix) and executes the target file :

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

### <span id="records">`records` Example</span> [**&#x25B4;**](#top)

Command [**`build.bat run`**](./records/build.bat) generates the target file `target\records\artifact\records.jar` from the [Flix] source file [`src\main\Main.flix`](./records/src/main/Main.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./records/build.bat">build</a> run</b>
r1 = { 1, 2 }
r2 = { 1, 2 }
r1 == r2: true
r3 = { 3, 2 }
</pre>

### <span id="trees">`trees` Example</span>

Command [**`build.bat run`**](./trees/build.bat) generates the target file `target\trees\artifact\trees.jar` from the [Flix] source file [`src\main\Main.flix`](./trees/src/main/Main.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./trees/build.bat">build</a> run</b>
10
</pre>

### <span id="type-aliases">`type-aliases` Example</span>

Command [**`build.bat run`**](./type-aliases/build.bat) generates the target file `target\type-aliases\artifact\type-aliases.jar` from the [Flix] source file [`src\main\Main.flix`](./type-aliases/src/main/Main.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./type-aliases/build.bat">build</a> run</b>
Map#{1 => Hello, 2 => World}
Map#{1 => Ok(123), 2 => Err(Hello)}
</pre>

<!--=======================================================================-->

## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Flix commands*** [↩](#anchor_01)

<dl><dd>
We give option <code><b>--help</b></code> to display the Flix commands :
<pre style="font-size:80%;">
<b>&gt; "%JAVA_HOME%\bin\java.exe" -jar "%FLIX_HOME%\flix.jar" --help</b>
The Flix Programming Language v0.44.0
Usage: flix [init|check|build|build-jar|build-pkg|run <b>↲</b><br/>&emsp;|benchmark|test|repl|install|lsp] [options] &lt;args&gt;...
&nbsp;
Command: <a href=""><b>init</b></a>
  creates a new project in the current directory.
Command: <a href=""><b>check</b></a>
  checks the current project for errors.
Command: <a href=""><b>build</b></a>
  builds (i.e. compiles) the current project.
Command: <a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/Bootstrap.scala#L515"><b>build-jar</b></a>
  builds a jar-file from the current project.
Command: <a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/Bootstrap.scala#L630"><b>build-pkg</b></a>
  builds a fpkg-file from the current project.
Command: <a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/Bootstrap.scala#L707"><b>run</b></a>
  runs main for the current project.
Command: <a href="https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/api/Bootstrap.scala#L684"><b>doc</b></a>
  generates API documentation.
Command: <a href=""><b>benchmark</b></a>
  runs the benchmarks for the current project.
Command: <a href=""><b>test</b></a>
  runs the tests for the current project.
Command: <b>repl</b>
  starts a repl for the current project, or provided Flix source files.
Command: <b>lsp port</b>
  starts the LSP server and listens on the given port.
  port
&nbsp;
  --args &lt;a1, a2, ...>     arguments passed to main. Must be a single quoted string.
  --entrypoint &lt;value>     specifies the main entry point.
  --explain                provides suggestions on how to solve a problem.
  --github-token &lt;value>   API key to use for GitHub dependency resolution.
  --help                   prints this usage information.
  --json                   enables json output.
  --listen &lt;port>          starts the socket server and listens on the given port.
  --no-install             disables automatic installation of dependencies.
  --threads &lt;value>        number of threads to use for compilation.
  --yes                    automatically answer yes to all prompts.
  --version                prints the version number.
&nbsp;
The following options are experimental:
  --Xbenchmark-code-size   [exp.] benchmarks the size of the generated JVM files.
  --Xbenchmark-incremental
                           [exp.] benchmarks the performance of each compiler phase in incremental mode.
  --Xbenchmark-phases      [exp.] benchmarks the performance of each compiler phase..
  --Xbenchmark-frontend    [exp.] benchmarks the performance of the frontend.
  --Xbenchmark-throughput  [exp.] benchmarks the performance of the entire compiler.
  --Xlib &lt;value&gt;           [exp.] controls the amount of std. lib. to include (nix, min, all).
  --Xno-optimizer          [exp.] disables compiler optimizations.
  --Xprint-phase &lt;value>   [exp.] prints the AST(s) after the given phase(s). 'all' prints all ASTs.
  --Xbdd-threshold &lt;value>
                           [exp.] sets the threshold for when to use BDDs.
  --Xno-bool-cache         [exp.] disables Boolean caches.
  --Xno-bool-specialcases  [exp.] disables hardcoded Boolean unification special cases.
  --Xno-bool-table         [exp.] disables Boolean minimization via tabling.
  --Xno-bool-unif          [exp.] disables Boolean unification. (DO NOT USE).
  --Xno-qmc                [exp.] disables Quine McCluskey when using BDDs.
  --Xsummary               [exp.] prints a summary of the compiled modules.
  --Xparser                [exp.] disables new experimental lexer and parser.
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
Nightly build "flix-2024-02-24.jar" was selected
Delete directory "target"
Initialize Flix project directory "target\areas"
Copy 1 Flix source file to directory "target\areas\src\"
Compile 1 Flix source file into directory "target\areas\build\"
Create archive file "target\areas\artifact\areas.jar"
Execute Flix program "target\areas\artifact\areas.jar"
2 :: 6 :: Nil
2 :: 6 :: Nil
</pre>

<pre style="font-size:80%;">
<b>&gt; <a href="https://www.gnu.org/software/make/manual/make.html" rel="external">make</a> NIGHTLY=1 run</b>
[ -d "target/areas" ] || "C:/opt/Git/usr/bin/mkdir.exe" -p "target/areas"
cd "target/areas"; \
        [ -d "build" ] || "C:/opt/jdk-temurin-21.0.2_13/bin/java.exe" -jar "C:\opt\flix-0.44.0/flix-2023-12-14.jar" init && \
        "C:/opt/Git/usr/bin/rm.exe" -f "src/Main.flix" && \
        "C:/opt/Git/usr/bin/cp.exe" -r "F:/examples/areas/src/main/." src && \
        "C:/opt/jdk-temurin-21.0.2_13/bin/java.exe" -jar "C:\opt\flix-0.44.0/flix-2024-02-24.jar" build && \
        "C:/opt/jdk-temurin-21.0.2_13/bin/java.exe" -jar "C:\opt\flix-0.44.0/flix-2024-02-24.jar" build-jar
"C:/opt/jdk-temurin-21.0.2_13/bin/java.exe"  -jar "target/areas/areas.jar"
2 :: 6 :: Nil
2 :: 6 :: Nil
</pre>
<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.gradle.org/current/userguide/command_line_interface.html" rel="external">gradle</a> -Dnightly run</b>
&nbsp;
&gt; Configure project :
Nightly build 'flix-2024-02-24.jar' was selected
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

*[mics](https://lampwww.epfl.ch/~michelou/)/February 2024* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- href links -->

[apache_ant_cli]: https://ant.apache.org/manual/running.html
[bash_cli]: https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_01.html
[cmd_cli]: https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/cmd
[flix]: https://flix.dev/
[gradle_cli]: https://docs.gradle.org/current/userguide/command_line_interface.html
[jar_cli]: https://docs.oracle.com/en/java/javase/13/docs/specs/man/jar.html
[make_cli]: https://www.gnu.org/software/make/manual/make.html
[scala]: https://www.scala-lang.org/
[scalac_cli]: https://docs.scala-lang.org/overviews/compiler-options/index.html
[sh_cli]: https://www.man7.org/linux/man-pages/man1/bash.1.html
