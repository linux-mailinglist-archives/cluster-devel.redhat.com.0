Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 90D203B84C5
	for <lists+cluster-devel@lfdr.de>; Wed, 30 Jun 2021 16:10:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-ZnqikVH2OvOGS8Dc93cztA-1; Wed, 30 Jun 2021 10:10:57 -0400
X-MC-Unique: ZnqikVH2OvOGS8Dc93cztA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93A3180430F;
	Wed, 30 Jun 2021 14:10:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60324179E6;
	Wed, 30 Jun 2021 14:10:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52C8A1809C9A;
	Wed, 30 Jun 2021 14:10:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15UEA1lZ004407 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 30 Jun 2021 10:10:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4C4F120285BE; Wed, 30 Jun 2021 14:10:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47281202145F
	for <cluster-devel@redhat.com>; Wed, 30 Jun 2021 14:09:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BB0510AC3A8
	for <cluster-devel@redhat.com>; Wed, 30 Jun 2021 14:09:58 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-475-D2Zu81yGPMOYIRY-zjt4UA-1; Wed, 30 Jun 2021 10:09:53 -0400
X-MC-Unique: D2Zu81yGPMOYIRY-zjt4UA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1lyata-005Qpq-4r; Wed, 30 Jun 2021 14:09:09 +0000
Date: Wed, 30 Jun 2021 15:08:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YNx69luCAxlLMDAG@casper.infradead.org>
References: <YNoJPZ4NWiqok/by@casper.infradead.org>
	<20210628172727.1894503-1-agruenba@redhat.com>
	<20210629091239.1930040-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210629091239.1930040-1-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: "Darrick J . Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org, cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 0/2] iomap: small block problems
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

On Tue, Jun 29, 2021 at 11:12:39AM +0200, Andreas Gruenbacher wrote:
> Below is a version of your patch on top of v5.13 which has passed some
> local testing here.
> 
> Thanks,
> Andreas
> 
> --
> 
> iomap: Permit pages without an iop to enter writeback
> 
> Permit pages without an iop to enter writeback and create an iop *then*.  This
> allows filesystems to mark pages dirty without having to worry about how the
> iop block tracking is implemented.

How about ...

Create an iop in the writeback path if one doesn't exist.  This allows
us to avoid creating the iop in some cases.  The only current case we
do that for is pages with inline data, but it can be extended to pages
which are entirely within an extent.  It also allows for an iop to be
removed from pages in the future (eg page split).

> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

Co-developed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

