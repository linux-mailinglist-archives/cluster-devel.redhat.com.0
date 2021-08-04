Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 96D9B3E041B
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Aug 2021 17:25:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628090720;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=gYL7WTiLrXdvlISyfYPUBkceFpd6GfwZ8nIKez1uy+s=;
	b=Jb6lFgntivG5xelV0pdc9SnHaWn0ynIe3gD3E81M5nLNMTOdDlM9KWgRoS7HRhbhNvIMur
	VDZEwSjVaDy9jC5H8QUCKekRotD5cKP0o4Sa4t88wrUy3B+uYdz1u3RqWC2+GGVpWisHJf
	TKvNhD+fNy+3Jx8rZfXg7zqN04wG3Gs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-5WpI7HdwM-amSpyPHsf9Ww-1; Wed, 04 Aug 2021 11:25:19 -0400
X-MC-Unique: 5WpI7HdwM-amSpyPHsf9Ww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71A5618C89DA;
	Wed,  4 Aug 2021 15:25:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E0C718432;
	Wed,  4 Aug 2021 15:25:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 232204BB7C;
	Wed,  4 Aug 2021 15:25:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 174FPC12013313 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 4 Aug 2021 11:25:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C7083208097F; Wed,  4 Aug 2021 15:25:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA46D2077FB6
	for <cluster-devel@redhat.com>; Wed,  4 Aug 2021 15:25:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 240E38D138D
	for <cluster-devel@redhat.com>; Wed,  4 Aug 2021 15:25:09 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-541-ib7jcPHjNfSJpyGXgVkQ0w-1; Wed, 04 Aug 2021 11:25:07 -0400
X-MC-Unique: ib7jcPHjNfSJpyGXgVkQ0w-1
Received: by mail-wm1-f72.google.com with SMTP id
	k5-20020a7bc3050000b02901e081f69d80so392343wmj.8
	for <cluster-devel@redhat.com>; Wed, 04 Aug 2021 08:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gYL7WTiLrXdvlISyfYPUBkceFpd6GfwZ8nIKez1uy+s=;
	b=dTIxlpjok2VAl/NUWvtW6IPcapjDQRNa+3YDpXvGVW0CAH3JFsL5zVnzJBYtIHKp83
	3rldDlz2nnJN0+hNzKkKg7okXVrOgqCExsmpSavCuU7P9gDEdPJmru/hvobsyX9cpUOJ
	2qIP++DVCznUvhIh/QHPJazrS74sPhYYSwcKNRU2x58PdoIEVqcA4/OuTvJWAWoVAotO
	P1iC/H1SK7OGUK690oeP1Ubd7aUfSQCGk80tZ+FjeXj6N0XclQlVCFQLT9gEZljjsld1
	91XDoHo6lgKQa4pQnswLj+8Qz61LAI0A3Zu9hy4STyxRzT1QHbPskStmcwI9wsYoi/go
	DQzg==
X-Gm-Message-State: AOAM533y89BYo1RMjzU08Eyp7FuiowGLh1TFuUtW/9k7rRwVg4Tg7Dxh
	5hp3jyNVPT18xIOqy7JvA5WMBL5WquG1Fu2p2JpwIUNJ6abmf7IrgjTByopW2J1zVOk82o0Zsc2
	7N4Sg0EgBl+43FDsIBb1HwnHLOK/reRclHRG/tQ==
X-Received: by 2002:a05:600c:5108:: with SMTP id
	o8mr146216wms.97.1628090706476; 
	Wed, 04 Aug 2021 08:25:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGPp6F/pqnoLzgNlPa34lpo9Fxz5ei5sfxO6QxFSlOC9E6qS0pKNJg4a4S7jUPOSWKzwWMmB1rxcCP3pTCg+4=
X-Received: by 2002:a05:600c:5108:: with SMTP id
	o8mr146202wms.97.1628090706302; 
	Wed, 04 Aug 2021 08:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210803191818.993968-1-agruenba@redhat.com>
	<20210803191818.993968-6-agruenba@redhat.com>
In-Reply-To: <20210803191818.993968-6-agruenba@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 4 Aug 2021 17:24:55 +0200
Message-ID: <CAHc6FU7YLUivXXa00dX1=DC1XaYLnh_j3QDvYcRoAji14WAyAQ@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v5 05/12] iov_iter: Introduce
	fault_in_iov_iter_writeable
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
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 3, 2021 at 9:18 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> Introduce a new fault_in_iov_iter_writeable helper for safely faulting in an
> iterator for writing.  Uses get_user_pages() to fault in the pages without
> actually writing to them, which would be destructive.
>
> We'll use fault_in_iov_iter_writeable in gfs2 once we've determined that the
> iterator passed to .read_iter isn't in memory.
>
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  include/linux/pagemap.h |  1 +
>  include/linux/uio.h     |  1 +
>  lib/iov_iter.c          | 41 +++++++++++++++++++++++++++
>  mm/gup.c                | 61 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 104 insertions(+)
>
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 7c9edc9694d9..a629807edb8c 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -737,6 +737,7 @@ extern void add_page_wait_queue(struct page *page, wait_queue_entry_t *waiter);
>   * Fault in userspace address range.
>   */
>  size_t fault_in_writeable(char __user *uaddr, size_t size);
> +size_t fault_in_safe_writeable(const char __user *uaddr, size_t size);
>  size_t fault_in_readable(const char __user *uaddr, size_t size);
>
>  int add_to_page_cache_locked(struct page *page, struct address_space *mapping,
> diff --git a/include/linux/uio.h b/include/linux/uio.h
> index 12d30246c2e9..ffa431aeb067 100644
> --- a/include/linux/uio.h
> +++ b/include/linux/uio.h
> @@ -120,6 +120,7 @@ size_t copy_page_from_iter_atomic(struct page *page, unsigned offset,
>  void iov_iter_advance(struct iov_iter *i, size_t bytes);
>  void iov_iter_revert(struct iov_iter *i, size_t bytes);
>  size_t fault_in_iov_iter_readable(const struct iov_iter *i, size_t bytes);
> +size_t fault_in_iov_iter_writeable(const struct iov_iter *i, size_t bytes);
>  size_t iov_iter_single_seg_count(const struct iov_iter *i);
>  size_t copy_page_to_iter(struct page *page, size_t offset, size_t bytes,
>                          struct iov_iter *i);
> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> index c0fa1618561c..4ffc76801eaa 100644
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -471,6 +471,47 @@ size_t fault_in_iov_iter_readable(const struct iov_iter *i, size_t size)
>  }
>  EXPORT_SYMBOL(fault_in_iov_iter_readable);
>
> +/*
> + * fault_in_iov_iter_writeable - fault in iov iterator for writing
> + * @i: iterator
> + * @size: maximum length
> + *
> + * Faults in the iterator using get_user_pages(), i.e., without triggering
> + * hardware page faults.  This is primarily useful when we know that some or
> + * all of the pages in @i aren't in memory.
> + *
> + * Returns the number of bytes faulted in, or 0 if no bytes could be faulted in
> + * (i.e., because the address is invalid).
> + *
> + * Always returns the number of avaliable bytes for non-user space iterators.
> + */
> +size_t fault_in_iov_iter_writeable(const struct iov_iter *i, size_t size)
> +{
> +       if (size > i->count)
> +               size = i->count;
> +
> +       if (iter_is_iovec(i)) {
> +               const struct iovec *p;
> +               size_t bytes = size;
> +               size_t skip;
> +
> +               for (p = i->iov, skip = i->iov_offset; bytes; p++, skip = 0) {
> +                       size_t len = min(bytes, p->iov_len - skip);
> +                       size_t ret;
> +
> +                       if (unlikely(!len))
> +                               continue;
> +                       ret = fault_in_safe_writeable(p->iov_base + skip, len);
> +                       bytes -= ret;
> +                       if (ret != len)
> +                               break;
> +               }
> +               return size - bytes;
> +       }
> +       return size;
> +}
> +EXPORT_SYMBOL(fault_in_iov_iter_writeable);
> +
>  void iov_iter_init(struct iov_iter *i, unsigned int direction,
>                         const struct iovec *iov, unsigned long nr_segs,
>                         size_t count)
> diff --git a/mm/gup.c b/mm/gup.c
> index d04984d5d93c..7218e27c2481 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1694,6 +1694,67 @@ size_t fault_in_writeable(char __user *uaddr, size_t size)
>  }
>  EXPORT_SYMBOL(fault_in_writeable);
>
> +/**
> + * fault_in_safe_writeable - fault in an address range for writing
> + * @uaddr: start of address range
> + * @size: length of address range
> + *
> + * Faults in an address range using get_user_pages, i.e., without triggering
> + * hardware page faults.  This is primarily useful when we know that some or
> + * all of the pages in the address range aren't in memory.
> + *
> + * Other than fault_in_writeable(), this function is non-destructive.
> + *
> + * Note that we don't pin or otherwise hold the pages referenced that we fault
> + * in.  There's no guarantee that they'll stay in memory for any duration of
> + * time.
> + *
> + * Returns the number of bytes faulted in from @uaddr.
> + */
> +size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
> +{
> +       unsigned long start = (unsigned long)uaddr;
> +       unsigned long end, nstart, nend;
> +       struct mm_struct *mm = current->mm;
> +       struct vm_area_struct *vma = NULL;
> +       int locked = 0;
> +
> +       /* FIXME: Protect against overflow! */
> +
> +       end = PAGE_ALIGN(start + size);
> +       for (nstart = start & PAGE_MASK; nstart < end; nstart = nend) {
> +               unsigned long nr_pages;
> +               long ret;
> +
> +               if (!locked) {
> +                       locked = 1;
> +                       mmap_read_lock(mm);
> +                       vma = find_vma(mm, nstart);
> +               } else if (nstart >= vma->vm_end)
> +                       vma = vma->vm_next;
> +               if (!vma || vma->vm_start >= end)
> +                       break;
> +               nend = min(end, vma->vm_end);
> +               if (vma->vm_flags & (VM_IO | VM_PFNMAP))
> +                       continue;

Shouldn't we disallow read()ing into those kinds of vmas? If we skip
over them here and then the actual write results in -EFAULT, we'll end
up in a loop.

> +               if (nstart < vma->vm_start)
> +                       nstart = vma->vm_start;

Likewise, shouldn't we fail for memory ranges not covered by a vma?

> +               nr_pages = (nend - nstart) / PAGE_SIZE;
> +               ret = __get_user_pages_locked(mm, nstart, nr_pages,
> +                                             NULL, NULL, &locked,
> +                                             FOLL_TOUCH | FOLL_WRITE);
> +               if (ret <= 0)
> +                       break;
> +               nend = nstart + ret * PAGE_SIZE;
> +       }
> +       if (locked)
> +               mmap_read_unlock(mm);
> +       if (nstart > start)
> +               return min(nstart - start, size);
> +       return 0;
> +}
> +EXPORT_SYMBOL(fault_in_safe_writeable);
> +
>  size_t fault_in_readable(const char __user *uaddr, size_t size)
>  {
>         const char __user *start = uaddr, *end;
> --
> 2.26.3
>

Thanks,
Andreas

