# <span id="top">Playing with Flix in Ubuntu WSL</span> <span style="size:25%;"><a href="README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;;min-width:120px;"><a href="https://flix.dev/" rel="external"><img src="./docs/images/flix-logo.png" width="120" alt="Flix project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">This document presents one <a href="https://flix.dev/" rel="external">Flix</a> code example we work on in the <a href="https://ubuntu.com/wsl" rel="external">Ubuntu WSL</a> environment.
  </td>
  </tr>
</table>

> **&#9755;** We open a Ubuntu terminal to work on our [Flix] code examples in the same way as we do from a Windows prompt. We assume the [Ubuntu WSL][wsl] <sup id="anchor_01">[1](#footnote_01)</sup> is installed on the user's Windows machine.

We first go to directory **`flix-examples\`** which contains our local checkout of the GitHub project [**`flix-examples`**](https://github.com/michelou/flix-examples) :
<pre style="font-size:80%;">
<b>$ <a href="https://manpages.ubuntu.com/manpages/bionic/en/man1/pwd.1.html" rel="external">pwd</a></b>
/home/michelou
<b>$ <a href="https://manpages.ubuntu.com/manpages/bionic/en/man1/cd.1posix.html" rel="external">cd</a> /mnt/c/Users/michelou/workspace-perso/flix-examples/</b>
</pre>

Then we execute our Bash script [**`setenv.sh`**](./setenv.sh) to set up our Unix environment :

<pre style="font-size:80%;">
<b>$ . <a href="./examples/setenv.sh">./setenv.sh</a></b>
<b>$ <a href="https://manpages.ubuntu.com/manpages/bionic/en/man1/which.1.html" rel="external">which</a> bash gradle make</b>
/bin/bash
/opt/gradle-7.6/bin/gradle
/usr/bin/make
<b>$ <a href="https://manpages.ubuntu.com/manpages/bionic/en/man1/env.1.html" rel="external">env</a> | <a href="https://manpages.ubuntu.com/manpages/bionic/en/man1/grep.1.html" rel="external">grep</a> _HOME</b>
FLIX_HOME=/opt/flix-0.34.0
JAVA_HOME=/opt/jdk-temurin-11
SCALA_HOME=/opt/scala-2.13.10
GRADLE_HOME=/opt/gradle-7.6
</pre>

<!-- https://mirrors.edge.kernel.org/pub/software/scm/git/ -->

> **:mag_right:** We install additional software tools such as [Flix] <sup id="anchor_01">[1](#footnote_01)</sup>, [Gradle][gradle_cli] or [Scala][scala_getting_started] into root directory **`/opt/`**:
> <pre style="font-size:80%;">
> <b>$ <a href="https://manpages.ubuntu.com/manpages/bionic/en/man1/find.1.html" rel="external">find</a> /opt -maxdepth 1 -type d -print | <a href="https://manpages.ubuntu.com/manpages/bionic/en/man1/sort.1.html" rel="external">sort</a> | <a href="https://manpages.ubuntu.com/manpages/bionic/en/man1/xargs.1.html" rel="external">xargs</a> -i sh -c 'du -sh {}'</b>
> 44M     /opt/apache-ant-1.10.13
> 9.9M    /opt/apache-maven-3.8.7
> 2.4G    /opt/archives
> 2.2M    /opt/cfr-0.151
> 36M     /opt/flix-0.34.0
> 51M     /opt/git-2.39.1
> 129M    /opt/gradle-7.6
> 308M    /opt/jdk-11.0.17+8
> 61M     /opt/mill-0.10.11
> 81M     /opt/sbt-1.8.2
> 25M     /opt/scala-2.13.10
> 36M     /opt/scala3-3.2.2
> 15M     /opt/wabt-1.0.23
> </pre>

And finally we build and run one of our [Flix] code examples, for instance [**`areas`**](./examples/areas/), with either a [Bash script][bash_script], a [Gradle script][gradle_script] or a [Make script][make_script] :

<pre style="font-size:80%;">
<b>$ <a href="https://manpages.ubuntu.com/manpages/bionic/en/man1/cd.1posix.html" rel="external">cd</a> examples/areas/</b>
<b>$ <a href="./examples/areas/build.sh">./build.sh</a> -verbose clean run</b>
Delete directory "target"
Initialize directory "target/areas"
Copy Flix source files to directory "target/areas/src"
Copy Flix test source files to directory "target/areas/test"
Compile 2 Flix source files to directory "target/areas/build"
Create archive file "target/areas/areas.jar"
Execute the JAR file "target/areas/areas.jar"
2 :: 6 :: Nil
2 :: 6 :: Nil
&nbsp;
<b>$ <a href="https://docs.gradle.org/current/userguide/command_line_interface.html" rel="external">gradle</a> -q clean run</b>
2 :: 6 :: Nil
2 :: 6 :: Nil
&nbsp;
<b>$ <a href="https://www.gnu.org/software/make/manual/make.html" rel="external">make</a> clean run</b>
"rm" -rf "target"
[ -d "target/areas" ] || "mkdir" -p "target/areas"
cd "target/areas"; \
[ -d "build" ] || "/opt/jdk-temurin-11/bin/java" -jar "/opt/flix-0.34.0/flix.jar" init && \
"rm" -f "src/Main.flix" && \
"cp" -r "/mnt/c/Users/michelou/workspace-perso/flix-examples/examples/areas/src/main/." src && \
"/opt/jdk-temurin-11/bin/java" -jar "/opt/flix-0.34.0/flix.jar" build && \
"/opt/jdk-temurin-11/bin/java" -jar "/opt/flix-0.34.0/flix.jar" build-jar
"/opt/jdk-temurin-11/bin/java"  -jar "target/areas/areas.jar"
2 :: 6 :: Nil
2 :: 6 :: Nil
</pre>

<!--=======================================================================-->
 
## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Flix software installation*** [↩](#anchor_01)

<dl><dd>
<pre style="font-size:80%;">
<b>$ <a href="https://manpages.ubuntu.com/manpages/bionic/en/man8/sudo.8.html" rel="external">sudo</a> <a href="https://manpages.ubuntu.com/manpages/bionic/man2/mkdir.2.html">mkdir</a> flix-0.34.0</b>
<b>$ <a href="https://manpages.ubuntu.com/manpages/bionic/en/man1/cd.1posix.html" rel="external">cd</a> /opt/flix-0.34.0</b>
<b>$ <a href="" rel="external">sudo</a> wget -L <a href="https://github.com/flix/flix/releases" rel="external">https://github.com/flix/flix/releases/download/v0.34.0/flix.jar</a> -O flix.jar</b>
Resolving github.com (github.com)... 140.82.114.4
Connecting to github.com (github.com)|140.82.114.4|:443... connected.
HTTP request sent, awaiting response... 302 Found
[...]
HTTP request sent, awaiting response... 200 OK
Length: 36745570 (35M) [application/octet-stream]
Saving to: ‘flix.jar’

flix.jar 100%[==========================>]  35.04M  1.25MB/s    in 28s
2022-11-01 18:44:04 (1.25 MB/s) - ‘flix.jar’ saved [36745570/36745570]
</pre>
</dd></dl>

<span id="footnote_02">[2]</span> ***Updating our packages with*** **`apt`** [↩](#anchor_02)

<dl><dd>
We run command <a href="https://manpages.ubuntu.com/manpages/trusty/man8/apt.8.html" rel="external"><code><b>apt</b></code></a> to keep the packages of our <a href="https://ubuntu.com/wsl" rel="external">Ubuntu WSL</a> installation up-to-date :
<pre style="font-size:80%;">
<b>$ <a href="https://manpages.ubuntu.com/manpages/bionic/en/man1/uname.1.html" rel="external">uname</a> -a</b>
Linux DESKTOP-U9DCNVQ 4.19.128-microsoft-standard #1 SMP Tue Jun 23 12:58:10 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
</pre>

<pre style="font-size:80%;">
<b>$ <a href="https://manpages.ubuntu.com/manpages/bionic/en/man8/sudo.8.html" rel="external">sudo</a> <a href="https://manpages.ubuntu.com/manpages/bionic/en/man8/apt.8.html" rel="external">apt</a> update</b>
[sudo] password for michelou:
Hit:1 http://archive.ubuntu.com/ubuntu bionic InRelease
Get:2 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
[...]]
Get:23 http://archive.ubuntu.com/ubuntu bionic-backports/universe amd64 Packages [18.1 kB]
Get:24 http://archive.ubuntu.com/ubuntu bionic-backports/universe Translation-en [8668 B]
Fetched 12.6 MB in 12s (1085 kB/s)
Reading package lists... Done
Building dependency tree
Reading state information... Done
153 packages can be upgraded. Run 'apt list --upgradable' to see them.
</pre>

<pre style="font-size:80%;">
<b>$ <a href="https://manpages.ubuntu.com/manpages/bionic/en/man8/sudo.8.html" rel="external">sudo</a> <a href="https://manpages.ubuntu.com/manpages/bionic/en/man8/apt.8.html" rel="external">apt</a> upgrade</b>
Reading package lists... Done
Building dependency tree
Reading state information... Done
Calculating upgrade... Done
The following NEW packages will be installed:
  dbus-user-session
The following packages will be upgraded:
  apport bash bind9-host ca-certificates cloud-init cron curl
  [...]
  vim-runtime vim-tiny xxd xz-utils zlib1g zlib1g-dev
153 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
127 standard security updates
Need to get 419 MB of archives.
After this operation, 60.2 MB of additional disk space will be used.
Do you want to continue? [Y/n]
Get:1 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 bash amd64 4.4.18-2ubuntu1.3 [615 kB]
Get:2 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libc6-dev amd64 2.27-3ubuntu1.6 [2587 kB]
[...]
Get:152 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 unzip amd64 6.0-21ubuntu1.2 [168 kB]
Get:153 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 cloud-init all 22.3.4-0ubuntu1~18.04.1 [510 kB]
Get:154 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 open-vm-tools amd64 2:11.0.5-4ubuntu0.18.04.2 [543 kB]
Fetched 419 MB in 5min 46s (1212 kB/s)
Extracting templates from packages: 100%
Preconfiguring packages ...
(Reading database ... 63334 files and directories currently installed.)
Preparing to unpack .../bash_4.4.18-2ubuntu1.3_amd64.deb ...
Unpacking bash (4.4.18-2ubuntu1.3) over (4.4.18-2ubuntu1.2) ...
Setting up bash (4.4.18-2ubuntu1.3) ...
[...]
Setting up libisccfg160:amd64 (1:9.11.3+dfsg-1ubuntu1.18) ...
Setting up snapd (2.57.5+18.04) ...
Installing new version of config file /etc/apparmor.d/usr.lib.snapd.snap-confine.real ...
Installing new version of config file /etc/profile.d/apps-bin-path.sh ...
Created symlink /etc/systemd/system/multi-user.target.wants/snapd.aa-prompt-listener.service → /lib/systemd/system/snapd.aa-prompt-listener.service.
Setting up dpkg-dev (1.19.0.5ubuntu2.4) ...
Processing triggers for mime-support (3.60ubuntu1) ...
Processing triggers for ureadahead (0.100.0-21) ...
Running hooks in /etc/ca-certificates/update.d...1-2) ...1) ...
Processing triggers for initramfs-tools (0.130ubuntu3.13) ...
done.ssing triggers for ca-certificates (20211016~18.04.1) ...
done.ing certificates in /etc/ssl/certs.../cloud/cloud.cfg ...
</pre>


***

*[mics](https://lampwww.epfl.ch/~michelou/)/February 2023* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[adts]: https://wiki.haskell.org/Algebraic_data_type
[bash_script]: https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_01.html "Bash - Creating and running a script"
[flix]: https://flix.dev/ "Flix Programming Language"
[gradle_cli]: https://docs.gradle.org/current/userguide/command_line_interface.html "Gradle Command-Line Interface"
[gradle_script]: https://docs.gradle.org/current/userguide/tutorial_using_tasks.html "Gradle Build Script Basis"
[make_cli]: https://www.gnu.org/software/make/manual/make.html "GNU make"
[make_script]: https://makefiletutorial.com/ "Learn Makefiles"
[scala_getting_started]: https://docs.scala-lang.org/getting-started/ "Scala - Getting started"
[wsl]: https://ubuntu.com/wsl "Ubuntu WSL"
