Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CE97D3D5955
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 14:21:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-47fKiZbOPqC-D8I3XsTINg-1; Mon, 26 Jul 2021 08:21:16 -0400
X-MC-Unique: 47fKiZbOPqC-D8I3XsTINg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E086487D54A;
	Mon, 26 Jul 2021 12:21:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D236D5DD68;
	Mon, 26 Jul 2021 12:21:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFF0C4A700;
	Mon, 26 Jul 2021 12:21:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16Q8FYBP026004 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 04:15:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 445B3110DBC8; Mon, 26 Jul 2021 08:15:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40741110DBC7
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 08:15:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A28F118A01A0
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 08:15:21 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-23-bq1vmBFzN6ef-38d-Dp7Jw-1;
	Mon, 26 Jul 2021 04:15:19 -0400
X-MC-Unique: bq1vmBFzN6ef-38d-Dp7Jw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id DF1C468BEB; Mon, 26 Jul 2021 10:15:12 +0200 (CEST)
Date: Mon, 26 Jul 2021 10:15:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210726081510.GB14853@lst.de>
References: <20210719103520.495450-1-hch@lst.de>
	<20210719103520.495450-9-hch@lst.de>
	<20210719165600.GG23236@magnolia>
MIME-Version: 1.0
In-Reply-To: <20210719165600.GG23236@magnolia>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 08/27] iomap: add the new iomap_iter
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 19, 2021 at 09:56:00AM -0700, Darrick J. Wong wrote:
> Linus previously complained to me about filesystem code (especially
> iomap since it was "newer") (ab)using loff_t variables to store the
> lengths of byte ranges.  It was "loff_t length;" (or so willy
> recollects) that tripped him up.
> 
> ISTR he also said we should use size_t for all lengths because nobody
> should do operations larger than ~2G, but I reject that because iomap
> has users that iterate large ranges of data without generating any IO
> (e.g. fiemap, seek, swapfile activation).
> 
> So... rather than confusing things even more by mixing u64 and ssize_t
> for lengths, can we introduce a new 64-bit length typedef for iomap?
> Last summer, Dave suggested[1] something like:
> 
> 	typedef long long lsize_t;
> 
> That would enable cleanup of all the count/size/length parameters in
> fs/remap_range.c and fs/xfs/xfs_reflink.c to use the new 64-bit length
> type, since those operations have never been limited to 32-bit sizes.

I'd rather avoid playing guinea pig for a somewhat odd new type.  For
now I've switched it to the loff_t as that matches the rest of iomap.
If we switch away either to a new type or s64/u64 we should probably do
it as a big sweep.

