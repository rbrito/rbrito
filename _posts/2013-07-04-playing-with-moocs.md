---
layout: post
title: "Playing with MOOCs"
date: "Thu, 04 Jul 2013 08:33:00 -0300"
tags: [debian, free-software, git, mooc, python, study, education]
---

Not so much ago, we had a boom of new enterprises offering Massive Online
Open Courses (MOOCs for short).

First were Thrun and Norvig (Artificial Intelligence), with Widom
(Introduction to Databases) and Ng (Machine Learning). Then, these initial
experiments led to the creation of Udacity (founded by Thrun) and Coursera
(founded by Ng and Koller).

I have been keeping an eye on them for some time and, in fact, I have been
contributing to a project similar to [youtube-dl][ytdl] (which
[I package for Debian][ytdlpkg]), but focused on downloading videos from
Cousera, called [`coursera-dl`][coursera-dl].

[ytdl]: https://github.com/rg3/youtube-dl
[ytdlpkg]: http://packages.debian.org/sid/youtube-dl
[coursera-dl]: https://github.com/jplehmann/coursera

I started contributing to `coursera-dl` because I wanted to stratch some
itches with downloading with [`aria2c`][aria2c], but soon the original
author of the project granted me write permission to the repository and I
have been one of the persons that commits the most, which is strange, since
I was not the original creator of the program.

[aria2c]: http://aria2.sourceforge.net/

So far, from the courses that grant certificates, I have concluded the
following:

* Algorithms: Design and Analysis, Part 1 (Coursera)
* Machine Learning (Coursera)
* Introduction to Databases (Coursera)
* Quantum Mechanics and Quantum Computation (Coursera)
* Introduction to Cryptography I (Coursera)
* M101P: MongoDB for Developers (10gen)
* M102: MongoDB for DBAs (10gen)
* M101J: MongoDB for Java Developers (10gen)

I have to say that this have been a pleasant experience, with some of the
courses being challenging, but not up to what an undergraduate course would
be (and the fears of some people that such courses would threaten the
conventional University-style model are a bit far at this point).

Anyway, talking about challenging courses, in particular, prof. Umesh
Vazirani's "Quantum Mechanics and Quantum Computation" had a lot of
(computational) work and this was one of the courses that prompted me to use
a computer algebra system for manipulating some tedious calculations.

In particular, I used a mix of the [online SAGE math server][sagenb] and
[Wolfram Alpha][wa], whichever I found the syntax to be easier to use for
the problem in question. It is with happiness that I see that there are
efforts to [get SAGE again packaged in Debian][sageindebian].

[sagenb]: http://www.sagenb.org/
[wa]: http://www.wolframalpha.com/
[sageindebian]: http://people.debian.org/~thansen/debian-sage-status.html

Another (positively) surprising course has been Dan Boneh's "Introduction to
Cryptography I", which was more theoretical and more serious than what I was
expecting. It even included some nice proof sketches and discussion of
recent results. The last course on cryptography that I took was in 1998 and
*a lot* of things changed since then, including the way to think about
cryptography. But more on that on a future post.

There are some other courses that I may be completing soon and that I will
post more about, with some reviews of the good and the bad parts of select
ones.

