Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 283013D5956
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 14:21:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-L6RJsNXeMFKqmQK6jSzoNA-1; Mon, 26 Jul 2021 08:21:17 -0400
X-MC-Unique: L6RJsNXeMFKqmQK6jSzoNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42B4B100F76E;
	Mon, 26 Jul 2021 12:21:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35D137A8D4;
	Mon, 26 Jul 2021 12:21:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22471181A2A8;
	Mon, 26 Jul 2021 12:21:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16Q8PmUg026898 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 04:25:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD7B91112C3C; Mon, 26 Jul 2021 08:25:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8C41112C088
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 08:25:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4B2B89C7DB
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 08:25:45 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-229-8N4W3u1cPZCWBgxwA_VhUw-1;
	Mon, 26 Jul 2021 04:25:41 -0400
X-MC-Unique: 8N4W3u1cPZCWBgxwA_VhUw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 66F7767373; Mon, 26 Jul 2021 10:25:38 +0200 (CEST)
Date: Mon, 26 Jul 2021 10:25:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20210726082538.GF14853@lst.de>
References: <20210719103520.495450-1-hch@lst.de>
	<20210719103520.495450-21-hch@lst.de>
	<20210719221005.GL664593@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20210719221005.GL664593@dread.disaster.area>
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
	"Darrick J. Wong" <djwong@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 20/27] fsdax: switch dax_iomap_rw to use
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 20, 2021 at 08:10:05AM +1000, Dave Chinner wrote:
> At first I wondered "iomi? Strange name, why is this one-off name
> used?" and then I realised it's because this function also takes an
> struct iov_iter named "iter".
> 
> That's going to cause confusion in the long run - iov_iter and
> iomap_iter both being generally named "iter", and then one or the
> other randomly changing when both are used in the same function.
> 
> Would it be better to avoid any possible confusion simply by using
> "iomi" for all iomap_iter variables throughout the patchset from the
> start? That way nobody is going to confuse iov_iter with iomap_iter
> iteration variables and code that uses both types will naturally
> have different, well known names...

Hmm.  iomi comes from the original patch from willy and I kinda hate
it.  But given that we have this clash here (and in the direct I/O code)
I kept using it.

Does anyone have any strong opinions here?

