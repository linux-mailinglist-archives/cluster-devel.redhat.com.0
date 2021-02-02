Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9408D30C7DF
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Feb 2021 18:35:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612287346;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=BTcZlRbK4BC0RHgtquu5QUqxwH96vMeL0Zggw0B2bwg=;
	b=cI9FaaTOWFJ6B/QHAcc+lfrYPolLG4/+g3yLjJ6NjTdfGu/eYsOnkvpQdIzqx6JT/08WOW
	vNWQX/6GjsCYWAqJWX9dC84LSaNjFiIjOwHadTm1+Yo9f5hp9kJstQzbE+NiZwjSsRpKi/
	dAHJ0rSedKRPcakVsplPHsC53jfu8lA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-0kbXSgs2PcCUeM5j143oXw-1; Tue, 02 Feb 2021 12:35:42 -0500
X-MC-Unique: 0kbXSgs2PcCUeM5j143oXw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D36AD107ACF9;
	Tue,  2 Feb 2021 17:35:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AD0C5D9D5;
	Tue,  2 Feb 2021 17:35:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0C624EEF6;
	Tue,  2 Feb 2021 17:35:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 112HZV2l020524 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 12:35:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 964635D763; Tue,  2 Feb 2021 17:35:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 114E85D749;
	Tue,  2 Feb 2021 17:35:24 +0000 (UTC)
To: Abhijith Das <adas@redhat.com>, cluster-devel <cluster-devel@redhat.com>
References: <CACrDRjiiXtz6cOO8FmnZHKte2EVKAFzDESXJ5a8oALd7h+EizA@mail.gmail.com>
	<CACrDRjjOgEsqOSWK1PeMro4WQxKkmR=KEfCCRQzBGCwtY+fevQ@mail.gmail.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <93452e4c-af81-225f-34f5-f297473164ae@redhat.com>
Date: Tue, 2 Feb 2021 17:35:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CACrDRjjOgEsqOSWK1PeMro4WQxKkmR=KEfCCRQzBGCwtY+fevQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] Recording extents in GFS2
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
	boundary="------------1CAFF89C18549B20A0EF0C45"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1CAFF89C18549B20A0EF0C45
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

On 24/01/2021 06:44, Abhijith Das wrote:
> Hi all,
>
> I've been looking at rgrp.c:gfs2_alloc_blocks(), which is called from=20
> various places to allocate single/multiple blocks for inodes. I've=20
> come up with some data structures to accomplish recording of these=20
> allocations as extents.
>
> I'm proposing we add a new metadata type for journal blocks that will=20
> hold these extent records.
>
> GFS2_METATYPE_EX 15 /* New metadata type for a block that will hold=20
> extents=C2=A0*/
>
> This structure below will be at the start of the block, followed by a=20
> number of alloc_ext structures.
>
> struct gfs2_extents {/* This structure is 32 bytes long */
> struct gfs2_meta_header ex_header;
> __be32 ex_count;/* count of number of alloc_ext structs that follow=20
> this header. */
> __be32 __pad;
> };
> /* flags for the alloc_ext struct */
> #define AE_FL_XXX
>
> struct alloc_ext {/* This structure is 48 bytes long */
> struct gfs2_inum ae_num;/* The inode this allocation/deallocation=20
> belongs to */
> __be32 ae_flags;/* specifies if we're allocating/deallocating,=20
> data/metadata, etc. */
> __be64 ae_start;/* starting physical block number of the extent */
> __be64 ae_len;=C2=A0 =C2=A0/* length of the extent */
> __be32 ae_uid;=C2=A0 =C2=A0/* user this belongs to, for quota accounting =
*/
> __be32 ae_gid;=C2=A0 =C2=A0/* group this belongs to, for quota accounting=
 */
> __be32 __pad;
> };
>
The gfs2_inum structure is a bit OTT for this I think. A single 64 bit=20
inode number should be enough? Also, it is quite likely we may have=20
multiple extents for the same inode... so should we split this into two=20
so we can have something like this? It is more complicated, but should=20
save space in the average case.

struct alloc_hdr {

 =C2=A0=C2=A0=C2=A0 __be64 inum;

 =C2=A0=C2=A0=C2=A0 __be32 uid; /* This is duplicated from the inode... var=
ious options=20
here depending on whether we think this is something we should do.=20
Should we also consider logging chown using this structure? We will have=20
to carefully check chown sequence wrt to allocations/deallocations for=20
quota purposes */

 =C2=A0=C2=A0=C2=A0 __be32 gid;

 =C2=A0=C2=A0=C2=A0 __u8 num_extents; /* Never likely to have huge numbers =
of extents=20
per header, due to block size! */

 =C2=A0=C2=A0=C2=A0 /* padding... or is there something else we could/shoul=
d add here? */

};

followed by num_extents copies of:

struct alloc_extent {

 =C2=A0=C2=A0=C2=A0 __be64 phys_start;

 =C2=A0=C2=A0=C2=A0 __be64 logical_start; /* Do we need a logical & physica=
l start?=20
Maybe we don't care about the logical start? */

 =C2=A0=C2=A0=C2=A0 __be32 length; /* Max extent length is limited by rgrp =
length...=20
only need 32 bits */

 =C2=A0=C2=A0=C2=A0 __be32 flags; /* Can we support unwritten, zero extents=
 with this?=20
Need to indicate alloc/free/zero, data/metadata */

};

Just wondering if there is also some shorthand we might be able to use=20
in case we have multiple extents all separated by either one metadata=20
block, or a very small number of metadata blocks (which will be the case=20
for streaming writes). Again it increases the complexity, but will=20
likely reduce the amount we have to write into the new journal blocks=20
quite a lot. Not much point having a 32 bit length, but never filling it=20
with a value above 509 (4k block size)...


> With 4k block sizes, we can fit 84 extents (10 for 512b, 20 for 1k, 42=20
> for 2k block sizes) in one block. As we process more allocs/deallocs,=20
> we keep creating more such alloc_ext records and tack them to the back=20
> of this block if there's space or else create a new block. For smaller=20
> extents, this might not be efficient, so we might just want to revert=20
> to the old method of recording the bitmap blocks instead.
> During journal replay, we decode these new blocks and flip the=20
> corresponding bitmaps for each of the blocks represented in the=20
> extents. For the ones where we just recorded the bitmap blocks the=20
> old-fashioned way, we also replay them the old-fashioned way. This way=20
> we're also backward compatible with an older version of gfs2 that only=20
> records the bitmaps.
> Since we record the uid/gid with each extent, we can do the quota=20
> accounting without relying on the quota change file. We might need to=20
> keep the quota change file around for backward compatibility and for=20
> the cases where we might want to record allocs/deallocs the=20
> old-fashioned way.
>
> I'm going to play around with this and come up with some patches to=20
> see if this works and what kind of performance improvements we get.=20
> These data structures will mostly likely need reworking and renaming,=20
> but this is the general direction I'm thinking along.
>
> Please let me know what you think.
>
> Cheers!
> --Abhi

That all sounds good. I'm sure it will take a little while to figure out=20
how to get this right,

Steve.



--------------1CAFF89C18549B20A0EF0C45
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class=3D"moz-cite-prefix">On 24/01/2021 06:44, Abhijith Das
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CACrDRjjOgEsqOSWK1PeMro4WQxKkmR=3DKEfCCRQzBGCwtY+fevQ@mail.gmai=
l.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
      <div dir=3D"ltr">
        <div>
          <div class=3D"gmail_default"
            style=3D"font-family:monospace,monospace">Hi all,</div>
          <div class=3D"gmail_default"
            style=3D"font-family:monospace,monospace"><br>
          </div>
          <div class=3D"gmail_default"
            style=3D"font-family:monospace,monospace">I've been looking at
            rgrp.c:gfs2_alloc_blocks(), which is called from various
            places to allocate single/multiple blocks for inodes. I've
            come up with some data structures to accomplish recording of
            these allocations as extents.</div>
          <div class=3D"gmail_default"
            style=3D"font-family:monospace,monospace"><br>
          </div>
          <div class=3D"gmail_default"
            style=3D"font-family:monospace,monospace">I'm proposing we add
            a new metadata type for journal blocks that will hold these
            extent records.</div>
        </div>
        <div class=3D"gmail_default"
          style=3D"font-family:monospace,monospace"><br>
        </div>
        <font face=3D"monospace">GFS2_METATYPE_EX 15 /* <span
            class=3D"gmail_default"
            style=3D"font-family:monospace,monospace">New metadata type
            for a block that will hold extents</span>=C2=A0*/<br>
          <br>
          <span class=3D"gmail_default"
            style=3D"font-family:monospace,monospace">This structure below
            will be at the start of the block, followed by a number of
            alloc_ext structures.</span></font>
        <div><font face=3D"monospace, monospace"><br>
          </font><font face=3D"monospace">struct gfs2_extents {</font><span
            class=3D"gmail_default"
            style=3D"font-family:monospace,monospace"> /* This structure
            is 32 bytes long */</span><br>
          <span class=3D"gmail_default"
            style=3D"font-family:monospace,monospace">=C2=A0 =C2=A0 </span>=
<font
            face=3D"monospace">struct gfs2_meta_header ex_header;</font><br=
>
          <span class=3D"gmail_default"
            style=3D"font-family:monospace,monospace">=C2=A0 =C2=A0 </span>=
<font
            face=3D"monospace">__be32 ex_count;</font><span
            class=3D"gmail_default"
            style=3D"font-family:monospace,monospace"> /* count of number
            of alloc_ext structs that follow this header. */</span><br>
          <span class=3D"gmail_default"
            style=3D"font-family:monospace,monospace">=C2=A0 =C2=A0 </span>=
<font
            face=3D"monospace">__be32 __pad;</font><br>
          <font face=3D"monospace">};</font><br>
          <span class=3D"gmail_default"
            style=3D"font-family:monospace,monospace"></span><span
            class=3D"gmail_default"
            style=3D"font-family:monospace,monospace"></span>
          <div><font face=3D"monospace, monospace"><span
                class=3D"gmail_default"
                style=3D"font-family:monospace,monospace">/* flags for the
                alloc_ext struct */</span><br>
            </font><font face=3D"monospace">#<span class=3D"gmail_default"
                style=3D"">define</span> AE_FL_<span class=3D"gmail_default=
"
                style=3D"font-family:monospace,monospace">XXX</span></font>=
<br>
            <font face=3D"monospace"><span class=3D"gmail_default"
                style=3D"font-family:monospace,monospace"><br>
              </span></font>
            <div><font face=3D"monospace"><span class=3D"gmail_default"
                  style=3D"font-family:monospace,monospace"></span>struct
                alloc_ext {<span class=3D"gmail_default"
                  style=3D"font-family:monospace,monospace"> /* This
                  structure is 48 bytes long */</span><br>
                <span class=3D"gmail_default"
                  style=3D"font-family:monospace,monospace">=C2=A0 =C2=A0 <=
/span>struct
                gfs2_inum ae_num;<span class=3D"gmail_default"
                  style=3D"font-family:monospace,monospace"> /* The inode
                  this allocation/deallocation belongs to */</span><br>
                <span class=3D"gmail_default"
                  style=3D"font-family:monospace,monospace">=C2=A0 =C2=A0 <=
/span>__be32
                ae_flags;<span class=3D"gmail_default"
                  style=3D"font-family:monospace,monospace"> /* specifies
                  if we're allocating/deallocating, data/metadata, etc.
                  */</span><br>
                <span class=3D"gmail_default"
                  style=3D"font-family:monospace,monospace">=C2=A0 =C2=A0 <=
/span>__be64
                ae_start;<span class=3D"gmail_default"
                  style=3D"font-family:monospace,monospace"> /* starting
                  physical block number of the extent */</span><br>
                <span class=3D"gmail_default"
                  style=3D"font-family:monospace,monospace">=C2=A0 =C2=A0 <=
/span>__be64
                ae_len;<span class=3D"gmail_default"
                  style=3D"font-family:monospace,monospace">=C2=A0 =C2=A0/*=
 length
                  of the extent */</span><br>
                <span class=3D"gmail_default"
                  style=3D"font-family:monospace,monospace">=C2=A0 =C2=A0 <=
/span>__be32
                ae_uid;<span class=3D"gmail_default"
                  style=3D"font-family:monospace,monospace">=C2=A0 =C2=A0/*=
 user
                  this belongs to, for quota accounting */</span><br>
                <span class=3D"gmail_default"
                  style=3D"font-family:monospace,monospace">=C2=A0 =C2=A0 <=
/span>__be32
                ae_gid;<span class=3D"gmail_default"
                  style=3D"font-family:monospace,monospace">=C2=A0 =C2=A0/*=
 group
                  this belongs to, for quota accounting */</span><br>
                <span class=3D"gmail_default"
                  style=3D"font-family:monospace,monospace">=C2=A0 =C2=A0 <=
/span>__be32
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
        logical &amp; physical start? Maybe we don't care about the
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
    <p><font face=3D"monospace">};</font></p>
    <p><font face=3D"monospace">Just wondering if there is also some
        shorthand we might be able to use in case we have multiple
        extents all separated by either one metadata block, or a very
        small number of metadata blocks (which will be the case for
        streaming writes). Again it increases the complexity, but will
        likely reduce the amount we have to write into the new journal
        blocks quite a lot. Not much point having a 32 bit length, but
        never filling it with a value above 509 (4k block size)...<br>
      </font></p>
    <p><font face=3D"monospace"><br>
      </font></p>
    <blockquote type=3D"cite"
cite=3D"mid:CACrDRjjOgEsqOSWK1PeMro4WQxKkmR=3DKEfCCRQzBGCwtY+fevQ@mail.gmai=
l.com">
      <div dir=3D"ltr">
        <div>
          <div><font face=3D"monospace"><span class=3D"gmail_default"
                style=3D"font-family:monospace,monospace">With 4k block
                sizes, we can fit 84 extents (10 for 512b, 20 for 1k,=C2=A0=
</span><span
                class=3D"gmail_default"
                style=3D"font-family:monospace,monospace">42 for 2k block
                sizes) in one block. As we process more allocs/deallocs,
                we keep creating more such alloc_ext records and tack
                them to the back of this block if there's space or else
                create a new block. For smaller extents, this might not
                be efficient, so we might just want to revert to the old
                method of recording the bitmap blocks instead.</span></font=
></div>
        </div>
        <div><font face=3D"monospace"><span class=3D"gmail_default"
              style=3D"font-family:monospace,monospace">During journal
              replay, we decode these new blocks and flip the
              corresponding bitmaps for each of the blocks represented
              in the extents. For the ones where we just recorded the
              bitmap blocks the old-fashioned way, we also replay them
              the old-fashioned way. This way we're also backward
              compatible with an older version of gfs2 that only records
              the bitmaps.</span></font></div>
        <div><font face=3D"monospace"><span class=3D"gmail_default"
              style=3D"font-family:monospace,monospace">Since we record
              the uid/gid with each extent, we can do the quota
              accounting without relying on the quota change file. We
              might need to keep the quota change file around for
              backward compatibility and for the cases where we might
              want to record allocs/deallocs the old-fashioned way.</span><=
/font></div>
        <div><font face=3D"monospace"><span class=3D"gmail_default"
              style=3D"font-family:monospace,monospace"><br>
            </span></font></div>
        <div>
          <div class=3D"gmail_default"
            style=3D"font-family:monospace,monospace">I'm going to play
            around with this and come up with some patches to see if
            this works and what kind of performance improvements we get.
            These data structures will mostly likely need reworking and
            renaming, but this is the general direction I'm thinking
            along.</div>
          <div class=3D"gmail_default"
            style=3D"font-family:monospace,monospace"><br>
          </div>
          <div class=3D"gmail_default"
            style=3D"font-family:monospace,monospace">Please let me know
            what you think.</div>
        </div>
        <div class=3D"gmail_default"
          style=3D"font-family:monospace,monospace"><br>
        </div>
        <div class=3D"gmail_default"
          style=3D"font-family:monospace,monospace">Cheers!</div>
        <div class=3D"gmail_default"
          style=3D"font-family:monospace,monospace">--Abhi</div>
      </div>
    </blockquote>
    <p>That all sounds good. I'm sure it will take a little while to
      figure out how to get this right,</p>
    <p>Steve.</p>
    <p><br>
    </p>
  </body>
</html>

--------------1CAFF89C18549B20A0EF0C45--

