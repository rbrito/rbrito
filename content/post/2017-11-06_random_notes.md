---
title: "Some activities of the day"
date: "Mon, 06 Nov 2017 22:52:59 -0200"
tags: [debian, free-software, hardware, java, life, linux, parenting]
---

Yesterday, I printed the first draft of the first chapter when my little boy
was here and he was impressed with this strange object called a "printer".
Before I printed what I needed, I fired up LibreOffice and chose the biggest
font size that was available and let him type his first name by himself.
He was quicker than I thought with a keyboard. After seeing me print his
first name, he was jumping up and down with joy of having created something
and even showed grandma and grandpa what he had done.

He, then, wanted more and I taught him how to use that backspace key, what
it meant and he wanted to type his full name. I let him and taught him that
there is a key called space that he should type every time he wants to start
a new word and, in the end, he typed his first two names. To my surprise, he
memorized the icon with the printer (which I must say that I have to hunt
every time, since it seems so similar to the adjacent ones!) and pressed
this new key called "Enter". When he pressed, he wasn't expecting the
printer on his right to start making noises and printing his name.

He was so excited and it was so nice to see his reaction full of joy to get
a job done!

I am thinking of getting a spare computer, building it with him and for him,
so that he can call it his computer every time he comes to see daddy. As a
serendipitous situation, [Packt Publishing][packt] offered yesterday their
title ["Python Projects for Kids"][pythonprojects]. Unfortunately, he does
not yet know how to read, but I guess that the right age is coming soon,
which is a good thing to make him be educated "the right way" (that is, with
the best support, teaching and patience that I can give him).

[packt]: https://www.packtpub.com/
[pythonprojects]: https://www.packtpub.com/application-development/python-projects-kids

Anyway, I printed the first draft of the first chapter and today I have to
turn it in.

As I write this, I am [downloading a virtual machine from Microsoft][2] to
try to install Java on it. Let me see if it works. I have none of the
virtualization options used, tough the closest seems to be virtualbox.

Let me cross my fingers.

[2]: https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/

In other news, I updated some of the tags of very old posts of this blog,
and I am seriously thinking about switching from [ikiwiki][0] to another
blog platform. It is *slow*, *very slow* on my system with the repositories
that I have, especially on my armel system. Some non-interpreted system
would be best, but I don't know if such a thing even exists. But the killer
problem is that it doesn't support easily the typing of Mathematics (even
though a [3rd party plugin][mathjax-plugin] for MathJax exists).

[0]: https://ikiwiki.info/
[mathjax-plugin]: https://github.com/bk/ikiwiki-plugin-mathjax

On the other hand, I just received [an answer on twitter][1] from @telegram and
it was nice:

> Hello, Telegram supports bold and italic. You can type `**bold**` and `__italic__`. On mobile, you can also highlight text for this as well.

[1]: https://twitter.com/telegram/status/927470283094499329

It is nice that this works with [telegram-desktop][3] too.

[3]: https://packages.debian.org/sid/telegram-desktop

Besides that, I filed some bugs on Debian's BTS, responded to some issues on
my projects on GitHub (I'm slowly getting back on maintaining things) and
file [wishlist bugs on some other projects][4].

[4]: https://github.com/bk/ikiwiki-plugin-mathjax/issues/3

Oh, and I grabbed a copy of "Wonder woman" ("Mulher Maravilha") and
"Despicable Me 3" ("Meu Malvado Favorito 3") dubbed in Brazilian Portuguese
for my son. I have to convert the audio from AAC-LC in 6 channels to AC3 or
to stereo. Otherwise, my TVs have problem with the videos (one refuses to
play the entire file and another plays the audio with sounds of hiccups).

**Edit:** After converting the VirtualBox image taken from Microsoft, I
could easily use `qemu`/`kvm` to create screenshots of the installation of
Java.  The command that I used (for future reference) is:

```
qemu-system-x86_64 -enable-kvm -m 4096 -smp 2 -net nic,model=e1000 -net user -soundhw ac97 -drive index=0,media=disk,cache=unsafe,file=win7.qcow2
```

**Edit:** Fixed some typos.

