Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 15DDD3F9FA0
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Aug 2021 21:09:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-Y-qIx-a2MYO0YxNvansqMQ-1; Fri, 27 Aug 2021 15:09:52 -0400
X-MC-Unique: Y-qIx-a2MYO0YxNvansqMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C90421082922;
	Fri, 27 Aug 2021 19:09:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9C1E5D6B1;
	Fri, 27 Aug 2021 19:09:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 967FD181A0F1;
	Fri, 27 Aug 2021 19:09:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RJ9mcg017352 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 15:09:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7F463F4ED9; Fri, 27 Aug 2021 19:09:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79DAF1A91E5
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 19:09:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAE59101A54C
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 19:09:45 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-149-m7WeycX3MI-HXCGrcU9Kyg-1; Fri, 27 Aug 2021 15:08:36 -0400
X-MC-Unique: m7WeycX3MI-HXCGrcU9Kyg-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mJhDO-00GZVm-U4; Fri, 27 Aug 2021 19:08:34 +0000
Date: Fri, 27 Aug 2021 19:08:34 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YSk4Mvbyp8lxPfPF@zeniv-ca.linux.org.uk>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-4-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210827164926.1726765-4-agruenba@redhat.com>
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
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 03/19] gup: Turn
 fault_in_pages_{readable, writeable} into fault_in_{readable, writeable}
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

On Fri, Aug 27, 2021 at 06:49:10PM +0200, Andreas Gruenbacher wrote:
> Turn fault_in_pages_{readable,writeable} into versions that return the
> number of bytes not faulted in (similar to copy_to_user) instead of
> returning a non-zero value when any of the requested pages couldn't be
> faulted in.  This supports the existing users that require all pages to
> be faulted in as well as new users that are happy if any pages can be
> faulted in at all.
> 
> Neither of these functions is entirely trivial and it doesn't seem
> useful to inline them, so move them to mm/gup.c.
> 
> Rename the functions to fault_in_{readable,writeable} to make sure that
> this change doesn't silently break things.

I'm sorry, but this is wrong.  The callers need to be reviewed and
sanitized.  You have several oddball callers (most of them simply
wrong) *and* the ones on a very hot path in write(2).  And _there_
the existing behaviour does the wrong thing for memory poisoning setups.

	Do we have *any* cases where we both need the fault-in at all *and*
would not be better off with "fail only if the first byte couldn't have been
faulted in"?

> diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
> index 0608581967f0..38c3eae40c14 100644
> --- a/arch/powerpc/kernel/signal_32.c
> +++ b/arch/powerpc/kernel/signal_32.c
> @@ -1048,7 +1048,7 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
>  	if (new_ctx == NULL)
>  		return 0;
>  	if (!access_ok(new_ctx, ctx_size) ||
> -	    fault_in_pages_readable((u8 __user *)new_ctx, ctx_size))
> +	    fault_in_readable((char __user *)new_ctx, ctx_size))
>  		return -EFAULT;

This is completely pointless.  Look at do_setcontext() there.  Seriously,
it immediately does
        if (!user_read_access_begin(ucp, sizeof(*ucp)))
			return -EFAULT;
so this access_ok() is so much garbage.  Then it does normal unsage_get_...()
stuff, so it doesn't need that fault-in crap at all - it *must* handle
copyin failures, fault-in or not.  Just lose that fault_in_... call and be
done with that.


> @@ -1237,7 +1237,7 @@ SYSCALL_DEFINE3(debug_setcontext, struct ucontext __user *, ctx,
>  #endif
>  
>  	if (!access_ok(ctx, sizeof(*ctx)) ||
> -	    fault_in_pages_readable((u8 __user *)ctx, sizeof(*ctx)))
> +	    fault_in_readable((char __user *)ctx, sizeof(*ctx)))
>  		return -EFAULT;

Ditto.

> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index 1831bba0582e..9f471b4a11e3 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -688,7 +688,7 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
>  	if (new_ctx == NULL)
>  		return 0;
>  	if (!access_ok(new_ctx, ctx_size) ||
> -	    fault_in_pages_readable((u8 __user *)new_ctx, ctx_size))
> +	    fault_in_readable((char __user *)new_ctx, ctx_size))
>  		return -EFAULT;

... and again.

> diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> index 0ba98e08a029..9233ecc31e2e 100644
> --- a/fs/btrfs/ioctl.c
> +++ b/fs/btrfs/ioctl.c
> @@ -2244,9 +2244,8 @@ static noinline int search_ioctl(struct inode *inode,
>  	key.offset = sk->min_offset;
>  
>  	while (1) {
> -		ret = fault_in_pages_writeable(ubuf + sk_offset,
> -					       *buf_size - sk_offset);
> -		if (ret)
> +		ret = -EFAULT;
> +		if (fault_in_writeable(ubuf + sk_offset, *buf_size - sk_offset))
>  			break;

Really?

> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> index 25dfc48536d7..069cedd9d7b4 100644
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -191,7 +191,7 @@ static size_t copy_page_to_iter_iovec(struct page *page, size_t offset, size_t b
>  	buf = iov->iov_base + skip;
>  	copy = min(bytes, iov->iov_len - skip);
>  
> -	if (IS_ENABLED(CONFIG_HIGHMEM) && !fault_in_pages_writeable(buf, copy)) {
> +	if (IS_ENABLED(CONFIG_HIGHMEM) && !fault_in_writeable(buf, copy)) {

Here we definitely want "fail only if nothing could be faulted in"

>  		kaddr = kmap_atomic(page);
>  		from = kaddr + offset;
>  
> @@ -275,7 +275,7 @@ static size_t copy_page_from_iter_iovec(struct page *page, size_t offset, size_t
>  	buf = iov->iov_base + skip;
>  	copy = min(bytes, iov->iov_len - skip);
>  
> -	if (IS_ENABLED(CONFIG_HIGHMEM) && !fault_in_pages_readable(buf, copy)) {
> +	if (IS_ENABLED(CONFIG_HIGHMEM) && !fault_in_readable(buf, copy)) {

Same.

> @@ -446,13 +446,11 @@ int iov_iter_fault_in_readable(const struct iov_iter *i, size_t bytes)
>  			bytes = i->count;
>  		for (p = i->iov, skip = i->iov_offset; bytes; p++, skip = 0) {
>  			size_t len = min(bytes, p->iov_len - skip);
> -			int err;
>  
>  			if (unlikely(!len))
>  				continue;
> -			err = fault_in_pages_readable(p->iov_base + skip, len);
> -			if (unlikely(err))
> -				return err;
> +			if (fault_in_readable(p->iov_base + skip, len))
> +				return -EFAULT;

... and the same, except that here we want failure only if nothing had already
been faulted in.

