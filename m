Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8644D396906
	for <lists+cluster-devel@lfdr.de>; Mon, 31 May 2021 22:32:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622493178;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=eIPtoH3V1uRSKTYJIeUQjqM9k7RxE6f0M/KOCbORxjo=;
	b=DZ637Yoo6ZlXCQdSQoMhwNHapSpu2+oH75SJY4uP/KeB/KmAwCjtVmbzhpfGc1e2zaxMFw
	L3DmFrYyySZl8ZXKlpkoe2tEvvb1JvyDbHxLC9TCWaV/6xgrz5xZWa4zyP9vucgG+xodL/
	cr9c4gWLPgi+ivcA+NW9ZQEI++la16s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-DhTrs7o6M5-GQWuKhQRAOQ-1; Mon, 31 May 2021 16:32:57 -0400
X-MC-Unique: DhTrs7o6M5-GQWuKhQRAOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0202C1005D4E;
	Mon, 31 May 2021 20:32:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EB3119C71;
	Mon, 31 May 2021 20:32:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 188D544A58;
	Mon, 31 May 2021 20:32:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14VKWjkO032391 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 31 May 2021 16:32:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E5F0112D42B; Mon, 31 May 2021 20:32:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 594ED112D42D
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 20:32:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1807858F0D
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 20:32:42 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-474-clwpKXqDN6q6bnmAeAqn0g-1; Mon, 31 May 2021 16:32:40 -0400
X-MC-Unique: clwpKXqDN6q6bnmAeAqn0g-1
Received: by mail-wm1-f72.google.com with SMTP id
	v25-20020a1cf7190000b0290197a4be97b7so356285wmh.9
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 13:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eIPtoH3V1uRSKTYJIeUQjqM9k7RxE6f0M/KOCbORxjo=;
	b=ayInujKqqcjOyuHLGt27pDGaeG+Fli2vOzvLTOTa9RRAx1LCiaOw99vc1R+Y5iGps5
	xOSKuQ9VrSBEH0f2HVrHJkEDGU3Jxd6K+nkmL2KWrEawynMOpZjT0QznejowPKdny3ln
	4Xo6MchuSsBaBGguYET2+8np3R2i9kfctbA4VeaoO4e9VbeuDxHpmG7pC0Dk5TpICPgf
	QWHmOMOxweRRYIG0R9JNN6J23N+seRxNkHqgsNhPMaz+efZA1Ispwaj9aP0njhpSG5Y1
	a1wGt7GBKw2HVR6h1FzMBQcjnZMZHsU2otS7fz5Zn/tFi/79DjSDAxD3ZhYb2XZGGPx7
	FoxQ==
X-Gm-Message-State: AOAM5331DGdHZTLl6bJgYSYjq0ju7iRKg1dipHjl/Slo3t4DL1D2Z73C
	ndMmJ3VcphxfZIQqO5mXTx/ccoBdRiE94F+Nh0R8m95TwSZNY6/OCwdGEMB4KdUz4su7pMnnsDH
	b0Mrr7Oszyziq6SjewrqdKoG+rnIOQvL9LsMugw==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr742487wmi.132.1622493159719; 
	Mon, 31 May 2021 13:32:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuUP4NISItoptr6oKYfry3Adwhj9c5n6SHwj4ZPOi4fGsXEBkf39U4RUlwoOP+qpxNp07En9r9I5ue0x82AUU=
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr742477wmi.132.1622493159526; 
	Mon, 31 May 2021 13:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210531105606.228314-1-agruenba@redhat.com>
	<CAHk-=wj8EWr_D65i4oRSj2FTbrc6RdNydNNCGxeabRnwtoU=3Q@mail.gmail.com>
In-Reply-To: <CAHk-=wj8EWr_D65i4oRSj2FTbrc6RdNydNNCGxeabRnwtoU=3Q@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 31 May 2021 22:32:28 +0200
Message-ID: <CAHc6FU51=5cNZX9hdDHj3AJ6fy4bK7nH1qwAi2m2wB45WPoq8Q@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fixes for v5.13-rc5
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
Content-Type: text/plain; charset="UTF-8"

On Mon, May 31, 2021 at 6:30 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> [ Adding fsdevel, because this is not limited to gfs2 ]
>
> On Mon, May 31, 2021 at 12:56 AM Andreas Gruenbacher
> <agruenba@redhat.com> wrote:
> >
> > Andreas Gruenbacher (2):
> >       gfs2: Fix mmap locking for write faults
>
> This is bogus.
>
> I've pulled it, but this is just wrong.
>
> A write fault on a mmap IS NOT A WRITE to the filesystem.
>
> It's a read.
>
> Yes, it will later then allow writes to the page, but that's entirely
> immaterial - because the write is going to happen not at fault time,
> but long *after* the fault, and long *after* the filesystem has
> installed the page.
>
> The actual write will happen when the kernel returns from the user space.
>
> And no, the explanation in that commit makes no sense either:
>
>    "When a write fault occurs, we need to take the inode glock of the underlying
>     inode in exclusive mode.  Otherwise, there's no guarantee that the
> dirty page
>     will be written back to disk"
>
> the thing is, FAULT_FLAG_WRITE only says that the *currently* pending
> access that triggered the fault was a write. That's entirely
> irrelevant to a filesystem, because
>
>  (a) it might be a private mapping, and a write to a page will cause a
> COW by the VM layer, and it's not actually a filesystem write at all
>
> AND
>
>  (b) if it's a shared mapping, the first access that paged things in
> is likely a READ, and the page will be marked writable (because it's a
> shared mapping!) and subsequent writes will not cause any faults at
> all.
>
> In other words, a filesystem that checks for FAULT_FLAG_WRITE is
> _doubly_ wrong. It's absolutely never the right thing to do. It
> *cannot* be the right thing to do.
>
> And yes, some other filesystems do this crazy thing too. If your
> friends jumped off a bridge, would you jump too?
>
> The xfs and ext3/ext4 cases are wrong too - but at least they spent
> five seconds (but no more) thinking about it, and they added the check
> for VM_SHARED. So they are only wrong for reason (b)
>
> But wrong is wrong. The new code is not right in gfs2, and the old
> code in xfs/ext4 is not right either.
>
> Yeah, yeah, you can - and people do - do things like "always mark the
> page readable on initial page fault, use mkwrite to catch when it
> becomes writable, and do timestamps carefully, at at least have full
> knowledge of "something might become dirty"
>
> But even then it is ENTIRELY BOGUS to do things like write locking.
>
> Really.
>
> Because the actual write HASN'T HAPPENED YET, AND YOU WILL RELEASE THE
> LOCK BEFORE IT EVER DOES! So the lock? It does nothing. If you think
> it protects anything at all, you're wrong.
>
> So don't do write locking. At an absolute most, you can do things like
>
>  - update file times (and honestly, that's quite questionable -
> because again - THE WRITE HASN'T HAPPENED YET - so any tests that
> depend on exact file access times to figure out when the last write
> was done is not being helped by your extra code, because you're
> setting the WRONG time.
>
>  - set some "this inode will have dirty pages" flag just for some
> possible future use. But honestly, if this is about consistency etc,
> you need to do it not for a fault, but across the whole mmap/munmap.
>
> So some things may be less bogus - but still very very questionable.
>
> But locking? Bogus. Reads and writes aren't really any different from
> a timestamp standpoint (if you think you need to mtime for write
> accesses, you should do atime for reads, so from a filesystem
> timestamp standpoint read and write faults are exactly the same - and
> both are bogus, because by definition for a mmap both the reads and
> the writes can then happen long long long afterwards, and repeatedly).
>
> And if that "set some flag" thing needs a write lock, but a read
> doesn't, you're doing something wrong and odd.
>
> Look at the VM code. The VM code does this right. The mmap_sem is
> taken for writing for mmap and for munmap. But a page fault is always
> a read lock, even if the access that caused the page fault is a write.
>
> The actual real honest-to-goodness *write* happens much later, and the
> only time the filesystem really knows when it is done is at writeback
> time. Not at fault time. So if you take locks, logically you should
> take them when the fault happens, and release them when the writeback
> is done.
>
> Are you doing that? No. So don't do the write lock over the read
> portion of the page fault. It is not a sensible operation.

Thanks for the detailed explanation. I'll work on a fix.

Andreas

