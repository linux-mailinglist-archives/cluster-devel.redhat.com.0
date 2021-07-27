Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADCA3D788F
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 16:33:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-KBT_qjntMsGavggncnq_6Q-1; Tue, 27 Jul 2021 10:33:08 -0400
X-MC-Unique: KBT_qjntMsGavggncnq_6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6551F87D55A;
	Tue, 27 Jul 2021 14:33:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42F845C1CF;
	Tue, 27 Jul 2021 14:33:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD4764BB7C;
	Tue, 27 Jul 2021 14:33:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16REX2xC000310 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 10:33:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1D87200AD05; Tue, 27 Jul 2021 14:33:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC43F2138BAE
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 14:33:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A8941800741
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 14:33:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-327-HCj1iwmSOxKezXx3oSoNOQ-1;
	Tue, 27 Jul 2021 10:32:58 -0400
X-MC-Unique: HCj1iwmSOxKezXx3oSoNOQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8053603E7;
	Tue, 27 Jul 2021 14:32:56 +0000 (UTC)
Date: Tue, 27 Jul 2021 07:32:56 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210727143256.GC559142@magnolia>
References: <20210719103520.495450-1-hch@lst.de>
	<20210719103520.495450-17-hch@lst.de>
	<20210719170545.GF22402@magnolia> <20210726081942.GD14853@lst.de>
	<20210726163922.GA559142@magnolia> <20210727063138.GA10143@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210727063138.GA10143@lst.de>
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
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2021 at 08:31:38AM +0200, Christoph Hellwig wrote:
> On Mon, Jul 26, 2021 at 09:39:22AM -0700, Darrick J. Wong wrote:
> > The documentation needs to be much more explicit about the fact that you
> > cannot "break;" your way out of an iomap_iter loop.  I think the comment
> > should be rewritten along these lines:
> > 
> > "Iterate over filesystem-provided space mappings for the provided file
> > range.  This function handles cleanup of resources acquired for
> > iteration when the filesystem indicates there are no more space
> > mappings, which means that this function must be called in a loop that
> > continues as long it returns a positive value.  If 0 or a negative value
> > is returned, the caller must not return to the loop body.  Within a loop
> > body, there are two ways to break out of the loop body: leave
> > @iter.processed unchanged, or set it to the usual negative errno."
> > 
> > Hm.
> 
> Yes, I'll update the documentation.

Ok, thanks!

> > Clunky, for sure, but at least we still get to use break as the language
> > designers intended.
> 
> I can't see any advantage there over just proper documentation.  If you
> are totally attached to a working break we might have to come up with
> a nasty for_each macro that ensures we have a final iomap_apply, but I
> doubt it is worth the effort.

I was pushing the explicit _break() function as a means to avoid an even
fuglier loop macro.

--D

