Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 93701216E0D
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Jul 2020 15:50:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-67SKs8nSO5-y24pT5DuEkw-1; Tue, 07 Jul 2020 09:50:12 -0400
X-MC-Unique: 67SKs8nSO5-y24pT5DuEkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87B0219253CB;
	Tue,  7 Jul 2020 13:50:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FE835C1D0;
	Tue,  7 Jul 2020 13:50:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 304BC72F48;
	Tue,  7 Jul 2020 13:50:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 067Do5Qg022079 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 09:50:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D706C63536; Tue,  7 Jul 2020 13:50:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B61907D294
	for <cluster-devel@redhat.com>; Tue,  7 Jul 2020 13:50:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C33A41049BE0
	for <cluster-devel@redhat.com>; Tue,  7 Jul 2020 13:49:58 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-512-LQZzpSYbNqSHluIn0Ncbrg-1;
	Tue, 07 Jul 2020 09:49:56 -0400
X-MC-Unique: LQZzpSYbNqSHluIn0Ncbrg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 66786AC23;
	Tue,  7 Jul 2020 13:49:55 +0000 (UTC)
Date: Tue, 7 Jul 2020 08:49:52 -0500
From: Goldwyn Rodrigues <rgoldwyn@suse.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200707134952.3niqhxngwh3gus54@fiona>
References: <20200629192353.20841-1-rgoldwyn@suse.de>
	<20200629192353.20841-3-rgoldwyn@suse.de>
	<20200701075310.GB29884@lst.de>
	<20200707124346.xnr5gtcysuzehejq@fiona>
	<20200707125705.GK25523@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200707125705.GK25523@casper.infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, fdmanana@gmail.com, darrick.wong@oracle.com,
	david@fromorbit.com, dsterba@suse.cz, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
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

On 13:57 07/07, Matthew Wilcox wrote:
> On Tue, Jul 07, 2020 at 07:43:46AM -0500, Goldwyn Rodrigues wrote:
> > On  9:53 01/07, Christoph Hellwig wrote:
> > > On Mon, Jun 29, 2020 at 02:23:49PM -0500, Goldwyn Rodrigues wrote:
> > > > From: Goldwyn Rodrigues <rgoldwyn@suse.com>
> > > > 
> > > > For direct I/O, add the flag IOMAP_DIO_RWF_NO_STALE_PAGECACHE to indicate
> > > > that if the page invalidation fails, return back control to the
> > > > filesystem so it may fallback to buffered mode.
> > > > 
> > > > Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
> > > > Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> > > 
> > > I'd like to start a discussion of this shouldn't really be the
> > > default behavior.  If we have page cache that can't be invalidated it
> > > actually makes a whole lot of sense to not do direct I/O, avoid the
> > > warnings, etc.
> > > 
> > > Adding all the relevant lists.
> > 
> > Since no one responded so far, let me see if I can stir the cauldron :)
> > 
> > What error should be returned in case of such an error? I think the
> 
> Christoph's message is ambiguous.  I don't know if he means "fail the
> I/O with an error" or "satisfy the I/O through the page cache".  I'm
> strongly in favour of the latter.  Indeed, I'm in favour of not invalidating
> the page cache at all for direct I/O.  For reads, I think the page cache
> should be used to satisfy any portion of the read which is currently

That indeed would make reads faster. How about if the pages are dirty
during DIO reads?
Should a direct I/O read be responsible for making sure that the dirty
pages are written back. Technically direct I/O reads is that we are
reading from the device.

> cached.  For writes, I think we should write into the page cache pages
> which currently exist, and then force those pages to be written back,
> but left in cache.

Yes, that makes sense.
If this is implemented, what would be the difference between O_DIRECT
and O_DSYNC, if any?

-- 
Goldwyn

