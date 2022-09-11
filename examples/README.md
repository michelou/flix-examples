# <span id="top">Flix Examples</span> <span style="size:25%;"><a href="../README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;;min-width:120px;">
    <a href="https://flix.dev/"><img src="../docs/images/flix-logo.png" width="120" alt="Flix project"/></a>
  </td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>examples\</code></strong> contains <a href="https://flix.dev/" rel="external">Flix</a> code examples coming from various websites - mostly from the <a href="https://flix.dev/" rel="external">Flix project</a>.
  </td>
  </tr>
</table>

All Flix projects presented below share the same directory layout as project `areas`, namely :
1. Before compilation the project directory `areas\` looks as follows :
   <pre style="font-size:80%;">
   <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f areas |<a href="https://man7.org/linux/man-pages/man1/tail.1.html">tail</a> -n +3</b>
   F:\EXAMPLES\AREAS
   |   <a href="./areas/build.bat">build.bat</a>
   \---<b>src</b>
        <a href="./areas/src/Main.flix">Main.flix</a>
   </pre>

2. During compilation we generate the target file `areas.jar` inside a Flix-managed <sup id="anchor_01">[1](#footnote_01)</sup> subdirectory `target\areas\` :
   <pre style="font-size:80%;">
   <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f areas |<a href="https://man7.org/linux/man-pages/man1/tail.1.html">tail</a> -n +3</b>
   F:\EXAMPLES\AREAS
   |   <a href="./areas/build.bat">build.bat</a>
   +---<b>src</b>
   |    <a href="./areas/src/Main.flix">Main.flix</a>
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

### <span id="areas">Example `areas`</span>

Command [`build`](./areas/build.bat)` run` generates the target file `target\areas\areas.jar` from the Flix source file [`src\Main.flix`](./areas/src/Main.flix) and runs the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./areas/build.bat">build</a> -verbose run</b>
Copy 1 Flix source file to directory "target\areas\src\"
Compile 1 Flix source file
Create archive file "F:\examples\areas\target\areas\areas.jar"
Execute Flix program "target\areas\areas.jar"
2 :: 6 :: Nil
2 :: 6 :: Nil
</pre>

### <span id="primes">Example `primes`</span>

Command [`build`](./primes/build.bat)` run`generates the target file `target\primes\primes.jar` from the Flix source file [`src\Main.flix`](./primes/src/Main.flix) and runs the target file :

<pre style="font-size:80%;">
<b>&gt; <a href="./primes/build.bat">build</a> run</b>
Using 'primes'
2 :: 3 :: 5 :: 7 :: 11 :: 13 :: 17 :: 19 :: 23 :: 29 :: Nil
Using 'primes2'
2 :: 3 :: 5 :: 7 :: 11 :: 13 :: 17 :: 19 :: 23 :: 29 :: Nil
</pre>

<!--=======================================================================-->

## <span id="footnotes">Footnotes</span>[**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Flix-managed project directory*** [↩](#anchor_01)

<dl><dd>
Flix project directories must have a special layout enforced by the Flix command <code>init</code>. In particular the documentation files <code>HISTORY.md</code>, <code>LICENSED.md</code> and <code>README.md</code> must exist inside the project directory.
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/September 2022* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- href links -->
