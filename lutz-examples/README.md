# <span id="top">Lutz Hühnken's Flix Examples</span> <span style="size:25%;"><a href="../README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 8px 0 0;;min-width:160px;">
    <a href="https://flix.dev/"><img src="../docs/images/flix-logo.png" width="160" alt="Flix project"/></a>
  </td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>lutz-examples\</code></strong> contains <a href="https://flix.dev/" rel="external">Flix</a> code examples presented in Lutz Hühnken's article "<a href="https://www.reactivesystems.eu/2022/06/24/flix-for-java-programmers.html">Flix for Java programmers</a>" (June 2022).
  </td>
  </tr>
</table>

> **:mag_right:** Visit the Codeberg repository [`2022-06-24-flix-for-java-programmers`][lutz_codeberg] to get the original [Flix] code examples.

We made the following changes resp. additions in comparison to the original [Flix] code examples :
- The source files have been updated <sup id="anchor_01">[1](#footnote_01)</sup> to successfully compile with the latest version of the [Flix] compiler.
- Each example has the same directory layout as the [Flix] code examples presented in document [`examples\README.md`](../examples/README.md).
- Each example includes a basic test suite (directory `src\test\`).
- We provide several build scripts to build, run and test the [Flix] code examples.

Currently we provide four ways to build, run and test the [Flix] code examples :

| Build&nbsp;tool     | Build&nbsp;file  | Parent&nbsp;file | Environment(s) |
|---------------------|------------------|------------------|----------------|
| [**`cmd.exe`**][cmd_cli] | [`build.bat`](channels/build.bat) | &nbsp; | MS Windows |
| [**`sh.exe`**][sh_cli] | [`build.sh`](channels/build.sh) | &nbsp; | Any <sup><b>a)</b></sup> |
| [**`gradle.exe`**][gradle_cli] | [`build.gradle`](channels/build.gradle) | [`common.gradle`](common.gradle) | Any |
| [**`make.exe`**][make_cli] | [`Makefile`](channels/Makefile) | [`Makefile.inc`](./Makefile.inc)  | Any |
<div style="margin:0 15% 0 8px;font-size:90%;">
<sup><b>a)</b></sup> Here "Any" means "tested on MS Windows / Cygwin / MSYS2 / Unix".<br/>&nbsp;
</div>

## <span id="channels">`channels` Example</span> [**&#x25B4;**](#top)

This project has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /f /a . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./channels/build.bat">build.bat</a>
|   <a href="./channels/build.gradle">build.gradle</a>
|   <a href="./channels/build.sh">build.sh</a>
|   <a href="./channels/build.xml">build.xml</a>
|   <a href="./channels/flix.toml">flix.toml</a>
|   <a href="./channels/gradle.properties">gradle.properties</a>
|   <a href="./channels/Makefile">Makefile</a>
\---<b>src</b>
    +---<b>main</b>
    |       <a href="./channels/src/main/Main.flix">Main.flix</a>
    \---<b>test</b>
            <a href="./channels/src/test/channelsTest.flix">TestMain.flix</a>
</pre>

Command [**`build`**](./channels/build.bat)`-verbose run` generates and executes the target file `channels.jar` :

<pre style="font-size:80%;">
<b>&gt; <a href="./channels/build.bat">build</a> -verbose run</b>
Initialize Flix project directory "target\channels"
Copy 1 Flix source file to directory "target\channels\src\"
Compile 1 Flix source file into directory "target\channels\build\"
Create archive file "target\channels\channels.jar"
Extract Flix runtime from archive file "%FLIX_HOME%\flix.jar"
Add Flix runtime to archive file "target\channels\channels.jar"
Execute Flix program "target\channels\channels.jar"
29
39
[...]
72
35
done
</pre>

Command [**`build -verbose test`**](./channels/build.bat) generates the target file `target\channels\channels.jar` from the [Flix] sources files [`src\main\channels.flix`](./channels/src/main/channels.flix) and [`src\test\channelsTest.flix`](./channels/src/test/channelsTest.flix) and runs the test suite :

<pre style="font-size:80%;">
<b>&gt; <a href="./channels/build.bat">build</a> -verbose test</b>
Copy 1 Flix source file to directory "target\channels\src\"
Copy 1 Flix test source file to directory "target\channels\test\"
Compile 1 Flix source file and 1 Flix test source file
Create archive file "target\channels\channels.jar"
Extract Flix runtime from archive file "C:\opt\flix-0.43.0\flix.jar"
Add Flix runtime to archive file "target\channels\channels.jar"
Execute tests for Flix program "target\channels\channels.jar"
Running 1 tests...

   PASS  test01 384,1us

Passed: 1, Failed: 0. Skipped: 0. Elapsed: 6,9ms.
</pre>

> **:mag_right:** Command [**`build.sh`**](./channels/build.sh) is the counterpart of the above batch file [**`build.bat`**](./channels/build.bat) for Unix-like environments; for instance :
> &nbsp;
> <pre style="font-size:80%;">
> <b>&gt; <a href="https://www.man7.org/linux/man-pages/man1/bash.1.html">bash</a> -c "./<a href="./channels/build.sh">build.sh</a> -verbose run"</b>
> Initialize directory "target/channels"
> Copy Flix source files to directory "target/channels/src"
> Copy Flix test source files to directory "target/channels/test"
> Compile 1 Flix source files to directory "target/channels/build"
> Create archive file "target/channels/channels.jar"
> Extract class files from archive file "C:/opt/flix-0.43.0/flix.jar"
> Update archive file "target/channels/channels.jar"
> Execute the JAR file "target/channels/channels.jar"
> 20
> ...
> 7
> done
> &nbsp;
> <b>&gt; <a href="https://www.man7.org/linux/man-pages/man1/bash.1.html">bash</a> --version | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> version</b>
> GNU bash, version 5.2.15(1)-release (x86_64-pc-linux-gnu)
> License GPLv3+: GNU GPL version 3 or later &lt;http://gnu.org/licenses/gpl.html&gt;
> </pre>

## <span id="datalog">`datalog` Example</span> [**&#x25B4;**](#top)

Command [**`make run`**][make_cli] ([`Makefile`](./datalog/Makefile)/[`Makefile.inc`](./Makefile.inc)) generates the target file `target\datalog\datalog.jar` from the [Flix] source file [`src\main\datalog.flix`](./datalog/src/main/datalog.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="https://www.gnu.org/software/make/manual/make.html" rel="external">make</a> run</b>
[ -d "target/datalog" ] || "%GIT_HOME%/usr/bin/mkdir.exe" -p "target/datalog"
cd "target/datalog"; \
        [ -d "build" ] || "%JAVA_HOME%/bin/java.exe" -jar "%FLIX_HOME%/flix.jar" init && \
        "%GIT_HOME%/usr/bin/rm.exe" -f "src/Main.flix" && \
        "%GIT_HOME%/usr/bin/cp.exe" -r "F:/lutz-examples/datalog/src/main/." src && \
        "%JAVA_HOME%/bin/java.exe" -jar "%FLIX_HOME%/flix.jar" build && \
        "%JAVA_HOME%/bin/java.exe" -jar "%FLIX_HOME%/flix.jar" build-jar
"%JAVA_HOME%/bin/java.exe"  -jar "target/datalog/datalog.jar"
Children of Zeus = Apollo :: Ares :: Nil
Ancestors of Apollo = Kronos :: Leto :: Rhea :: Zeus :: Nil
0
</pre>

<!--=======================================================================-->

## <span id="effects">`effects` Example</span>

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /f /a . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./effects/build.bat">build.bat</a>
|   <a href="./effects/build.gradle">build.gradle</a>
|   <a href="./effects/build.sh">build.sh</a>
|   <a href="./effects/build.xml">build.xml</a>
|   <a href="./effects/gradle.properties">gradle.properties</a>
|   <a href="./effects/Makefile">Makefile</a>
\---<b>src</b>
    +---<b>main</b>
    |       <a href="./effects/src/main/effects.flix">effects.flix</a>
    \---<b>test</b>
            <a href="./effects/src/test/effectsTest.flix">effectsTest.flix</a>
</pre>

Command [**`gradle`**][gradle_cli]`-q run` &ndash; given the configuration [`build.gradle`](./effects/build.gradle) (resp. [`common.gradle`](./common.gradle)) &ndash; generates and executes the target file `target\effects\effects.jar` :

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.gradle.org/current/userguide/command_line_interface.html" rel="external">gradle</a> -q run</b>
2

1
2
3
4

2
4
6
8
0
</pre>

<!--=======================================================================-->

## <span id="interop">`interop` Example</span> [**&#x25B4;**](#top)

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /f /a . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./interop/build.bat">build.bat</a>
|   <a href="./interop/build.gradle">build.gradle</a>
|   <a href="./interop/build.sh">build.sh</a>
|   <a href="./interop/build.xml">build.xml</a>
|   <a href="./interop/gradle.properties">gradle.properties</a>
|   <a href="./interop/Makefile">Makefile</a>
\---<b>src</b>
    +---<b>main</b>
    |       <a href="./interop/src/main/interop.flix">interop.flix</a>
    \---<b>test</b>
            <a href="./interop/src/test/interopTest.flix">interopTest.flix</a>
</pre>

Command [**`build run`**](./interop/build.bat) generates the target file `target\interop\interop.jar` from the [Flix] source file [`src\main\interop.flix`](./interop/src/main/interop.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./interop/build.bat">build</a> run</b>
false
0
</pre>

<!--=======================================================================-->

## <span id="mutualrecursion">`mutualrecursion` Example</span>

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /f /a . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./mutualrecursion/build.bat">build.bat</a>
|   <a href="./mutualrecursion/build.gradle">build.gradle</a>
|   <a href="./mutualrecursion/build.sh">build.sh</a>
|   <a href="./mutualrecursion/build.xml">build.xml</a>
|   <a href="./mutualrecursion/gradle.properties">gradle.properties</a>
|   <a href="./mutualrecursion/Makefile">Makefile</a>
\---<b>src</b>
    +---<b>main</b>
    |       <a href="./mutualrecursion/src/main/mutualrecursion.flix">mutualrecursion.flix</a>
    |       <a href="./mutualrecursion/src/main/MutualRecursion.java">MutualRecursion.java</a>
    \---<b>test</b>
            <a href="./mutualrecursion/src/test/mutualrecursionTest.flix">mutualrecursionTest.flix</a>
</pre>

Command [**`make`**][make_cli]`-s run` &ndash; given the configuration [`Makefile`](./mutualrecursion/Makefile) (resp. [`Makefile.inc`](./Makefile.inc)) &ndash; generates and executes the target file `target\mutualrecursion\mutualrecursion.jar` :

<pre style="font-size:80%;">
<b>&gt; <a href="https://www.gnu.org/software/make/manual/make.html" rel="external">make</a> -s run</b>
true
0
</pre>

> **:mag_right:** Command [**`build.bat`**](./mutualrecursion/build.bat) features option `-java` to compile/run the Java version of this code example.
> <pre style="font-size:80%;">
> <b>&gt; <a href="./mutualrecursion/build.bat">build</a> -java -verbose run</b>
> Compile Java source files to directory "target\classes"
> Execute Java program "MutualRecursion"
> true
> </pre>

<!--=======================================================================-->

## <span id="random">`random` Example</span> [**&#x25B4;**](#top)

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="">tree</a> /f /a . | <a href="">findstr</a> /v /b [A-Z]</b>
|   <a href="./random/build.bat">build.bat</a>
|   <a href="./random/build.gradle">build.gradle</a>
|   <a href="./random/build.sh">build.sh</a>
|   <a href="./random/build.xml">build.xml</a>
|   <a href="./random/gradle.properties">gradle.properties</a>
|   <a href="./random/Makefile">Makefile</a>
\---<b>src</b>
    +---<b>main</b>
    |       <a href="./random/src/main/random.flix">random.flix</a>
    \---<b>test</b>
            <a href="./random/src/test/randomTest.flix">randomTest.flix</a>
</pre>

Command [**`gradle`**][gradle_cli]`-q run` &ndash; given the configuration [`build.gradle`](./random/build.gradle) (resp. [`common.gradle`](./common.gradle)) &ndash; generates and executes the target file `target\random\random.jar` :

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.gradle.org/current/userguide/command_line_interface.html" rel="external">gradle</a> -q run</b>
109
169
[...]
192
124
0
</pre>

<!--=======================================================================-->

## <span id="tailcalls">`tailcalls` Example</span> 

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /f /a . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr">findstr</a> /v /b [A-Z]</b>
|   <a href="./tailcalls/build.bat">build.bat</a>
|   <a href="./tailcalls/build.gradle">build.gradle</a>
|   <a href="./tailcalls/build.sh">build.sh</a>
|   <a href="./tailcalls/build.xml">build.xml</a>
|   <a href="./tailcalls/gradle.properties">gradle.properties</a>
|   <a href="./tailcalls/Makefile">Makefile</a>
\---<b>src</b>
    +---<b>main</b>
    |       <a href="./tailcalls/src/main/tailcalls.flix">tailcalls.flix</a>
    |       <a href="./tailcalls/src/main/tailcalls.java">tailcalls.java</a>
    \---<b>test</b>
            <a href="./tailcalls/src/test/tailcallsTest.flix">tailcallsTest.flix</a>
</pre>

Command [**`build.bat`**](./tailcalls/build.bat)`run` builds and generates the target file `target\tailcalls\tailcalls.jar` :

<pre style="font-size:80%;">
<b>&gt; <a href="./tailcalls/build.bat">build</a> run</b>
312512500
0
</pre>

> **:mag_right:** The same example written in Java ([`src\main\tailcalls.java`](./tailcalls/src/main/tailcalls.java)) fails with a runtime error :
> <pre style="font-size:80%;">
> <b>&gt; <a href="./tailcalls/build.bat">build</a> -java run</b>
> Exception in thread "main" java.lang.StackOverflowError
>         at Tailcalls.tailsum(tailcalls.java:12)
>         at Tailcalls.tailsum(tailcalls.java:12)
>         [...]
>         at Tailcalls.tailsum(tailcalls.java:12)
>         at Tailcalls.tailsum(tailcalls.java:12)
> Error: Failed to execute Java program "Tailcalls"
> </pre>

<!--=======================================================================-->

## <span id="footnotes">Footnotes</span>[**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Updated source files*** [↩](#anchor_01)

<dl><dd>
Here are our modifications of the original <a href="https://flix.dev/">Flix</a>  code examples from Lutz Hühnken's article "<a href="https://www.reactivesystems.eu/2022/06/24/flix-for-java-programmers.html">Flix for Java programmers</a>" (June 2022) :
<table>
<tr>
  <td><b>Source file(s)</b></td>
  <td><b>Source code change</a></td>
</tr>
<tr>
  <td><code>*.flix</code></td>
  <td>Old syntax: <code>& Impure</code>, new syntax: <code>\ IO</code>.</td>
</tr>
<tr>
  <td><a href="./channels/src/main/channels.flix"><code>channels.flix</code></a><br/><a href="./random/src/main/random.flix"><code>random.flix</code></a></td>
  <td>Changed return type <code>Unit & Impure</code> to <code>Unit \ NonDet</code> for functions <code>doSomething</code> and <code>main</code> (see definition of <a href="https://github.com/flix/flix/blob/master/main/src/library/Random.flix#L66-L69"><code>Random.nextInt64</code></a>).</td>
</tr>
</table>
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/December 2024* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- href links -->

[bash_cli]: https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_01.html
[cmd_cli]: https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/cmd
[flix]: https://flix.dev/
[gradle_cli]: https://docs.gradle.org/current/userguide/command_line_interface.html
[lutz_article]: https://www.reactivesystems.eu/2022/06/24/flix-for-java-programmers.html
[lutz_codeberg]: https://codeberg.org/reactivesystems.eu/2022-06-24-flix-for-java-programmers
[make_cli]: https://www.gnu.org/software/make/manual/make.html
[sh_cli]: https://www.man7.org/linux/man-pages/man1/bash.1.html
