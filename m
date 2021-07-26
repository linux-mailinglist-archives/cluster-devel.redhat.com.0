Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CA1F33D65A6
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 19:25:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-885UljZxMXS9DDO0IEGjIg-1; Mon, 26 Jul 2021 13:25:20 -0400
X-MC-Unique: 885UljZxMXS9DDO0IEGjIg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 521AAA0BDF;
	Mon, 26 Jul 2021 17:25:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 376245C1CF;
	Mon, 26 Jul 2021 17:25:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED153180BAB0;
	Mon, 26 Jul 2021 17:25:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QHJn01023236 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 13:19:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80D86111287C; Mon, 26 Jul 2021 17:19:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B144111287B
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 17:19:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14A208007B1
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 17:19:46 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-196-qubpZtunM8CJWr0pSLxMmA-1; Mon, 26 Jul 2021 13:19:41 -0400
X-MC-Unique: qubpZtunM8CJWr0pSLxMmA-1
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 63A151FECC;
	Mon, 26 Jul 2021 17:19:40 +0000 (UTC)
Received: from quack2.suse.cz (unknown [10.100.200.198])
	by relay2.suse.de (Postfix) with ESMTP id 4ECF8A3B85;
	Mon, 26 Jul 2021 17:19:40 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 1C1F11E3B13; Mon, 26 Jul 2021 19:19:40 +0200 (CEST)
Date: Mon, 26 Jul 2021 19:19:40 +0200
From: Jan Kara <jack@suse.cz>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20210726171940.GM20621@quack2.suse.cz>
References: <20210723205840.299280-1-agruenba@redhat.com>
	<20210723205840.299280-6-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210723205840.299280-6-agruenba@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v3 5/7] iomap: Support restarting direct
 I/O requests after user copy failures
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

On Fri 23-07-21 22:58:38, Andreas Gruenbacher wrote:
> In __iomap_dio_rw, when iomap_apply returns an -EFAULT error, complete the
> request synchronously and reset the iterator to the start position.  This
> allows callers to deal with the failure and retry the operation.
> 
> In gfs2, we need to disable page faults while we're holding glocks to prevent
> deadlocks.  This patch is the minimum solution I could find to make
> iomap_dio_rw work with page faults disabled.  It's still expensive because any
> I/O that was carried out before hitting -EFAULT needs to be retried.
> 
> A possible improvement would be to add an IOMAP_DIO_FAULT_RETRY or similar flag
> that would allow iomap_dio_rw to return a short result when hitting -EFAULT.
> Callers could then retry only the rest of the request after dealing with the
> page fault.
> 
> Asynchronous requests turn into synchronous requests up to the point of the
> page fault in any case, but they could be retried asynchronously after dealing
> with the page fault.  To make that work, the completion notification would have
> to include the bytes read or written before the page fault(s) as well, and we'd
> need an additional iomap_dio_rw argument for that.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/iomap/direct-io.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index cc0b4bc8861b..b0a494211bb4 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -561,6 +561,15 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
>  		ret = iomap_apply(inode, pos, count, iomap_flags, ops, dio,
>  				iomap_dio_actor);
>  		if (ret <= 0) {
> +			if (ret == -EFAULT) {
> +				/*
> +				 * To allow retrying the request, fail
> +				 * synchronously and reset the iterator.
> +				 */
> +				wait_for_completion = true;
> +				iov_iter_revert(dio->submit.iter, dio->size);
> +			}
> +

Hum, OK, but this means that if userspace submits large enough write, GFS2
will livelock trying to complete it? While other filesystems can just
submit multiple smaller bios constructed in iomap_apply() (paging in
different parts of the buffer) and thus complete the write?

								Honza

>  			/* magic error code to fall back to buffered I/O */
>  			if (ret == -ENOTBLK) {
>  				wait_for_completion = true;
> -- 
> 2.26.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

