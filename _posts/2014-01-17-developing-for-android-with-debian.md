---
layout: post
title: "Developing for Android with Debian"
date: "Fri, 17 Jan 2014 20:18:04 -0200"
tags: [android, debian, free-software, java]
---

I have just enrolled in a MOOC to learn about programming with Android.
There are many tutorials and reports of people using Linux for the
development of the apps out there, but, unfortunately, many of them are
outdated or contain misleading information.

You will find bazillion instructions out there telling you to install
JDK6. (Even the instructions in the MOOCs say so, and Google says that it is
the only supported version of Java). Even more than that, some of them will
tell you that you should *not* use OpenJDK, but use Oracle's JDK instead.

So, if you have a pure `amd64` system and you try to install the x86-64
version of Google's Android Developer Tools (ADT), you are going to have a
surprise: you will have all sorts of programs telling you that you have file
not found, even though the required binaries are there.

(This is, of course, besides install `openjdk-7-jdk`, if you wish to use the
integrated Eclipse environment).

Turns out that the so-called 64-bit ADT/SDK actually has many 32-bit
executables(!) and they aren't statically linked. Inspecting them, I needed
the following packages:

        gcc-4.8-base:i386
        libc6-i686:i386
        libc6:i386
        libgcc1:i386
        libstdc++6:i386
        zlib1g:i386

It is worth observing that:

* `libstdc++6:i386` depends (transitively) on `libc6:i386`, `libgcc1:i386`,
  and `gcc-4.8-base:i386`.
* `zlib1g:i386` depends (transitively) on `libc6:i386`, `libgcc1:i386`, and
  `gcc-4.8-base:i386`.

Given the above, and given that the version of the GCC libraries can vary a
lot, it is perhaps better to simply do something like:

    apt-get install libstdc++6:i386 zlib1g:i386

Although not necessary, since you are using an amd64 machine, your computer
already supports many more recent instructions that will be used if you
install the package `libc6-i686:i386`.

To avoid the emulator from spitting out error messages related to `libGL.so`,
install `libgl1-mesa-dev` (note: *not* `i386` here).

This way, you will be able to run the embedded QEMU with full KVM
acceleration if you pass the options `-qemu -m 1024 -enable-kvm` on
Eclipse's "Run > Run Configurations... > Target > Additional Emulator
Command Line Options".

After that, you are probably good to go.

