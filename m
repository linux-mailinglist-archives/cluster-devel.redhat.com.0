Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7778D229862
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Jul 2020 14:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595421744;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vCtk9GnBiOAqU3k+W1SQe7KIu+zVdj7N1c33spXO6As=;
	b=agnTGCP09M48vg1OqztKrc6NeaffIdgWEzbiYtJd8+Jcvpg9ueLSiwpO+SoqJc8Z9MscuI
	cpQfK9P81jpiqrCHuADZWm5rR5ckybprp2BUSmDKTGlJv+/axLuULsCn5ndUky+VvU1z0f
	Y2qDpB46KbGbyFgKp78lTjO2V6B4LR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-lM_Qy76iMSSAqgT2HHNTKA-1; Wed, 22 Jul 2020 08:42:22 -0400
X-MC-Unique: lM_Qy76iMSSAqgT2HHNTKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E4908AA0AF;
	Wed, 22 Jul 2020 12:42:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DB946115F;
	Wed, 22 Jul 2020 12:42:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E36831809557;
	Wed, 22 Jul 2020 12:41:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06MCK2EW021385 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 08:20:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7BFEA100EBB8; Wed, 22 Jul 2020 12:20:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74DA510027A5
	for <cluster-devel@redhat.com>; Wed, 22 Jul 2020 12:19:59 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D27E730D3;
	Wed, 22 Jul 2020 12:19:59 +0000 (UTC)
Date: Wed, 22 Jul 2020 08:19:58 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <595939815.7378944.1595420398243.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200721203749.GF3151642@magnolia>
References: <20200721183157.202276-1-hch@lst.de>
	<20200721183157.202276-4-hch@lst.de>
	<20200721203749.GF3151642@magnolia>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.145, 10.4.195.20]
Thread-Topic: iomap: fall back to buffered writes for invalidation failures
Thread-Index: PLuOF8kQrR0wpZuOBcUe+YqC5MOZSw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, cluster-devel@redhat.com,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>, Goldwyn Rodrigues <rgoldwyn@suse.de>,
	Dave Chinner <david@fromorbit.com>,
	Matthew Wilcox <willy@infradead.org>, linux-xfs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Goldwyn Rodrigues <rgoldwyn@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
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
> 
> --D
> 
> > ---
> >  fs/ext4/file.c       |  2 ++
> >  fs/gfs2/file.c       |  3 ++-
> >  fs/iomap/direct-io.c | 16 +++++++++++-----
> >  fs/iomap/trace.h     |  1 +
> >  fs/xfs/xfs_file.c    |  4 ++--
> >  fs/zonefs/super.c    |  7 +++++--
> >  6 files changed, 23 insertions(+), 10 deletions(-)

Hi,

I think Andreas is on holiday this week, but the gfs2 portion looks good to me:

For the gfs2 portion:
Acked-by: Bob Peterson <rpeterso@redhat.com>

Regards,

Bob Peterson

