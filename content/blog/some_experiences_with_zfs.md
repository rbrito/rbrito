---
title: "Some experiences with ZFS"
date: "Sat, 08 Sep 2012 23:42:24 -0300"
tags: [compression, debian-planet, debian, deduplication, filesystems, free-software, linux, zfs]
---

Continuing the [ZFS evaluation journey][0] (which I will summarize here with
the things that I learned), I was able to fit about 2.5TB of data on a
single 2TB drive, with deduplication enabled.

Unfortunately, even *moving* files around in ZFS (which you would think
would be a cheap operation) takes ages. Removing files also takes ages.

In a *completely* unloaded Phenom II X4 910 system running Linux 3.5.2
(actually, from Debian's experimental), and zfsonlinux version
0.6.0.71-0ubuntu1~precise1 (recompiled from source to work with my Debian
system), I tried to remove a subdirectory that had about 4000
files. According to time, it took:

    real    42m51.487s
    user    0m0.188s
    sys     0m16.769s

Which is a bit too slow.

I just (read: "yesterday") upgraded this machine from 4GB to 6GB of RAM
(well, I would have updated it to 8GB of RAM as that is what I ordered, but
it one of the RAM chips arrived dead here and I simply took one of the new
4GB card and one of the older 2GB card).

But, honestly, I don't see change in upgrading the RAM from 4GB to 6GB and,
unless something magic happens with 2GB more, I wouldn't expect a whole
different story with 8GB of RAM. Oh, no swap is being used (well, it is an
unloaded machine after all), and the Linux kernel swappiness knob is at its
default of 60.

What I *do* see, though, is that even for a single file removal, the disk is
thrashing a lot. I mean *like* crazy and that is, of course, the prime
suspect of the bad performance (of course, of course). So, there must be
some really crazy metadata churning going on here and I guess that the
people from the LLNL would like to know of their modules producing this
behavior.

Keep tuned for some future impressions.

[0]: https://plus.google.com/117659222649141007981/posts/T3BcxA7wKjK


