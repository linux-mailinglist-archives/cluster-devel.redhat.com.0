Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 701EF6F332C
	for <lists+cluster-devel@lfdr.de>; Mon,  1 May 2023 17:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682956193;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=1MUFWRQzN2U7B9NovRPIUdnOItgaF2BM1nA/v8zJpK0=;
	b=XiY2d/uAzIUeKaAonq4gtFQqJccWbvXODBhxlTfWLXvAsoy1q8OBTz5nk87J8cihQwnl/R
	oNlSb1txIK8i6PS8kWjPqrg3d0b6b8EXnyXF2SsmMx3T4sPpLlcmgmybB4YEDUPDza+gFL
	I7SFrxF4ZiB5oeJqz5LKIWFmkyWM+FI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-2FBtdRrrN4GRfEEbh1VPAg-1; Mon, 01 May 2023 11:49:37 -0400
X-MC-Unique: 2FBtdRrrN4GRfEEbh1VPAg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EDE6827998;
	Mon,  1 May 2023 15:48:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E5172027043;
	Mon,  1 May 2023 15:48:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CE1EF1946595;
	Mon,  1 May 2023 15:48:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3CF0D1946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  1 May 2023 15:47:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B761540F169; Mon,  1 May 2023 15:47:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0173400F4D
 for <cluster-devel@redhat.com>; Mon,  1 May 2023 15:47:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B59D8678B1
 for <cluster-devel@redhat.com>; Mon,  1 May 2023 15:47:14 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-3-QJKqfmYCOvmzLO2WjGS75g-1; Mon,
 01 May 2023 11:46:43 -0400
X-MC-Unique: QJKqfmYCOvmzLO2WjGS75g-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1ptVj9-007SZI-Oz; Mon, 01 May 2023 15:46:11 +0000
Date: Mon, 1 May 2023 16:46:11 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <ZE/ew1VpU/a1gqQP@casper.infradead.org>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-18-hch@lst.de>
 <ZExgzbBCbdC1y9Wk@bombadil.infradead.org>
 <ZExw0eW52lYj2R1m@casper.infradead.org>
 <ZE8ue9Mx6n2T0yn6@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZE8ue9Mx6n2T0yn6@bombadil.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 17/17] fs: add CONFIG_BUFFER_HEAD
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
Cc: Pankaj Raghav <p.raghav@samsung.com>, Jens Axboe <axboe@kernel.dk>,
 David Howells <dhowells@redhat.com>, cluster-devel@redhat.com,
 linux-xfs@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 "Darrick J. Wong" <djwong@kernel.org>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daniel Gomez <da.gomez@samsung.com>, linux-mm@kvack.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 30, 2023 at 08:14:03PM -0700, Luis Chamberlain wrote:
> On Sat, Apr 29, 2023 at 02:20:17AM +0100, Matthew Wilcox wrote:
> > > [   11.322212] Call Trace:
> > > [   11.323224]  <TASK>
> > > [   11.324146]  iomap_readpage_iter+0x96/0x300
> > > [   11.325694]  iomap_readahead+0x174/0x2d0
> > > [   11.327129]  read_pages+0x69/0x1f0
> > > [   11.329751]  page_cache_ra_unbounded+0x187/0x1d0
> > 
> > ... that shouldn't be possible.  read_pages() allocates pages, puts them
> > in the page cache and tells the filesystem to fill them in.
> > 
> > In your patches, did you call mapping_set_large_folios() anywhere?
> 
> No but the only place to add that would be in the block cache. Adding
> that alone to the block cache doesn't fix the issue. The below patch
> however does get us by.

That's "working around the error", not fixing it ... probably the same
root cause as your other errors; at least I'm not diving into them until
the obvious one is fixed.

> >From my readings it does't seem like readahead_folio() should always
> return non-NULL, and also I couldn't easily verify the math is right.

readahead_folio() always returns non-NULL.  That's guaranteed by how
page_cache_ra_unbounded() and page_cache_ra_order() work.  It allocates
folios, until it can't (already-present folio, ENOMEM, EOF, max batch
size) and then calls the filesystem to make those folios uptodate,
telling it how many folios it put in the page cache, where they start.

Hm.  The fact that it's coming from page_cache_ra_unbounded() makes
me wonder if you updated this line:

                folio = filemap_alloc_folio(gfp_mask, 0);

without updating this line:

                ractl->_nr_pages++;

This is actually number of pages, not number of folios, so needs to be
		ractl->_nr_pages += 1 << order;

various other parts of page_cache_ra_unbounded() need to be examined
carefully for assumptions of order-0; it's never been used for that
before.  all the large folio work has concentrated on
page_cache_ra_order()

