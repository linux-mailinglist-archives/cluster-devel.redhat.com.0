Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 95F0641B889
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Sep 2021 22:42:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632861730;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3jBAm38dwxejV13EKa37YtYOLD3eWnXj6fegh8i3dws=;
	b=DC88kfCfjAEcbwRuIoGnNwArMgEmdh7fzRsOno1jumFDXYcQlfI8el87siGJIn2oQ+R6PC
	vp8HF9wwtJ2r/EWDVezOE31NPuyZ3Gg0GffeuBfKBxx2m0QSWDRbR8LSr5yWE+ciJhN5iE
	n98j/g82+QWO/ZQBDyIc5E0K+U4qxRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-5nT5vyLrMQCAZfI58_PGCg-1; Tue, 28 Sep 2021 16:42:09 -0400
X-MC-Unique: 5nT5vyLrMQCAZfI58_PGCg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 250B31B2C980;
	Tue, 28 Sep 2021 20:42:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE95019C79;
	Tue, 28 Sep 2021 20:42:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6287F4E58F;
	Tue, 28 Sep 2021 20:42:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18SKfxZ5009016 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 28 Sep 2021 16:42:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D812B1003330; Tue, 28 Sep 2021 20:41:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2B1D1004042
	for <cluster-devel@redhat.com>; Tue, 28 Sep 2021 20:41:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E39D4811E76
	for <cluster-devel@redhat.com>; Tue, 28 Sep 2021 20:41:55 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-347-hdFmhDMiM3Se4PDbWM4ubA-1; Tue, 28 Sep 2021 16:41:54 -0400
X-MC-Unique: hdFmhDMiM3Se4PDbWM4ubA-1
Received: by mail-wr1-f69.google.com with SMTP id
	f7-20020a5d50c7000000b0015e288741a4so103625wrt.9
	for <cluster-devel@redhat.com>; Tue, 28 Sep 2021 13:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3jBAm38dwxejV13EKa37YtYOLD3eWnXj6fegh8i3dws=;
	b=d9bmB/M4oFSvQAyT76SRrj5/qBCJ0GBakgOdS8pJfZWqy+sykpIL5udGpjPN0ILw+1
	1Kh9s9pMfZ444FG97t++rr5uHKXqzaTopel9kt2pm7Vb43tMy3E5ScXh7ufAh+QOeZmV
	L3cphkBZpg33hr27omOtV9vmFJkHYf8lFQ/VDkNS6bTFK/d2fva8ypnV94C0bMS5FPZV
	N7fg6mGUnaiH2R2//bEhbTHpCyU8+gDVZA8n1VIGThDW7iGifZtqzDLiU/kv/3ZstIMq
	Roi1qsCoyh8DATy1LgqUNhBapikJOjJrLgbYMsQeHfejzaQUXjpgBAm9p5nhBcfu9pDI
	7raA==
X-Gm-Message-State: AOAM5300DdeAfjGkEFbdCuNrq5rFNdRF26pp8DySHminHtr2sHXRvMeA
	6JSvEP3d7YAQREL7Ma3rgzy0mjpa87YwbiG2gCVrIam1WDJO7BMF4bhFdLkf/OALgWb8amBOnDM
	KOBnlcl87kQx59NfNiGkUh4QzmnGe5uOANuRhJQ==
X-Received: by 2002:adf:fe11:: with SMTP id n17mr2531995wrr.134.1632861712996; 
	Tue, 28 Sep 2021 13:41:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ3DYdqCR9Z5PcqKHy1xm32GHNEUBLV2gDJNFBOzxHyUdTS2vH5aXkMEboVTXvHTdpTp6sggiL9+bBSwcUm1A=
X-Received: by 2002:adf:fe11:: with SMTP id n17mr2531978wrr.134.1632861712811; 
	Tue, 28 Sep 2021 13:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-4-agruenba@redhat.com>
	<CAL3q7H7PdBTuK28tN=3fGUyTP9wJU8Ydrq35YtNsfA_3xRQhzQ@mail.gmail.com>
	<CAHc6FU7rbdJxeuvoz0jov5y_GH_B4AtjkDnbNyOxeeNc1Zw5+A@mail.gmail.com>
	<YVNE4HGKPb7bw+En@casper.infradead.org>
In-Reply-To: <YVNE4HGKPb7bw+En@casper.infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 28 Sep 2021 22:41:41 +0200
Message-ID: <CAHc6FU47kX=P2VhjAxk-7hqiKoEHUMMzbC-8vRYfWXUVs9zAtQ@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	fdmanana@gmail.com, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Willy,

On Tue, Sep 28, 2021 at 6:40 PM Matthew Wilcox <willy@infradead.org> wrote:
> On Tue, Sep 28, 2021 at 05:02:43PM +0200, Andreas Gruenbacher wrote:
> > On Fri, Sep 3, 2021 at 4:57 PM Filipe Manana <fdmanana@gmail.com> wrote:
> > > On Fri, Aug 27, 2021 at 5:52 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> > > > +size_t fault_in_writeable(char __user *uaddr, size_t size)
> > > > +{
> > > > +       char __user *start = uaddr, *end;
> > > > +
> > > > +       if (unlikely(size == 0))
> > > > +               return 0;
> > > > +       if (!PAGE_ALIGNED(uaddr)) {
> > > > +               if (unlikely(__put_user(0, uaddr) != 0))
> > > > +                       return size;
> > > > +               uaddr = (char __user *)PAGE_ALIGN((unsigned long)uaddr);
> > > > +       }
> > > > +       end = (char __user *)PAGE_ALIGN((unsigned long)start + size);
> > > > +       if (unlikely(end < start))
> > > > +               end = NULL;
> > > > +       while (uaddr != end) {
> > > > +               if (unlikely(__put_user(0, uaddr) != 0))
> > > > +                       goto out;
> > > > +               uaddr += PAGE_SIZE;
> > >
> > > Won't we loop endlessly or corrupt some unwanted page when 'end' was
> > > set to NULL?
> >
> > What do you mean? We set 'end' to NULL when start + size < start
> > exactly so that the loop will stop when uaddr wraps around.
>
> But think about x86-64.  The virtual address space (unless you have 5
> level PTs) looks like:
>
> [0, 2^47)               userspace
> [2^47, 2^64 - 2^47)     hole
> [2^64 - 2^47, 2^64)     kernel space
>
> If we try to copy from the hole we'll get some kind of fault (I forget
> the details).  We have to stop at the top of userspace.

If you look at the before and after state of this patch,
fault_in_pages_readable and fault_in_pages_writeable did fail an
attempt to fault in a range that wraps with -EFAULT. That's sensible
for a function that returns an all-or-nothing result. We now want to
return how much of the range was (or wasn't) faulted in. We could do
that and still reject ranges that wrap outright. Or we could try to
fault in however much we reasonably can even if the range wraps. The
patch tries the latter, which is where the stopping at NULL is coming
from: when the range wraps, we *definitely* don't want to go any
further.

If the range extends into the hole, we'll get a failure from
__get_user or __put_user where that happens. That's entirely the
expected result, isn't it?

Thanks,
Andreas

