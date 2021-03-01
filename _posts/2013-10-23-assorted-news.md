---
layout: post
title: "Assorted random notes"
date: "Wed, 23 Oct 2013 21:08:42 -0200"
tags: [btrfs, debian, filesystem, free-software, linux, music, python, study]
---

This post is just a bunch of random notes, but I think that things are going
well, this time.

# Btrfs

Just started playing with [[!wikipedia btrfs]] after converting a 2TB disk
with about 1.3TB of data from [[!wikipedia ext4]] to btrfs.  This particular
filesystem contains my backup data and I hope that btrfs is able to live up
to high standards.

I will probably write a detailed review with my impressions, but suffice to
say that it is working fine and I hope that I will be happy for a long time
to come. My other filesystems, for the moment, will be ext4.

# Coursera Downloader

Thanks to [John Lehmann][0]'s generosity, now `coursera-dl` has a new home:
a [github organization][1] of its own!

[0]: https://twitter.com/jplehmann
[1]: https://github.com/coursera-dl

# youtube-dl

[Some people may have noticed, others may not][3], but when downloading
videos from Youtube, they apparently are getting more aggressive with the
use of [[!wikipedia Dynamic Adaptive Streaming over HTTP]] (also called
DASH) and, as a result, some (perhaps going to be all in the near future?)
of the videos may not be available in the resolution/formats that you used
to like (like me, with format number 35).

By the way, one thing that is interesting with youtube videos provided via
DASH is that they are available in different streams: one for the video and
another for the audio.

What does this mean in practical terms for users of youtube-dl?  Well, if
you wanted to download videos in resolutions like the 480p (format 35) that
I mentioned, then you will probably have to change your way of doing things,
until a more automated solution is in place.

You will have to download both the audio and the video and, then, "combine"
them (that is, multiplex them) to create one "normal" video file with both
the audio and the video. I usually do this via:

```
ffmpeg -i audio.m4a -i video.mp4 -vcodec copy -acodec copy combined.mp4
```

If you prefer having a Matroska container instead of an mp4 container
(which, BTW, results in *smaller* muxing overhead), then you can use the
command line:

```
mkvmerge -o combined.mkv audio.m4a video.mp4
```

Oh, those `m4a` and `mp4` extensions are a new addition that
[I just sent upstream][4] (in the past, both would have been named with an
extension of `mp4`).

As, an aside, I like formats `135` for video and `140` for audio, for the
reasons that I mentioned in a comments to issue 1612:

> Otherwise, to download 480p videos (which I do for lectures and so on with
> other projects of mine, like edx-dl) I have to call youtube-dl twice: once
> for format 135 and another for format 140, since the old (?) format 35
> files are much smaller than the lower resolution 360p files (due to the
> former being encoded in High profile vs. the latter being encoded in
> Constrained Baseline profile).

While this is unfortunate for some, this is a good thing for others: I once
had a blind user of `youtube-dl` asking me if he could avoid downloading the
whole video just to extract the audio, so that he save on bandwidth. Well,
now this is possible.

Expect a new version of `youtube-dl` to be uploaded soon to Debian unstable.


[3]: https://github.com/rg3/youtube-dl/issues/1612
[4]: https://github.com/rg3/youtube-dl/pull/1622

# Music

It is so nice to see the music that I like getting better. It was
particularly pleasant to [see][2] [[!wikipedia Tarja Turunen]] being joined
on stage by [[!wikipedia Floor Jansen]].

[2]: https://youtu.be/hAnVFJFmFx8

In fact, it is my impression that the once female-fronted bands are getting
more and more into collaborations and side-projects and they are, in many
ways, getting more refined. Examples of this includes Floor, Tarja,
[[!wikipedia Anneke van Giersbergen]], [[!wikipedia Sharon den Adel]],
[[!wikipedia Kari Rueslåtten]] and many others that I can't remember right
now.

Of course, some thanks to people that take the time to film, and
upload/share the videos so that other people not at these events can watch
them is highly appreciated and they usually are treated as anonymous, but,
of course, this should be fixed.


