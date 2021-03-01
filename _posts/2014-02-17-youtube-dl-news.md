---
layout: post
title: "Some new Youtube-dl functionality"
date: "Mon, 17 Feb 2014 18:27:00 -0300"
tags: [debian, free-software, linux, multimedia, python, study]
---

I wrote in a [[previous post|2013-10-23-assorted_news#youtube-dl]] that
Youtube changed their way of delivering videos, with the use of
[[!wikipedia Dynamic Adaptive Streaming over HTTP]].  On top of that, they
started serving both the audio and the video in separate streams, which
meant trouble for downloader tools like [`youtube-dl`][1].

[1]: http://youtube-dl.org/

As I mentioned in that previous post:

> What does this mean in practical terms for users of youtube-dl?  Well, if
> you wanted to download videos in resolutions like the 480p (format 35)
> that I mentioned, then you will probably have to change your way of doing
> things, until a more automated solution is in place.
>
> You will have to download both the audio and the video and, then,
> "combine" them (that is, multiplex them) to create one "normal" video file
> with both the audio and the video.

And latter, I wrote:

> Otherwise, to download 480p videos (which I do for lectures and so on with
> other projects of mine, like edx-dl) I have to call youtube-dl twice: once
> for format 135 and another for format 140, since the old (?) format 35
> files are much smaller than the lower resolution 360p files (due to the
> former being encoded in High profile vs. the latter being encoded in
> Constrained Baseline profile).

(...)

Well, now, we don't have this problem anymore:

The new release of `youtube-dl` brings us many goodies, including that it is
possible to *automatically* combine/merge/multiplex audio and video formats
that Youtube now offers separately (See the previous comments about separate
audio and video).

Now, if you want a 480p video in H.264 format, High profile, with 128kbps
AAC audio (this used to be Youtube's format 35), you can specify format `-f
135+140` on the command-line and it will download both the audio, the video
and multiplex it with `ffmpeg` (or `avconv`, depending on what you have
installed).

Besides being convenient, this automatic downloading and merging makes it
unnecessary to write scripts to, say, retrieve all the videos in a playlist
that contains a lot of lectures (see [one example here][2], taught by
[[!wikipedia Benedict Gross]]).

[2]: http://www.youtube.com/watch?v=EPQgeAz264g&list=PLA58AC5CABC1321A3

Version 2014.02.17 of `youtube-dl` will be soon in your favorite mirror of
the Debian archives.

