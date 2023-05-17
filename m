Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F15C8706D15
	for <lists+cluster-devel@lfdr.de>; Wed, 17 May 2023 17:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684338222;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=/bea/Ao0tXydEBqoD4zpuJMruUISQrNg+0RkuvIvujw=;
	b=VIm6fhYYu8nqoxUtEh5Tkfo4GjWNHAIX3qvh5NDevxdOfvJRBWAWeu+74jXUEa0rH26KC0
	qn93/6ran4pPYBkI/JOAKk97kv1kglMH4fluS2VUzAPhvYHczr4rjeCIxLYWbSeoLuD1/I
	d96/8ymhy8Tp8KuaTLzYHeA6El2Dc9g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-K85wZTqROKmDWQBTXX0GBg-1; Wed, 17 May 2023 11:43:39 -0400
X-MC-Unique: K85wZTqROKmDWQBTXX0GBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D8003C0C8A7;
	Wed, 17 May 2023 15:43:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 868BC14171C1;
	Wed, 17 May 2023 15:43:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2D9DC19465B2;
	Wed, 17 May 2023 15:43:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6947119465B1 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 17 May 2023 15:43:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C9269492C3F; Wed, 17 May 2023 15:43:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1B20483EC2
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 15:43:28 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABAC11991C40
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 15:43:28 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-68-E1To9Ap1PIOFgXD2UPu6Ag-1; Wed,
 17 May 2023 11:43:26 -0400
X-MC-Unique: E1To9Ap1PIOFgXD2UPu6Ag-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pzJJ6-005C5r-QP; Wed, 17 May 2023 15:43:16 +0000
Date: Wed, 17 May 2023 16:43:16 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Pankaj Raghav <p.raghav@samsung.com>
Message-ID: <ZGT2FDNTp2Q+WfRA@casper.infradead.org>
References: <20230517032442.1135379-1-willy@infradead.org>
 <20230517032442.1135379-5-willy@infradead.org>
 <CGME20230517144703eucas1p1550db888e29fc5b182c202f24adddb87@eucas1p1.samsung.com>
 <20230517144701.4dnd5pzvzudccc56@localhost>
MIME-Version: 1.0
In-Reply-To: <20230517144701.4dnd5pzvzudccc56@localhost>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 4/6] buffer: Convert
 __block_write_full_page() to __block_write_full_folio()
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
Cc: Hannes Reinecke <hare@suse.com>, cluster-devel@redhat.com,
 Luis Chamberlain <mcgrof@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 17, 2023 at 04:47:01PM +0200, Pankaj Raghav wrote:
> > @@ -1793,7 +1793,7 @@ int __block_write_full_page(struct inode *inode, struct page *page,
> >  	blocksize = bh->b_size;
> >  	bbits = block_size_bits(blocksize);
> >  
> > -	block = (sector_t)page->index << (PAGE_SHIFT - bbits);
> > +	block = (sector_t)folio->index << (PAGE_SHIFT - bbits);
> 
> Shouldn't the PAGE_SHIFT be folio_shift(folio) as you allow larger
> folios to be passed to this function in the later patches?

No, the folio->index is expressed in multiples of PAGE_SIZE.

> >  	last_block = (i_size_read(inode) - 1) >> bbits;
> >  


