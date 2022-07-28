Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 531925840E9
	for <lists+cluster-devel@lfdr.de>; Thu, 28 Jul 2022 16:18:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659017903;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6yJFmCjq7j3EiYzdT5riiMxTlawWcPIvBh3hMXTowos=;
	b=ch1YqdARPydR+89fTOThP0pzyXv7iRqiYrnOl9tLacGJEOOfOq3A9q142kLfeSoKA/ahqv
	g+CYOtvG894RygsxQMI5fJlINVgEiLUuBJ3i/VV4ir4EP2JGOQwwUhDB5WCDmfx/855hss
	KUyCK3au3kQNLw2ocVZmkdVG8vaSFpc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-UTl5IqcnMu206CErjeKdgA-1; Thu, 28 Jul 2022 10:18:20 -0400
X-MC-Unique: UTl5IqcnMu206CErjeKdgA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8A21101A54E;
	Thu, 28 Jul 2022 14:18:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFF8A40CFD0A;
	Thu, 28 Jul 2022 14:18:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6F4551945DAC;
	Thu, 28 Jul 2022 14:18:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F1A291945D85 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 28 Jul 2022 14:18:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CFFAC1410F3C; Thu, 28 Jul 2022 14:18:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC3C7140EBE3
 for <cluster-devel@redhat.com>; Thu, 28 Jul 2022 14:18:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2FA2806017
 for <cluster-devel@redhat.com>; Thu, 28 Jul 2022 14:18:12 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-3DrerDc2MAKG8JQEfK_hBQ-1; Thu, 28 Jul 2022 10:18:10 -0400
X-MC-Unique: 3DrerDc2MAKG8JQEfK_hBQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oH4Kx-003toI-8v; Thu, 28 Jul 2022 14:18:03 +0000
Date: Thu, 28 Jul 2022 15:18:03 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <YuKam52dkTGycay2@casper.infradead.org>
References: <20220719041311.709250-1-hch@lst.de>
 <20220728111016.uwbaywprzkzne7ib@quack3>
MIME-Version: 1.0
In-Reply-To: <20220728111016.uwbaywprzkzne7ib@quack3>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] remove iomap_writepage v2
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
 Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 28, 2022 at 01:10:16PM +0200, Jan Kara wrote:
> Hi Christoph!
> 
> On Tue 19-07-22 06:13:07, Christoph Hellwig wrote:
> > this series removes iomap_writepage and it's callers, following what xfs
> > has been doing for a long time.
> 
> So this effectively means "no writeback from page reclaim for these
> filesystems" AFAICT (page migration of dirty pages seems to be handled by
> iomap_migrate_page()) which is going to make life somewhat harder for
> memory reclaim when memory pressure is high enough that dirty pages are
> reaching end of the LRU list. I don't expect this to be a problem on big
> machines but it could have some undesirable effects for small ones
> (embedded, small VMs). I agree per-page writeback has been a bad idea for
> efficiency reasons for at least last 10-15 years and most filesystems
> stopped dealing with more complex situations (like block allocation) from
> ->writepage() already quite a few years ago without any bug reports AFAIK.
> So it all seems like a sensible idea from FS POV but are MM people on board
> or at least aware of this movement in the fs land?

I mentioned it during my folio session at LSFMM, but didn't put a huge
emphasis on it.

For XFS, writeback should already be in progress on other pages if
we're getting to the point of trying to call ->writepage() in vmscan.
Surely this is also true for other filesystems?

