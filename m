Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 885CD229076
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Jul 2020 08:26:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-WJEi68EwOvC-sKqN5odOAw-1; Wed, 22 Jul 2020 02:26:20 -0400
X-MC-Unique: WJEi68EwOvC-sKqN5odOAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4325657;
	Wed, 22 Jul 2020 06:26:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 441F16FECD;
	Wed, 22 Jul 2020 06:26:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2954730D3;
	Wed, 22 Jul 2020 06:26:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06M6IwuM008232 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 02:18:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCF0D2026D67; Wed, 22 Jul 2020 06:18:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8AA42018284
	for <cluster-devel@redhat.com>; Wed, 22 Jul 2020 06:18:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6F648007C9
	for <cluster-devel@redhat.com>; Wed, 22 Jul 2020 06:18:56 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-417-hK8cCn_SNJSmimT4Azje6w-1;
	Wed, 22 Jul 2020 02:18:54 -0400
X-MC-Unique: hK8cCn_SNJSmimT4Azje6w-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id E8C1068AFE; Wed, 22 Jul 2020 08:18:50 +0200 (CEST)
Date: Wed, 22 Jul 2020 08:18:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200722061850.GA24799@lst.de>
References: <20200721183157.202276-1-hch@lst.de>
	<20200721183157.202276-4-hch@lst.de>
	<20200721203749.GF3151642@magnolia>
MIME-Version: 1.0
In-Reply-To: <20200721203749.GF3151642@magnolia>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Goldwyn Rodrigues <rgoldwyn@suse.de>,
	Dave Chinner <david@fromorbit.com>,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	Goldwyn Rodrigues <rgoldwyn@suse.com>, linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 3/3] iomap: fall back to buffered writes
 for invalidation failures
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2020 at 01:37:49PM -0700, Darrick J. Wong wrote:
> On Tue, Jul 21, 2020 at 08:31:57PM +0200, Christoph Hellwig wrote:
> > Failing to invalid the page cache means data in incoherent, which is
> > a very bad state for the system.  Always fall back to buffered I/O
> > through the page cache if we can't invalidate mappings.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Acked-by: Dave Chinner <dchinner@redhat.com>
> > Reviewed-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> 
> For the iomap and xfs parts,
> Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
> 
> But I'd still like acks from Ted, Andreas, and Damien for ext4, gfs2,
> and zonefs, respectively.
> 
> (Particularly if anyone was harboring ideas about trying to get this in
> before 5.10, though I've not yet heard anyone say that explicitly...)

Why would we want to wait another whole merge window?

