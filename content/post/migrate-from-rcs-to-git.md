---
title: "Migrate from RCS to git"
date: "2010-02-11 05:39:37"
tags: [debian, emacs, git, hacks, revision-control]
---

I have been keeping my [LaTeX][0] files under version control since I was
introduced to [AUCTeX][1] and I realized that a good way to approach the
"evolutionary" approach to software (this includes text) is to use a
[revision control system][2].

I started using that with [Emacs][3] 21 (the first version of Emacs that I
used was Emacs 19.something which I can't remember) and the revision system
that was most easily available was [RCS][4]. Its integration with Emacs
was very good and also easy to use: type `C-x v-v` and a check in is
performed (or a check out, depending on the state of the file). You would be
asked for a changelog for that file and that was it.

Now, on the other hand, there is a myriad of options and one that looks very
nice to me (apart from not dealing with metadata, but that's OK with me for
the moment) is Linus Torvald's [`git`][5]. The very nice thing with `git`
(or many other such systems) is that the interface with Emacs is exactly the
same: `C-x v-v`. That's the only thing you need to remember to work well
with, say, your text project. (I don't actually know very much of the
management workflow under Emacs, but I also use the command line a good
amount and it serves me well so far).

But how can I convert my RCS "repositories" to a proper `git` repository?
Well, git comes with a subcommand called `cvsimport`, meant to be used with
CVS and this does help, since a CVS repository is essentially just a
collection of RCS files. As many people have migrated along the path from
RCS to CVS to Subversion to git, and I did not intend to convert the
repository in multiple steps, I am documenting what I did here.

So, if you have the `,v` files that RCS generates (the "repository" files
for each file tracked by RCS) spread in a tree and you would like to convert
that tree to a git repository for replication, backup and "time
machine-like" support, you can mimic a basic CVS repository that can be
converted easily with the following simple steps:

* Create a new directory hierarchy somewhere, denoted here by
  `cvs-source-dir`. This will play the role of a CVS repository which `git
  cvsimport` will convert.
* Under `cvs-source-dir`, create the directory tree as you would like it to
  be visible by `git`.
* As an immediate subdirectory of `cvs-source-dir`, create a directory named
  `CVSROOT`, that is `cvs-source-dir/CVSROOT`.
* Each immediate subdirectory of `cvs-source-dir` will play the role of a
  CVS module. Just think of that as a project under control of the version
  control system.
* Think about the `,v` files as your regular files and put them under the
  `cvs-source-dir` tree, as you would like them to be.
* Create the directory where your git repository will reside, denoted here
  by `git-repo`.
* Run `git cvsimport -v -a -A -k -m -d cvs-source-dir -C git-repo cvs-module`

That's it. It seems to perform a very good job of changing a very old system
to something that is modern and with many features (and is distributed).

You may also want to read about the way to convert the ids of commits that
RCS/CVS register to proper (people) names, which git uses. Read the
`git-cvsimport` manpage for more details on this and other options mentioned
above.

[0]: http://www.latex-project.org/
[1]: http://www.gnu.org/software/auctex/
[2]: http://en.wikipedia.org/wiki/Revision_control
[3]: http://www.gnu.org/software/emacs/
[4]: http://www.gnu.org/software/rcs/
[5]: http://git-scm.com/

