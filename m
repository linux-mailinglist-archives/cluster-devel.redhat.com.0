Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 36C773E5428
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Aug 2021 09:16:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-8P9T4SvYM_qQ9_-3ZT8lXA-1; Tue, 10 Aug 2021 03:16:06 -0400
X-MC-Unique: 8P9T4SvYM_qQ9_-3ZT8lXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3FD01008060;
	Tue, 10 Aug 2021 07:16:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABC935D9DC;
	Tue, 10 Aug 2021 07:16:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B3534A7C8;
	Tue, 10 Aug 2021 07:16:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17A7Dtjs008450 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 03:13:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 685702031A42; Tue, 10 Aug 2021 07:13:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6458D2031A41
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 07:13:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD73580018D
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 07:13:51 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-362-1NKJhEvMOJaEMS_E7vF6Lg-1;
	Tue, 10 Aug 2021 03:13:44 -0400
X-MC-Unique: 1NKJhEvMOJaEMS_E7vF6Lg-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 02B8268AFE; Tue, 10 Aug 2021 09:13:42 +0200 (CEST)
Date: Tue, 10 Aug 2021 09:13:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210810071341.GB16590@lst.de>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-20-hch@lst.de>
	<20210810063951.GH3601443@magnolia>
MIME-Version: 1.0
In-Reply-To: <20210810063951.GH3601443@magnolia>
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
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 19/30] iomap: switch iomap_bmap to use
	iomap_iter
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

On Mon, Aug 09, 2021 at 11:39:51PM -0700, Darrick J. Wong wrote:
> Can't this at least be rephrased as:
> 
> 	const uint bno_shift = (mapping->host->i_blkbits - SECTOR_SHIFT);
> 
> 	while ((ret = iomap_iter(&iter, ops)) > 0) {
> 		if (iter.iomap.type == IOMAP_MAPPED)
> 			bno = iomap_sector(iomap, iter.pos) << bno_shift;
> 		/* leave iter.processed unset to stop iteration */
> 	}
> 
> to make the loop exit more explicit?

Sure.

