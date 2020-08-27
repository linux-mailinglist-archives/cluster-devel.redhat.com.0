Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BB080254592
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Aug 2020 15:00:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598533229;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vWe3dqg3Cd44MZzCvRi+BtmXhwtvlwYNZJZxjkAalL0=;
	b=NrtZNp+BYglmk86PZZ6trBNYW7fPxPH+XeTUHCbTayZS0QUvpuAIR3yvqKzxo1BVM3Kyg4
	WcQRIK2irl35G1lVmQtICb8TUMtJZbPBZXT3SjVk2VAPHQUz/7R6qjE9vtnqntDKlhstWa
	0a7I6YPVctztn5X/rHVymwehF9pZjj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-zZ5csP_cM86aQ8Jd5p5R-g-1; Thu, 27 Aug 2020 09:00:28 -0400
X-MC-Unique: zZ5csP_cM86aQ8Jd5p5R-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 046DC8014D9;
	Thu, 27 Aug 2020 13:00:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7C266111F;
	Thu, 27 Aug 2020 13:00:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 46D76668E1;
	Thu, 27 Aug 2020 13:00:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07RD0FwQ004402 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 09:00:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B4D47D8AD; Thu, 27 Aug 2020 13:00:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F09B67BE53;
	Thu, 27 Aug 2020 13:00:11 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E747518408A1;
	Thu, 27 Aug 2020 13:00:11 +0000 (UTC)
Date: Thu, 27 Aug 2020 09:00:11 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <504794288.14461492.1598533211696.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAHc6FU4u5NW3FYwTz0E4zVp5KWejtUc67YXjMXJNmL=wJfuHjg@mail.gmail.com>
References: <20200821173337.20377-1-rpeterso@redhat.com>
	<20200821173337.20377-7-rpeterso@redhat.com>
	<CAHc6FU4u5NW3FYwTz0E4zVp5KWejtUc67YXjMXJNmL=wJfuHjg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.245, 10.4.195.24]
Thread-Topic: gfs2: Create transaction for inodes with i_nlink != 0
Thread-Index: QuQg73s+yCw6brleqH04hqUcXBcgbw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 06/12] gfs2: Create transaction for
 inodes with i_nlink != 0
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> On Fri, Aug 21, 2020 at 7:33 PM Bob Peterson <rpeterso@redhat.com> wrote:
> > Before this patch, function gfs2_evict_inode would check if i_nlink
> > was non-zero, and if so, go to label out. The problem is, the evicted
> > file may still have outstanding pages that need invalidating, but
> > the call to truncate_inode_pages_final at label out doesn't start a
> > transaction. It needs a transaction in order to write revokes for any
> > pages it has to invalidate.
> 
> This is only true for jdata inodes though, right? If so, I'd rather
> just create transactions in the jdata case.

The truncate_inode_pages_final() for i_data is only for jdata, which
includes directories for their hash tables. However, for regular files,
evict's call to gfs2_glock_put_eventually() has the potential to be the
last put for the inode's glock (in a race), which might still have pages
attached (metamapping). I firmly believe this is our "nrpages" bug I've been
chasing, but I haven't proven it yet because it's very hard to recreate.

Afaik, some of these unresolved metadata pages may still need revokes, and
we still need a transaction to do that, even if the dinode still has links.

The "nrpages" problem always seems to involve the system quotas file,
probably because it's jdata, but imagine a directory with a large hash
table, which is modified, then is quickly evicted (without being deleted).

It wasn't that long ago I was working on a patch to take glock reference
even sooner than we did for f4e2f5e1a527ce58fc9f85145b03704779a3123e.
I titled the patch "grab glock reference as early as possible in transactions
but it was never pushed anywhere because it added a new atomic to the
glock. It may be an alternative solution to the problem. My comments on
that patch were:

   Before this patch, an additional glock reference was taken when
   the bufdata element, bd, was revoked. That's not early enough
   because the caller who created the bd (via trans_add_meta) may
   have already come and gone with the bd still not revoked (but
   in the ail).
   
   This patch takes the glock reference earlier in the process, when
   the first bd element is allocated for a glock. It queues the glock
   reference to be put when the last bd element for the glock is freed.
   
   To this end, a new atomic glock field, gl_bd_count, keeps count.

Regards,

Bob Peterson

