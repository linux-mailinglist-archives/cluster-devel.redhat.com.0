Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C066E30C311
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Feb 2021 16:10:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612278609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T3u+eVYgdX2Q7cLSOLGRITqY4o+e4ivVIYtqc0Gb4gY=;
	b=NDkW7Tds1ksX1AiJXGwLSli305BTkLWNMzAxK40EKG12gly/U8Z8MiXZoqKspZ34g0/xJ/
	Qyqo2YwcgamaSb0bwCGGAQhJI+0r8YT0MeXZrNlw75MEy9WujLuXhpPj1az+jk1oyTgrCV
	KQ6ssZt+XZ8tFyA57nRhxqD1IdgI61I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-gAFRVSTtOQyCPvwrmsG82g-1; Tue, 02 Feb 2021 10:10:06 -0500
X-MC-Unique: gAFRVSTtOQyCPvwrmsG82g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 452F99CDB6;
	Tue,  2 Feb 2021 15:09:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A0C55D749;
	Tue,  2 Feb 2021 15:09:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E5DDF5003A;
	Tue,  2 Feb 2021 15:09:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 112F8kMd003851 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 10:08:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 500715F705; Tue,  2 Feb 2021 15:08:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51A695C237;
	Tue,  2 Feb 2021 15:08:43 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4787618095CA;
	Tue,  2 Feb 2021 15:08:43 +0000 (UTC)
Date: Tue, 2 Feb 2021 10:08:40 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Abhijith Das <adas@redhat.com>
Message-ID: <897874016.51379099.1612278520151.JavaMail.zimbra@redhat.com>
In-Reply-To: <CACrDRjjOgEsqOSWK1PeMro4WQxKkmR=KEfCCRQzBGCwtY+fevQ@mail.gmail.com>
References: <CACrDRjiiXtz6cOO8FmnZHKte2EVKAFzDESXJ5a8oALd7h+EizA@mail.gmail.com>
	<CACrDRjjOgEsqOSWK1PeMro4WQxKkmR=KEfCCRQzBGCwtY+fevQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.228, 10.4.195.3]
Thread-Topic: Recording extents in GFS2
Thread-Index: paW8vnAY6OREvrUWxlnJZ6ipxDYtwA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
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
> GFS2_METATYPE_EX 15 /* New metadata type for a block that will hold extents
>  */
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
> With 4k block sizes, we can fit 84 extents (10 for 512b, 20 for 1k, 42 for
> 2k block sizes) in one block. As we process more allocs/deallocs, we keep
> creating more such alloc_ext records and tack them to the back of this
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
Hi Abhi,

Thanks for working on this. I just want to throw some thoughts out,
as long as we're in the early stages of this.

I'm concerned about whether we need to worry about these new records
being encountered during a journal replay on an old kernel that knows
nothing about them, and how we handle that. We'll need a plan going in,
but we're already talking about changes to the on-disk format and
version numbers to keep that straight. So I assume we're okay there.

It sounds like a journal replay may encounter metadata records for both
resource groups, bitmaps, and these new journal entries.
Since this is not really metadata, but a representation thereof, I wonder
if we should make this new record a new kind of journal block. After
all, they should only appear in journals. In other words, today we
have (1) log headers and (2) log descriptors. Maybe these should be
log modifiers or something? There may be advantages and disadvantages.

The reason I bring this up is: I'm concerned that journal replay might
get the ordering wrong. In other words, if journal replay encounters
a metadata block for a resource group bitmap, and rewrites the in-place
block, then it encounters one of these new gfs2_extents blocks for the
same bitmap, it needs to get the order right with regard to whether the
extents should be carved out of the original bitmap or the replayed one.
The order of the metadata in the log descriptors depends entirely on
the order in which they appear within the ail lists as they're added to
the transaction. I'm not convinced we get the order "right" today, but
today it doesn't matter because there will only be one copy of the bitmap
per transaction. With extents, we will potentially have more than one,
which means we need to guarantee the order is correct, or at least
guard against illegal bitmap changes caused by them.

With today's scheme of journaling the entire bitmap, we use our scheme
of revoking the metadata that's been written once it's safely written
back. So we need a way to do something similar for these extent blocks.
This is mostly accomplished by way of the journal sequence numbers in
the log headers. So maybe we can leverage these same sequence numbers
to guarantee the order and ensure some kind of revoke process.

It's likely to get messy. But probably still worth the effort.

Unless, of course, we go to an all-or-nothing scheme: IOW, either we
have all bitmap changes journaled as either (a) metadata or as (b) extents
but not both. That could, as you brought up, affect performance for
smaller allocations.

Another thought is that maybe we could toss these records into the
log headers? I suppose there are probably better long-term uses for
that space though.

Regards,

Bob Peterson
Red Hat File SYstems

