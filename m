Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D892F368157
	for <lists+cluster-devel@lfdr.de>; Thu, 22 Apr 2021 15:19:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-sI6EPSr5PRmwMySxDIpEaA-1; Thu, 22 Apr 2021 09:19:03 -0400
X-MC-Unique: sI6EPSr5PRmwMySxDIpEaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 424E8102C816;
	Thu, 22 Apr 2021 13:18:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 313345C1B4;
	Thu, 22 Apr 2021 13:18:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD58744A58;
	Thu, 22 Apr 2021 13:18:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13MDEQLc025360 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 22 Apr 2021 09:14:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA29B21AF10C; Thu, 22 Apr 2021 13:14:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C35BD21C0DC3
	for <cluster-devel@redhat.com>; Thu, 22 Apr 2021 13:14:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17751104F0A0
	for <cluster-devel@redhat.com>; Thu, 22 Apr 2021 13:14:24 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-473-8vLvJHosMh6Pg0yExgFg6Q-1;
	Thu, 22 Apr 2021 09:14:21 -0400
X-MC-Unique: 8vLvJHosMh6Pg0yExgFg6Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6AFFBAF52;
	Thu, 22 Apr 2021 13:14:19 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 24ACC1E37A2; Thu, 22 Apr 2021 15:14:19 +0200 (CEST)
Date: Thu, 22 Apr 2021 15:14:19 +0200
From: Jan Kara <jack@suse.cz>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20210422131419.GI26221@quack2.suse.cz>
References: <20210422112612.GF26221@quack2.suse.cz>
	<CAHc6FU7kFWtQDAAU16h3xkWkSV2dm9WWb-RbjXBusJ9+118GRw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU7kFWtQDAAU16h3xkWkSV2dm9WWb-RbjXBusJ9+118GRw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>
Subject: Re: [Cluster-devel] Hole punch races in GFS2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu 22-04-21 14:51:42, Andreas Gruenbacher wrote:
> Hi Jan,
> 
> On Thu, Apr 22, 2021 at 1:26 PM Jan Kara <jack@suse.cz> wrote:
> > I am looking into how GFS2 protects against races between hole punching and
> > things like page fault or readahead and AFAICT it seems it does not. In
> > particular is there anything that protects against a race like:
> >
> > CPU1                                    CPU2
> > gfs2_fallocate()
> >   __gfs2_punch_hole()
> >     truncate_pagecache_range()
> >                                         gfs2_fault()
> >                                           - faults in old data into page
> >                                             cache
> >     punch_hole()
> >
> > And now we have stale data in the page cache (data corruption). If
> > gfs2_page_mkwrite() sneaked in that window as well, we might be even racing
> > with writeback and are possibly corrupting the filesystem on disk. Is there
> > anything I'm missing?
> 
> This is controlled by the inode glock (ip->i_gl). Readers are holding
> a shared lock while writers are holding an exclusive lock, similar to
> an rwlock. Those locks take effect cluster wide (via DLM locks) and
> down to individual tasks locally. The only exception are resource
> group glocks, which use the LM_FLAG_NODE_SCOPE flag to indicate that
> exclusive locks should be shared locally. In that case, rgd->rd_mutex
> provides the exclusion among local tasks.

OK, thanks for explanation! I missed that GFS2 glocks are task local. But
then I have another question. We have the following:

gfs2_file_read_iter()
  grabs inode glock in shared mode
  generic_file_read_iter()
    filemap_read()
      copy_page_to_iter()
        <page fault>
        grabs mmap_sem
          gfs2_fault()
            - tries to grab inode glock again -> possible recursive locking

And even if the locking isn't recursive, you have glock->mmap_sem and
mmap_sem->glock lock orderings so ABBA deadlocks are possible AFAICT.

And there's a similar problem with the write path as well, just the lock is
grabbed exclusively.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

