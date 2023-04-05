Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B92B6D8119
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 17:09:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680707379;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=79yDnodF22HJGDCnUpnUGggD40n6HiawRbVw81LjdKA=;
	b=hhf6UHNxZtFFrue2T1XYXCGUEFnwOr3zwRj69D6BCSSFY9SqJHhj5qL7FITSx7pKbN8tB6
	q0xZ+++7rK1t+VL2M9xGj0uB2C/c8Vts24EeG2rodgay5U0vL9TeMECvoZlpZdLSZmmajc
	M9dHtFC4O/UNENmAbfIOvAf+KsVEiKU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-x4hsoOZDOkOj4nNJCyy8Ig-1; Wed, 05 Apr 2023 11:09:38 -0400
X-MC-Unique: x4hsoOZDOkOj4nNJCyy8Ig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 862D3857FB4;
	Wed,  5 Apr 2023 15:09:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 752BFC1602B;
	Wed,  5 Apr 2023 15:09:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4407A1946597;
	Wed,  5 Apr 2023 15:09:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 17B961946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 15:09:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CD2B140BC797; Wed,  5 Apr 2023 15:09:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C657C40C6EC4
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 15:09:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A959F85530C
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 15:09:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-_WBR0y2DOXinBoOXZcMhTA-1; Wed, 05 Apr 2023 11:09:30 -0400
X-MC-Unique: _WBR0y2DOXinBoOXZcMhTA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0FA2626EA;
 Wed,  5 Apr 2023 15:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353F3C433EF;
 Wed,  5 Apr 2023 15:09:28 +0000 (UTC)
Date: Wed, 5 Apr 2023 08:09:27 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20230405150927.GD303486@frogsfrogsfrogs>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-20-aalbersh@redhat.com>
 <20230404161047.GA109974@frogsfrogsfrogs>
 <20230405150142.3jmxzo5i27bbc4c4@aalbersh.remote.csb>
MIME-Version: 1.0
In-Reply-To: <20230405150142.3jmxzo5i27bbc4c4@aalbersh.remote.csb>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v2 19/23] xfs: disable direct read path
 for fs-verity sealed files
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
Cc: fsverity@lists.linux.dev, linux-ext4@vger.kernel.org,
 damien.lemoal@opensource.wdc.com, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 05:01:42PM +0200, Andrey Albershteyn wrote:
> On Tue, Apr 04, 2023 at 09:10:47AM -0700, Darrick J. Wong wrote:
> > On Tue, Apr 04, 2023 at 04:53:15PM +0200, Andrey Albershteyn wrote:
> > > The direct path is not supported on verity files. Attempts to use direct
> > > I/O path on such files should fall back to buffered I/O path.
> > > 
> > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > ---
> > >  fs/xfs/xfs_file.c | 14 +++++++++++---
> > >  1 file changed, 11 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> > > index 947b5c436172..9e072e82f6c1 100644
> > > --- a/fs/xfs/xfs_file.c
> > > +++ b/fs/xfs/xfs_file.c
> > > @@ -244,7 +244,8 @@ xfs_file_dax_read(
> > >  	struct kiocb		*iocb,
> > >  	struct iov_iter		*to)
> > >  {
> > > -	struct xfs_inode	*ip = XFS_I(iocb->ki_filp->f_mapping->host);
> > > +	struct inode		*inode = iocb->ki_filp->f_mapping->host;
> > > +	struct xfs_inode	*ip = XFS_I(inode);
> > >  	ssize_t			ret = 0;
> > >  
> > >  	trace_xfs_file_dax_read(iocb, to);
> > > @@ -297,10 +298,17 @@ xfs_file_read_iter(
> > >  
> > >  	if (IS_DAX(inode))
> > >  		ret = xfs_file_dax_read(iocb, to);
> > > -	else if (iocb->ki_flags & IOCB_DIRECT)
> > > +	else if (iocb->ki_flags & IOCB_DIRECT && !fsverity_active(inode))
> > >  		ret = xfs_file_dio_read(iocb, to);
> > > -	else
> > > +	else {
> > > +		/*
> > > +		 * In case fs-verity is enabled, we also fallback to the
> > > +		 * buffered read from the direct read path. Therefore,
> > > +		 * IOCB_DIRECT is set and need to be cleared
> > > +		 */
> > > +		iocb->ki_flags &= ~IOCB_DIRECT;
> > >  		ret = xfs_file_buffered_read(iocb, to);
> > 
> > XFS doesn't usually allow directio fallback to the pagecache. Why
> > would fsverity be any different?
> 
> Didn't know that, this is what happens on ext4 so I did the same.
> Then it probably make sense to just error on DIRECT on verity
> sealed file.

Thinking about this a little more -- I suppose we shouldn't just go
breaking directio reads from a verity file if we can help it.  Is there
a way to ask fsverity to perform its validation against some arbitrary
memory buffer that happens to be fs-block aligned?  In which case we
could support fsblock-aligned directio reads without falling back to the
page cache?

--D

> > 
> > --D
> > 
> > > +	}
> > >  
> > >  	if (ret > 0)
> > >  		XFS_STATS_ADD(mp, xs_read_bytes, ret);
> > > -- 
> > > 2.38.4
> > > 
> > 
> 
> -- 
> - Andrey
> 

