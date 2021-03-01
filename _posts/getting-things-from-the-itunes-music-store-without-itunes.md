---
title: "Getting things from the iTunes Music Store without iTunes"
date: "2009-02-24 11:11:54"
tags: [apple, computers, itunesu, music, video]
---

Being the [[!wikipedia Free Software]] advocate that I am, I want to use as
much Free Software as I can (and spread the world).

Disclaimer: no, I don't like to call what I use
"[[!wikipedia Open Source]]".  I prefer the things the RMS way and if you
don't like the fact that I like his way, I'm afraid that you may miss some
of the things that I have here, even if you don't necessarily agree with me.

In particular, I would like to use, see etc., the material that is available
on the Internet, that people has put available for others to see. In
particular, many Universities around the world are making the shift of being
only in the classroom to being present in their students' lifes all the
time. This is accomplished by putting their educational material available
on-line.

A decade or two ago, this was usually accomplished by publishing the
so-called "lecture notes" on the website of the course and maintaining
mailing-lists with the currently enrolled students. The lecture notes were
usually taken using the "[[!wikipedia Scribe]] method", where, for each
class, one student is responsible of taking notes of the material, writing
it in a "finished" form and distributing it back for all the other
students. This was made in a round-robin fashion, as a means to spread the
responsibilities among the students taking the course. Also, the most common
tool used to edit the material, especially in Mathematically-oriented
courses, was to typeset everything in [[!wikipedia LaTeX]] (or even plain
[[!wikipedia TeX]], in some cases).

The lecturer frequently distributed a template, which the students used and,
this way, all the notes written by the students had the same, uniform look
and style. The work was usually revised by the lecturer and, many times, it
resulted in a kind of a book, published in
[[!wikipedia Device_independent_file_format desc="DVI"]] or
[[!wikipedia PostScript]] form (latter, it became common to use
[[!wikipedia Portable_document_format desc="PDF"]], as it is a format more
popular).

Actually, it is still quite frequent (and welcome!) to produce such lecture
notes. But, now, things have changed slightly. (I could discuss *why* things
have changed the way they have, but it is beyond the scope of these short
notes here.) People have been recording lectures in audio and, after the
technology became more accessible, in video. Now, a new term is used for
distributing those contents: *podcasting*. Essentially, a
[[!wikipedia podcast]] is a way of publishing, say, audio so that people can
subscribe to your "podcast" (sometimes also said to be a "channel"). It is
very much like a radio program, where people tune in to listen to a given
program.

The way most people use to distribute the "episodes" of such
programs/podcasts is actually a combination of technologies, but nothing
exactly new: the description of *what* is available is given in a format
called [[!wikipedia RSS]] (which is a specialization of [[!wikipedia XML]],
but this isn't important for our subject matter) and the content is usually
in form of [[!wikipedia MP3]] files (or some variation of that).

OK, enough background. Now, there are on-line stores on the Internet that
make available podcasts. Those podcasts are usually free of charge for the
listener. Some of the most prominent stores nowadays are
[[!wikipedia Apple_Inc. desc="Apple"]]'s "iTunes Store" and Amazon's store.

Apple has created its "[[!wikipedia iTunes Store]]" to foster the use of its
[[!wikipedia iTunes]] program and to boost the sales of its
[[!wikipedia iPod]] digital players (and, also, to make some extra money).
But people in the education field have seen that using a podcast would be a
good way of sharing knowledge and Apple wouldn't loose this market: they
invented the [[!wikipedia ITunes_Store#iTunes_U desc="iTunes U"]], which is
a way for Universities around the world to publish their content on "iTunes
Store".

Several big Universities have been putting their content on Apple's
iTunes-U. And, to see the directory of podcasts on iTunes-U, you have (in
theory) to use Apple's proprietary program iTunes, only available for
proprietary platforms: for Microsoft's Windows and for Apple's own
[[!wikipedia Mac OS X]]. No Free Software alternative is officially
supported, despite the fact that the blurb on the Universities pages say
that only the access to the content has to be via iTunes and that the
content can be used with any MP3 player or with programs other than
iTunes. Yes, this means that the content is playable under
[[!wikipedia Linux]] and Linux plays a big role in higher education
environments.

So, isn't there a way to access the blogs avoiding the use of proprietary
software? What about people that only want to use Free Software solutions
or, not even a matter of desiring to use Free Software, having only access
to Free Software?

Well, there is. Apple has changed the way that people use to get the
contents from its iTunes store during time, but, now, it seems to be quite
easy to grab it under a 100% Free environment. I have used this recipe for
two Universities only so far, but it has worked perfectly well. The
Universities in question are [[!wikipedia MIT]] and
[[!wikipedia Stanford University]].

Let's say that you come across a link with the format:

    itms://deimos3.apple.com/WebObjects/Core.woa/Browse/mit.edu.1330383747.01330383754.1330693646

Such a link is *usually not* recognized by browsers without the help of
extra software. In platforms where iTunes is available, the browser sends it
to iTunes and iTunes takes the duty of connecting to the "iTunes Music
Store" (that's where the "itms" thing at the beginning of the URL comes
from, by the way). Pay close attention to the part
`mit.edu.1330383747.01330383754.1330693646`. That is the important part of
the URL here.

But it is quite easy to convert the link above to something that can be
grabbed with a usual browser or, say, a program like wget or curl. Just
write the link as:

    http://deimos3.apple.com/WebObjects/Core.woa/DownloadTracksFile/mit.edu.1330383747.01330383754.1330693646.mp4

The part up to and including `DownloadTracksFile/` is constant. Only the
part after it is changed and taken from the original link.

There is another way of rewriting the link. Its format is:

    http://deimos3.apple.com/WebObjects/Core.woa/FeedEnclosure/mit.edu.1330383747.01330383754.1330693646/enclosure.mp4

Notice that the middle part of this URL is the actual part that we alluded
to. The rest is simply a constant thing.

Well, this way, we can get the contents of podcasts with Free Software in an
automated way. That is, until Apple changes its scheme of doing things. But,
by that time, we will already have the things we want and newer solutions
can be devised soon.

So, let's fire those wget's and start to study things (or prozilla's,
aria2c's etc, for some speed boost).

