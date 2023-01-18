Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 162A767228C
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 17:09:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674058159;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=JEUOAZ78kJr603e3fslTqPJIm0KVjgSmMPI95SNsLdQ=;
	b=PLYb5DyzO2ZDNgGn2j0Nx0lczL9u7QJb8vU2/Znk1SRiA/OWAdWOTmXos4+LyUGnZcLx/l
	02f1v6N5JVG9E77toI88aOfp0oOi8f7WoBcwBmbqrYclnHaPfWhBwt3IJ0Z5IDJ67nQk+w
	woqBsgFth+4NRJ+7maJSpHY/KYEyfDE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-N1eszf7SNb-dW4H1HZn3Rw-1; Wed, 18 Jan 2023 11:09:14 -0500
X-MC-Unique: N1eszf7SNb-dW4H1HZn3Rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B4F48A010C;
	Wed, 18 Jan 2023 16:09:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A81A39D93;
	Wed, 18 Jan 2023 16:09:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0AD561946A6E;
	Wed, 18 Jan 2023 16:09:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 86D1C1946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 16:09:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 74679492C18; Wed, 18 Jan 2023 16:09:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C50C492C14
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 16:09:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51FCC2A5954C
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 16:09:06 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-99-GtqMbas2PsKQBQ-JMv5SIQ-1; Wed,
 18 Jan 2023 11:09:03 -0500
X-MC-Unique: GtqMbas2PsKQBQ-JMv5SIQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pIAzh-0007zm-8H; Wed, 18 Jan 2023 16:08:57 +0000
Date: Wed, 18 Jan 2023 16:08:57 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Y8gZmTFB6vCivxsY@casper.infradead.org>
References: <20230118094329.9553-1-hch@lst.de>
 <20230118094329.9553-9-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230118094329.9553-9-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 8/9] btrfs: handle a NULL folio in
 extent_range_redirty_for_io
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
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, cluster-devel@redhat.com, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 18, 2023 at 10:43:28AM +0100, Christoph Hellwig wrote:
> filemap_get_folio can return NULL, skip those cases.

Hmm, I'm not sure that's true.  We have one place that calls
extent_range_redirty_for_io(), and it previously calls
extent_range_clear_dirty_for_io() which has an explicit

                BUG_ON(!page); /* Pages should be in the extent_io_tree */

so I'm going to say this one can't happen either.  I haven't delved far
enough into btrfs to figure out why it can't happen.

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/btrfs/extent_io.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> index d55e4531ffd212..a54d2cf74ba020 100644
> --- a/fs/btrfs/extent_io.c
> +++ b/fs/btrfs/extent_io.c
> @@ -230,6 +230,8 @@ void extent_range_redirty_for_io(struct inode *inode, u64 start, u64 end)
>  
>  	while (index <= end_index) {
>  		folio = filemap_get_folio(mapping, index);
> +		if (!folio)
> +			continue;
>  		filemap_dirty_folio(mapping, folio);
>  		folio_account_redirty(folio);
>  		index += folio_nr_pages(folio);
> -- 
> 2.39.0
> 

