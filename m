Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBD241B293
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Sep 2021 17:03:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632841405;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4foXtDImKfjGxXCox0X2bLwV0yjwuNVoe4vpMdtwRRA=;
	b=KncgWHygMrtpZAtmjcF1xiwD9dGEipRLyGSKM3hP4OAFTKWXqw6tiqvk50KuNpJTbSk5gv
	j69VqJ+672Hno0J0BlqLBM4vBiT8OiKjy6NoEQ38o/+0guQjoCQFwMHZIUJWfvsfcBXPO/
	j8ixDAxGAyJh8lXj67H27QLb/BeRtGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-4uIU0fb9NzC19hm9_CutUA-1; Tue, 28 Sep 2021 11:03:23 -0400
X-MC-Unique: 4uIU0fb9NzC19hm9_CutUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 561768145E6;
	Tue, 28 Sep 2021 15:03:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0560860877;
	Tue, 28 Sep 2021 15:03:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35E014EA2A;
	Tue, 28 Sep 2021 15:03:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18SF39iP012584 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 28 Sep 2021 11:03:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0392D1112C3B; Tue, 28 Sep 2021 15:03:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F32701112C39
	for <cluster-devel@redhat.com>; Tue, 28 Sep 2021 15:03:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31EF61066686
	for <cluster-devel@redhat.com>; Tue, 28 Sep 2021 15:03:00 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-593-brujbYQTOr-gFYB8x3mloA-1; Tue, 28 Sep 2021 11:02:57 -0400
X-MC-Unique: brujbYQTOr-gFYB8x3mloA-1
Received: by mail-wr1-f69.google.com with SMTP id
	j16-20020adfa550000000b0016012acc443so15241170wrb.14
	for <cluster-devel@redhat.com>; Tue, 28 Sep 2021 08:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4foXtDImKfjGxXCox0X2bLwV0yjwuNVoe4vpMdtwRRA=;
	b=gRfR2umGd2WHeFG0zs7PEnUscYTGaGsqvR/vkK5SODO6ZjAfED7yN4vbI9fhDwIQNI
	liKzhrvNgCtumldmBnIGnJ0guGnLoI+VhddHWOWsqRksNKgHAfYIixFg4BFoKIcrGKVB
	/Sgam842D8JEJMLwrkcuFo5zqLmZU7I55+f3FJvYVaHLjlchduuei2Xmr1GiCIVsQQTZ
	2X0nz0OXDCS0SfFhaf76yvHFtb0PejYqwqELTSxG3/mOgekuiJRwfjaRplrwEM5mMWnG
	uxRrHvBAKUd3UqHVzbDXc8czqX8tDaRyg7kEHxbn03DB5cXyy2anDDR8Sg3EAWy2J3Y3
	TyBQ==
X-Gm-Message-State: AOAM532l2/ClG8CtxKOUfa7QtrThdhJg9KP+PqR/UWPlqgjfhcSVVUlu
	zIBit4QYJEHtcZHRRBL+7CgCjHgmckxDIX9S7RoZsS3z1T6nwY5G7WD7MKhwx/uSu3E1UwKn3zp
	9VGPGVGmsA7Z3dWjpwdmlbk1YcuzbfHbE+TB0sQ==
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr630782wrw.228.1632841376019; 
	Tue, 28 Sep 2021 08:02:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQYpSzxFYG3WAstx1iOIzaQIJ7zca0+7/4IIkWQxoeGhjO9K6Mn179dAauiF9IbSi3ZlEXbGKOrezwz62P/0I=
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr630736wrw.228.1632841375654; 
	Tue, 28 Sep 2021 08:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-4-agruenba@redhat.com>
	<CAL3q7H7PdBTuK28tN=3fGUyTP9wJU8Ydrq35YtNsfA_3xRQhzQ@mail.gmail.com>
In-Reply-To: <CAL3q7H7PdBTuK28tN=3fGUyTP9wJU8Ydrq35YtNsfA_3xRQhzQ@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 28 Sep 2021 17:02:43 +0200
Message-ID: <CAHc6FU7rbdJxeuvoz0jov5y_GH_B4AtjkDnbNyOxeeNc1Zw5+A@mail.gmail.com>
To: fdmanana@gmail.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 3, 2021 at 4:57 PM Filipe Manana <fdmanana@gmail.com> wrote:
> On Fri, Aug 27, 2021 at 5:52 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > Turn fault_in_pages_{readable,writeable} into versions that return the
> > number of bytes not faulted in (similar to copy_to_user) instead of
> > returning a non-zero value when any of the requested pages couldn't be
> > faulted in.  This supports the existing users that require all pages to
> > be faulted in as well as new users that are happy if any pages can be
> > faulted in at all.
> >
> > Neither of these functions is entirely trivial and it doesn't seem
> > useful to inline them, so move them to mm/gup.c.
> >
> > Rename the functions to fault_in_{readable,writeable} to make sure that
> > this change doesn't silently break things.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > ---
> >  arch/powerpc/kernel/kvm.c           |  3 +-
> >  arch/powerpc/kernel/signal_32.c     |  4 +-
> >  arch/powerpc/kernel/signal_64.c     |  2 +-
> >  arch/x86/kernel/fpu/signal.c        |  7 ++-
> >  drivers/gpu/drm/armada/armada_gem.c |  7 ++-
> >  fs/btrfs/ioctl.c                    |  5 +-
> >  include/linux/pagemap.h             | 57 ++---------------------
> >  lib/iov_iter.c                      | 10 ++--
> >  mm/filemap.c                        |  2 +-
> >  mm/gup.c                            | 72 +++++++++++++++++++++++++++++
> >  10 files changed, 93 insertions(+), 76 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/kvm.c b/arch/powerpc/kernel/kvm.c
> > index d89cf802d9aa..6568823cf306 100644
> > --- a/arch/powerpc/kernel/kvm.c
> > +++ b/arch/powerpc/kernel/kvm.c
> > @@ -669,7 +669,8 @@ static void __init kvm_use_magic_page(void)
> >         on_each_cpu(kvm_map_magic_page, &features, 1);
> >
> >         /* Quick self-test to see if the mapping works */
> > -       if (fault_in_pages_readable((const char *)KVM_MAGIC_PAGE, sizeof(u32))) {
> > +       if (fault_in_readable((const char __user *)KVM_MAGIC_PAGE,
> > +                             sizeof(u32))) {
> >                 kvm_patching_worked = false;
> >                 return;
> >         }
> > diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
> > index 0608581967f0..38c3eae40c14 100644
> > --- a/arch/powerpc/kernel/signal_32.c
> > +++ b/arch/powerpc/kernel/signal_32.c
> > @@ -1048,7 +1048,7 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
> >         if (new_ctx == NULL)
> >                 return 0;
> >         if (!access_ok(new_ctx, ctx_size) ||
> > -           fault_in_pages_readable((u8 __user *)new_ctx, ctx_size))
> > +           fault_in_readable((char __user *)new_ctx, ctx_size))
> >                 return -EFAULT;
> >
> >         /*
> > @@ -1237,7 +1237,7 @@ SYSCALL_DEFINE3(debug_setcontext, struct ucontext __user *, ctx,
> >  #endif
> >
> >         if (!access_ok(ctx, sizeof(*ctx)) ||
> > -           fault_in_pages_readable((u8 __user *)ctx, sizeof(*ctx)))
> > +           fault_in_readable((char __user *)ctx, sizeof(*ctx)))
> >                 return -EFAULT;
> >
> >         /*
> > diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> > index 1831bba0582e..9f471b4a11e3 100644
> > --- a/arch/powerpc/kernel/signal_64.c
> > +++ b/arch/powerpc/kernel/signal_64.c
> > @@ -688,7 +688,7 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
> >         if (new_ctx == NULL)
> >                 return 0;
> >         if (!access_ok(new_ctx, ctx_size) ||
> > -           fault_in_pages_readable((u8 __user *)new_ctx, ctx_size))
> > +           fault_in_readable((char __user *)new_ctx, ctx_size))
> >                 return -EFAULT;
> >
> >         /*
> > diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
> > index 445c57c9c539..ba6bdec81603 100644
> > --- a/arch/x86/kernel/fpu/signal.c
> > +++ b/arch/x86/kernel/fpu/signal.c
> > @@ -205,7 +205,7 @@ int copy_fpstate_to_sigframe(void __user *buf, void __user *buf_fx, int size)
> >         fpregs_unlock();
> >
> >         if (ret) {
> > -               if (!fault_in_pages_writeable(buf_fx, fpu_user_xstate_size))
> > +               if (!fault_in_writeable(buf_fx, fpu_user_xstate_size))
> >                         goto retry;
> >                 return -EFAULT;
> >         }
> > @@ -278,10 +278,9 @@ static int restore_fpregs_from_user(void __user *buf, u64 xrestore,
> >                 if (ret != -EFAULT)
> >                         return -EINVAL;
> >
> > -               ret = fault_in_pages_readable(buf, size);
> > -               if (!ret)
> > +               if (!fault_in_readable(buf, size))
> >                         goto retry;
> > -               return ret;
> > +               return -EFAULT;
> >         }
> >
> >         /*
> > diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
> > index 21909642ee4c..8fbb25913327 100644
> > --- a/drivers/gpu/drm/armada/armada_gem.c
> > +++ b/drivers/gpu/drm/armada/armada_gem.c
> > @@ -336,7 +336,7 @@ int armada_gem_pwrite_ioctl(struct drm_device *dev, void *data,
> >         struct drm_armada_gem_pwrite *args = data;
> >         struct armada_gem_object *dobj;
> >         char __user *ptr;
> > -       int ret;
> > +       int ret = 0;
> >
> >         DRM_DEBUG_DRIVER("handle %u off %u size %u ptr 0x%llx\n",
> >                 args->handle, args->offset, args->size, args->ptr);
> > @@ -349,9 +349,8 @@ int armada_gem_pwrite_ioctl(struct drm_device *dev, void *data,
> >         if (!access_ok(ptr, args->size))
> >                 return -EFAULT;
> >
> > -       ret = fault_in_pages_readable(ptr, args->size);
> > -       if (ret)
> > -               return ret;
> > +       if (fault_in_readable(ptr, args->size))
> > +               return -EFAULT;
> >
> >         dobj = armada_gem_object_lookup(file, args->handle);
> >         if (dobj == NULL)
> > diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> > index 0ba98e08a029..9233ecc31e2e 100644
> > --- a/fs/btrfs/ioctl.c
> > +++ b/fs/btrfs/ioctl.c
> > @@ -2244,9 +2244,8 @@ static noinline int search_ioctl(struct inode *inode,
> >         key.offset = sk->min_offset;
> >
> >         while (1) {
> > -               ret = fault_in_pages_writeable(ubuf + sk_offset,
> > -                                              *buf_size - sk_offset);
> > -               if (ret)
> > +               ret = -EFAULT;
> > +               if (fault_in_writeable(ubuf + sk_offset, *buf_size - sk_offset))
> >                         break;
> >
> >                 ret = btrfs_search_forward(root, &key, path, sk->min_transid);
> > diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> > index ed02aa522263..7c9edc9694d9 100644
> > --- a/include/linux/pagemap.h
> > +++ b/include/linux/pagemap.h
> > @@ -734,61 +734,10 @@ int wait_on_page_private_2_killable(struct page *page);
> >  extern void add_page_wait_queue(struct page *page, wait_queue_entry_t *waiter);
> >
> >  /*
> > - * Fault everything in given userspace address range in.
> > + * Fault in userspace address range.
> >   */
> > -static inline int fault_in_pages_writeable(char __user *uaddr, int size)
> > -{
> > -       char __user *end = uaddr + size - 1;
> > -
> > -       if (unlikely(size == 0))
> > -               return 0;
> > -
> > -       if (unlikely(uaddr > end))
> > -               return -EFAULT;
> > -       /*
> > -        * Writing zeroes into userspace here is OK, because we know that if
> > -        * the zero gets there, we'll be overwriting it.
> > -        */
> > -       do {
> > -               if (unlikely(__put_user(0, uaddr) != 0))
> > -                       return -EFAULT;
> > -               uaddr += PAGE_SIZE;
> > -       } while (uaddr <= end);
> > -
> > -       /* Check whether the range spilled into the next page. */
> > -       if (((unsigned long)uaddr & PAGE_MASK) ==
> > -                       ((unsigned long)end & PAGE_MASK))
> > -               return __put_user(0, end);
> > -
> > -       return 0;
> > -}
> > -
> > -static inline int fault_in_pages_readable(const char __user *uaddr, int size)
> > -{
> > -       volatile char c;
> > -       const char __user *end = uaddr + size - 1;
> > -
> > -       if (unlikely(size == 0))
> > -               return 0;
> > -
> > -       if (unlikely(uaddr > end))
> > -               return -EFAULT;
> > -
> > -       do {
> > -               if (unlikely(__get_user(c, uaddr) != 0))
> > -                       return -EFAULT;
> > -               uaddr += PAGE_SIZE;
> > -       } while (uaddr <= end);
> > -
> > -       /* Check whether the range spilled into the next page. */
> > -       if (((unsigned long)uaddr & PAGE_MASK) ==
> > -                       ((unsigned long)end & PAGE_MASK)) {
> > -               return __get_user(c, end);
> > -       }
> > -
> > -       (void)c;
> > -       return 0;
> > -}
> > +size_t fault_in_writeable(char __user *uaddr, size_t size);
> > +size_t fault_in_readable(const char __user *uaddr, size_t size);
> >
> >  int add_to_page_cache_locked(struct page *page, struct address_space *mapping,
> >                                 pgoff_t index, gfp_t gfp_mask);
> > diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> > index 25dfc48536d7..069cedd9d7b4 100644
> > --- a/lib/iov_iter.c
> > +++ b/lib/iov_iter.c
> > @@ -191,7 +191,7 @@ static size_t copy_page_to_iter_iovec(struct page *page, size_t offset, size_t b
> >         buf = iov->iov_base + skip;
> >         copy = min(bytes, iov->iov_len - skip);
> >
> > -       if (IS_ENABLED(CONFIG_HIGHMEM) && !fault_in_pages_writeable(buf, copy)) {
> > +       if (IS_ENABLED(CONFIG_HIGHMEM) && !fault_in_writeable(buf, copy)) {
> >                 kaddr = kmap_atomic(page);
> >                 from = kaddr + offset;
> >
> > @@ -275,7 +275,7 @@ static size_t copy_page_from_iter_iovec(struct page *page, size_t offset, size_t
> >         buf = iov->iov_base + skip;
> >         copy = min(bytes, iov->iov_len - skip);
> >
> > -       if (IS_ENABLED(CONFIG_HIGHMEM) && !fault_in_pages_readable(buf, copy)) {
> > +       if (IS_ENABLED(CONFIG_HIGHMEM) && !fault_in_readable(buf, copy)) {
> >                 kaddr = kmap_atomic(page);
> >                 to = kaddr + offset;
> >
> > @@ -446,13 +446,11 @@ int iov_iter_fault_in_readable(const struct iov_iter *i, size_t bytes)
> >                         bytes = i->count;
> >                 for (p = i->iov, skip = i->iov_offset; bytes; p++, skip = 0) {
> >                         size_t len = min(bytes, p->iov_len - skip);
> > -                       int err;
> >
> >                         if (unlikely(!len))
> >                                 continue;
> > -                       err = fault_in_pages_readable(p->iov_base + skip, len);
> > -                       if (unlikely(err))
> > -                               return err;
> > +                       if (fault_in_readable(p->iov_base + skip, len))
> > +                               return -EFAULT;
> >                         bytes -= len;
> >                 }
> >         }
> > diff --git a/mm/filemap.c b/mm/filemap.c
> > index d1458ecf2f51..4dec3bc7752e 100644
> > --- a/mm/filemap.c
> > +++ b/mm/filemap.c
> > @@ -88,7 +88,7 @@
> >   *    ->lock_page              (access_process_vm)
> >   *
> >   *  ->i_mutex                  (generic_perform_write)
> > - *    ->mmap_lock              (fault_in_pages_readable->do_page_fault)
> > + *    ->mmap_lock              (fault_in_readable->do_page_fault)
> >   *
> >   *  bdi->wb.list_lock
> >   *    sb_lock                  (fs/fs-writeback.c)
> > diff --git a/mm/gup.c b/mm/gup.c
> > index b94717977d17..0cf47955e5a1 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -1672,6 +1672,78 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
> >  }
> >  #endif /* !CONFIG_MMU */
> >
> > +/**
> > + * fault_in_writeable - fault in userspace address range for writing
> > + * @uaddr: start of address range
> > + * @size: size of address range
> > + *
> > + * Returns the number of bytes not faulted in (like copy_to_user() and
> > + * copy_from_user()).
> > + */
> > +size_t fault_in_writeable(char __user *uaddr, size_t size)
> > +{
> > +       char __user *start = uaddr, *end;
> > +
> > +       if (unlikely(size == 0))
> > +               return 0;
> > +       if (!PAGE_ALIGNED(uaddr)) {
> > +               if (unlikely(__put_user(0, uaddr) != 0))
> > +                       return size;
> > +               uaddr = (char __user *)PAGE_ALIGN((unsigned long)uaddr);
> > +       }
> > +       end = (char __user *)PAGE_ALIGN((unsigned long)start + size);
> > +       if (unlikely(end < start))
> > +               end = NULL;
> > +       while (uaddr != end) {
> > +               if (unlikely(__put_user(0, uaddr) != 0))
> > +                       goto out;
> > +               uaddr += PAGE_SIZE;
>
> Won't we loop endlessly or corrupt some unwanted page when 'end' was
> set to NULL?

What do you mean? We set 'end' to NULL when start + size < start
exactly so that the loop will stop when uaddr wraps around.

> > +       }
> > +
> > +out:
> > +       if (size > uaddr - start)
> > +               return size - (uaddr - start);
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL(fault_in_writeable);
> > +
> > +/**
> > + * fault_in_readable - fault in userspace address range for reading
> > + * @uaddr: start of user address range
> > + * @size: size of user address range
> > + *
> > + * Returns the number of bytes not faulted in (like copy_to_user() and
> > + * copy_from_user()).
> > + */
> > +size_t fault_in_readable(const char __user *uaddr, size_t size)
> > +{
> > +       const char __user *start = uaddr, *end;
> > +       volatile char c;
> > +
> > +       if (unlikely(size == 0))
> > +               return 0;
> > +       if (!PAGE_ALIGNED(uaddr)) {
> > +               if (unlikely(__get_user(c, uaddr) != 0))
> > +                       return size;
> > +               uaddr = (const char __user *)PAGE_ALIGN((unsigned long)uaddr);
> > +       }
> > +       end = (const char __user *)PAGE_ALIGN((unsigned long)start + size);
> > +       if (unlikely(end < start))
> > +               end = NULL;
> > +       while (uaddr != end) {
>
> Same kind of issue here, when 'end' was set to NULL?
>
> Thanks.
>
> > +               if (unlikely(__get_user(c, uaddr) != 0))
> > +                       goto out;
> > +               uaddr += PAGE_SIZE;
> > +       }
> > +
> > +out:
> > +       (void)c;
> > +       if (size > uaddr - start)
> > +               return size - (uaddr - start);
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL(fault_in_readable);
> > +
> >  /**
> >   * get_dump_page() - pin user page in memory while writing it to core dump
> >   * @addr: user address
> > --
> > 2.26.3
> >

Thanks,
Andreas

