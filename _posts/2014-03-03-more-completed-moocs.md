---
layout: post
title: "More completed MOOCs"
date: "Mon, 03 Mar 2014 02:35:11 -0300"
tags: [android, debian, java, life, mooc, study]
---

This weekend I received my 17th certification (or Statement of
Accomplishment) for MOOCs. In particular, this last MOOC that I took was
[Creative, Serious and Playful Science of Android Apps][0], offered by
[Lawrence Angrave][1] of [University of Illinois at Urbana-Champaign][2].

[0]: https://www.coursera.org/course/androidapps101
[1]: https://www.coursera.org/instructor/lawrenceangrave
[2]: https://www.coursera.org/illinois

While I certainly knew that the course was an Introduction to Programming,
the reasons I took it were twofold:

1. For the "novelty" (for me, at least) of writing some Android Apps
2. To reacquaint myself with Java, which I have not touched since 1999, when
[I wrote a compiler][3], in the ages of JDK 1.0 being transitioned to
JDK 1.1.

[3]: https://github.com/rbrito/old-projects

I think that the time the course took (and which I invested in) was really
well spent. In fact, I learned some nice things which I would *not* have
touched otherwise. For instance, I made the conscious effort to use an IDE
(Eclipse), despite being a person that would do most of the things inside
Emacs and compile the programs with command-line tools.

Despite being huge, Eclipse has some really nice features and the
auto-completion is amazing. Since Java is so strongly typed and Eclipse
knows Java pretty well, it almost completely writes your programs for you.
:)

Of course, my interest also made me want to streamline the build process and
use the command line tools (with ant, another tool that was "alien" to me,
having used makefiles for everything that I needed).

The use of Eclipse (and the Android development environment in general) in
my Debian unstable computers
[[was not|2014-01-17-developing_for_android_with_debian]]
[without problems][4], but after spending more time trying to fix Eclipse
than really doing the homework (and pulling the little hair that I still
have left), one really helpful post [nailed it][5]. (Yes, I had to remove
other packages like gimp, but such is life).

[4]: https://bugs.debian.org/734674
[5]: http://aleksz-programming.blogspot.com/2013/03/eclipse-and-webkit-on-ubuntu-64.html

While playing with the Android side of things, I put one badly written (and
*not* really "android-ish") app in [a github repository][6] (which I think
is aptly named "Toy Android Apps"), which served me the purpose of learning
some Android-specific concepts.

[6]: https://github.com/rbrito/toy-android-apps

But the course was helpful not only to get in touch with the tools (Eclipse,
ant, running Android virtual machines with the help of kvm), but also on the
Java side. I lost a bit of the prejudice against it (even though I still
think it is a verbose language, especially when compared to, say Python),
and I, also intend to contribute to one apache project or another that have
low-hanging fruits.  Actually, I have signed their
[Contributor License Agreement][7] and I even had
[my first patch accepted][8]!

[7]: https://www.apache.org/licenses/icla.txt
[8]: http://svn.apache.org/viewvc?view=revision&revision=1559792

Aside: Well, sadly SVN doesn't support different committer and author fields
like git does and it seems that doing many small commits may not be the
Apache way of doing things&mdash;but the important part of all this is that
the code is there and there is so much more to be done.

Aside #2: After a *lot* of time spent converting the repository to git
(which is, after all, what I use), I put [a mirror][9] of Apache's the
commons graph project.

[9]: https://github.com/rbrito/commons-graph
