Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 148703BE9C2
	for <lists+cluster-devel@lfdr.de>; Wed,  7 Jul 2021 16:29:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-SuJJqulBPjGj1A_gJQs7dg-1; Wed, 07 Jul 2021 10:29:27 -0400
X-MC-Unique: SuJJqulBPjGj1A_gJQs7dg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AF23100C661;
	Wed,  7 Jul 2021 14:29:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 492F3101E24F;
	Wed,  7 Jul 2021 14:29:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA7BD4EA2A;
	Wed,  7 Jul 2021 14:29:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 167ETLIk028159 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 7 Jul 2021 10:29:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24945DAF06; Wed,  7 Jul 2021 14:29:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EE8DDAF13
	for <cluster-devel@redhat.com>; Wed,  7 Jul 2021 14:29:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C29580018D
	for <cluster-devel@redhat.com>; Wed,  7 Jul 2021 14:29:17 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-274-3oCjlncEOVSnJbWNOiYucg-1; Wed, 07 Jul 2021 10:29:15 -0400
X-MC-Unique: 3oCjlncEOVSnJbWNOiYucg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1m18Xf-00CTqL-G4; Wed, 07 Jul 2021 14:28:50 +0000
Date: Wed, 7 Jul 2021 15:28:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YOW6Hz0/FgQkQDgm@casper.infradead.org>
References: <20210707115524.2242151-1-agruenba@redhat.com>
	<20210707115524.2242151-3-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707115524.2242151-3-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: "Darrick J . Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org, cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH v3 2/3] iomap: Don't create iomap_page
 objects for inline files
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 07, 2021 at 01:55:23PM +0200, Andreas Gruenbacher wrote:
> @@ -252,6 +253,7 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
>  	}
>  
>  	/* zero post-eof blocks as the page may be mapped */
> +	iop = iomap_page_create(inode, page);
>  	iomap_adjust_read_range(inode, iop, &pos, length, &poff, &plen);
>  	if (plen == 0)
>  		goto done;

I /think/ a subsequent patch would look like this:

+	/* No need to create an iop if the page is within an extent */
+	loff_t page_pos = page_offset(page);
+	if (pos > page_pos || pos + length < page_pos + page_size(page))
+		iop = iomap_page_create(inode, page);

but that might miss some other reasons to create an iop.

