# <span id="top">Flix Build Dependencies</span> <span style="font-size:90%;">[↩](README.md#top)</span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:60px;max-width:100px;">
    <a href="https://flix.dev/" rel="external"><img style="border:0;width:80px;" src="./docs/images/flix-logo.png" alt="Flix project" /></a>
  </td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    This document presents changes in <a href="https://flix.dev/" rel="external">Flix</a> build dependencies.<br/>&nbsp;
  </td>
  </tr>
</table>

Releases : [0.4](#flix04_releases), [0.3](#flix03_releases), [0.2](#flix02_releases).
<!--
## <span id="intro">Introduction</span>

> **:mag_right:** We observe a jump in the increases in size of the software distributions : 
> |  Version  | Release date | Zip archive | Installation |
> |:----------|:------------:|:-----------:|:------------:|
> | [3.2.1](https://github.com/lampepfl/dotty/releases/tag/3.2.1-RC2) | Sep 2022 | 35.6 MB | 37.6 MB |
> | [3.2.0](https://github.com/lampepfl/dotty/releases/tag/3.2.0) | Sep 2022 | 34.2 MB | 36.1 MB |
> |  [3.1.3](https://github.com/lampepfl/dotty/releases/tag/3.1.3)     | Jun 2022 |   33.8 MB   |   35.7 MB    |
> |  [3.1.2](https://github.com/lampepfl/dotty/releases/tag/3.1.2)     | Apr 2022 |   33.4 MB   |   35.3 MB    |
-->

## <span id="flix04_releases">Dependencies in Flix 0.4 Releases</span>

The [Flix] 0.4 software distributions depend on the following external libraries.

<table style="font-size:80%;">
<tr>
  <th style="padding:4px;min-width:115px;">Java&nbsp;Archive</th>
  <th style="padding:4px;">Current<br/>Version</th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.40.0">0.40.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.41.0">0.41.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.42.0">0.42.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.43.0">0.43.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.44.0">0.44.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.45.0">0.45.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.48.0">0.48.0</a><br/><span style="color:red;"></span></th>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://github.com/antlr/antlr4"><code>antlr4-runtime </code></a><br/>(<a href="https://github.com/antlr/antlr4/releases">relnotes</a>)</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.antlr/antlr4-runtime/4.13.1"><b>4.13.1</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.antlr/antlr4-runtime/4.11.1">4.11.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.antlr/antlr4-runtime/4.11.1">4.11.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.antlr/antlr4-runtime/4.11.1">4.11.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.antlr/antlr4-runtime/4.11.1">4.11.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.antlr/antlr4-runtime/4.11.1">4.11.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.antlr/antlr4-runtime/4.11.1">4.11.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.antlr/antlr4-runtime/4.11.1">4.11.1</a><br/>&nbsp;</td>
</tr>
<tr>
<td style="padding:4px;"><a href="https://github.com/coursier/coursier/releases"><code>coursier</code></a><br/>(<a href="https://github.com/coursier/coursier/releases">relnotes</a>)</td>
  <td style="padding:4px;"><a href="https://github.com/coursier/coursier/releases/tag/v2.1.9"><b>2.1.9</b></a><br/><span style="color:gray;font-size:80%;">(Feb&nbsp;2024)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/io.get-coursier/coursier_2.13/2.1.4">2.1.4</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/io.get-coursier/coursier_2.13/2.1.4">2.1.4</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/io.get-coursier/coursier_2.13/2.1.4">2.1.4</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/io.get-coursier/coursier_2.13/2.1.4">2.1.4</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/io.get-coursier/coursier_2.13/2.1.4">2.1.4</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/io.get-coursier/coursier_2.13/2.1.4">2.1.4</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/io.get-coursier/coursier_2.13/2.1.4">2.1.4</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://github.com/google/guava/releases"><code>guava</code></a><br/>(<a href="https://github.com/google/guava/releases">relnotes</a>)</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.google.guava/guava/33.0.0-jre"><b>33.0.0-jre</b></a><br/><span style="color:gray;font-size:80%;">(Dec&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.google.guava/guava/31.1-jre">31.1-jre</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.google.guava/guava/31.1-jre">31.1-jre</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.google.guava/guava/31.1-jre">31.1-jre</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.google.guava/guava/31.1-jre">31.1-jre</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.google.guava/guava/31.1-jre">31.1-jre</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.google.guava/guava/31.1-jre">31.1-jre</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.google.guava/guava/31.1-jre">31.1-jre</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket"><code>java_websocket</code></a><br/>(<a href="https://github.com/TooTallNate/Java-WebSocket/releases">relnotes</a>)</td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.5.6"><b>1.5.6</b></a><br/><span style="color:gray;font-size:80%;">(Feb&nbsp;2024)</span></td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.5.3">1.5.3</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.5.3">1.5.3</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.5.3">1.5.3</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.5.3">1.5.3</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.5.3">1.5.3</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.5.3">1.5.3</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.5.3">1.5.3</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline"><code>jline</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.25.1"><b>3.25.1</b></a><br/><span style="color:gray;font-size:80%;">(Jan&nbsp;2024)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1">3.5.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1">3.5.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.22.0">3.22.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.22.0">3.22.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.22.0">3.22.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.25.0">3.25.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.25.0">3.25.0</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core"><code>json4s-*</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/4.1.0-M4"><b>4.1.0</b></a><br/><span style="color:gray;font-size:80%;">(Nov&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.6.12">3.6.12</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.6.12">3.6.12</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.6.12">3.6.12</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.6.12">3.6.12</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.6.12">3.6.12</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.6.12">3.6.12</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.6.12">3.6.12</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm"><code>objectweb.asm</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.6"><b>9.6</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2">9.2</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2">9.2</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.6">9.6</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.6">9.6</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.6">9.6</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.6">9.6</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.6">9.6</a></td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled"><code>parboiled</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.5.1"><b>2.5.1</b></a><br/><span style="color:gray;font-size:80%;">(Oct&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.4.1">2.4.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.4.1">2.4.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.4.1">2.4.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.4.1">2.4.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.4.1">2.4.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.4.1">2.4.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.4.1">2.4.1</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;font-size:80%;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections"><code>scala.collection.parallel</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/1.0.4"><b>1.0.4</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2021)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a><br/>&nbsp;</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library"><code>scala-library</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.12"><b>2.13.12</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.11">2.13.11</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.11">2.13.11</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.11">2.13.11</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.12">2.13.12</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.12">2.13.12</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.12">2.13.12</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.12">2.13.12</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://github.com/tomlj/tomlj"><code>tomj</code></a><br/>(<a href="https://github.com/tomlj/tomlj/releases/tag/1.1.0">relnotes</a>)</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.tomlj/tomlj/1.1.1"><b>1.1.1</b></a><br/><span style="color:gray;font-size:80%;">(Dec&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.tomlj/tomlj/1.1.0">1.1.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.tomlj/tomlj/1.1.0">1.1.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.tomlj/tomlj/1.1.0">1.1.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.tomlj/tomlj/1.1.0">1.1.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.tomlj/tomlj/1.1.0">1.1.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.tomlj/tomlj/1.1.0">1.1.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.tomlj/tomlj/1.1.0">1.1.0</a><br/>&nbsp;</td>
</tr>
</table>

<!--================================ 0.3 ==================================-->

## <span id="flix03_releases">Dependencies in Flix 0.3 Releases</span> [**&#x25B4;**](#top)

The [Flix] 0.3 software distributions depend on the following external libraries.

<table style="font-size:80%;">
<tr>
  <th style="padding:4px;min-width:115px;">Java&nbsp;Archive</th>
  <th style="padding:4px;">Current<br/>Version</th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.30.0">0.30.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.31.0">0.31.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.32.0">0.32.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.33.0">0.33.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.34.0">0.34.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.35.0">0.35.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.36.0">0.36.0</a><br/><span style="color:red;"></span></th>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://github.com/antlr/antlr4"><code>antlr4-runtime </code></a><br/>(<a href="https://github.com/antlr/antlr4/releases">relnotes</a>)</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.antlr/antlr4-runtime/4.13.1"><b>4.13.1</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2023)</span></td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.antlr/antlr4-runtime/4.11.1">4.11.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.antlr/antlr4-runtime/4.11.1">4.11.1</a><br/>&nbsp;</td>
</tr>
<tr>
<td style="padding:4px;"><a href="https://github.com/coursier/coursier/releases"><code>coursier</code></a><br/>(<a href="https://github.com/coursier/coursier/releases">relnotes</a>)</td>
  <td style="padding:4px;"><a href="https://github.com/coursier/coursier/releases/tag/v2.1.8"><b>2.1.8</b></a><br/><span style="color:gray;font-size:80%;">(Nov&nbsp;2023)</span></td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/io.get-coursier/coursier_2.13/2.1.0-RC4">2.1.0-RC4</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/io.get-coursier/coursier_2.13/2.1.0-RC4">2.1.0-RC4</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://github.com/google/guava/releases"><code>guava</code></a><br/>(<a href="https://github.com/google/guava/releases">relnotes</a>)</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.google.guava/guava/32.1.3-jre"><b>32.1.3-jre</b></a><br/><span style="color:gray;font-size:80%;">(Oct&nbsp;2023)</span></td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.google.guava/guava/25.1-jre">25.1-jre</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.google.guava/guava/31.1-jre">31.1-jre</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket"><code>java_websocket</code></a><br/>(<a href="https://github.com/TooTallNate/Java-WebSocket/releases">relnotes</a>)</td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.5.4"><b>1.5.4</b></a><br/><span style="color:gray;font-size:80%;">(Jul&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.3.9">1.3.9</a><br/><span style="color:gray;font-size:80%;">(Aug&nbsp;2018)</span></td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.3.9">1.3.9</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.3.9">1.3.9</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.3.9">1.3.9</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.3.9">1.3.9</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.3.9">1.3.9</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.5.3">1.5.3</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline"><code>jline</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.24.1"><b>3.24.1</b></a><br/><span style="color:gray;font-size:80%;">(Nov&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1">3.5.1</a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2017)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1">3.5.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1">3.5.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1">3.5.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1">3.5.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1">3.5.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1">3.5.1</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core"><code>json4s-*</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/4.0.6"><b>4.0.6</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2022)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.5.5">3.5.5</a><br/><span style="color:gray;font-size:80%;">(Jun&nbsp;2019)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.5.5">3.5.5</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.5.5">3.5.5</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.5.5">3.5.5</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.5.5">3.5.5</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.5.5">3.5.5</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.5.5">3.5.5</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm"><code>objectweb.asm</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.6"><b>9.6</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2">9.2</a><br/><span style="color:gray;font-size:80%;">(Jun&nbsp;2021)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2">9.2</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2">9.2</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2">9.2</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2">9.2</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2">9.2</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2">9.2</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled"><code>parboiled</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.5.1"><b>2.5.1</b></a><br/><span style="color:gray;font-size:80%;">(Oct&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.2.1">2.2.1</a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2020)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.2.1">2.2.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.2.1">2.2.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.2.1">2.2.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.2.1">2.2.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.2.1">2.2.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.4.1">2.4.1</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;font-size:80%;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections"><code>scala.collection.parallel</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/1.0.4"><b>1.0.4</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2021)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a><br/><span style="color:gray;font-size:80%;">(Jun&nbsp;2019)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library"><code>scala-library</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.10"><b>2.13.10</b></a><br/><span style="color:gray;font-size:80%;">(Oct&nbsp;2022)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.5">2.13.5</a><br/><span style="color:gray;font-size:80%;">(Feb&nbsp;2021)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.5">2.13.5</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.5">2.13.5</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.5">2.13.5</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.5">2.13.5</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.5">2.13.5</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.5">2.13.5</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect"><code>scala-reflect</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect/2.13.12"><b>2.13.12</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect/2.13.5">2.13.5</a><br/><span style="color:gray;font-size:80%;">(Feb&nbsp;2021)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect/2.13.5">2.13.5</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect/2.13.5">2.13.5</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect/2.13.5">2.13.5</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect/2.13.5">2.13.5</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect/2.13.5">2.13.5</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect/2.13.5">2.13.5</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml"><code>scala.xml</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/2.2.0"><b>2.2.0</b></a><br/><span style="color:gray;font-size:80%;">(Jul&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/1.2.0">1.2.0</a><br/><span style="color:gray;font-size:80%;">(Jun&nbsp;2019)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/1.2.0">1.2.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/1.2.0">1.2.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/1.2.0">1.2.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/1.2.0">1.2.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/1.2.0">1.2.0</a><br/>&nbsp;</td>
  <td style="padding:4px;">-</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic"><code>scalactic</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.2.17"><b>3.2.17</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.0.8">3.0.8</a><br/><span style="color:gray;font-size:80%;">(Jun&nbsp;2019)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.0.8">3.0.8</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.0.8">3.0.8</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.0.8">3.0.8</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.0.8">3.0.8</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.0.8">3.0.8</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.2.15">3.2.15</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13"><code>scalatest</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.2.17"><b>3.2.17</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.0.8">3.0.8</a><br/><span style="color:gray;font-size:80%;">(Jun&nbsp;2019)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.0.8">3.0.8</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.0.8">3.0.8</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.0.8">3.0.8</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.0.8">3.0.8</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.0.8">3.0.8</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.2.15">3.2.15</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt"><code>scopt</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/4.1.0"><b>4.1.0</b></a><br/><span style="color:gray;font-size:80%;">(Jul&nbsp;2022)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/4.0.1">4.0.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/4.0.1">4.0.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/4.0.1">4.0.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/4.0.1">4.0.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/4.0.1">4.0.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/4.0.1">4.0.1</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/4.0.1">4.0.1</a><br/>&nbsp;</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.chuusai/shapeless"><code>shapeless</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.chuusai/shapeless_2.13/2.3.10"><b>2.3.10</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2022)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.chuusai/shapeless_2.13/2.3.3">2.3.3</a><br/><span style="color:gray;font-size:80%;">(Jun&nbsp;2019)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.chuusai/shapeless_2.13/2.3.3">2.3.3</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.chuusai/shapeless_2.13/2.3.3">2.3.3</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.chuusai/shapeless_2.13/2.3.3">2.3.3</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.chuusai/shapeless_2.13/2.3.3">2.3.3</a><br/>&nbsp;</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://github.com/tomlj/tomlj"><code>tomj</code></a><br/>(<a href="https://github.com/tomlj/tomlj/releases/tag/1.1.0">relnotes</a>)</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.tomlj/tomlj/1.1.0"><b>1.1.0</b></a><br/><span style="color:gray;font-size:80%;">(Oct&nbsp;2022)</span></td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;">-</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.tomlj/tomlj/1.1.0">1.1.0</a><br/>&nbsp;</td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.tomlj/tomlj/1.1.0">1.1.0</a><br/>&nbsp;</td>
</tr>
</table>

<!--================================== 0.2 ================================-->

## <span id="flix02_releases">Dependencies in Flix 0.2 Releases</span> [**&#x25B4;**](#top)

The [Flix] 0.2 software distributions depend on the following external libraries.

<table style="font-size:80%;">
<tr>
  <th style="padding:4px;min-width:115px;">Java Archive</th>
  <th style="padding:4px;">Current<br/>Version</th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.24.0">0.24.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.25.0">0.25.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.26.0">0.26.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.27.0">0.27.0</a></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.28.0">0.28.0</a><br/><span style="color:red;"></span></th>
  <th><a href="https://github.com/flix/flix/releases/tag/v0.29.0">0.29.0</a><br/><span style="color:red;"></span></th>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket"><code>java_websocket</code></a><br/>(<a href="https://github.com/TooTallNate/Java-WebSocket/releases">relnotes</a>)</td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.5.4"><b>1.5.4</b></a><br/><span style="color:gray;font-size:80%;">(Jul&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.3.9">1.3.9</a><br/><span style="color:gray;font-size:80%;">(Aug&nbsp;2018)</span></td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.3.9">1.3.9</a></td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.3.9">1.3.9</a></td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.3.9">1.3.9</a></td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.3.9">1.3.9</a></td>
  <td style="padding:4px;"><a href="https://github.com/TooTallNate/Java-WebSocket/releases/tag/v1.3.9">1.3.9</a></td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline"><code>jline</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.24.1"><b>3.24.1</b></a><br/><span style="color:gray;font-size:80%;">(Nov&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1">3.5.1</a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2017)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1">3.5.1</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1">3.5.1</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1">3.5.1</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1">3.5.1</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.jline/jline/3.5.1">3.5.1</a></td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core"><code>json4s-*</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/4.0.6"><b>4.0.6</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2022)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.5.5">3.5.5</a><br/><span style="color:gray;font-size:80%;">(Jun&nbsp;2019)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.5.5">3.5.5</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.5.5">3.5.5</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.5.5">3.5.5</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.5.5">3.5.5</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.json4s/json4s-core_2.13/3.5.5">3.5.5</a></td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm"><code>objectweb.asm</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.6"><b>9.6</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2">9.2</a><br/><span style="color:gray;font-size:80%;">(Jun&nbsp;2021)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2">9.2</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2">9.2</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2">9.2</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2">9.2</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.ow2.asm/asm/9.2">9.2</a></td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled"><code>parboiled</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.5.1"><b>2.5.1</b></a><br/><span style="color:gray;font-size:80%;">(Oct&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.2.1">2.2.1</a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2020)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.2.1">2.2.1</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.2.1">2.2.1</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.2.1">2.2.1</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.2.1">2.2.1</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.parboiled/parboiled_2.13/2.2.1">2.2.1</a></td>
</tr>
<tr>
  <td style="padding:4px;font-size:80%;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections"><code>scala.collection.parallel</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/1.0.4"><b>1.0.4</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2021)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a><br/><span style="color:gray;font-size:80%;">(Jun&nbsp;2019)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections_2.13/0.2.0">0.2.0</a></td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library"><code>scala-library</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.10"><b>2.13.10</b></a><br/><span style="color:gray;font-size:80%;">(Oct&nbsp;2022)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.5">2.13.5</a><br/><span style="color:gray;font-size:80%;">(Feb&nbsp;2021)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.5">2.13.5</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.5">2.13.5</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.5">2.13.5</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.5">2.13.5</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-library/2.13.5">2.13.5</a></td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect"><code>scala-reflect</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect/2.13.12"><b>2.13.12</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect/2.13.5">2.13.5</a><br/><span style="color:gray;font-size:80%;">(Feb&nbsp;2021)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect/2.13.5">2.13.5</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect/2.13.5">2.13.5</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect/2.13.5">2.13.5</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect/2.13.5">2.13.5</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang/scala-reflect/2.13.5">2.13.5</a></td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml"><code>scala.xml</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/2.2.0"><b>2.2.0</b></a><br/><span style="color:gray;font-size:80%;">(Jul&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/1.2.0">1.2.0</a><br/><span style="color:gray;font-size:80%;">(Jun&nbsp;2019)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/1.2.0">1.2.0</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/1.2.0">1.2.0</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/1.2.0">1.2.0</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/1.2.0">1.2.0</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scala-lang.modules/scala-xml_2.13/1.2.0">1.2.0</a></td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic"><code>scalactic</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.2.17"><b>3.2.17</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.0.8">3.0.8</a><br/><span style="color:gray;font-size:80%;">(Jun&nbsp;2019)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.0.8">3.0.8</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.0.8">3.0.8</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.0.8">3.0.8</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.0.8">3.0.8</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalactic/scalactic_2.13/3.0.8">3.0.8</a></td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13"><code>scalatest</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.2.17"><b>3.2.17</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2023)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.0.8">3.0.8</a><br/><span style="color:gray;font-size:80%;">(Jun&nbsp;2019)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.0.8">3.0.8</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.0.8">3.0.8</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.0.8">3.0.8</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.0.8">3.0.8</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/org.scalatest/scalatest_2.13/3.0.8">3.0.8</a></td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt"><code>scopt</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/4.1.0"><b>4.1.0</b></a><br/><span style="color:gray;font-size:80%;">(Jul&nbsp;2022)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/3.7.1">3.7.1</a><br/><span style="color:gray;font-size:80%;">(Jun&nbsp;2019)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/3.7.1">3.7.1</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/4.0.1">4.0.1</a><br/><span style="color:gray;font-size:80%;">(Jul&nbsp;2022)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/4.0.1">4.0.1</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/4.0.1">4.0.1</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.github.scopt/scopt_2.13/4.0.1">4.0.1</a></td>
</tr>
<tr>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.chuusai/shapeless"><code>shapeless</code></a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.chuusai/shapeless_2.13/2.3.10"><b>2.3.10</b></a><br/><span style="color:gray;font-size:80%;">(Sep&nbsp;2022)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.chuusai/shapeless_2.13/2.3.3">2.3.3</a><br/><span style="color:gray;font-size:80%;">(Jun&nbsp;2019)</span></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.chuusai/shapeless_2.13/2.3.3">2.3.3</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.chuusai/shapeless_2.13/2.3.3">2.3.3</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.chuusai/shapeless_2.13/2.3.3">2.3.3</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.chuusai/shapeless_2.13/2.3.3">2.3.3</a></td>
  <td style="padding:4px;"><a href="https://mvnrepository.com/artifact/com.chuusai/shapeless_2.13/2.3.3">2.3.3</a></td>
</tr>
</table>

<!--
## <span id="footnotes">Footnotes</span>

<span id="footnote_01">[1]</span> **`jline 3.21.0` and `JNA 5.9.0` *Library Updates*** [↩](#anchor_01)

<dl><dd>
</dd></dl>
-->

***

*[mics](https://lampwww.epfl.ch/~michelou/)/October 2025* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[flix]: https://flix.dev/
