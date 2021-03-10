---
layout: post
title: "Changing Some Configuration from Defaults"
date: "2010-05-22 20:36:42"
tags: [debian, free-software, life]
---

Two of my most frequently used tools are, hands down, Emacs and bash.
Having a pleasant configuration of one's toolbox is necessary for long-term
productivity.

However, newer versions of the programs (any programs) don't always have
good, comfortable defaults. That is the case with Emacs 23 and bash 4.

With Emacs 23, by default, the scratch buffer shows some text that, if you
want to quickly enter text to be saved, has to be deleted. This can be
tolerated for some invocations of the editor. But at some point, it gets on
one's nerves.

Luckily, Emacs is so fully customizable that this is not a problem, unless
you have to hunt down the right knobs and you are an e-lisp illiterate. That
is my case.

After reading an admittedly small amount of documentation, some good lines
that ought to be put into one's `.emacs` file are:

    (setq inhibit-startup-echo-area-message "rbrito")
    (setq initial-scratch-message nil); show an empty scratch buffer
    (setq inhibit-startup-message t); remove splash screen

Another line that may make things more comfortable (especially if you, like
me, use Emacs's dired as a filemanager to navigate your folders):

    (defalias 'yes-or-no-p 'y-or-n-p)

But configuring Emacs is not always that hard. Seeing a change of behaviour
with your shell is scarier. When bash 4 was released, one thing that got
implemented is the echo of some characters from the terminal to the screen.

In practice and with my usage pattern, this meant that whenever I was typing
a command line, changed my mind and pressed `C-c`, I got a `^C` printed on
the screen, usually overwriting one or two characters of what I had typed.
And this prevented me from automatically copying and pasting the command
that I had typed.

Looking for an answer to that was much harder than to see how to change a
parameter on Emacs: every search that I tried on Google with the words
"bash" and "Ctrl-C" or some variants of that eventually lead me to "how do I
trap a Ctrl-C on my shell script?".

Decided to see what changed, I read the documentation of readline. It didn't
help, because I was reading something from version 5. I, then, downloaded
the source code and started looking for `SIGINT`. Then, perusing the code
(and the changelog), I saw that with bash 4 and readline 6, a new
configuration option was introduced: the `echo-control-characters` option of
readline.

Of course, after knowing this, stopping the undesired behaviour was a simple
matter of inserting `set echo-control-characters off` in my `.inputrc` and
think about how much time I spent with that uncomfortable behaviour in some
of my preferred tools.

As an addendum to the previous paragraphs (written on February of this year,
but only now published), the Debian package of [Emacs 23.2][1], the newest
version as of this writing, comes with some configuration that makes it
ignore the settings that are used with fontconfig. I did not spend any time
trying to see the cause of the problem, but adding a simple

    Emacs*font:			Mono

to my `.Xdefaults` file did the trick and restored back the ability to use
DejaVu Sans Mono at the right size on my system.

[1]: http://www.gnu.org/software/emacs/NEWS.23.2
