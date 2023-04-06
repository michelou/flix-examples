# <span id="top">Flix Resources</span> <span style="size:25%;"><a href="README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;;min-width:120px;"><a href="https://flix.dev/" rel="external"><img src="./docs/images/flix-logo.png" width="120" alt="Flix project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">This document gathers <a href="https://flix.dev/" rel="external">Flix</a> related resources that caught our attention.
  </td>
  </tr>
</table>

> **:mag_right:** The following online [Flix] resources are very useful and nicely laid out :
> - [Flix API][flix_api]
> - [Flix Compiler Tests][flix_compiler_tests]
> - [Flix Documentation][flix_doc]
> - [Flix Playground][flix_playground]

<!--
## <span id="articles">Articles</span>
-->

## <span id="blogs">Blogs</span>

- [An Introduction to Datalog](https://blogit.michelin.io/an-introduction-to-datalog/) by Fabien Alberi, December 2022.
- [Flix for Java Programmers][blog_huehnken] by Lutz Hühnken, June 2022.

## <span id="community">Community</span>

- [Gitter - flix/Lobby](https://gitter.im/flix/Lobby).

## <span id="interviews">Interviews</span>

- [Flix: Designing a principled programming language with Magnus Madsen][anchor_flix], February 2022.
- [Interview with Magnus Madsen about the Flix Programming Language][infoq_flix], February 2022.

## <span id="papers">Papers</span> [**&#x25B4;**](#top)
<!-- https://www.accentletters.com/accent-a.html -->

- [The Principles of the Flix Programming Language][paper_madsen_2020] (Proceedings) by Magnus Madsen, November 2022.
- [Programming with First-Class Datalog Constraints](https://dl.acm.org/doi/10.1145/3428193) by Magnus Madsen and Ondřey Lhoták, November 2020.<br><span style="font-size:80%;">(<a href="https://www.youtube.com/watch?v=ikVZrivln8c" rel="external">Youtube video</a>)</span>
- [Extending Parallel Datalog with Lattice](https://www.cse.psu.edu/~gxt29/papers/) (Master Thesis) by Qing Gong, May 2020.
- [Tail call elimination and data representation for functional languages on the Java virtual machine][paper_madsen_2018] by Magnus Madsen and al., February 2018.
  > **Note:** Compiler internals:
  > - Tail recursive call vs self recursive call : [`phase/Tailrec.scala`](https://github.com/flix/flix/blob/master/main/src/ca/uwaterloo/flix/language/phase/Tailrec.scala#L91)
- [From Datalog to Flix][paper_madsen_2016] by Magnus Madsen and al., June 2016.

## <span id="projects">Projects</span>

- [flix-pretty](https://github.com/stephentetley/flix-pretty) &ndash; A pretty print library for Flix.

## <span id="tools">Tools</span>

- [Flix for Visual Studio Code][vscode-flix].
- [Flix Gradle Plugin](https://github.com/KengoTODA/flix-gradle-plugin) by Kengo Toda.

***

*[mics](https://lampwww.epfl.ch/~michelou/)/April 2023* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- href links -->

[anchor_flix]: https://anchor.fm/happypathprogramming/episodes/54-Flix-Designing-a-principled-programming-language-with-Magnus-Madsen-e1dueb2
[blog_huehnken]: https://www.reactivesystems.eu/2022/06/24/flix-for-java-programmers.html
[flix]: https://flix.dev/
[flix_api]: https://api.flix.dev/
[flix_doc]: https://doc.flix.dev/
[flix_compiler_tests]: https://github.com/flix/flix/blob/master/main/test/flix/README.md
[flix_playground]: https://play.flix.dev/
[infoq_flix]: https://www.infoq.com/news/2022/02/flix-programming-language/
[paper_madsen_2020]: https://dl.acm.org/doi/10.1145/3563835.3567661
[paper_madsen_2018]: https://dl.acm.org/doi/10.1145/3178372.3179499
[paper_madsen_2016]: https://cs.au.dk/~magnusm/papers/pldi16/paper.pdf
[vscode-flix]: https://github.com/flix/vscode-flix
