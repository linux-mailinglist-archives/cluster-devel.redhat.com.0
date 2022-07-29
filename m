Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 923C1584E14
	for <lists+cluster-devel@lfdr.de>; Fri, 29 Jul 2022 11:34:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659087247;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=OHzMII7PmKpSZu+Cs5j/9PDskHpu0BMOk43FfHJdKQk=;
	b=gvHrhER7HbrYoWlzMIEiddhfV6xGNuO3aWoqCWpmTqHUIQ7u+C/qaaUBlwYif+r2vYUkOk
	bSV0niNAqXsXjXcNHzvZnBybIVQZyMPo2W29JoFl4bCWQiTzUTy0JHIxqznuvWlMCtLKsk
	DocZGgRbRNc6B56LVcYTT+66V7Y8GKU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-CeY3PcMQOXajRhMJATMW2g-1; Fri, 29 Jul 2022 05:34:03 -0400
X-MC-Unique: CeY3PcMQOXajRhMJATMW2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78FE2804197;
	Fri, 29 Jul 2022 09:34:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC3051415121;
	Fri, 29 Jul 2022 09:33:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3C27D1932124;
	Fri, 29 Jul 2022 09:33:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B9FC6193211F for <cluster-devel@listman.corp.redhat.com>;
 Fri, 29 Jul 2022 09:27:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 99675400DEF8; Fri, 29 Jul 2022 09:27:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95BF340CF8E8
 for <cluster-devel@redhat.com>; Fri, 29 Jul 2022 09:27:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CEEA10AF7C1
 for <cluster-devel@redhat.com>; Fri, 29 Jul 2022 09:27:58 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-my6ZGXFyNm-SkT8plZ9LFQ-1; Fri, 29 Jul 2022 05:27:54 -0400
X-MC-Unique: my6ZGXFyNm-SkT8plZ9LFQ-1
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0FF2F2023D;
 Fri, 29 Jul 2022 09:22:20 +0000 (UTC)
Received: from suse.de (unknown [10.163.43.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E1FBA2C142;
 Fri, 29 Jul 2022 09:22:17 +0000 (UTC)
Date: Fri, 29 Jul 2022 10:22:16 +0100
From: Mel Gorman <mgorman@suse.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20220729092216.GE3493@suse.de>
References: <20220719041311.709250-1-hch@lst.de>
 <20220728111016.uwbaywprzkzne7ib@quack3>
MIME-Version: 1.0
In-Reply-To: <20220728111016.uwbaywprzkzne7ib@quack3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Fri, 29 Jul 2022 09:33:58 +0000
Subject: Re: [Cluster-devel] remove iomap_writepage v2
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline

On Thu, Jul 28, 2022 at 01:10:16PM +0200, Jan Kara wrote:
> Hi Christoph!
> 
> On Tue 19-07-22 06:13:07, Christoph Hellwig wrote:
> > this series removes iomap_writepage and it's callers, following what xfs
> > has been doing for a long time.
> 
> So this effectively means "no writeback from page reclaim for these
> filesystems" AFAICT (page migration of dirty pages seems to be handled by
> iomap_migrate_page()) which is going to make life somewhat harder for
> memory reclaim when memory pressure is high enough that dirty pages are
> reaching end of the LRU list. I don't expect this to be a problem on big
> machines but it could have some undesirable effects for small ones
> (embedded, small VMs). I agree per-page writeback has been a bad idea for
> efficiency reasons for at least last 10-15 years and most filesystems
> stopped dealing with more complex situations (like block allocation) from
> ->writepage() already quite a few years ago without any bug reports AFAIK.
> So it all seems like a sensible idea from FS POV but are MM people on board
> or at least aware of this movement in the fs land?
> 
> Added a few CC's for that.
> 

There is some context missing because it's not clear what the full impact is
but it is definitly the case that writepage is ignored in some contexts for
common filesystems so lets assume that writepage from reclaim context always
failed as a worst case scenario. Certainly this type of change is something
linux-mm needs to be aware of because we've been blind-sided before.

I don't think it would be incredibly damaging although there *might* be
issues with small systems or cgroups. In many respects, vmscan has been
moving in this direction for a long time e.g. f84f6e2b0868 ("mm: vmscan:
do not writeback filesystem pages in kswapd except in high priority") and
e2be15f6c3ee ("mm: vmscan: stall page reclaim and writeback pages based on
dirty/writepage pages encountered"). This was roughly 10 years ago when
it was clear that FS writeback from reclaim context was fragile (iirc it
was partially due to concerns about stack depth and later concerns that a
filesystem would simply ignore the writeback request). There also is less
reliance on stalling reclaim by queueing and waiting on writeback but we now
should explicitly throttle if no progress is being made e.g. 69392a403f49
("mm/vmscan: throttle reclaim when no progress is being made") and some
follow-up fixes.

There still is a reliance on swap and shmem pages will not ignore writepage
but I assume that is still ok.

One potential caveat is if wakeup_flusher_threads() is ignored because
there is a reliance in reclaim that if all the pages at the tail of the
LRU are dirty pages not queued for writeback then wakeup_flusher_threads()
will do something so pages get marked for immediate reclaim when writeback
completes. Of course there is no guarantee that flusher threads will start
writeback on the old pages and the pages could be backed by a slow BDI
but wakeup_flusher_threads() should not be ignored.

Another caveat is that comments become misleading. Take for example the
comment "Only kswapd can writeback filesystem folios to avoid risk of
stack overflow." The wording should change to note that writepage may
do nothing at all.  There also might need to be some adjustment on when
pages get marked for immediate reclaim when they are dirty but not under
writeback. pageout() might need a tracepoint for "mapping->a_ops->writepage
== NULL" to help debug problems around a failure to queue pages for writback
although that could be done as a test patch for a bug.

There would need to be some changes made if writepage always or often failed
and there might be some premature throttling based on "NOPROGRESS" on small
systems due to dirty-not-writepage pages at the tail of the LRU but I don't
think it would be an immediate disaster, Reclaim throttling is no longer
based on the ability to queue for writeback or "congestion" state of BDIs
and some care is taken to not prematurely stall on NOPROGRESS. However,
if there was a bug related to premature stalls or excessive CPU usage
from direct reclaimers or kswapd that bisected to a change in writepage
then it should be fixed on the vmscan-side to put an emphasis on handling
"reclaim is in trouble when the bulk of reclaimable pages are FS-only,
dirty and not under writeback but ->writepage is a no-op".

-- 
Mel Gorman
SUSE Labs

