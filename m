Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 35F293D594F
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 14:18:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-KcrE-nbaPYaUOiDq5Ko1oA-1; Mon, 26 Jul 2021 08:18:55 -0400
X-MC-Unique: KcrE-nbaPYaUOiDq5Ko1oA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 450A7871826;
	Mon, 26 Jul 2021 12:18:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39976179B3;
	Mon, 26 Jul 2021 12:18:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F829181A2A6;
	Mon, 26 Jul 2021 12:18:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16Q8JpN0026433 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 04:19:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E004D112C088; Mon, 26 Jul 2021 08:19:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB60E1003203
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 08:19:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7C40800B28
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 08:19:47 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-476-rq50yjZePTOzwaz6yzVFFA-1;
	Mon, 26 Jul 2021 04:19:45 -0400
X-MC-Unique: rq50yjZePTOzwaz6yzVFFA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id BFDB567373; Mon, 26 Jul 2021 10:19:42 +0200 (CEST)
Date: Mon, 26 Jul 2021 10:19:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210726081942.GD14853@lst.de>
References: <20210719103520.495450-1-hch@lst.de>
	<20210719103520.495450-17-hch@lst.de>
	<20210719170545.GF22402@magnolia>
MIME-Version: 1.0
In-Reply-To: <20210719170545.GF22402@magnolia>
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
Subject: Re: [Cluster-devel] [PATCH 16/27] iomap: switch iomap_bmap to use
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 19, 2021 at 10:05:45AM -0700, Darrick J. Wong wrote:
> >  	bno = 0;
> > -	ret = iomap_apply(inode, pos, blocksize, 0, ops, &bno,
> > -			  iomap_bmap_actor);
> > +	while ((ret = iomap_iter(&iter, ops)) > 0) {
> > +		if (iter.iomap.type != IOMAP_MAPPED)
> > +			continue;
> 
> There isn't a mapped extent, so return 0 here, right?

We can't just return 0, we always need the final iomap_iter() call
to clean up in case a ->iomap_end method is supplied.  No for bmap
having and needing one is rather theoretical, but people will copy
and paste that once we start breaking the rules.

