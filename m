Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EEF15131334
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Jan 2020 14:47:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578318420;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aGQXKs/a3dg1wXYv6nh+E97EPGATEDWPj/yGn0AQvnM=;
	b=If+2qtmZydT+c+CYH+lTr+cqGcMV4K8Zg8jpGXOAOvLI7YGZosk8ERjbYJQeZoVz9MjylA
	4yKyH0+D6yvlVR8AEChpYDGFlP8Tt67wlBBMUavlAQJXiC6f60WSLCLP7JY1yyPcJo7kt5
	6hc3r4flwxC4m4FMqzYAOFQz2lzR340=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-pUmsisVFMlWE9gT79CDqng-1; Mon, 06 Jan 2020 08:46:57 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89A63800D41;
	Mon,  6 Jan 2020 13:46:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50F2A5C21A;
	Mon,  6 Jan 2020 13:46:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C57D581C61;
	Mon,  6 Jan 2020 13:46:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006DkoG5007320 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 08:46:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1A9B85C21A; Mon,  6 Jan 2020 13:46:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E6895C57C;
	Mon,  6 Jan 2020 13:46:47 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8436618095FF;
	Mon,  6 Jan 2020 13:46:47 +0000 (UTC)
Date: Mon, 6 Jan 2020 08:46:47 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <235677466.677575.1578318407483.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200103153123.402971-1-rpeterso@redhat.com>
References: <20200103153123.402971-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.64, 10.4.195.30]
Thread-Topic: gfs2: jdata transactions not reserving enough revokes
Thread-Index: AjtuCISN0eoOtyrLiO11PdCJ3e/8HQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH 0/6] gfs2: jdata transactions
	not	reserving enough revokes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: pUmsisVFMlWE9gT79CDqng-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> Before this patch set, several gfs2 functions failed to reserve enough
> revoke entries in the journal. Some examples:
> 
> 1. gfs2_dinode_dealloc failed to reserve a revoke for the dinode
>    being deleted.
> 2. Any function that allocates dinodes with gfs2_alloc_blocks
>    should reserve a revoke because alloc_blocks will premptively
>    call trans_remove_revoke to make sure there isn't a pending revoke
>    for the new dinode.
> 3. Any function that potentially will unstuff a stuffed directory
>    needs to reserve a revoke because gfs2_unstuff_dinode calls
>    gfs2_trans_remove_revoke for the new journaled leaf block.
> 
> In addition, function gfs2_trans_remove_revoke unconditionally
> decrements tr->tr_num_revoke, and if not enough revokes are reserved, the
> value goes from 0 to  4294967295 (-1, but it's an unsigned int). This is
> later
> re-added to the system-wide revoke numbers, thereby decrementing the value
> (sd_log_commited_revoke) "properly," but by accident. This worked properly
> most of the time because one transaction would reserve space for revokes,
> then it would be merged with the system transaction (sdp->sd_log_tr) and it
> usually did not run out, because you can hold a lot of revoke entries
> per log descriptor block. Some of the code, such as gfs2_write_revokes, would
> work around this and somehow got it right most of the time. However, some
> jdata tests with xfstests generic/269 encountered problems when it actually
> ran out.
> 
> This series adds needed revoke entries to the transactions that
> need them. So now we try to do proper accounting of revokes.
> 
> Bob Peterson (6):
>   gfs2: revoke cleanup: leaf_dealloc
>   gfs2: revoke cleanup: alloc_dinode and gfs2_create_inode
>   gfs2: revoke cleanup: gfs2_dinode_dealloc
>   gfs2: revoke cleanup: gfs2_iomap_begin_write
>   gfs2: revoke cleanup: truncate functions
>   gfs2: revoke cleanup: gfs2_trans_remove_revoke
> 
>  fs/gfs2/bmap.c  | 25 +++++++++++++------------
>  fs/gfs2/dir.c   |  3 ++-
>  fs/gfs2/inode.c |  5 +++--
>  fs/gfs2/super.c |  2 +-
>  fs/gfs2/trans.c | 16 ++++++++++++++--
>  5 files changed, 33 insertions(+), 18 deletions(-)
Hi,

Self-NACK on this patch series. It's not ready for prime time yet.

While it's still true that many transactions don't reserve enough blocks for
revokes, the last patch to gfs2_trans_remove_revoke won't work properly.

It checks for revokes being removed and the counters "improperly" going negative,
but there's a disconnect: Multiple processes can add the same metadata block
over and over to the journal, and they get merged with the superblock transaction.
For example, when multiple processes allocate and/or delete blocks and the
bitmap block gets rewritten over and over again for multiple transactions.

This means after some churn, a process might (properly) add a metadata block
but in so doing, remove multiple revokes for that same block, which causes
the numbers to temporarily go negative. And this is not due to a lack of
revokes being reserved. This is because the revokes go on a central list
from the superblock, but may originate from multiple transactions.
For example, a transaction may revise a bitmap, but in so doing, it may
need to remove several revokes that were added by other processes before it,
and thus, its count of transaction revokes goes negative.

By the way, the value can go negative because patch e955537e326 changed the
behavior from always using positive numbers. (Which is not necessarily a bad
thing).

One solution to this would be to search the global revokes list for all
revoke instances of when new revokes are added, and remove them so that
there's only a single instance on the queue at any given point in time.

If we did this, I'd be worried about improper behavior when journal replays
are needed when transactions are interrupted by a node getting blasted or
fenced, etc. I'd also be worried about a performance impact if every revoke
needs to search a global linked list, while holding the list's ail list
spin_lock.

As I see it, we have several choices:

1. We can revert patch e955537e326 and only allow positive numbers.
   There isn't much gain in doing this.
2. We can embrace the negative values and just fix the problem revoke
   transactions. This might be as simple as eliminating the last patch,
   "gfs2: revoke cleanup: gfs2_trans_remove_revoke".
   If it makes sense, we can also change the counter from unsigned int
   to a signed int. Or maybe we don't even care.
3. We can work out a new solution to keep track of revokes and revoke counts.

For several years we've talked about ways to improve our journal flushing
code and to possibly allow transactions to be queued during log flushes.
So whatever solution we come up with needs to keep that in mind.

Regards,

Bob Peterson
Red Hat File Systems

