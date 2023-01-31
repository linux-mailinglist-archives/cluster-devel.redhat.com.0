Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1346836BC
	for <lists+cluster-devel@lfdr.de>; Tue, 31 Jan 2023 20:42:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675194167;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=1u+SZDMkJ1vFn+QDbFq5kiRMcjf/G7pulRBSuzHb0xQ=;
	b=P8/XQ3uX9AxnmW1jhqkblGygYMq04PiSmWf+3EUs+3vBLafldRiC/4D5B26d5RmIAuXA3W
	dGmkz6pauvgTUwMgHMHM4jEEWizx4Ay4RPa0Pi6osjP+PvJgBVSpTzCnDUNgEkBVYDtUQ7
	qGppCvmq5vy4G/vsm64753BolbhFoao=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-YHey1YHQPgmL0O_9G0zhtg-1; Tue, 31 Jan 2023 14:42:43 -0500
X-MC-Unique: YHey1YHQPgmL0O_9G0zhtg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCEC6385F380;
	Tue, 31 Jan 2023 19:42:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF6A4C15BAD;
	Tue, 31 Jan 2023 19:42:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 961951946594;
	Tue, 31 Jan 2023 19:42:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 88A531946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 31 Jan 2023 19:37:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 49905492B06; Tue, 31 Jan 2023 19:37:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42866492B05
 for <cluster-devel@redhat.com>; Tue, 31 Jan 2023 19:37:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 242FE29AA3A5
 for <cluster-devel@redhat.com>; Tue, 31 Jan 2023 19:37:42 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-588-qXU3-EeyMOaTNJtQKgsCsQ-1; Tue,
 31 Jan 2023 14:37:38 -0500
X-MC-Unique: qXU3-EeyMOaTNJtQKgsCsQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pMwRj-00Bboe-Ck; Tue, 31 Jan 2023 19:37:35 +0000
Date: Tue, 31 Jan 2023 19:37:35 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <Y9lt/95kN6kwp+A1@casper.infradead.org>
References: <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-6-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230108194034.1444764-6-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [RFC v6 05/10] iomap/gfs2: Get page in
 page_prepare handler
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
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 08, 2023 at 08:40:29PM +0100, Andreas Gruenbacher wrote:
> +static struct folio *
> +gfs2_iomap_page_prepare(struct iomap_iter *iter, loff_t pos, unsigned len)
>  {
> +	struct inode *inode = iter->inode;
>  	unsigned int blockmask = i_blocksize(inode) - 1;
>  	struct gfs2_sbd *sdp = GFS2_SB(inode);
>  	unsigned int blocks;
> +	struct folio *folio;
> +	int status;
>  
>  	blocks = ((pos & blockmask) + len + blockmask) >> inode->i_blkbits;
> -	return gfs2_trans_begin(sdp, RES_DINODE + blocks, 0);
> +	status = gfs2_trans_begin(sdp, RES_DINODE + blocks, 0);
> +	if (status)
> +		return ERR_PTR(status);
> +
> +	folio = iomap_get_folio(iter, pos);
> +	if (IS_ERR(folio))
> +		gfs2_trans_end(sdp);
> +	return folio;
>  }

Hi Andreas,

I didn't think to mention this at the time, but I was reading through
buffered-io.c and this jumped out at me.  For filesystems which support
folios, we pass the entire length of the write (or at least the length
of the remaining iomap length).  That's intended to allow us to decide
how large a folio to allocate at some point in the future.

For GFS2, we do this:

        if (!mapping_large_folio_support(iter->inode->i_mapping))
                len = min_t(size_t, len, PAGE_SIZE - offset_in_page(pos));

I'd like to drop that and pass the full length of the write to
->get_folio().  It looks like you'll have to clamp it yourself at this
point.  I am kind of curious why you do one transaction per page --
I would have thought you'd rather do one transaction for the entire write.

