Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4D12039655C
	for <lists+cluster-devel@lfdr.de>; Mon, 31 May 2021 18:31:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-o53AnHe2OFOS1hx1z0u-Nw-1; Mon, 31 May 2021 12:31:03 -0400
X-MC-Unique: o53AnHe2OFOS1hx1z0u-Nw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78E25803620;
	Mon, 31 May 2021 16:31:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F33661169;
	Mon, 31 May 2021 16:31:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 030BB44A58;
	Mon, 31 May 2021 16:30:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14VGUqOw015551 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 31 May 2021 12:30:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B9D2E5016F; Mon, 31 May 2021 16:30:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4F8D5016E
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 16:30:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 152E0802E5E
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 16:30:50 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-402-GcLtGywUPfivB0aSi2XkUg-1; Mon, 31 May 2021 12:30:47 -0400
X-MC-Unique: GcLtGywUPfivB0aSi2XkUg-1
Received: by mail-lf1-f49.google.com with SMTP id i9so17543172lfe.13
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 09:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dD1cRRRxJ2EzPfJboyLphgi4kVVClR9Hk5LXwRtjq5E=;
	b=g/v3w4+zOyRWnt0oeYnGYM4GSWC/TOnAVR5NuwpVNtrtAowtBqpXYmFn0AaTSirQfC
	8087pxPFpM5Sr+at2qEogp6VtJ9yy78pEBiupSPFilKKp0qfnWjY6ThNBM8hO0ZH6Xwe
	Z6f0SUnlaBeOBW+T3zdcLqsXw6RJ7k+SGDoMEkMGt3ycNxERAZf7awy0Rqvfuuh0AAqM
	KRi542embTRNSeehU/g5W66wxMDLW8ZDZzfKyB9OTDfioxzj8SmyuXVh3YB9Q4HAJFm8
	XKhQId5LJu2qfjNQe6I7Svy3Hsy6ZD3XZ/bK+Vs4OtrvsSK9Ly/+ZgDW1xXRe+jejAQk
	Rd/w==
X-Gm-Message-State: AOAM532SAN3c9uUU4UTMkakzwvhGLt3eOdipoBDtorDfmaMSPcv48CKF
	QqBxJoiPoowOi6vCrbxE7qFIhqgDCflubLQU
X-Google-Smtp-Source: ABdhPJzeUNs7b1XiYrStd84uq1AMaWpvS/Ao/LLL6KNYbgiEG0kprC2ViBAuGaNhbAfEhrFFZBfomw==
X-Received: by 2002:a05:6512:33d5:: with SMTP id
	d21mr15121278lfg.418.1622478645780; 
	Mon, 31 May 2021 09:30:45 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
	[209.85.167.45])
	by smtp.gmail.com with ESMTPSA id 17sm1388487lfr.53.2021.05.31.09.30.41
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 31 May 2021 09:30:43 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id a5so17638228lfm.0
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 09:30:41 -0700 (PDT)
X-Received: by 2002:a05:6512:374b:: with SMTP id
	a11mr14981484lfs.377.1622478640992; 
	Mon, 31 May 2021 09:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210531105606.228314-1-agruenba@redhat.com>
In-Reply-To: <20210531105606.228314-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 May 2021 06:30:25 -1000
X-Gmail-Original-Message-ID: <CAHk-=wj8EWr_D65i4oRSj2FTbrc6RdNydNNCGxeabRnwtoU=3Q@mail.gmail.com>
Message-ID: <CAHk-=wj8EWr_D65i4oRSj2FTbrc6RdNydNNCGxeabRnwtoU=3Q@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
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
Cc: cluster-devel <cluster-devel@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

[ Adding fsdevel, because this is not limited to gfs2 ]

On Mon, May 31, 2021 at 12:56 AM Andreas Gruenbacher
<agruenba@redhat.com> wrote:
>
> Andreas Gruenbacher (2):
>       gfs2: Fix mmap locking for write faults

This is bogus.

I've pulled it, but this is just wrong.

A write fault on a mmap IS NOT A WRITE to the filesystem.

It's a read.

Yes, it will later then allow writes to the page, but that's entirely
immaterial - because the write is going to happen not at fault time,
but long *after* the fault, and long *after* the filesystem has
installed the page.

The actual write will happen when the kernel returns from the user space.

And no, the explanation in that commit makes no sense either:

   "When a write fault occurs, we need to take the inode glock of the underlying
    inode in exclusive mode.  Otherwise, there's no guarantee that the
dirty page
    will be written back to disk"

the thing is, FAULT_FLAG_WRITE only says that the *currently* pending
access that triggered the fault was a write. That's entirely
irrelevant to a filesystem, because

 (a) it might be a private mapping, and a write to a page will cause a
COW by the VM layer, and it's not actually a filesystem write at all

AND

 (b) if it's a shared mapping, the first access that paged things in
is likely a READ, and the page will be marked writable (because it's a
shared mapping!) and subsequent writes will not cause any faults at
all.

In other words, a filesystem that checks for FAULT_FLAG_WRITE is
_doubly_ wrong. It's absolutely never the right thing to do. It
*cannot* be the right thing to do.

And yes, some other filesystems do this crazy thing too. If your
friends jumped off a bridge, would you jump too?

The xfs and ext3/ext4 cases are wrong too - but at least they spent
five seconds (but no more) thinking about it, and they added the check
for VM_SHARED. So they are only wrong for reason (b)

But wrong is wrong. The new code is not right in gfs2, and the old
code in xfs/ext4 is not right either.

Yeah, yeah, you can - and people do - do things like "always mark the
page readable on initial page fault, use mkwrite to catch when it
becomes writable, and do timestamps carefully, at at least have full
knowledge of "something might become dirty"

But even then it is ENTIRELY BOGUS to do things like write locking.

Really.

Because the actual write HASN'T HAPPENED YET, AND YOU WILL RELEASE THE
LOCK BEFORE IT EVER DOES! So the lock? It does nothing. If you think
it protects anything at all, you're wrong.

So don't do write locking. At an absolute most, you can do things like

 - update file times (and honestly, that's quite questionable -
because again - THE WRITE HASN'T HAPPENED YET - so any tests that
depend on exact file access times to figure out when the last write
was done is not being helped by your extra code, because you're
setting the WRONG time.

 - set some "this inode will have dirty pages" flag just for some
possible future use. But honestly, if this is about consistency etc,
you need to do it not for a fault, but across the whole mmap/munmap.

So some things may be less bogus - but still very very questionable.

But locking? Bogus. Reads and writes aren't really any different from
a timestamp standpoint (if you think you need to mtime for write
accesses, you should do atime for reads, so from a filesystem
timestamp standpoint read and write faults are exactly the same - and
both are bogus, because by definition for a mmap both the reads and
the writes can then happen long long long afterwards, and repeatedly).

And if that "set some flag" thing needs a write lock, but a read
doesn't, you're doing something wrong and odd.

Look at the VM code. The VM code does this right. The mmap_sem is
taken for writing for mmap and for munmap. But a page fault is always
a read lock, even if the access that caused the page fault is a write.

The actual real honest-to-goodness *write* happens much later, and the
only time the filesystem really knows when it is done is at writeback
time. Not at fault time. So if you take locks, logically you should
take them when the fault happens, and release them when the writeback
is done.

Are you doing that? No. So don't do the write lock over the read
portion of the page fault. It is not a sensible operation.

             Linus

