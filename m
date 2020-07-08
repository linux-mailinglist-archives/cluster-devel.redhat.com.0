Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BD8CD218998
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Jul 2020 15:59:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-cpV3gGqFOR2-BE4nbp49Rw-1; Wed, 08 Jul 2020 09:59:30 -0400
X-MC-Unique: cpV3gGqFOR2-BE4nbp49Rw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54956107ACF2;
	Wed,  8 Jul 2020 13:59:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52C2060E1C;
	Wed,  8 Jul 2020 13:59:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D202D1809547;
	Wed,  8 Jul 2020 13:59:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068DtgMP018611 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 09:55:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 29D00110F0B3; Wed,  8 Jul 2020 13:55:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1956C110F0B2
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 13:55:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45E6118E05E6
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 13:55:39 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-401-u_X689byOP6z8qD7YmqFNA-1; Wed, 08 Jul 2020 09:55:37 -0400
X-MC-Unique: u_X689byOP6z8qD7YmqFNA-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jtAX1-0005vm-5p; Wed, 08 Jul 2020 13:54:43 +0000
Date: Wed, 8 Jul 2020 14:54:37 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200708135437.GP25523@casper.infradead.org>
References: <20200629192353.20841-1-rgoldwyn@suse.de>
	<20200629192353.20841-3-rgoldwyn@suse.de>
	<20200701075310.GB29884@lst.de>
	<20200707124346.xnr5gtcysuzehejq@fiona>
	<20200707125705.GK25523@casper.infradead.org>
	<20200707130030.GA13870@lst.de>
	<20200708065127.GM2005@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200708065127.GM2005@dread.disaster.area>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, fdmanana@gmail.com, darrick.wong@oracle.com,
	Goldwyn Rodrigues <rgoldwyn@suse.de>, dsterba@suse.cz,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	linux-btrfs@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 08, 2020 at 04:51:27PM +1000, Dave Chinner wrote:
> On Tue, Jul 07, 2020 at 03:00:30PM +0200, Christoph Hellwig wrote:
> > On Tue, Jul 07, 2020 at 01:57:05PM +0100, Matthew Wilcox wrote:
> > > Indeed, I'm in favour of not invalidating
> > > the page cache at all for direct I/O.  For reads, I think the page cache
> > > should be used to satisfy any portion of the read which is currently
> > > cached.  For writes, I think we should write into the page cache pages
> > > which currently exist, and then force those pages to be written back,
> > > but left in cache.
> > 
> > Something like that, yes.
> 
> So are we really willing to take the performance regression that
> occurs from copying out of the page cache consuming lots more CPU
> than an actual direct IO read? Or that direct IO writes suddenly
> serialise because there are page cache pages and now we have to do
> buffered IO?
> 
> Direct IO should be a deterministic, zero-copy IO path to/from
> storage. Using the CPU to copy data during direct IO is the complete
> opposite of the intended functionality, not to mention the behaviour
> that many applications have been careful designed and tuned for.

Direct I/O isn't deterministic though.  If the file isn't shared, then
it works great, but as soon as you get mixed buffered and direct I/O,
everything is already terrible.  Direct I/Os perform pagecache lookups
already, but instead of using the data that we found in the cache, we
(if it's dirty) write it back, wait for the write to complete, remove
the page from the pagecache and then perform another I/O to get the data
that we just wrote out!  And then the app that's using buffered I/O has
to read it back in again.

Nobody's proposing changing Direct I/O to exclusively work through the
pagecache.  The proposal is to behave less weirdly when there's already
data in the pagecache.

I have had an objection raised off-list.  In a scenario with a block
device shared between two systems and an application which does direct
I/O, everything is normally fine.  If one of the systems uses tar to
back up the contents of the block device then the application on that
system will no longer see the writes from the other system because
there's nothing to invalidate the pagecache on the first system.

Unfortunately, this is in direct conflict with the performance
problem caused by some little arsewipe deciding to do:

$ while true; do dd if=/lib/x86_64-linux-gnu/libc-2.30.so iflag=direct of=/dev/null; done

... doesn't hurt me because my root filesystem is on ext4 which doesn't
purge the cache.  But anything using iomap gets all the pages for libc
kicked out of the cache, and that's a lot of fun.

