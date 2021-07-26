Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAA33D6389
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 18:40:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-BO2xkjg8MfOh8w8NfR8okA-1; Mon, 26 Jul 2021 12:40:41 -0400
X-MC-Unique: BO2xkjg8MfOh8w8NfR8okA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37B6A363A0;
	Mon, 26 Jul 2021 16:40:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2593C26DC7;
	Mon, 26 Jul 2021 16:40:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09EBA4BB7C;
	Mon, 26 Jul 2021 16:40:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QGeaPs017660 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 12:40:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 576DD1003330; Mon, 26 Jul 2021 16:40:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5331911422A8
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 16:40:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 483B0802A64
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 16:40:33 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-603-JKc4vz_1Mv28a51e0SE4aA-1; Mon, 26 Jul 2021 12:40:31 -0400
X-MC-Unique: JKc4vz_1Mv28a51e0SE4aA-1
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id CC6FE21EE9;
	Mon, 26 Jul 2021 16:33:26 +0000 (UTC)
Received: from quack2.suse.cz (unknown [10.100.200.198])
	by relay2.suse.de (Postfix) with ESMTP id B17B5A3C0E;
	Mon, 26 Jul 2021 16:33:26 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 8CBD81E3B13; Mon, 26 Jul 2021 18:33:26 +0200 (CEST)
Date: Mon, 26 Jul 2021 18:33:26 +0200
From: Jan Kara <jack@suse.cz>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20210726163326.GK20621@quack2.suse.cz>
References: <20210723205840.299280-1-agruenba@redhat.com>
	<20210723205840.299280-2-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210723205840.299280-2-agruenba@redhat.com>
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
Subject: Re: [Cluster-devel] [PATCH v3 1/7] iov_iter: Introduce
	fault_in_iov_iter helper
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri 23-07-21 22:58:34, Andreas Gruenbacher wrote:
> Introduce a new fault_in_iov_iter helper for manually faulting in an iterator.
> Other than fault_in_pages_writeable(), this function is non-destructive.
> 
> We'll use fault_in_iov_iter in gfs2 once we've determined that the iterator
> passed to .read_iter or .write_iter isn't in memory.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
...
> +unsigned long fault_in_user_pages(unsigned long start, unsigned long len,
> +				  bool write)
> +{
> +	struct mm_struct *mm = current->mm;
> +	struct vm_area_struct *vma = NULL;
> +	unsigned long end, nstart, nend;
> +	int locked = 0;
> +	int gup_flags;
> +
> +	/*
> +	 * FIXME: Make sure this function doesn't succeed for pages that cannot
> +	 * be accessed; otherwise we could end up in a loop trying to fault in
> +	 * and then access the pages.  (It's okay if a page gets evicted and we
> +	 * need more than one retry.)
> +	 */
> +
> +	/*
> +	 * FIXME: Are these the right FOLL_* flags?
> +	 */

How about the FIXMEs here? I guess we should answer these questions before
merging and remove the comments. Regarding the first FIXME I tend to agree
that if we cannot fault in the first page, we should return the error
rather than returning 0 as you do now. OTOH the caller can check for 0 and
understand there's something wrong going on as well. But the error would be
probably a bit clearer.

> +
> +	gup_flags = FOLL_TOUCH | FOLL_POPULATE;

I don't think FOLL_POPULATE makes sense here. It makes sense only with
FOLL_MLOCK and determines whether mlock(2) should fault in missing pages or
not.

								Honza

> +	if (write)
> +		gup_flags |= FOLL_WRITE;
> +
> +	end = PAGE_ALIGN(start + len);
> +	for (nstart = start & PAGE_MASK; nstart < end; nstart = nend) {
> +		unsigned long nr_pages;
> +		long ret;
> +
> +		if (!locked) {
> +			locked = 1;
> +			mmap_read_lock(mm);
> +			vma = find_vma(mm, nstart);
> +		} else if (nstart >= vma->vm_end)
> +			vma = vma->vm_next;
> +		if (!vma || vma->vm_start >= end)
> +			break;
> +		nend = min(end, vma->vm_end);
> +		if (vma->vm_flags & (VM_IO | VM_PFNMAP))
> +			continue;
> +		if (nstart < vma->vm_start)
> +			nstart = vma->vm_start;
> +		nr_pages = (nend - nstart) / PAGE_SIZE;
> +		ret = __get_user_pages_locked(mm, nstart, nr_pages,
> +					      NULL, NULL, &locked, gup_flags);
> +		if (ret <= 0)
> +			break;
> +		nend = nstart + ret * PAGE_SIZE;
> +	}
> +	if (locked)
> +		mmap_read_unlock(mm);
> +	if (nstart > start)
> +		return min(nstart - start, len);
> +	return 0;
> +}
> +
>  /**
>   * get_dump_page() - pin user page in memory while writing it to core dump
>   * @addr: user address
> -- 
> 2.26.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

