---
layout: post
title: "Please let me zoom my documents!"
date: "2010-05-27 11:17:00"
tags: [debian, fonts, free-software, tex]
---

It all started when I tried to typeset my documents with the
[Utopia](http://en.wikipedia.org/wiki/Utopia%20(typeface)) typeface,
which is Free Software, since Adobe liberated it to the TeX Users Group.
There are some nice packages for changing fonts in LaTeX with Utopia,
like
[`mathdesign`](http://www.ctan.org/tex-archive/help/Catalogue/entries/mathdesign-utopia.html)
and
[fourier](http://www.ctan.org/tex-archive/help/Catalogue/entries/fourier.html).
But I wanted to play with a new toy, [XeTeX](http://www.tug.org/xetex/).
Then, seeing as small caps was missing from the fonts that Adobe
donated, I tried to just fake them with a program that I had never heard
of before: [fontforge](http://fontforge.sf.net/). My [first
attempt](http://bugs.debian.org/569548) wasn\'t that very successful,
but, after reading a little bit of the code, [the reason for the problem
was soon discovered](http://bugs.debian.org/569548#15). At the same
time, I wanted to *see* what I had done with a PDF reader. The options
aren\'t many here: xpdf was already removed from Debian\'s unstable
(which is the distribution that I use), trying to [update
it](http://bugs.debian.org/527840) proved to be unsuccessful and
upstream isn\'t that active (which, by the way, led to the creation of
the [poppler
project](http://cgit.freedesktop.org/poppler/poppler/tree/README)).
Unfortunately, some of the Free PDF viewers seem to be
[limited](https://bugs.launchpad.net/evince/+bug/241604)
[to](https://bugzilla.redhat.com/show_bug.cgi?id=532946) a
[maximum](http://mail.gnome.org/archives/evince-list/2007-March/msg00002.html)
[zoom](http://bugs.debian.org/583119) [of
400%](http://bugs.debian.org/580495), while some documents seem to
demand more zooming (especially those with little, tiny letters, and for
those people, like myself, that don\'t have good eyesight). Patching the
programs to eliminate those hardcoded limits isn\'t that hard, but the
results with evince and epdfview can be frightening: [a very simple
document](http://kernel.org/pub/linux/kernel/people/hpa/raid6.pdf), when
zoomed with epdfview to, say, 1600% uses so much memory that one needs
to watch out for the Out Of Memory killer and so much swapping that it
is hard to believe. Don\'t believe my words. Just try it. But, hey, I
just want to see a document without having to suffer too much. And 400%
isn\'t enough for many documents that I have. Especially when I want to
see how a given font has been rendered on a document. I have not yet
investigated the real cause of the huge memory consumption, but I would
trust the words of the developers, that [evince does everything in a big
piece of memory](https://bugzilla.gnome.org/show_bug.cgi?id=303365#c6).
On the other hand, if one compiles poppler right from the sources, its
[demo
program](http://cgit.freedesktop.org/poppler/poppler/tree/glib/demo) for
the glib backend can display files in a zippy manner, even with very
large zooms. xpdf, though, works very well with higher zoom levels,
without making the whole computer grind to a halt. Seeing as Martin Pitt
has [stripped xpdf to be able to use the poppler
backend](http://bugs.debian.org/351279), I was animated to have the best
of both worlds: the frequent updates of poppler and the lightness of
xpdf. Martin\'s port of xpdf doesn\'t compile with a recent poppler,
though: the library has
[changed](http://lists.freedesktop.org/archives/poppler/2009-May/004665.html)
[a lot](http://lists.debian.org/debian-devel/2007/12/msg00501.html)
[since](https://bugzilla.redhat.com/show_bug.cgi?id=551119#c3)
[2006](http://lists.debian.org/debian-tex-maint/2009/09/msg00203.html).
And, in many respects, for good reason, since the original code is not
that clean. But it makes harder for luses like me to use code based on
fast-changing libraries. Well, to cut a long story short, after two
afternoons hunting down a version of poppler that would allow me to
compile Martin\'s xpdf version, I got bored and tried to attack the
problem. Now I can use this alternative version of xpdf with the poppler
backend, with very little dependencies and with little memory usage on
my computer. I\'m keeping it for my private use, but if anybody else is
interested, please let me know.
