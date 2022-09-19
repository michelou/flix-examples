# <span id="top">Building Flix on Windows</span> <span style="size:25%;"><a href="README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;;min-width:120px;"><a href="https://flix.dev/"><img src="./docs/images/flix-logo.png" width="120" alt="Flix project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">Source code of the <a href="https://flix.dev/" rel="external">Flix project</a> is hosted on <a href="https://github.com/flix/flix" rel="external">Github</a>.<br/>The Gradle build is used for continuous integration on GitHub.
  </td>
  </tr>
</table>

The [Gradle build][gradle_userguide] of the Flix library is fast and simple :

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.gradle.org/current/userguide/command_line_interface.html">gradle</a> jar</b>

BUILD SUCCESSFUL in 3m 7s
2 actionable tasks: 2 executed

<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/where">where</a> /r . flix*.jar</b>
F:\flix\build\libs\flix.jar
</pre>

> **Note** : The Flix library generated **locally** on September 19, 2022, is effectively the same as the corresponding [Flix nightly build][flix_nightly] :
> <pre style="font-size:80%;">
> <b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/where">where</a> /t "%FLIX_HOME%:*.jar" build\libs:*.jar</b>
>   36614213   19.09.2022      20:26:29  c:\opt\flix-0.31.0\flix-2022-09-19.jar
>   36594654   17.09.2022      14:20:22  c:\opt\flix-0.31.0\flix.jar
>   36614213   19.09.2022      23:00:34  F:\flix\build\libs\flix.jar
> </pre>

<!--=======================================================================-->

<!--
## <span id="footnotes">Footnotes</span>[**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Flix Releases*** [↩](#anchor_01)

<dl><dd>
</dd></dl>
-->

***

*[mics](https://lampwww.epfl.ch/~michelou/)/September 2022* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- href links -->

[flix_nightly]: https://flix.dev/nightly/
[gradle_userguide]: https://docs.gradle.org/current/userguide/userguide.html
