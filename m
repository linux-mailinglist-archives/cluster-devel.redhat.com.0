Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6185A3C1F4F
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Jul 2021 08:27:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487--LjjFldHOG-Do5VDLPEOTQ-1; Fri, 09 Jul 2021 02:27:10 -0400
X-MC-Unique: -LjjFldHOG-Do5VDLPEOTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F248362F9;
	Fri,  9 Jul 2021 06:27:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12A845D6D3;
	Fri,  9 Jul 2021 06:27:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED8FB1809C97;
	Fri,  9 Jul 2021 06:27:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1696R5RK025774 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Jul 2021 02:27:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E3E3510F9B1; Fri,  9 Jul 2021 06:27:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD75910F04D
	for <cluster-devel@redhat.com>; Fri,  9 Jul 2021 06:27:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D3661064E69
	for <cluster-devel@redhat.com>; Fri,  9 Jul 2021 06:27:02 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-551-SOfnzWGcN8u_twOR1NIuQw-1; Fri, 09 Jul 2021 02:26:59 -0400
X-MC-Unique: SOfnzWGcN8u_twOR1NIuQw-1
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
	Linux)) id 1m1jrt-00EDRr-6w; Fri, 09 Jul 2021 06:20:12 +0000
Date: Fri, 9 Jul 2021 07:20:09 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YOfqmXtSI2qJHhtB@infradead.org>
References: <20210707115524.2242151-1-agruenba@redhat.com>
	<20210707115524.2242151-3-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707115524.2242151-3-agruenba@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
	"Darrick J . Wong" <djwong@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v3 2/3] iomap: Don't create iomap_page
 objects for inline files
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 07, 2021 at 01:55:23PM +0200, Andreas Gruenbacher wrote:
> In iomap_readpage_actor, don't create iop objects for inline inodes.
> Otherwise, iomap_read_inline_data will set PageUptodate without setting
> iop->uptodate, and iomap_page_release will eventually complain.
> 
> To prevent this kind of bug from occurring in the future, make sure the
> page doesn't have private data attached in iomap_read_inline_data.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

Ok, given that you want a quick fix this looks good for now:

Reviewed-by: Christoph Hellwig <hch@lst.de>

