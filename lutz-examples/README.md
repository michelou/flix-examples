# <span id="top">Lutz Hühnken's Flix Examples</span> <span style="size:25%;"><a href="../README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
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

| Build tool          | Configuration file(s)  | Parent file(s) | Environment(s) |
|---------------------|------------------------|----------------|----------------|
| [**`build.bat`**](channels/build.bat) | &nbsp;                 | &nbsp; | MS Windows |
| [**`build.sh`**](channels/build.sh) | &nbsp;                 | &nbsp; | Cygwin / MSYS2 / Unix |
| [**`gradle.exe`**][gradle_cli] | [**`build.gradle`**](channels/build.gradle) | [**`common.gradle`**](common.gradle) | Any <sup><b>a)</b></sup>  |
| [**`make.exe`**][make_cli] | [**`Makefile`**](channels/Makefile) | [**`Makefile.inc`**](./Makefile.inc)  | Any |
<div style="margin:0 15% 0 8px;font-size:90%;">
<sup><b>a)</b></sup> Here "Any" means "tested on MS Windows / Cygwin / MSYS2 / Unix".<br/>&nbsp;
</div>

## <span id="channels">`channels` Example</span>

Command [**`build -verbose run`**](./channels/build.bat) generates the target file `target\channels\channels.jar` from the [Flix] source file [`src\main\channels.flix`](./channels/src/main/channels.flix) and executes the target file :

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
Extract Flix runtime from archive file "C:\opt\flix-0.34.0\flix.jar"
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
> Extract class files from archive file "C:/opt/flix-0.34.0/flix.jar"
> Update archive file "target/channels/channels.jar"
> Execute the JAR file "target/channels/channels.jar"
> 20
> ...
> 7
> done
> &nbsp;
> <b>&gt; <a href="https://www.man7.org/linux/man-pages/man1/bash.1.html">bash</a> --version | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> version</b>
> GNU bash, version 4.4.20(1)-release (x86_64-pc-linux-gnu)
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

## <span id="effects">`effects` Example</span>

Command [**`gradle -q run`**][gradle_cli] ([`build.gradle`](./effects/build.gradle)/ [`common.gradle`](./common.gradle)) generates the target file `target\effects\effects.jar` from the [Flix] source file [`src\main\effects.flix`](./effects/src/main/effects.flix) and executes the target file :

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

## <span id="interop">`interop` Example</span> [**&#x25B4;**](#top)

Command [**`build run`**](./interop/build.bat) generates the target file `target\interop\interop.jar` from the [Flix] source file [`src\main\interop.flix`](./interop/src/main/interop.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./interop/build.bat">build</a> run</b>
false
0
</pre>

## <span id="mutualrecursion">`mutualrecursion` Example</span>

Command [**`make -s run`**][make_cli] ([`Makefile`](./mutualrecursion/Makefile)/[`Makefile.inc`](./Makefile.inc)) generates the target file `target\mutualrecursion\mutualrecursion.jar` from the [Flix] source file [`src\main\mutualrecursion.flix`](./mutualrecursion/src/main/mutualrecursion.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="https://www.gnu.org/software/make/manual/make.html" rel="external">make</a> -s run</b>
true
0
</pre>

> **:mag_right:** Command `build` features option `-java` to compile/run the Java version of this code example.
> <pre style="font-size:80%;">
> <b>&gt; <a href="./mutualrecursion/build.bat">build</a> -java -verbose run</b>
> Compile Java source files to directory "target\classes"
> Execute Java program "MutualRecursion"
> true
> </pre>

## <span id="random">`random` Example</span> [**&#x25B4;**](#top)

Command [**`gradle -q run`**][gradle_cli] ([`build.gradle`](./random/build.gradle)/[`common.gradle`](./common.gradle)) generates the target file `target\random\random.jar` from the [Flix] source file [`src\main\random.flix`](./random/src/main/random.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.gradle.org/current/userguide/command_line_interface.html" rel="external">gradle</a> -q run</b>
109
169
[...]
192
124
0
</pre>

## <span id="tailcalls">`tailcalls` Example</span> 

Command [**`build run`**](./tailcalls/build.bat) generates the target file `target\tailcalls\tailcalls.jar` from the [Flix] source file [`src\main\tailcalls.flix`](./tailcalls/src/main/tailcalls.flix) and executes the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./tailcalls/build.bat">build</a> run</b>
312512500
0
</pre>

The same example written in Java ([`src\main\tailcalls.java`](./tailcalls/src/main/tailcalls.java)) fails with a runtime error :

<pre style="font-size:80%;">
<b>&gt; <a href="./tailcalls/build.bat">build</a> -java run</b>
Exception in thread "main" java.lang.StackOverflowError
        at Tailcalls.tailsum(tailcalls.java:12)
        at Tailcalls.tailsum(tailcalls.java:12)
        [...]
        at Tailcalls.tailsum(tailcalls.java:12)
        at Tailcalls.tailsum(tailcalls.java:12)
Error: Failed to execute Java program "Tailcalls"
</pre>

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

*[mics](https://lampwww.epfl.ch/~michelou/)/February 2023* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- href links -->

[bash_cli]: https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_01.html
[flix]: https://flix.dev/
[gradle_cli]: https://docs.gradle.org/current/userguide/command_line_interface.html
[lutz_article]: https://www.reactivesystems.eu/2022/06/24/flix-for-java-programmers.html
[lutz_codeberg]: https://codeberg.org/reactivesystems.eu/2022-06-24-flix-for-java-programmers
[make_cli]: https://www.gnu.org/software/make/manual/make.html
