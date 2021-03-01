---
layout: post
title: "Running GRUB2 on PowerPC Macs"
date: "Sat, 2 Apr 2011 22:18:12 -0300"
tags: [configuration, debian, development, free-software, hacks, ibook, kernel, linux, mac, powerpc]
---


Here I write a little bit about my experiences running GRUB2 with a PowerPC
Mac (actually, an iBook G4), since the current documentation is lacking in
many places (outdated, incorrect, etc.).

Some of what I say is platform agnostic, though, and may be of interest to
users of GRUB in general.

# Basics using GRUB2 with PowerPC

First of all, it is important to understand (at least superficially) how
botting on a Mac works.

One of the first programs that run in your Mac is the OpenFirmware. It works
with more or less the same purpose of a BIOS in a regular x86 system. The
basic idea is the same: get the computer running with whatever programs you
want it to run. The implementation, though, differs quite a bit.

First of all, OpenFirmware (OF) usually presents itself as a command-line
interface that is programmable, differently from the common day BIOSes from
x86 boxes. As it is programmable, it is more flexible, but this flexibility
comes at the price of an increased complexity.

I may write some things more in a future article, if there is any
interest.

For now, it just suffices to say that to get to the OF prompt in a Mac, you
have to press a combination keys during the time that your Mac gives a chime
when you turn it on. At that moment, you have to press (simulaneously) Cmd +
Option + O + F. (Note: the Cmd key is the key that has an Apple drawn on it,
usually on the side of the space bar).

# Limitations of Open Firmware

Differently from usual BIOSes of x86 computers, Open Firmware *can* read the
contents of a partition in your HD (or other devices), as long as it is
formatted in the original HFS format (*not* in HFS+ or one of its
descendents).

This is the reason why some older versions of Linux create an HFS partition
in your HD, even if you don't intent to run or use anything besides Linux.
The `yaboot` bootloader consists of, among other things, one binary that is
understandable by OpenFirmware. That binary is a file called `yaboot`, after
the name of the booloader.

As an aside, you have to indicate to OF what is the file that you want it to
load during the boot process, so that it knows what to do. The way to
indicate this is to "bless" the file (and the folder that contains it).
Some ways to bless a file are to, for example, use the `bless` command in
MacOS X or the `hattrib -b` command from hfsutils.

Files in an HFS filesystem have two attributes that many other filesystems
don't: a creator ID (the "application" that created the file) and the type
ID (which determines what kind of file it is).

OpenFirmware, in particular, looks for files with the type `tbxi` for the
bootstrap process.

The `yaboot` binary is loaded by OF into memory and, then, control is passed
to the yaboot program, which then reads its configuration file
(`yaboot.conf`) from the same folder where the binary was in. The file
`yaboot.conf` contains instructions for yaboot to do its job. The file
yaboot.conf is *very* similar in construction to configurations of an older
bootloader for x86 computers, `lilo.conf`.

Also, in a way similar to what LILO requires, after you install some new
kernel, change some parameter in the configuration file, etc., you have to
run a program that will set up everything so that the boot process can know
of your new configuration. With LILO, this command was called `lilo`, while
with yaboot the command is called `ybin` (which, essentially, takes care of
putting `yaboot.conf` in the bootstrap/HFS partition and blesses the
`yaboot` binary).

# Going to GRUB2

One of the characteristics of yaboot (which is left as an exercise to the
reader to determine if it is a drawback or not) is exactly the way that
changes in the configuration have to be copied to the special HFS partition:
the step of running `ybin`.

GRUB2 (and its older sibling, GRUB legacy) do away with that: during
boot-time, it can understand the filesystems that you have in your computer
and interactively load whatever you want from there, also from a
command-line like OF, before any (regular) operating system has even been
started.

But how do you *start* GRUB2? Well, the way that this is performed is
copying a binary to that special HFS partition. Here things start to be
hairy, because GRUB2 has a lot of functionality, but it comes at the price
of it consuming a lot of space (especially if you are using encrypted
partitions or some kind of logical volume managements with some journalling
filesystem that allows files to be compressed etc. on top of it).  The list
goes on.

Usually, that special HFS partition only has 800KB, which, BTW, is the size
of an old 3.5" floppy used with older Macs (note: due to some contraints on
partitions and aligments of such partitions on cylinders, it is not uncommon
for disk partitioning software to create partitions slighly larger than
800KB, but *not* much larger than that).

A full-featured binary of GRUB2 to be placed on that HFS partition can have
much more than those 800KB. But how do you get that binary, in the first
place? And how do you fit that in the HFS partition?

## Creating the GRUB2 binary

To answer the first question, you have to construct it from your
`grub-ieee1275` package (I'm assuming here that you are using Debian or
Ubuntu, but similar instructions may apply to other distributions). Then, a
first step would be to create such binary with:

     mkdir /tmp/foo
     cd /tmp/foo
     cp -a /usr/lib/grub/powerpc-ieee1275/* .
     grub-mkimage -O powerpc-ieee1275 -o ../grub.img *.mod

The last command of these create an executable named `grub.img` that is
callable from OF and which contains every module from `grub-ieee1275`.  This
executable that I call here `grub.img` is called, in GRUB2 parlance,
*the core image* and it it seems to be named `core.img` in many systems.

On my system, with those commands, the binary `grub.img` is about 1208KB,
which is 50% larger than that 800KB partition. And you would like it to be
*much* smaller, becase you want to still have your `yaboot` bootloader by
default while you are evaluating your bootloaders (or using it as a backup
plan).

As GRUB2 follow a modular design, you can mix and match the features that
you want. This already hints you to the way we can fit it in the HFS
partition, and it is always the same story: just trim the fat.

## Creating the configuration file

You will also have to have GRUB2 configuration's file (or you will have to
play with way more commands than you'd want to). An important distinction
here is that you usually have 2 or more partitions on your Mac:

* the special bootstrap/HFS partition where OF is going to look at (I'll
  call it `/dev/hda2` here);
* the partition where your `/` filesystem resides (denoted by `/dev/hda3`
  here);
* some partition to hold `/boot` (I don't have one of these, but let's say
  that it is `/dev/hda7` for our discussion purposes), usually containing
  your kernels and initial ramdisks.
* other partitions.

With this in mind, you can With Let's say that this last one, in Linux
parlance, is `/dev/hda3` (as is the case of this author), and optionally a
partition where your Linux kernel resides (people usually use it to store
the `/boot` subtree of a Linux filesystem). Let's say that this last one is
`/dev/hda7`.

Then, you would compose something like the following as a configuration file
for GRUB2 (named `grub.cfg`):

    insmod part_apple
    insmod ext2
    set root='(hd,apple7)'

    menuentry "Linux" {
        linux /vmlinux root=/dev/hda3
        initrd /initrd
    }

There are one two important points here that deserve more comments:

* Note that, **differently** from a regular x86 system, in a Mac system with
  only one HD the way that you specify an HD does *not* have a trailing
  zero. For instance, in the case above of the variable `root`, we have
  `(hd,apple7)`, while in a "common PC" we would have the `(hd` part
  replaced with `(hd0`.

  That's something that you should make your distribution aware of, if they
  aren't yet.

  As an addendum, I don't know how it works with systems with more than one
  HD, as I only have (PowerPC) Macs that are notebooks. If you can share any
  experiences, please do.

* One point of caution here: what GRUB2 calls `root` is not necessarily the
  root of your filesystem (i.e., the partition that holds `/`), but the
  *device* that everything that is "not fully qualified" is interpreted as
  being relative to.

  The "not fully qualified" above means anything that is not prefixed with
  [GRUB's device notation](http://www.gnu.org/software/grub/manual/grub.html#Device-syntax).
  As an example, `(hd,apple2)/boot/vmlinux` if fully qualified for GRUB's
  purpose, while `/boot/vmlinux` is not.


## Putting it all together

The next step is to just copy the files `grub.img` and `grub.cfg` to the
special HFS partition. You can do that using `hmount`, `hcopy`, and
`humount` or you can use the regular Linux `hfs` module to copy to that
partition.

Then, boot your system, get into the OF prompt and execute:

    boot hd:2,grub.img

Here, the `2` above is a reference to my HFS partition. Substitute that with
yours, appropriately. You will then see the common (familiar?) GRUB prompt
and, from there, everything else that you know will (hopefully) work.

# The list of modules that "Works for Me(TM)"

As I mentioned above, I use a subset of all modules that come with
`grub-ieee1275` to create my `grub.img` binary. Here is the list of modules
that I use and that gives me a reasonably sized bootloader:

    bitmap.mod        datehook.mod  gzio.mod         lsmmap.mod      reboot.mod          terminal.mod
    bitmap_scale.mod  datetime.mod  halt.mod         memdisk.mod     regexp.mod          test.mod
    blocklist.mod     echo.mod      help.mod         memrw.mod       relocator.mod       trig.mod
    boot.mod          elf.mod       hexdump.mod      minicmd.mod     scsi.mod            true.mod
    bufio.mod         ext2.mod      hfs.mod          msdospart.mod   search.mod          video.mod
    cat.mod           fat.mod       hfsplus.mod      normal.mod      search_fs_file.mod  video_fb.mod
    cmp.mod           font.mod      ieee1275_fb.mod  part_apple.mod  search_fs_uuid.mod  videoinfo.mod
    configfile.mod    fshelp.mod    linux.mod        part_msdos.mod  search_label.mod
    cpio.mod          gettext.mod   loadenv.mod      parttool.mod    setjmp.mod
    crypto.mod        gfxmenu.mod   loopback.mod     probe.mod       sleep.mod
    date.mod          gfxterm.mod   ls.mod           read.mod        suspend.mod

Just for the record, my `grub.img` file has 624KB, and that can certainly be
shrunk.

# The command line that "Works for Me(TM)" to create the image

Actually, I lied when I told you that I used the lines above to create my
`grub.img` file, because I'm lazy and I don't want to type the `.img`
extension. I also *embed* my configuration file in the binary that I create
with GRUB2, so that I don't have two files to copy to my HFS partition, but
only one. I do that with:

    grub-mkimage -c grub.cfg -o ../grub -O powerpc-ieee1275 -d . *.mod

OK. No more lies here.

The nice aspect of GRUB is that one you install that image, you don't have
to touch that HFS partition anymore: you simply update your regular
filesystem's `/boot/grub/grub.cfg` file (which is usually performed when you
install a new kernel, at least with Debian) and you're ready to go.

The good way to do that is to use a minimal configuration file embedded in
your `grub` binary in your HFS partition that will hook into the system's
`/boot/grub/grub.cfg` to read newer kernels and leave the HFS partition (and
your system's NVRAM) alone.

Here is what I am using right now:

    search --no-floppy --fs-uuid --set=root 35d26869-f7c9-4852-a9b8-100314560c34
    set prefix=($root)/boot/grub
    configfile /boot/grub/grub.cfg

You will, of course, want to modify the file above as you install newer
kernels (perhaps even that unsupported operating system from that fruity
company, who knows?). Don't forget to change the UUID's, and partition
numbers to fit your needs.

Well, that's it. I hope that it helps somebody out there, as the information
that I got otherwise was way outdated, incomplete, etc. to keep up with
GRUB2 from these days. Now, let's go patch the tools that we have so that
not everybody who wants to use GRUB2 have to learn about its workings.

Oh, of course, you can now have your kernels in ext4, btrfs, xfs
etc. partitions without the fear that your bootloader won't load them.

