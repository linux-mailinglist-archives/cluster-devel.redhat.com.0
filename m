Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AAF39301A3D
	for <lists+cluster-devel@lfdr.de>; Sun, 24 Jan 2021 07:47:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611470868;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ZTKOt8atE5RzrOW/z+yZPcTjpxJWBABkC4i7xtbrpyQ=;
	b=TWMhsLfyT98MYXcG3ut1V75dHWASaPm8paVQD4dFu31jDAPsMQLfQMa3cZyZO+GK5CxXSK
	o0etuutHROaQcwDFOBzTyUX17CtZBmaljHZdXom6JDEzmkoYI5sHCoaZmpoYh6DtyJFo8J
	mFqUzARlybTs6fMerW5glIaIwbkzt34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-4if7lTS8OseUD-inqso-5A-1; Sun, 24 Jan 2021 01:47:46 -0500
X-MC-Unique: 4if7lTS8OseUD-inqso-5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A979A806672;
	Sun, 24 Jan 2021 06:47:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EF245B6A9;
	Sun, 24 Jan 2021 06:47:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85A22180954D;
	Sun, 24 Jan 2021 06:47:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10O6jG1Q015875 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 24 Jan 2021 01:45:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0615A2166B2F; Sun, 24 Jan 2021 06:45:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00BD92166B28
	for <cluster-devel@redhat.com>; Sun, 24 Jan 2021 06:45:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CC8C101A53F
	for <cluster-devel@redhat.com>; Sun, 24 Jan 2021 06:45:13 +0000 (UTC)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
	[209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-480-gFa8-fKMNHKu-ZxygEEmdQ-1; Sun, 24 Jan 2021 01:45:10 -0500
X-MC-Unique: gFa8-fKMNHKu-ZxygEEmdQ-1
Received: by mail-pg1-f197.google.com with SMTP id 18so6078715pgp.22
	for <cluster-devel@redhat.com>; Sat, 23 Jan 2021 22:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=ZTKOt8atE5RzrOW/z+yZPcTjpxJWBABkC4i7xtbrpyQ=;
	b=GkCZJK997Tc1MQP/uyG1t5sE4Dcfv8j1t1qWYNQVH0AKH8J3Y5gfwQTa5E2S+Irb2E
	nlITKUvXqDY8yDUWHbKsl6+XgsBNbLS78Vx1TqeUwdYzbFW1WbG64W2iIr/MqIkjiDXt
	3Eoc/gIsGegmtukO2tp+EAIUCJ5p+qVPd4yTdBa6rd+gnYhqIyNaYQKy/FvjRpwaX6vO
	OSHdIUNg53S1QbBkWAInlNq1mXH+NgN2Xtjo/kehhwY4C10ij+Smx+ZOVwjBK7UKRZpO
	GW1FmttZG+nnxYlzmeWN4iNqnxnb81/RYjANqIflb/kpEGcaffP1jjhXgJz89JGl01b1
	3MPQ==
X-Gm-Message-State: AOAM5303OPPP0wEtHTY7tmAgkbmd9AYunCnHGo7Wj5TSesC+dCkbZU+Q
	LQvaFGj1DiceVZe+LsdWnNfHypxaPUnU6UJueacgdi1e7czO/VaocS3yVMrseaJ5qKPEm3WW8u6
	Ace0mF32LNCLLfm7Um1pJ2la5/4R/fbc0rtJfDw==
X-Received: by 2002:a63:3549:: with SMTP id c70mr12604802pga.361.1611470709513;
	Sat, 23 Jan 2021 22:45:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvgKEhze9GCrmK9i0fUSi3nA7w2NZzKl3IVUr7OgkjRF7DvhBEnrNjI9upnw04BqXOzyJ948uM5i2FDuDDVgw=
X-Received: by 2002:a63:3549:: with SMTP id c70mr12604785pga.361.1611470709218;
	Sat, 23 Jan 2021 22:45:09 -0800 (PST)
MIME-Version: 1.0
References: <CACrDRjiiXtz6cOO8FmnZHKte2EVKAFzDESXJ5a8oALd7h+EizA@mail.gmail.com>
In-Reply-To: <CACrDRjiiXtz6cOO8FmnZHKte2EVKAFzDESXJ5a8oALd7h+EizA@mail.gmail.com>
From: Abhijith Das <adas@redhat.com>
Date: Sun, 24 Jan 2021 00:44:58 -0600
Message-ID: <CACrDRjjOgEsqOSWK1PeMro4WQxKkmR=KEfCCRQzBGCwtY+fevQ@mail.gmail.com>
To: cluster-devel <cluster-devel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000307c6a05b99fc3ab"

--000000000000307c6a05b99fc3ab
Content-Type: text/plain; charset="UTF-8"

Hi all,

I've been looking at rgrp.c:gfs2_alloc_blocks(), which is called from
various places to allocate single/multiple blocks for inodes. I've come up
with some data structures to accomplish recording of these allocations as
extents.

I'm proposing we add a new metadata type for journal blocks that will hold
these extent records.

GFS2_METATYPE_EX 15 /* New metadata type for a block that will hold extents
 */

This structure below will be at the start of the block, followed by a
number of alloc_ext structures.

struct gfs2_extents { /* This structure is 32 bytes long */
    struct gfs2_meta_header ex_header;
    __be32 ex_count; /* count of number of alloc_ext structs that follow
this header. */
    __be32 __pad;
};
/* flags for the alloc_ext struct */
#define AE_FL_XXX

struct alloc_ext { /* This structure is 48 bytes long */
    struct gfs2_inum ae_num; /* The inode this allocation/deallocation
belongs to */
    __be32 ae_flags; /* specifies if we're allocating/deallocating,
data/metadata, etc. */
    __be64 ae_start; /* starting physical block number of the extent */
    __be64 ae_len;   /* length of the extent */
    __be32 ae_uid;   /* user this belongs to, for quota accounting */
    __be32 ae_gid;   /* group this belongs to, for quota accounting */
    __be32 __pad;
};

With 4k block sizes, we can fit 84 extents (10 for 512b, 20 for 1k, 42 for
2k block sizes) in one block. As we process more allocs/deallocs, we keep
creating more such alloc_ext records and tack them to the back of this
block if there's space or else create a new block. For smaller extents,
this might not be efficient, so we might just want to revert to the old
method of recording the bitmap blocks instead.
During journal replay, we decode these new blocks and flip the
corresponding bitmaps for each of the blocks represented in the extents.
For the ones where we just recorded the bitmap blocks the old-fashioned
way, we also replay them the old-fashioned way. This way we're also
backward compatible with an older version of gfs2 that only records the
bitmaps.
Since we record the uid/gid with each extent, we can do the quota
accounting without relying on the quota change file. We might need to keep
the quota change file around for backward compatibility and for the cases
where we might want to record allocs/deallocs the old-fashioned way.

I'm going to play around with this and come up with some patches to see if
this works and what kind of performance improvements we get. These data
structures will mostly likely need reworking and renaming, but this is the
general direction I'm thinking along.

Please let me know what you think.

Cheers!
--Abhi

--000000000000307c6a05b99fc3ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div class=3D"gmail_default" style=3D"font-family:mon=
ospace,monospace">Hi all,</div><div class=3D"gmail_default" style=3D"font-f=
amily:monospace,monospace"><br></div><div class=3D"gmail_default" style=3D"=
font-family:monospace,monospace">I&#39;ve been looking at rgrp.c:gfs2_alloc=
_blocks(), which is called from various places to allocate single/multiple =
blocks for inodes. I&#39;ve come up with some data structures to accomplish=
 recording of these allocations as extents.</div><div class=3D"gmail_defaul=
t" style=3D"font-family:monospace,monospace"><br></div><div class=3D"gmail_=
default" style=3D"font-family:monospace,monospace">I&#39;m proposing we add=
 a new metadata type for journal blocks that will hold these extent records=
.</div></div><div class=3D"gmail_default" style=3D"font-family:monospace,mo=
nospace"><br></div><font face=3D"monospace">GFS2_METATYPE_EX 15 /* <span cl=
ass=3D"gmail_default" style=3D"font-family:monospace,monospace">New metadat=
a type for a block that will hold extents</span>=C2=A0*/<br><br><span class=
=3D"gmail_default" style=3D"font-family:monospace,monospace">This structure=
 below will be at the start of the block, followed by a number of alloc_ext=
 structures.</span></font><div><font face=3D"monospace, monospace"><br></fo=
nt><font face=3D"monospace">struct gfs2_extents {</font><span class=3D"gmai=
l_default" style=3D"font-family:monospace,monospace"> /* This structure is =
32 bytes long */</span><br><span class=3D"gmail_default" style=3D"font-fami=
ly:monospace,monospace">=C2=A0 =C2=A0 </span><font face=3D"monospace">struc=
t gfs2_meta_header ex_header;</font><br><span class=3D"gmail_default" style=
=3D"font-family:monospace,monospace">=C2=A0 =C2=A0 </span><font face=3D"mon=
ospace">__be32 ex_count;</font><span class=3D"gmail_default" style=3D"font-=
family:monospace,monospace"> /* count of number of alloc_ext structs that f=
ollow this header. */</span><br><span class=3D"gmail_default" style=3D"font=
-family:monospace,monospace">=C2=A0 =C2=A0 </span><font face=3D"monospace">=
__be32 __pad;</font><br><font face=3D"monospace">};</font><br><span class=
=3D"gmail_default" style=3D"font-family:monospace,monospace"></span><span c=
lass=3D"gmail_default" style=3D"font-family:monospace,monospace"></span><di=
v><font face=3D"monospace, monospace"><span class=3D"gmail_default" style=
=3D"font-family:monospace,monospace">/* flags for the alloc_ext struct */</=
span><br></font><font face=3D"monospace">#<span class=3D"gmail_default" sty=
le=3D"">define</span> AE_FL_<span class=3D"gmail_default" style=3D"font-fam=
ily:monospace,monospace">XXX</span></font><br><font face=3D"monospace"><spa=
n class=3D"gmail_default" style=3D"font-family:monospace,monospace"><br></s=
pan></font><div><font face=3D"monospace"><span class=3D"gmail_default" styl=
e=3D"font-family:monospace,monospace"></span>struct alloc_ext {<span class=
=3D"gmail_default" style=3D"font-family:monospace,monospace"> /* This struc=
ture is 48 bytes long */</span><br><span class=3D"gmail_default" style=3D"f=
ont-family:monospace,monospace">=C2=A0 =C2=A0 </span>struct gfs2_inum ae_nu=
m;<span class=3D"gmail_default" style=3D"font-family:monospace,monospace"> =
/* The inode this allocation/deallocation belongs to */</span><br><span cla=
ss=3D"gmail_default" style=3D"font-family:monospace,monospace">=C2=A0 =C2=
=A0 </span>__be32 ae_flags;<span class=3D"gmail_default" style=3D"font-fami=
ly:monospace,monospace"> /* specifies if we&#39;re allocating/deallocating,=
 data/metadata, etc. */</span><br><span class=3D"gmail_default" style=3D"fo=
nt-family:monospace,monospace">=C2=A0 =C2=A0 </span>__be64 ae_start;<span c=
lass=3D"gmail_default" style=3D"font-family:monospace,monospace"> /* starti=
ng physical block number of the extent */</span><br><span class=3D"gmail_de=
fault" style=3D"font-family:monospace,monospace">=C2=A0 =C2=A0 </span>__be6=
4 ae_len;<span class=3D"gmail_default" style=3D"font-family:monospace,monos=
pace">=C2=A0 =C2=A0/* length of the extent */</span><br><span class=3D"gmai=
l_default" style=3D"font-family:monospace,monospace">=C2=A0 =C2=A0 </span>_=
_be32 ae_uid;<span class=3D"gmail_default" style=3D"font-family:monospace,m=
onospace">=C2=A0 =C2=A0/* user this belongs to, for quota accounting */</sp=
an><br><span class=3D"gmail_default" style=3D"font-family:monospace,monospa=
ce">=C2=A0 =C2=A0 </span>__be32 ae_gid;<span class=3D"gmail_default" style=
=3D"font-family:monospace,monospace">=C2=A0 =C2=A0/* group this belongs to,=
 for quota accounting */</span><br><span class=3D"gmail_default" style=3D"f=
ont-family:monospace,monospace">=C2=A0 =C2=A0 </span>__be32 __pad;<br>};</f=
ont></div></div><div><font face=3D"monospace"><br></font></div><div><font f=
ace=3D"monospace"><span class=3D"gmail_default" style=3D"font-family:monosp=
ace,monospace">With 4k block sizes, we can fit 84 extents (10 for 512b, 20 =
for 1k,=C2=A0</span><span class=3D"gmail_default" style=3D"font-family:mono=
space,monospace">42 for 2k block sizes) in one block. As we process more al=
locs/deallocs, we keep creating more such alloc_ext records and tack them t=
o the back of this block if there&#39;s space or else create a new block. F=
or smaller extents, this might not be efficient, so we might just want to r=
evert to the old method of recording the bitmap blocks instead.</span></fon=
t></div></div><div><font face=3D"monospace"><span class=3D"gmail_default" s=
tyle=3D"font-family:monospace,monospace">During journal replay, we decode t=
hese new blocks and flip the corresponding bitmaps for each of the blocks r=
epresented in the extents. For the ones where we just recorded the bitmap b=
locks the old-fashioned way, we also replay them the old-fashioned way. Thi=
s way we&#39;re also backward compatible with an older version of gfs2 that=
 only records the bitmaps.</span></font></div><div><font face=3D"monospace"=
><span class=3D"gmail_default" style=3D"font-family:monospace,monospace">Si=
nce we record the uid/gid with each extent, we can do the quota accounting =
without relying on the quota change file. We might need to keep the quota c=
hange file around for backward compatibility and for the cases where we mig=
ht want to record allocs/deallocs the old-fashioned way.</span></font></div=
><div><font face=3D"monospace"><span class=3D"gmail_default" style=3D"font-=
family:monospace,monospace"><br></span></font></div><div><div class=3D"gmai=
l_default" style=3D"font-family:monospace,monospace">I&#39;m going to play =
around with this and come up with some patches to see if this works and wha=
t kind of performance improvements we get. These data structures will mostl=
y likely need reworking and renaming, but this is the general direction I&#=
39;m thinking along.</div><div class=3D"gmail_default" style=3D"font-family=
:monospace,monospace"><br></div><div class=3D"gmail_default" style=3D"font-=
family:monospace,monospace">Please let me know what you think.</div></div><=
div class=3D"gmail_default" style=3D"font-family:monospace,monospace"><br><=
/div><div class=3D"gmail_default" style=3D"font-family:monospace,monospace"=
>Cheers!</div><div class=3D"gmail_default" style=3D"font-family:monospace,m=
onospace">--Abhi</div></div>

--000000000000307c6a05b99fc3ab--

