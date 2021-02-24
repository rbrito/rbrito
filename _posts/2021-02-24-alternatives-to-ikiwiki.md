---
layout: post
title: "Alternatives to ikiwiki?"
date: "Wed, 24 Feb 2021 18:16:00 -0300"
tags: [debian, free-software, life]
---

It's been quite a long time since I last posted anything on this blog and I
can say that one of the reasons for that I don't feel comfortable using
`ikiwiki` anymore. ☹

I am actively looking for alternatives to `ikiwiki` that allow me, mainly,
to write blog posts with the following characteristics (not necessarily in
order of importance):

* **Write in a lightweight markup language** (e.g., markdown), with some
  features, like creating tables, having footnotes etc. I may be open to
  using something else (like restructured text or, perhaps, asciidoc, about
  which I know next to nothing), if necessary.
* **Store what I do in a git repository**, to be future-proof.
* **Create a static site** from a version of what I wrote in the lightweight
  markup language, which is especially useful for hosting the site with,
  say, GitHub pages, until I find where I can host my site. (My old email
  and account of more than 25 years is being closed and I will be
  "homeless", which is unfortunate).
* **Use mathematics**, extensively, mostly copying and pasting from LaTeX
  documents.
  <br/>
  <br/>
  This, is one **major** pain point with `ikiwiki`. Apparently almost nobody
  cares about supporting MathJax/KaTex **out-of-the-box**. ☹  To add insult
  to injury, the templates are very general to the point of being very hard
  to read (read: feature bloat) and it doesn't help that my editor (emacs)
  doesn't know (at least in its current configuration) how to display its
  structure.
  <br/>
  <br/>
  I have tried to use hugo (which we happily have packaged in Debian), but
  configuring it is totally crazy: first, you have to decide on a theme and,
  then, (almost?) everything that you do is tied to that theme.  This is
  (almost) the opposite to the philosophy of LaTeX: first, write your text
  and, only then, worry about the style/looks. Separation of content and
  form doesn't seem to be the priority, from a few days looking a it.[^2]
  <br/>
  <br/>
  I have more to say about hugo and I failed, but I would still like to give
  it a try, if I don't find anything else that has the features that I'm
  looking for.
* **Enable syntax-highlighting for code samples**. I like to post my
  discoveries regarding programs and programming languages and, of course,
  having readable code in my blog would be a very good thing.[^1]
* **Be packaged in Debian**. We all love the convenience that this brings,
  of course.

Connected to the fact that I only can have static sites (no CGI, no forms,
nothing else), I am, **at this time**, using Disqus to host the comments of
my blog. I am also thinking of alternatives to this, like sending people to
Twitter (or mastodon or email) or some site similar to Disqus, but with more
of a Free Software inclination.

Anyway, I am almost ready for any kind of transition, since I have already
converted most posts (of course, not yet this one ☺) with some Python
scripts to a format that I feel is a bit more format-agnostic than what
ikiwiki uses.

[^1]: I like the style of fenced blocks that GitHub used, where you prefix
    the code with the name of the language to give a hint of how to
    highlight the code snipped.

[^2]: That's not to mention the myriad of hugo themes and theme authors that
   try to bribe you into using their hosted solutions (despite branding
   everything as "open source! OMG!"), like "wowchemy"&mdash;you will have a
   hard time untangling the instructions of their so bloated themes to be
   usable on your local computer; so much so to the point that you give up
   with their convoluted configuration (which, potentially, doesn't
   "transfer" to other themes, if you are worried about possibly changing
   themes in the future).
