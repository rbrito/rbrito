---
layout: post
title: "User-Agent strings and privacy"
date: "Sun, 22 Feb 2015 20:54:27 -0300"
tags: [android, apple, browsers, debian, free-software]
---

I just had my hands on some mobile devices (a Samsung's [Galaxy Tab S 8.4"][0],
an Apple's [iPad mini 3][1], and my no-name tablet that runs Android).

[0]: https://en.wikipedia.org/wiki/Samsung_Galaxy_Tab_S_8.4
[1]: https://en.wikipedia.org/wiki/IPad_Mini_3

I got curious to see how the different browsers identify themselves to the
world via their [[!wikipedia User agent]] strings and I must say that each
browser's string reveals a lot about both the browser makers and their
philosophies regarding user privacy.

Here is a simple table that I compiled with the information that I
collected (sorry if it gets too wide):

| Device               | Browser                       | User-Agent String                                                                                                                                              |
|----------------------|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Samsung Galaxy Tab S | Firefox 35.0                  | `Mozilla/5.0 (Android; Tablet; rv:35.0) Gecko/35.0 Firefox/35.0`                                                                                               |
| Samsung Galaxy Tab S | Firefox 35.0.1                | `Mozilla/5.0 (Android; Tablet; rv:35.0.1) Gecko/35.0.1 Firefox/35.0.1`                                                                                         |
| Samsung Galaxy Tab S | Android's 4.4.2 stock browser | `Mozilla/5.0 (Linux; Android 4.4.2; en-gb; SAMSUNG SM-T700 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Version/1.5 Chrome/28.0.1500.94 Safari/537.36` |
| Samsung Galaxy Tab S | Updated Chrome                | `Mozilla/5.0 (Linux; Android 4.4.2; SM-T700 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.109 Safari/537.36`                           |
| Vanilla tablet       | Android's 4.1.1 stock browser | `Mozilla/5.0 (Linux; U; Android 4.1.1; en-us; TB1010 Build/JRO03H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30`                           |
| Vanilla tablet       | Firefox 35.0.1                | `Mozilla/5.0 (Android; Tablet; rv:35.0.1) Gecko/35.0.1 Firefox/35.0.1`                                                                                         |
| iPad                 | Safari's from iOS 8.1.3       | `Mozilla/5.0 (iPad; CPU OS 8_1_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B466 Safari/600.1.4`                              |
| Notebook             | Debian's Iceweasel 35.0.1     | `Mozilla/5.0 (X11; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0 Iceweasel/35.0.1`                                                                        |
| Moto G4 Plus         | Firefox Focus 2.2             | `Mozilla/5.0 (Linux; Android 7.0) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Focus/2.2 Chrome/61.0.3163.98 Mobile Safari/537.36`|

So, briefly looking at the table above, you can tell that the stock Android
browser reveals quite a bit of information: the model of the device (e.g.,
`SAMSUNG SM-T700` or `TB1010`) and even the build number (e.g.,
`Build/KOT49H` or `Build/JRO03H`)!  This is super handy for malicious
websites and I would say that it leaks a lot of possibly undesired
information.

The iPad is similar, with Safari revealing the version of the iOS that it is
running.  It doesn't reveal, though, the language that the user is using via
the UA string (it probably does via other HTTP fields).

[Chrome][2] is similar to the stock Android browser here, but, at least, it
doesn't reveal the language of the user. It does reveal the version of
Android, including the patch-level (that's a bit too much, IMVHO).

[2]: https://www.google.com/chrome/browser/mobile/

I would say that the winner respecting privacy of the users among the
browsers that I tested is [Firefox][3]: it conveys just the bare minimum,
not differentiating from a high-end tablet (Samsung's Galaxy Tab S with 8
cores) and a vanilla tablet (with 2 cores).  Like Chrome, Firefox still
reveals a bit too much in the form of the patch-level. It should be
sufficient to say that it is version 35.0 even if the user has 35.0.1
installed.

[3]: https://www.mozilla.org/en-US/firefox/android/

The bonus points with Firefox is that it is also available on [F-Droid][4], in
two versions: as [Firefox itself][5] and as [Fennec][6].

[4]: https://f-droid.org/
[5]: https://f-droid.org/repository/browse/?fdid=org.mozilla.firefox
[6]: https://f-droid.org/repository/browse/?fdid=org.mozilla.fennec_fdroid

*Edit, 2017-10-19:* Added the User-Agent string of Firefox Focus. Quite
different from regular Firefox, as we can see.
