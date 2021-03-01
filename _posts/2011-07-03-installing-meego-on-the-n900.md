---
layout: post
title: "Installing Meego on the N900"
date: "Sun, 03 Jul 2011 03:55:50 -0300"
tags: [debian, free-software, linux, meego, n900]
---

My last cellphone was a dumb phone. I seem to remember that it was called
something like Samsung Voicer. It didn't have those hip things like SIM
cards.

OK. Fast forward to December of 2010, and after a long hiatus, I decided to
get a new phone.  It was this shiny Nokia N900. The biggest thing that made
me want this one was that some people at DebConf 10 were praising it for
having a Debian-like distribution in it, and that it worked very well.

I saw that Phil Hands was
[enthusiastically talking about the bargain of getting one in New York][0]
and that it would have cost him many pounds in the UK and, so, he was happy
with it.

Otávio Salvador also got one in NY and during
[one of the nights of that DebConf][7] with him, Tiago Vaz, Daniel Baumann,
and Chris Lamb, I asked him to call my parents here in Brazil and he let me
use his N900. I had more time with it and played a little bit with the
command line, opened the stock media player and played a beautiful trailer
of [9 (2009 film)][1], leaving me a very good impression.

I bought one, and, indeed, it is a very good machine that can even make
phone calls. The ability to run Linux on it (even if it contains some
non-free pieces of software) was decisive in me getting it.  It runs this
distribution called [Maemo 5][2] which is loosely based on Debian.

But now, Maemo is not the "cool thing" to run, regarding Linux on these
portable devices. [Meego][3] is. But with the advent of many Internet forums
has brought many people writing some long, convoluted howto documents for
things that would be better done as, say, providing a script or, better yet,
preparing a package.

In the case of getting Meego running on the N900, only three things are
required:

1. Install `uboot-pr13` while in Maemo.
2. Uncompress the [MeeGo 1.2 Community Edition for Nokia N900][5] image to a
µSD card.
3. Turn the phone off, plug in the µSD card, and **PUT THE BACK COVER** on
the phone.

The last bit of the third step is crucial, as, otherwise, the SD card won't
be detected and you will get kernel panics with the device trying to mount
the root filesystem from a device that is not there.

As an aside, the official documentation tells us one should uncompress the
available pre-made images and write them with `dd` to the device. In my
experience, it is completely unnecessary to use it and, in fact, it is so 6
times slower than using a simple shell redirection. That is, instead of:

    bzip2 -d < mg-handset-armv7nhl-n900-whateverwhatever-mmcblk0p.raw.bz2 | dd bs=4096 of=/dev/mmcblk0

you can get better results with the simpler:

    bzip2 -d < mg-handset-armv7nhl-n900-whateverwhatever-mmcblk0p.raw.bz2 > /dev/mmcblk0

I actually used [lbzip2][6] instead of bzip2, but that shouldn't matter. The use
of the small block size for the `dd` command is probably the culprit, but I
don't see the need to write the uncompressed data in chunks this small. If
there is a problem, I would love to be informed of that.

As trying it with `uboot` and a µSD card doesn't mess with your "safe" Maemo
installation, this is a good way to play with the successor of Maemo.
Perhaps, if we give good feedback to the project, we can influence the
direction that it is taking.

It will surely be nice to learn about this new "consumer-oriented"
distribution.

[0]: https://gallery.debconf.org/v/debconf10/album/album_004/41-20100801T020944.JPG.html
[1]: http://en.wikipedia.org/wiki/9_%282009_film%29
[2]: http://maemo.org/
[3]: http://wiki.meego.com/ARM/N900
[4]: https://meego.com/devices/handset/installing-meego-nokia-n900
[5]: http://repository.maemo.org/meego/n900-de/archive/1.2.0.90.6.20110630.4.DE.2011-07-01.1/images/mg-handset-armv7nhl-n900-ce-stable/
[6]: http://packages.debian.org/sid/lbzip2
[7]: http://www.flickr.com/photos/tiagovaz/4870648124/in/set-72157624676953084


