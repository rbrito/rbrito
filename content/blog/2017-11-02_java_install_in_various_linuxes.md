---
title: "Comparison of JDK installation of various Linux distributions"
date: "Thu, 02 Nov 2017 23:13:56 -0200"
tags: [debian, free-software, java, linux, ubuntu]
---

Today I spent some time in the morning seeing how one would install the JDK
on Linux distributions. This is to create a little comparative tutorial to
teach introductory Java.

Installing the JDK is, thanks to the OpenJDK developers in Debian and Ubuntu
(Matthias Klose and helpers), a very easy task. You simply type something
like:

    apt-get install openjdk-8-jdk

Since for a student it is better to have everything for experiments, I
install the [full version][jdk-full], not only the
[`-headless`][jdk-headless] version. Given my familiarity with
Debian/Ubuntu, I didn't have to think about the way of installing it, of
course.

[jdk-full]: https://packages.debian.org/sid/openjdk-8-jdk
[jdk-headless]: https://packages.debian.org/sid/openjdk-8-jdk-headless

But as this is a tutorial meant to be as general as I can, I tried also to
include instructions on how to install Java on other distributions. The
first two that came to my mind were [openSUSE][opensuse] and [Fedora][fedora].

[opensuse]: https://www.opensuse.org/
[fedora]: https://getfedora.org/

Both use the RPM package format for their "native" packages (in the same
sense that Debian uses DEB packages for "native" packages). But they use
different higher-level tools to install such packages: Fedora uses a tool
called [`dnf`][dnf], while openSUSE uses [`zypper`][zypper].

[dnf]: https://fedoraproject.org/wiki/DNF
[zypper]: https://en.opensuse.org/SDB:Zypper_usage

To try these distributions, I got their netinstall ISOs and used
`qemu`/`kvm` to install on a virtual machine. I used the following to
install/run the virtual machines (the example below, is, of course, for openSUSE):


    qemu-system-x86_64 -enable-kvm -m 4096 -smp 2 -net nic,model=e1000 -net user -drive index=0,media=disk,cache=unsafe,file=suse.qcow2 -cdrom openSUSE-Leap-42.3-NET-x86_64.iso

The names of the packages also change from one distribution to another. On
Fedora, I had to use:

    dnf install java-1.8.0-openjdk-devel

On openSUSE, I had to use:

    zypper install java-1_8_0-openjdk-devel

Note that one distribution uses dots in the names of the packages while the
other uses underscores.

One interesting thing that I noticed with `dnf` was that, when I used it, it
automatically refreshed the package lists from the network, something which
I forgot, and it was a pleasant surprise. I don't know about `zypper`, but I
guess that it probably had fresh indices when the installation finished.

Both installations were effortless after I knew the names of the packages to
install.

Oh, BTW, in my 5 minute exploration with these distributions, I noticed that
if you don't want the JDK, but only the JRE, then you omit the `-devel`
suffix.  It makes sense when you think about it, for consistency with other
packages, but Debian's conventions also make sense (JRE with `-jre` suffix,
JDK with `-jdk` suffix).

I failed miserably to use Fedora's prebaked, vanilla
[cloud image][fedoracloud], as I couldn't login on this image and I decided
to just install the whole OS on a fresh virtual machine.

[fedoracloud]: https://alt.fedoraproject.org/cloud/

I don't have instructions on how to install on [Gentoo][gentoo] nor on
[Arch][arch], though.

[gentoo]: https://getfedora.org/
[arch]: https://www.archlinux.org/

I now see how hard it is to cover instructions/provide software for as many
distributions as you wish, given the multitude of package managers,
conventions etc.

