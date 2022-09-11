# <span id="top">Playing with Flix on Windows</span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:25%;"><a href="https://flix.dev/" rel="external"><img src="./docs/images/flix-logo.png" width="120" alt="Flix project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">This repository gathers <a href="https://flix.dev/" rel="external">Flix</a> code examples coming from various websites and books.<br/>
  It also includes several <a href="https://en.wikibooks.org/wiki/Windows_Batch_Scripting" rel="external">batch files</a> for experimenting with <a href="https://flix.dev/" rel="external">Flix</a> on a Windows machine.
  </td>
  </tr>
</table>

[Ada][ada_examples], [Akka][akka_examples], [C++][cpp_examples], [Deno][deno_examples], [GraalVM][graalvm_examples], [Haskell][haskell_examples], [Kotlin][kotlin_examples], [LLVM][llvm_examples], [Node.js][nodejs_examples], [Rust][rust_examples], [Scala 3][scala3_examples], [Spark][spark_examples], [Spring][spring_examples], [TruffleSqueak][trufflesqueak_examples] and [WiX][wix_examples] are other topics we are continuously monitoring.

## <span id="proj_deps">Project dependencies</span>

This project depends on the following external software for the **Microsoft Windows** platform:

- [Flix 0.30][flix_downloads] ([*release notes*][flix_relnotes])
- [Git 2.37][git_downloads] ([*release notes*][git_relnotes])

Optionally one may also install the following software:

- [Flix nightly](https://flix.dev/nightly/)

For instance our development environment looks as follows (*September 2022*) <sup id="anchor_01">[1](#footnote_01)</sup>:

<pre style="font-size:80%;">
C:\opt\flix-0.30.0\  <i>( 35 MB)</i>
C:\opt\Git-2.37.3\   <i>(289 MB)</i>
</pre>


## <span id="structure">Directory structure</span>

This project is organized as follows:

<pre style="font-size:80%;">
docs\
examples\{<a href="./examples/README.md">README.md</a>, ..}
<a href="README.md">README.md</a>
<a href="RESOURCES.md">RESOURCES.md</a>
<a href="setenv.bat">setenv.bat</a>
</pre>

where

- directory [**`docs\`**](docs/) contains [Flix] related papers/articles.
- directory [**`examples\`**](examples/) contains [Flix] code examples.
- file [**`README.md`**](README.md) is the [Markdown][github_markdown] document for this page.
- file [**`RESOURCES.md`**](RESOURCES.md) gathers [Flix] related documents.
- file [**`setenv.bat`**](setenv.bat) is the batch script for setting up our environment.

<!--=======================================================================-->

## <span id="footnotes">Footnotes</span>[**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Downloads*** [↩](#anchor_01)

<dl><dd>
In our case we downloaded the following installation files (see <a href="#proj_deps">section 1</a>):
</dd>
<dd>
<pre style="font-size:80%;">
<a href="https://github.com/flix/flix/releases/" rel="external">flix.jar</a>                          <i>( 35 MB)</i>
<a href="https://git-scm.com/download/win" rel="external">PortableGit-2.37.3-64-bit.7z.exe</a>  <i>( 41 MB)</i>
</pre>
</dd></dl>

<span id="footnote_02">[2]</span> ***Flix versus Scala*** [↩](#anchor_02)

<dl><dd>
Extract from the Flix FAQ :
<blockquote>
<p>
<a href="https://flix.dev/">Flix</a> looks quite similar to <a href="https://www.scala-lang.org/">Scala</a>. How are the two languages related?</p>
<p>
Flix borrows a lot of syntax from Scala, hence the two languages have a similar feel. We think Scala made many good design choices with respect to syntax, including:<br/>&ensp;<b>(a)</b> the use of short keywords,<br/>&ensp;<b>(b)</b> the <code>x : T</code> syntax for type annotations,<br/>&ensp;<b>(c)</b> the <code>List[Int32]</code> syntax for type parameters, and<br/>&ensp;<b>(d)</b> <code>if</code>, <code>match</code>, etc. as expressions.
</p>
Other than syntax, the two languages are very different:
<ul>
<li>Scala is object-oriented, Flix is not.</li>
<li>Scala has sub-typing, Flix does not.</li>
<li>The Scala type system is unsound and has imperfect type inference, whereas the Flix type system is both sound and supports type inference.</li>
</ul>
</blockquote>
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
[flix]: https://flix.dev/
[flix_downloads]: https://github.com/flix/flix/releases/
[flix_relnotes]: https://github.com/flix/flix/releases/tag/v0.30.0
[graalvm_examples]: https://github.com/michelou/graalvm-examples
[haskell_examples]: https://github.com/michelou/haskell-examples
[kotlin_examples]: https://github.com/michelou/kotlin-examples
[llvm_examples]: https://github.com/michelou/llvm-examples
[mage_downloads]: https://github.com/magefile/mage/releases
[mage_relnotes]: https://github.com/magefile/mage/releases/tag/v1.13.0
[nodejs_examples]: https://github.com/michelou/nodejs-examples
[rust_examples]: https://github.com/michelou/rust-examples
[scala3_examples]: https://github.com/michelou/dotty-examples
[spark_examples]: https://github.com/michelou/spark-examples
[spring_examples]: https://github.com/michelou/spring-examples
[trufflesqueak_examples]: https://github.com/michelou/trufflesqueak-examples
[wix_examples]: https://github.com/michelou/wix-examples
