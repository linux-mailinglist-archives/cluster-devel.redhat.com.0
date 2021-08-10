Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 51A4E3E5429
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Aug 2021 09:16:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-C3qrceXSPP-kKHh7PhgMbA-1; Tue, 10 Aug 2021 03:16:07 -0400
X-MC-Unique: C3qrceXSPP-kKHh7PhgMbA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1F75801B3C;
	Tue, 10 Aug 2021 07:16:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C37515C232;
	Tue, 10 Aug 2021 07:16:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F92F4A7C9;
	Tue, 10 Aug 2021 07:16:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17A7DQhq008430 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 03:13:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E24E2031A41; Tue, 10 Aug 2021 07:13:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A6D12031A40
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 07:13:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E34F101A529
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 07:13:22 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-512-_0NFIsQ-OKG1MABDsGtbNA-1;
	Tue, 10 Aug 2021 03:13:17 -0400
X-MC-Unique: _0NFIsQ-OKG1MABDsGtbNA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2FFD467373; Tue, 10 Aug 2021 09:13:13 +0200 (CEST)
Date: Tue, 10 Aug 2021 09:13:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210810071312.GA16590@lst.de>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-12-hch@lst.de>
	<20210809221047.GC3657114@dread.disaster.area>
	<20210810064509.GI3601443@magnolia>
MIME-Version: 1.0
In-Reply-To: <20210810064509.GI3601443@magnolia>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 11/30] iomap: add the new iomap_iter
	model
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2021 at 11:45:09PM -0700, Darrick J. Wong wrote:
> > fs/iomap.c without having to take the tree back in time to find
> > those files...
> 
> ...or put the new code in apply.c, remove iomap_apply, and don't bother
> with the renaming at all?
> 
> I don't see much reason to break the git history.  This is effectively a
> new epoch in iomap, but that is plainly obvious from the function
> declarations.
> 
> I'll wander through the rest of the unreviewed patches tomorrow morning,
> these are merely my off-the-cuff impressions.

We could do all that, but why?  There is no code even left from the
apply area.

