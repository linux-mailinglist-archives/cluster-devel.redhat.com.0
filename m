Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E072F218E18
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Jul 2020 19:17:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-l5EdTkl3M_6xgzcOMQzd5g-1; Wed, 08 Jul 2020 13:17:19 -0400
X-MC-Unique: l5EdTkl3M_6xgzcOMQzd5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FA661005510;
	Wed,  8 Jul 2020 17:17:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62A155C1B2;
	Wed,  8 Jul 2020 17:17:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C88A993F7D;
	Wed,  8 Jul 2020 17:17:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068HCTM1014347 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 13:12:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D89431C65E; Wed,  8 Jul 2020 17:12:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D488D111F6
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 17:12:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34BC0185A797
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 17:12:26 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-234-NdEvW8GBO1ijtj-e12YxcQ-1; Wed, 08 Jul 2020 13:12:24 -0400
X-MC-Unique: NdEvW8GBO1ijtj-e12YxcQ-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jtDbt-0007OU-3n; Wed, 08 Jul 2020 17:11:53 +0000
Date: Wed, 8 Jul 2020 18:11:52 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200708171152.GV25523@casper.infradead.org>
References: <20200629192353.20841-1-rgoldwyn@suse.de>
	<20200629192353.20841-3-rgoldwyn@suse.de>
	<20200701075310.GB29884@lst.de>
	<20200707124346.xnr5gtcysuzehejq@fiona>
	<20200707125705.GK25523@casper.infradead.org>
	<20200707130030.GA13870@lst.de>
	<20200708065127.GM2005@dread.disaster.area>
	<20200708135437.GP25523@casper.infradead.org>
	<20200708165412.GA637@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200708165412.GA637@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, fdmanana@gmail.com, darrick.wong@oracle.com,
	Goldwyn Rodrigues <rgoldwyn@suse.de>,
	Dave Chinner <david@fromorbit.com>, dsterba@suse.cz,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] always fall back to buffered I/O after
 invalidation failures,
 was: Re: [PATCH 2/6] iomap: IOMAP_DIO_RWF_NO_STALE_PAGECACHE return if page
 invalidation fails
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 08, 2020 at 06:54:12PM +0200, Christoph Hellwig wrote:
> On Wed, Jul 08, 2020 at 02:54:37PM +0100, Matthew Wilcox wrote:
> > Direct I/O isn't deterministic though.  If the file isn't shared, then
> > it works great, but as soon as you get mixed buffered and direct I/O,
> > everything is already terrible.  Direct I/Os perform pagecache lookups
> > already, but instead of using the data that we found in the cache, we
> > (if it's dirty) write it back, wait for the write to complete, remove
> > the page from the pagecache and then perform another I/O to get the data
> > that we just wrote out!  And then the app that's using buffered I/O has
> > to read it back in again.
> 
> Mostly agreed.  That being said I suspect invalidating clean cache
> might still be a good idea.  The original idea was mostly on how
> to deal with invalidation failures of any kind, but falling back for
> any kind of dirty cache also makes at least some sense.

That's certainly the btrfs problem that needs to be solved, but I think
it's all part of the directio misdesign.

> > I have had an objection raised off-list.  In a scenario with a block
> > device shared between two systems and an application which does direct
> > I/O, everything is normally fine.  If one of the systems uses tar to
> > back up the contents of the block device then the application on that
> > system will no longer see the writes from the other system because
> > there's nothing to invalidate the pagecache on the first system.
> 
> Err, WTF?  If someone access shared block devices with random
> applications all bets are off anyway.

That doesn't mean that customers don't do it.  It is, of course, not
recommended, but we suspect people do it anyway.  Because it does
work, unfortunately.  I'd be open to making this exact situation
deterministically not work (eg disallowing mixing O_DIRECT and
non-O_DIRECT openers of block devices), but making it suddenly
non-deterministically give you old data is a non-starter.

> > Unfortunately, this is in direct conflict with the performance
> > problem caused by some little arsewipe deciding to do:
> > 
> > $ while true; do dd if=/lib/x86_64-linux-gnu/libc-2.30.so iflag=direct of=/dev/null; done
> > 
> > ... doesn't hurt me because my root filesystem is on ext4 which doesn't
> > purge the cache.  But anything using iomap gets all the pages for libc
> > kicked out of the cache, and that's a lot of fun.
> 
> ext4 uses iomap..

I happen to be running an older kernel that doesn't on this laptop ;-)

