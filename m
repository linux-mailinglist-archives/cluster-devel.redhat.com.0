Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2263A6D678D
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 17:37:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680622636;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RdOI5GFBXvz2+CG+FGj78+ixvujqTitirHZIon4ASxI=;
	b=NYpSwr+i3EvZgQpHwMzcLsaTHYfEQOokzlMfihvq9fM1+GPT/WMdx2vbv6lNaXz2r3z6YS
	qegPkUnBn5V5surGjCPlzwvmQzcpcMozxsra+nq4933+a6wYezlOo/R9aDMYpPSOWHQmVo
	LlqNPVMg9AIjEra5cPR08nlnY5/QCq8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-eAhYOed6NoeyFhES0FyxtA-1; Tue, 04 Apr 2023 11:37:10 -0400
X-MC-Unique: eAhYOed6NoeyFhES0FyxtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67B18857FB2;
	Tue,  4 Apr 2023 15:37:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5ADEA1121314;
	Tue,  4 Apr 2023 15:37:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2DB411946595;
	Tue,  4 Apr 2023 15:37:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DE22D1946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 15:37:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CDA80440D6; Tue,  4 Apr 2023 15:37:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6F14FD6E
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 15:37:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 932703814595
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 15:37:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-4DV4o5rJP2uCmTMk2tCZFw-1; Tue, 04 Apr 2023 11:37:05 -0400
X-MC-Unique: 4DV4o5rJP2uCmTMk2tCZFw-1
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pjiiU-0021sG-0G; Tue, 04 Apr 2023 15:37:02 +0000
Date: Tue, 4 Apr 2023 08:37:02 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <ZCxEHkWayQyGqnxL@infradead.org>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-10-aalbersh@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230404145319.2057051-10-aalbersh@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v2 09/23] iomap: allow filesystem to
 implement read path verification
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, djwong@kernel.org,
 damien.lemoal@opensource.wdc.com, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

>  	if (iomap_block_needs_zeroing(iter, pos)) {
>  		folio_zero_range(folio, poff, plen);
> +		if (iomap->flags & IOMAP_F_READ_VERITY) {

Wju do we need the new flag vs just testing that folio_ops and
folio_ops->verify_folio is non-NULL?

> -		ctx->bio = bio_alloc(iomap->bdev, bio_max_segs(nr_vecs),
> -				     REQ_OP_READ, gfp);
> +		ctx->bio = bio_alloc_bioset(iomap->bdev, bio_max_segs(nr_vecs),
> +				REQ_OP_READ, GFP_NOFS, &iomap_read_ioend_bioset);

All other callers don't really need the larger bioset, so I'd avoid
the unconditional allocation here, but more on that later.

> +		ioend = container_of(ctx->bio, struct iomap_read_ioend,
> +				read_inline_bio);
> +		ioend->io_inode = iter->inode;
> +		if (ctx->ops && ctx->ops->prepare_ioend)
> +			ctx->ops->prepare_ioend(ioend);
> +

So what we're doing in writeback and direct I/O, is to:

 a) have a submit_bio hook
 b) allow the file system to then hook the bi_end_io caller
 c) (only in direct O/O for now) allow the file system to provide
    a bio_set to allocate from

I wonder if that also makes sense and keep all the deferral in the
file system.  We'll need that for the btrfs iomap conversion anyway,
and it seems more flexible.  The ioend processing would then move into
XFS.

> @@ -156,6 +160,11 @@ struct iomap_folio_ops {
>  	 * locked by the iomap code.
>  	 */
>  	bool (*iomap_valid)(struct inode *inode, const struct iomap *iomap);
> +
> +	/*
> +	 * Verify folio when successfully read
> +	 */
> +	bool (*verify_folio)(struct folio *folio, loff_t pos, unsigned int len);

Why isn't this in iomap_readpage_ops?

