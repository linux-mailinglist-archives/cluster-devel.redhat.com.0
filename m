Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8C5655206
	for <lists+cluster-devel@lfdr.de>; Fri, 23 Dec 2022 16:28:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671809299;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=T0IzOuznf6jL2kGG15kuuaoVimSHPTfo71bEOOPjJZA=;
	b=hjKRAC9mlqOBf3GnzMWO4NKUVjLLfEhsQB2Khke645trQtpoIBpFiMhC7orbWPT44Ma7Yg
	lVVBcqufy74QlnYFaMvoBtjcEanlAh0TJV7Z3/GFWsXuBi4j8HrtLn1zmr8FeLY0RgTViA
	XSFhkdwHuFHBPtsD6xXa8EqJvjj1LnQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-k_2mama8PPWv1AhsT6fMhQ-1; Fri, 23 Dec 2022 10:28:14 -0500
X-MC-Unique: k_2mama8PPWv1AhsT6fMhQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16AEB101A521;
	Fri, 23 Dec 2022 15:28:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E04E2166B33;
	Fri, 23 Dec 2022 15:28:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 57DE419465B6;
	Fri, 23 Dec 2022 15:28:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8B99019465B1 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 23 Dec 2022 15:28:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 47C71111F3BB; Fri, 23 Dec 2022 15:28:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40A70111F3B0
 for <cluster-devel@redhat.com>; Fri, 23 Dec 2022 15:28:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21F9385A588
 for <cluster-devel@redhat.com>; Fri, 23 Dec 2022 15:28:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-386-O4crZcnEMTWcm81xE6_9XA-1; Fri, 23 Dec 2022 10:28:07 -0500
X-MC-Unique: O4crZcnEMTWcm81xE6_9XA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p8jT1-0096pR-35; Fri, 23 Dec 2022 14:56:11 +0000
Date: Fri, 23 Dec 2022 06:56:11 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <Y6XBi/YJ4QV3NK5q@infradead.org>
References: <20221216150626.670312-1-agruenba@redhat.com>
 <20221216150626.670312-2-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221216150626.670312-2-agruenba@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [RFC v3 1/7] fs: Add folio_may_straddle_isize
 helper
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
 "Darrick J . Wong" <djwong@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 16, 2022 at 04:06:20PM +0100, Andreas Gruenbacher wrote:
> Add a folio_may_straddle_isize() helper as a replacement for
> pagecache_isize_extended() when we have a locked folio.

I find the naming very confusing.  Any good reason to not follow
the naming of pagecache_isize_extended an call it
folio_isize_extended?

> Use the new helper in generic_write_end(), iomap_write_end(),
> ext4_write_end(), and ext4_journalled_write_end().

Please split this into a patch per caller in addition to the one
adding the helper, and write commit logs explaining the rationale
for the helper.  The obious ones I'm trying to guess are that
the new helper avoid a page cache radix tree lookup and a lock
page/folio cycle, but I'd rather hear that from the horses mouth
in the commit log.

> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -2164,16 +2164,15 @@ int generic_write_end(struct file *file, struct address_space *mapping,
>  	 * But it's important to update i_size while still holding page lock:
>  	 * page writeout could otherwise come in and zero beyond i_size.
>  	 */
> -	if (pos + copied > inode->i_size) {
> +	if (pos + copied > old_size) {

This is and unrelated and undocument (but useful) change.  Please split
it out as well.

> + * This function must be called while we still hold i_rwsem - this not only
> + * makes sure i_size is stable but also that userspace cannot observe the new
> + * i_size value before we are prepared to handle mmap writes there.

Please add a lockdep_assert_held_write to enforce that.

> +void folio_may_straddle_isize(struct inode *inode, struct folio *folio,
> +			      loff_t old_size, loff_t start)
> +{
> +	unsigned int blocksize = i_blocksize(inode);
> +
> +	if (round_up(old_size, blocksize) >= round_down(start, blocksize))
> +		return;
> +
> +	/*
> +	 * See clear_page_dirty_for_io() for details why folio_set_dirty()
> +	 * is needed.
> +	 */
> +	if (folio_mkclean(folio))
> +		folio_set_dirty(folio);

Should pagecache_isize_extended be rewritten to use this helper,
i.e. turn this into a factoring out of a helper?

> +EXPORT_SYMBOL(folio_may_straddle_isize);

Please make this an EXPORT_SYMBOL_GPL just like folio_mkclean.

