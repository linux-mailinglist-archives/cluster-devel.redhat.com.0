Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 093BB404931
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Sep 2021 13:22:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-YFFP6PmPP0umDQKPtb-vAw-1; Thu, 09 Sep 2021 07:22:54 -0400
X-MC-Unique: YFFP6PmPP0umDQKPtb-vAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 292F2802C8A;
	Thu,  9 Sep 2021 11:22:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A17E60E1C;
	Thu,  9 Sep 2021 11:22:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 038E21809C81;
	Thu,  9 Sep 2021 11:22:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 189BMmtD013725 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Sep 2021 07:22:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3070B20A8943; Thu,  9 Sep 2021 11:22:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C55720A88A8
	for <cluster-devel@redhat.com>; Thu,  9 Sep 2021 11:22:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D67E18A6582
	for <cluster-devel@redhat.com>; Thu,  9 Sep 2021 11:22:45 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-460-XUya-e6sPx2kArGN5tnetg-1; Thu, 09 Sep 2021 07:22:44 -0400
X-MC-Unique: XUya-e6sPx2kArGN5tnetg-1
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
	Linux)) id 1mOI6o-009l4w-TK; Thu, 09 Sep 2021 11:20:53 +0000
Date: Thu, 9 Sep 2021 12:20:46 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YTnuDhNlSN1Ie1MJ@infradead.org>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-16-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210827164926.1726765-16-agruenba@redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 15/19] iomap: Support partial direct
 I/O on user copy failures
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 27, 2021 at 06:49:22PM +0200, Andreas Gruenbacher wrote:
> In iomap_dio_rw, when iomap_apply returns an -EFAULT error and the
> IOMAP_DIO_PARTIAL flag is set, complete the request synchronously and
> return a partial result.  This allows the caller to deal with the page
> fault and retry the remainder of the request.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/iomap/direct-io.c  | 6 ++++++
>  include/linux/iomap.h | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index 8054f5d6c273..ba88fe51b77a 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -561,6 +561,12 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
>  		ret = iomap_apply(inode, pos, count, iomap_flags, ops, dio,
>  				iomap_dio_actor);
>  		if (ret <= 0) {
> +			if (ret == -EFAULT && dio->size &&
> +			    (dio_flags & IOMAP_DIO_PARTIAL)) {
> +				wait_for_completion = true;
> +				ret = 0;

Do we need a NOWAIT check here to skip the wait_for_completion
for that case?

