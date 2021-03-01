Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7688E32892E
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Mar 2021 18:54:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614621246;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=T7DOirtyZ8JJFPfXuHqKA077AoUUVIr8qirfOay+jD0=;
	b=BQ7PVafM6p/XK1brbhfYkVuyXP2Bedk611dI6LjF0UAKycQmJTgLEx0g4tsrGsH0dVG/8n
	at+D91DT9/N+I+UUlQRV5vvMIAsoKrJRd0jMvnGjF2fYFbJld5OyWbSPlQv5VaCh7Dw0t+
	FZ70e7oKbRBzYy/n5pQqnsiXk4AT5hY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-thRl9WvrOt-oW41QZs1X0w-1; Mon, 01 Mar 2021 12:54:04 -0500
X-MC-Unique: thRl9WvrOt-oW41QZs1X0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DFB0801980;
	Mon,  1 Mar 2021 17:54:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57EED60636;
	Mon,  1 Mar 2021 17:54:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2FA4118095CB;
	Mon,  1 Mar 2021 17:53:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 121HrsIv009688 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Mar 2021 12:53:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4F3692166B27; Mon,  1 Mar 2021 17:53:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4803E200BFCB
	for <cluster-devel@redhat.com>; Mon,  1 Mar 2021 17:53:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DB38186E123
	for <cluster-devel@redhat.com>; Mon,  1 Mar 2021 17:53:51 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-5--oIxpQDDNnGP2vH9BxdgHA-1; Mon, 01 Mar 2021 12:53:48 -0500
X-MC-Unique: -oIxpQDDNnGP2vH9BxdgHA-1
Received: by mail-wr1-f69.google.com with SMTP id p18so9824865wrt.5
	for <cluster-devel@redhat.com>; Mon, 01 Mar 2021 09:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T7DOirtyZ8JJFPfXuHqKA077AoUUVIr8qirfOay+jD0=;
	b=YtNSiHLajucNeOpxahHNMdIyYhfDdFFcfFqSfYJE/mhdpjRQLInh68Tl6VcIsN3lGx
	wq0MWHDnumY/qwxZoAkFCXuq4RRWmY7N5oxLVdWMtVJEgI/rZHkVl7VvSGHkKibvuoNo
	K9K0eJspYXwq6C4/6tvTdZOkEC1EE/nezAvpsbz6stKgAI8MdkAVLonOQyOPOZpm7AGl
	QM1LgbHUpGEQ59lnvvtRrJQFgxyTW7nLHPEelB4xgykn2sdFl723pAbtdB0KjT8G7WTh
	VvuF+beDoNBTHh8FAz1fJWznjcesobMwUJ8tnlD5Js4SMQGlnt0XqhlPvW+AU5beCHhq
	x8jg==
X-Gm-Message-State: AOAM531YK89DBIXLhRIvMLvW9eyOlZHMXp5Kj4R1151g0RKIFF5Y28L7
	1miJAtM14eZTk8Q2CNHvsaNS/2wn62JKGPFwAaDRs7hT41cBi1AxJqCGGyrsYE4A1UIEkXu64Mz
	64L+RmLXep7XppBV/SFYuFpwINEFjtMh2jOTOxQ==
X-Received: by 2002:a5d:6b82:: with SMTP id n2mr17613716wrx.78.1614621227319; 
	Mon, 01 Mar 2021 09:53:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4FUfnwZdFRQr3JF6Cj9ogIaPZugNY5GOh7l726KGPBvipMeI/4roG1PURu8DSoGWjyshSIKWLTeeimC2vO2Q=
X-Received: by 2002:a5d:6b82:: with SMTP id n2mr17613703wrx.78.1614621227105; 
	Mon, 01 Mar 2021 09:53:47 -0800 (PST)
MIME-Version: 1.0
References: <CACrDRjiiXtz6cOO8FmnZHKte2EVKAFzDESXJ5a8oALd7h+EizA@mail.gmail.com>
	<CACrDRjjOgEsqOSWK1PeMro4WQxKkmR=KEfCCRQzBGCwtY+fevQ@mail.gmail.com>
	<93452e4c-af81-225f-34f5-f297473164ae@redhat.com>
In-Reply-To: <93452e4c-af81-225f-34f5-f297473164ae@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 1 Mar 2021 18:53:35 +0100
Message-ID: <CAHc6FU5fJ7hT5cDfwfQrAJ7GC+J3j8veq0Fx1NELw9StSnYyOA@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] Recording extents in GFS2
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b0533405bc7d4c6c"

--000000000000b0533405bc7d4c6c
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 2, 2021 at 6:35 PM Steven Whitehouse <swhiteho@redhat.com>
wrote:

> Hi,
> On 24/01/2021 06:44, Abhijith Das wrote:
>
> Hi all,
>
> I've been looking at rgrp.c:gfs2_alloc_blocks(), which is called from
> various places to allocate single/multiple blocks for inodes. I've come up
> with some data structures to accomplish recording of these allocations as
> extents.
>
> I'm proposing we add a new metadata type for journal blocks that will hold
> these extent records.
>
> GFS2_METATYPE_EX 15 /* New metadata type for a block that will hold
> extents */
>
> This structure below will be at the start of the block, followed by a
> number of alloc_ext structures.
>
> struct gfs2_extents { /* This structure is 32 bytes long */
>     struct gfs2_meta_header ex_header;
>     __be32 ex_count; /* count of number of alloc_ext structs that follow
> this header. */
>     __be32 __pad;
> };
> /* flags for the alloc_ext struct */
> #define AE_FL_XXX
>
> struct alloc_ext { /* This structure is 48 bytes long */
>     struct gfs2_inum ae_num; /* The inode this allocation/deallocation
> belongs to */
>     __be32 ae_flags; /* specifies if we're allocating/deallocating,
> data/metadata, etc. */
>     __be64 ae_start; /* starting physical block number of the extent */
>     __be64 ae_len;   /* length of the extent */
>     __be32 ae_uid;   /* user this belongs to, for quota accounting */
>     __be32 ae_gid;   /* group this belongs to, for quota accounting */
>     __be32 __pad;
> };
>
> The gfs2_inum structure is a bit OTT for this I think. A single 64 bit
> inode number should be enough? Also, it is quite likely we may have
> multiple extents for the same inode... so should we split this into two so
> we can have something like this? It is more complicated, but should save
> space in the average case.
>
> struct alloc_hdr {
>
>     __be64 inum;
>
>     __be32 uid; /* This is duplicated from the inode... various options
> here depending on whether we think this is something we should do. Should
> we also consider logging chown using this structure? We will have to
> carefully check chown sequence wrt to allocations/deallocations for quota
> purposes */
>
>     __be32 gid;
>
>     __u8 num_extents; /* Never likely to have huge numbers of extents per
> header, due to block size! */
>
>     /* padding... or is there something else we could/should add here? */
>
> };
>
> followed by num_extents copies of:
>
> struct alloc_extent {
>
>     __be64 phys_start;
>
>     __be64 logical_start; /* Do we need a logical & physical start? Maybe
> we don't care about the logical start? */
>
>     __be32 length; /* Max extent length is limited by rgrp length... only
> need 32 bits */
>
>     __be32 flags; /* Can we support unwritten, zero extents with this?
> Need to indicate alloc/free/zero, data/metadata */
>
> };
>
We're trying to keep allocations relatively close together and within the
same resource group, so to store extent lists more compactly, we could
store the first extent's start address absolutely, and the start of each
successive extent within range as a signed 32-bit number relative to that.

> Just wondering if there is also some shorthand we might be able to use in
> case we have multiple extents all separated by either one metadata block,
> or a very small number of metadata blocks (which will be the case for
> streaming writes). Again it increases the complexity, but will likely
> reduce the amount we have to write into the new journal blocks quite a lot.
> Not much point having a 32 bit length, but never filling it with a value
> above 509 (4k block size)...
>
The current allocator fills at most one indirect block before allocating
the next indirect block(s), which is why we end up with the above described
pattern. Once we switch to extent-based inodes, we won't be allocating
indirect blocks anymore, so we also won't end up with those chopped-up
extents anymore. There will be the occasional node split in the inode
extent tree, but that will be a much less frequent occurrence, and it won't
happen when extending an existing extent. Delayed allocation would further
improve the on-disk allocation patterns. On the other hand, we'll end up
with more overhead when files are highly fragmented.

As long as we're only storing extents in the journal, I don't think those
509-block chunks are a problem; we'll still end up with more compact
metadata for mostly-contiguous files. We'll do much worse for test cases
that write every other block, for example.

> With 4k block sizes, we can fit 84 extents (10 for 512b, 20 for 1k, 42
> for 2k block sizes) in one block. As we process more allocs/deallocs, we
> keep creating more such alloc_ext records and tack them to the back of this
> block if there's space or else create a new block. For smaller extents,
> this might not be efficient, so we might just want to revert to the old
> method of recording the bitmap blocks instead.
> During journal replay, we decode these new blocks and flip the
> corresponding bitmaps for each of the blocks represented in the extents.
> For the ones where we just recorded the bitmap blocks the old-fashioned
> way, we also replay them the old-fashioned way. This way we're also
> backward compatible with an older version of gfs2 that only records the
> bitmaps.
> Since we record the uid/gid with each extent, we can do the quota
> accounting without relying on the quota change file. We might need to keep
> the quota change file around for backward compatibility and for the cases
> where we might want to record allocs/deallocs the old-fashioned way.
>
> I'm going to play around with this and come up with some patches to see if
> this works and what kind of performance improvements we get. These data
> structures will mostly likely need reworking and renaming, but this is the
> general direction I'm thinking along.
>
> Please let me know what you think.
>
> Cheers!
> --Abhi
>
> That all sounds good. I'm sure it will take a little while to figure out
> how to get this right,
>
> Steve.
>
Thanks,
Andreas

--000000000000b0533405bc7d4c6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Feb 2, 2021 at 6:35 PM Steven Whitehouse &lt;<a href=3D"mail=
to:swhiteho@redhat.com">swhiteho@redhat.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p>Hi,<br>
    </p>
    <div>On 24/01/2021 06:44, Abhijith Das
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>
          <div style=3D"font-family:monospace,monospace">Hi all,</div>
          <div style=3D"font-family:monospace,monospace"><br>
          </div>
          <div style=3D"font-family:monospace,monospace">I&#39;ve been look=
ing at
            rgrp.c:gfs2_alloc_blocks(), which is called from various
            places to allocate single/multiple blocks for inodes. I&#39;ve
            come up with some data structures to accomplish recording of
            these allocations as extents.</div>
          <div style=3D"font-family:monospace,monospace"><br>
          </div>
          <div style=3D"font-family:monospace,monospace">I&#39;m proposing =
we add
            a new metadata type for journal blocks that will hold these
            extent records.</div>
        </div>
        <div style=3D"font-family:monospace,monospace"><br>
        </div>
        <font face=3D"monospace">GFS2_METATYPE_EX 15 /* <span class=3D"gmai=
l_default" style=3D"font-family:monospace,monospace">New metadata type
            for a block that will hold extents</span>=C2=A0*/<br>
          <br>
          <span class=3D"gmail_default" style=3D"font-family:monospace,mono=
space">This structure below
            will be at the start of the block, followed by a number of
            alloc_ext structures.</span></font>
        <div><font face=3D"monospace, monospace"><br>
          </font><font face=3D"monospace">struct gfs2_extents {</font><span=
 class=3D"gmail_default" style=3D"font-family:monospace,monospace"> /* This=
 structure
            is 32 bytes long */</span><br>
          <span class=3D"gmail_default" style=3D"font-family:monospace,mono=
space">=C2=A0 =C2=A0 </span><font face=3D"monospace">struct gfs2_meta_heade=
r ex_header;</font><br>
          <span class=3D"gmail_default" style=3D"font-family:monospace,mono=
space">=C2=A0 =C2=A0 </span><font face=3D"monospace">__be32 ex_count;</font=
><span class=3D"gmail_default" style=3D"font-family:monospace,monospace"> /=
* count of number
            of alloc_ext structs that follow this header. */</span><br>
          <span class=3D"gmail_default" style=3D"font-family:monospace,mono=
space">=C2=A0 =C2=A0 </span><font face=3D"monospace">__be32 __pad;</font><b=
r>
          <font face=3D"monospace">};</font><br>
          <span class=3D"gmail_default" style=3D"font-family:monospace,mono=
space"></span><span class=3D"gmail_default" style=3D"font-family:monospace,=
monospace"></span>
          <div><font face=3D"monospace, monospace"><span class=3D"gmail_def=
ault" style=3D"font-family:monospace,monospace">/* flags for the
                alloc_ext struct */</span><br>
            </font><font face=3D"monospace">#<span class=3D"gmail_default">=
define</span> AE_FL_<span class=3D"gmail_default" style=3D"font-family:mono=
space,monospace">XXX</span></font><br>
            <font face=3D"monospace"><span class=3D"gmail_default" style=3D=
"font-family:monospace,monospace"><br>
              </span></font>
            <div><font face=3D"monospace"><span class=3D"gmail_default" sty=
le=3D"font-family:monospace,monospace"></span>struct
                alloc_ext {<span class=3D"gmail_default" style=3D"font-fami=
ly:monospace,monospace"> /* This
                  structure is 48 bytes long */</span><br>
                <span class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">=C2=A0 =C2=A0 </span>struct
                gfs2_inum ae_num;<span class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace"> /* The inode
                  this allocation/deallocation belongs to */</span><br>
                <span class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">=C2=A0 =C2=A0 </span>__be32
                ae_flags;<span class=3D"gmail_default" style=3D"font-family=
:monospace,monospace"> /* specifies
                  if we&#39;re allocating/deallocating, data/metadata, etc.
                  */</span><br>
                <span class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">=C2=A0 =C2=A0 </span>__be64
                ae_start;<span class=3D"gmail_default" style=3D"font-family=
:monospace,monospace"> /* starting
                  physical block number of the extent */</span><br>
                <span class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">=C2=A0 =C2=A0 </span>__be64
                ae_len;<span class=3D"gmail_default" style=3D"font-family:m=
onospace,monospace">=C2=A0 =C2=A0/* length
                  of the extent */</span><br>
                <span class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">=C2=A0 =C2=A0 </span>__be32
                ae_uid;<span class=3D"gmail_default" style=3D"font-family:m=
onospace,monospace">=C2=A0 =C2=A0/* user
                  this belongs to, for quota accounting */</span><br>
                <span class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">=C2=A0 =C2=A0 </span>__be32
                ae_gid;<span class=3D"gmail_default" style=3D"font-family:m=
onospace,monospace">=C2=A0 =C2=A0/* group
                  this belongs to, for quota accounting */</span><br>
                <span class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">=C2=A0 =C2=A0 </span>__be32
                __pad;<br>
                };</font></div>
          </div>
          <div><font face=3D"monospace"><br>
            </font></div>
        </div>
      </div>
    </blockquote>
    <p><font face=3D"monospace">The gfs2_inum structure is a bit OTT for
        this I think. A single 64 bit inode number should be enough?
        Also, it is quite likely we may have multiple extents for the
        same inode... so should we split this into two so we can have
        something like this? It is more complicated, but should save
        space in the average case.<br>
      </font></p>
    <p><font face=3D"monospace">struct alloc_hdr {</font></p>
    <p><font face=3D"monospace">=C2=A0=C2=A0=C2=A0 __be64 inum;</font></p>
    <p><font face=3D"monospace">=C2=A0=C2=A0=C2=A0 __be32 uid; /* This is d=
uplicated from
        the inode... various options here depending on whether we think
        this is something we should do. Should we also consider logging
        chown using this structure? We will have to carefully check
        chown sequence wrt to allocations/deallocations for quota
        purposes */<br>
      </font></p>
    <p><font face=3D"monospace">=C2=A0=C2=A0=C2=A0 __be32 gid;</font></p>
    <p><font face=3D"monospace">=C2=A0=C2=A0=C2=A0 __u8 num_extents; /* Nev=
er likely to
        have huge numbers of extents per header, due to block size! */</fon=
t></p>
    <p><font face=3D"monospace">=C2=A0=C2=A0=C2=A0 /* padding... or is ther=
e something
        else we could/should add here? */<br>
      </font></p>
    <p><font face=3D"monospace">};</font></p>
    <p><font face=3D"monospace">followed by num_extents copies of:</font></=
p>
    <p><font face=3D"monospace">struct alloc_extent {</font></p>
    <p><font face=3D"monospace">=C2=A0=C2=A0=C2=A0 __be64 phys_start;</font=
></p>
    <p><font face=3D"monospace">=C2=A0=C2=A0=C2=A0 __be64 logical_start; /*=
 Do we need a
        logical &amp; physical start? Maybe we don&#39;t care about the
        logical start? */<br>
      </font></p>
    <p><font face=3D"monospace">=C2=A0=C2=A0=C2=A0 __be32 length; /* Max ex=
tent length is
        limited by rgrp length... only need 32 bits */<br>
      </font></p>
    <p><font face=3D"monospace">=C2=A0=C2=A0=C2=A0 __be32 flags; /* Can we =
support
        unwritten, zero extents with this? Need to indicate
        alloc/free/zero, data/metadata */</font></p>
    <p><font face=3D"monospace">};</font></p></div></blockquote><div>We&#39=
;re trying to keep allocations relatively close together and within the sam=
e resource group, so to store extent lists more compactly, we could store t=
he first extent&#39;s start address absolutely, and the start of each succe=
ssive extent within range as a signed 32-bit number relative to that.<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
    <p><font face=3D"monospace">Just wondering if there is also some
        shorthand we might be able to use in case we have multiple
        extents all separated by either one metadata block, or a very
        small number of metadata blocks (which will be the case for
        streaming writes). Again it increases the complexity, but will
        likely reduce the amount we have to write into the new journal
        blocks quite a lot. Not much point having a 32 bit length, but
        never filling it with a value above 509 (4k block size)...<br></fon=
t></p></div></blockquote><div>The current allocator fills at most one indir=
ect block before allocating the next indirect block(s), which is why we end=
 up with the above described pattern. Once we switch to extent-based inodes=
, we won&#39;t be allocating indirect blocks anymore, so we also won&#39;t =
end up with those chopped-up extents anymore. There will be the occasional =
node split in the inode extent tree, but that will be a much less frequent =
occurrence, and it won&#39;t happen when extending an existing extent. Dela=
yed allocation would further improve the on-disk allocation patterns. On th=
e other hand, we&#39;ll end up with more overhead when files are highly fra=
gmented.<br></div><div><br></div><div>As long as we&#39;re only storing ext=
ents in the journal, I don&#39;t think those 509-block chunks are a problem=
; we&#39;ll still end up with more compact metadata for mostly-contiguous f=
iles. We&#39;ll do much worse for test cases that write every other block, =
for example.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v><p><font face=3D"monospace">
      </font></p>
    <p><font face=3D"monospace">
      </font></p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div>
          <div><font face=3D"monospace"><span class=3D"gmail_default" style=
=3D"font-family:monospace,monospace">With 4k block
                sizes, we can fit 84 extents (10 for 512b, 20 for 1k,=C2=A0=
</span><span class=3D"gmail_default" style=3D"font-family:monospace,monospa=
ce">42 for 2k block
                sizes) in one block. As we process more allocs/deallocs,
                we keep creating more such alloc_ext records and tack
                them to the back of this block if there&#39;s space or else
                create a new block. For smaller extents, this might not
                be efficient, so we might just want to revert to the old
                method of recording the bitmap blocks instead.</span></font=
></div>
        </div>
        <div><font face=3D"monospace"><span class=3D"gmail_default" style=
=3D"font-family:monospace,monospace">During journal
              replay, we decode these new blocks and flip the
              corresponding bitmaps for each of the blocks represented
              in the extents. For the ones where we just recorded the
              bitmap blocks the old-fashioned way, we also replay them
              the old-fashioned way. This way we&#39;re also backward
              compatible with an older version of gfs2 that only records
              the bitmaps.</span></font></div>
        <div><font face=3D"monospace"><span class=3D"gmail_default" style=
=3D"font-family:monospace,monospace">Since we record
              the uid/gid with each extent, we can do the quota
              accounting without relying on the quota change file. We
              might need to keep the quota change file around for
              backward compatibility and for the cases where we might
              want to record allocs/deallocs the old-fashioned way.</span><=
/font></div>
        <div><font face=3D"monospace"><span class=3D"gmail_default" style=
=3D"font-family:monospace,monospace"><br>
            </span></font></div>
        <div>
          <div style=3D"font-family:monospace,monospace">I&#39;m going to p=
lay
            around with this and come up with some patches to see if
            this works and what kind of performance improvements we get.
            These data structures will mostly likely need reworking and
            renaming, but this is the general direction I&#39;m thinking
            along.</div>
          <div style=3D"font-family:monospace,monospace"><br>
          </div>
          <div style=3D"font-family:monospace,monospace">Please let me know
            what you think.</div>
        </div>
        <div style=3D"font-family:monospace,monospace"><br>
        </div>
        <div style=3D"font-family:monospace,monospace">Cheers!</div>
        <div style=3D"font-family:monospace,monospace">--Abhi</div>
      </div>
    </blockquote>
    <p>That all sounds good. I&#39;m sure it will take a little while to
      figure out how to get this right,</p>
    <p>Steve.</p>
    </div></blockquote><div>Thanks,</div><div>Andreas<br></div></div></div>

--000000000000b0533405bc7d4c6c--

