---
title: "Partially switching to Chromium"
date: "Tue, 29 Mar 2016 02:25:15 -0300"
tags: [chromium, debian, firefox, free-software, linux]
---

In the interest of being as brief as possible (just ask for details if you
want to know more or if you think that it would help), I have started,
against my preferences, to start using chromium from Debian instead of
Firefox (aka, Iceweasel).

The reason? I have a slow computer (a Core 2 Duo T7250). My main computer.
My workhorse.

There are some sites that even with an empty profile and a vanilla Firefox
build right from Mozilla Foundation cause Firefox to generate a very heavy
CPU load.  I [briefly reported this via Twitter][1] to one (but not the
only!) of the [sites in question][2] and to [Firefox Site Compatibility][3].

[1]: https://twitter.com/rtdbrito/status/703098330629296128
[2]: https://web.telegram.org/
[3]: https://www.fxsitecompat.com/

What do I see? Many CSS and redraw events (thanks to Firefox's profiling
tools). In fact, as many events that Firefox alone is able to completely
take over 1 (of the 2) cores that I have, with just that single tab open.

I don't see those problems with Chromium, unfortunately (or, at least, they
are not that perceptible to my computer's CPU).

So, before I go on and formally file a bug report, I would love to confirm
if other people see the same problems that I am seeing. Do you also see
something similar? Your input is highly welcome!

