Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0AA21BA4E
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Jul 2020 18:05:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-tQNUn2X_MrShegU5ujMi5w-1; Fri, 10 Jul 2020 12:04:12 -0400
X-MC-Unique: tQNUn2X_MrShegU5ujMi5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4EB280BCAE;
	Fri, 10 Jul 2020 16:04:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39D4574F67;
	Fri, 10 Jul 2020 16:04:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7182180954D;
	Fri, 10 Jul 2020 16:04:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06AG3oxM017321 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 10 Jul 2020 12:03:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9AAD710E60DD; Fri, 10 Jul 2020 16:03:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FD5B10EE6D8
	for <cluster-devel@redhat.com>; Fri, 10 Jul 2020 16:03:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 999A98007C8
	for <cluster-devel@redhat.com>; Fri, 10 Jul 2020 16:03:44 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-467-YNAcjaedP_qEEVIYyA22tQ-1;
	Fri, 10 Jul 2020 12:03:42 -0400
X-MC-Unique: YNAcjaedP_qEEVIYyA22tQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0D7A368AEF; Fri, 10 Jul 2020 18:03:37 +0200 (CEST)
Date: Fri, 10 Jul 2020 18:03:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200710160337.GA21808@lst.de>
References: <20200707124346.xnr5gtcysuzehejq@fiona>
	<20200707125705.GK25523@casper.infradead.org>
	<20200707130030.GA13870@lst.de>
	<20200708065127.GM2005@dread.disaster.area>
	<20200708135437.GP25523@casper.infradead.org>
	<20200709022527.GQ2005@dread.disaster.area>
	<20200709160926.GO7606@magnolia>
	<20200709170519.GH12769@casper.infradead.org>
	<20200709171038.GE7625@magnolia>
	<20200709225936.GZ2005@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200709225936.GZ2005@dread.disaster.area>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, fdmanana@gmail.com,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	Goldwyn Rodrigues <rgoldwyn@suse.de>, dsterba@suse.cz,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This looks sane - slightly updated version below to not bother with
the ret and a few tidyups.

That being said and to get back to the discussion in this thread:
I think it would be saner to give up on direct I/O in case of the
invalidation failure.  I've cooked up a patch on top of this one
(for which I had a few trivial cleanups).  It is still under testing,
but I'll send the two out in a new thread.

