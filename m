Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E340B78C4CB
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 15:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693314361;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RchKoATVAdQvPJfSjQ7igQ4w+5FVPwMefhSLf5vYpSI=;
	b=aJ9CE9RL/olPhTkqcs+sR1U6npH5SewbxdM6rEWwEsCwpVMmwZvyM22uE23M0kr0Tmh5R9
	EtpbCVYVghM6bktkmqedPtQWRPFNkhlKdoD4ZBFOCUJH5pdhwJLpf1pCheM8/J9yvx9469
	YhEdV79QxmDXjsPAXBE8fG/fwnfkeYg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-aczYwtDCNUafCblFRYUtbg-1; Tue, 29 Aug 2023 09:05:55 -0400
X-MC-Unique: aczYwtDCNUafCblFRYUtbg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DBB38D40A4;
	Tue, 29 Aug 2023 13:05:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 736682166B25;
	Tue, 29 Aug 2023 13:05:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 17E8119465BA;
	Tue, 29 Aug 2023 13:05:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 48E3D19465B3 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 29 Aug 2023 13:05:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 076282026D4B; Tue, 29 Aug 2023 13:05:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 001422026D68
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 13:05:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D72CB3C11A0F
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 13:05:45 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-513--AECKk0zNXKHuYM6quKxSQ-1; Tue,
 29 Aug 2023 09:05:43 -0400
X-MC-Unique: -AECKk0zNXKHuYM6quKxSQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qayP8-006i8Z-JC; Tue, 29 Aug 2023 13:05:10 +0000
Date: Tue, 29 Aug 2023 14:05:10 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZO3tBqJLtRwSYrEr@casper.infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-3-hao.xu@linux.dev>
 <ZOu1xYS6LRmPgEiV@casper.infradead.org>
 <ca10040f-b7fa-7c43-1c89-6706d13b2747@linux.dev>
MIME-Version: 1.0
In-Reply-To: <ca10040f-b7fa-7c43-1c89-6706d13b2747@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH 02/11] xfs: add NOWAIT semantics for
 readdir
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 29, 2023 at 03:41:43PM +0800, Hao Xu wrote:
> On 8/28/23 04:44, Matthew Wilcox wrote:
> > > @@ -391,10 +401,17 @@ xfs_dir2_leaf_getdents(
> > >   				bp = NULL;
> > >   			}
> > > -			if (*lock_mode == 0)
> > > -				*lock_mode = xfs_ilock_data_map_shared(dp);
> > > +			if (*lock_mode == 0) {
> > > +				*lock_mode =
> > > +					xfs_ilock_data_map_shared_generic(dp,
> > > +					ctx->flags & DIR_CONTEXT_F_NOWAIT);
> > > +				if (!*lock_mode) {
> > > +					error = -EAGAIN;
> > > +					break;
> > > +				}
> > > +			}
> > 
> > 'generic' doesn't seem like a great suffix to mean 'takes nowait flag'.
> > And this is far too far indented.
> > 
> > 			xfs_dir2_lock(dp, ctx, lock_mode);
> > 
> > with:
> > 
> > STATIC void xfs_dir2_lock(struct xfs_inode *dp, struct dir_context *ctx,
> > 		unsigned int lock_mode)
> > {
> > 	if (*lock_mode)
> > 		return;
> > 	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
> > 		return xfs_ilock_data_map_shared_nowait(dp);
> > 	return xfs_ilock_data_map_shared(dp);
> > }
> > 
> > ... which I think you can use elsewhere in this patch (reformat it to
> > XFS coding style, of course).  And then you don't need
> > xfs_ilock_data_map_shared_generic().
> 
> How about rename xfs_ilock_data_map_shared() to xfs_ilock_data_map_block()
> and rename xfs_ilock_data_map_shared_generic() to
> xfs_ilock_data_map_shared()?
> 
> STATIC void xfs_ilock_data_map_shared(struct xfs_inode *dp, struct
> dir_context *ctx, unsigned int lock_mode)
> {
>  	if (*lock_mode)
>  		return;
>  	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
>  		return xfs_ilock_data_map_shared_nowait(dp);
>  	return xfs_ilock_data_map_shared_block(dp);
> }

xfs_ilock_data_map_shared() is used for a lot of things which are not
directories.  I think a new function name is appropriate, and that
function name should include the word 'dir' in it somewhere.

