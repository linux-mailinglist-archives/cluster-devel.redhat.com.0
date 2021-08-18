Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A8DBD3F0DAF
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Aug 2021 23:50:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-93j5HVjaOaKrmFgWVh5BCg-1; Wed, 18 Aug 2021 17:50:06 -0400
X-MC-Unique: 93j5HVjaOaKrmFgWVh5BCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8047A1008060;
	Wed, 18 Aug 2021 21:50:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B244410016FB;
	Wed, 18 Aug 2021 21:50:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C94531826D03;
	Wed, 18 Aug 2021 21:50:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17ILnrkm020299 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 18 Aug 2021 17:49:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E605F894C; Wed, 18 Aug 2021 21:49:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59705F885B
	for <cluster-devel@redhat.com>; Wed, 18 Aug 2021 21:49:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7B8C801E6D
	for <cluster-devel@redhat.com>; Wed, 18 Aug 2021 21:49:49 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-43-VzEhrqr3OSyporGtlpGibA-1; Wed, 18 Aug 2021 17:49:47 -0400
X-MC-Unique: VzEhrqr3OSyporGtlpGibA-1
Received: by mail-lj1-f176.google.com with SMTP id q21so7733943ljj.6
	for <cluster-devel@redhat.com>; Wed, 18 Aug 2021 14:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iJVkGRZsMGQxCh04dQEEetPATyoitTCuRRt3dR/OwaQ=;
	b=Gg6KqjOHib7vRzF4vQBYjS4kivUljL/N/61ttwA7DAyKhqLtpww1KbrJDcaEaA2Aky
	PSxe2JxxMBEXrTT1x72BheCFDgV17p0WuztupuYyS5S44gC7993KbWjtFV6SYuDA3ZPX
	0fGLdVYqRUv0QxoahS4p9yFKZqsN1W26NYEuH+uCjot4ApBo1RoCI0wCvwQqtHZdfqzM
	e7V/EaDI74EbdQsSrh1sI42viFHCXx+D2xW4NdlJ1aXxSs3SRTTuyvBSsMkmUMVuFq2Y
	DEBTbnsUnHp8OiVC+1jlkvZK9W1H6VpuFHzpf5BBe+jNyP0Bt02xI2BmGyPINRtrRqC3
	QozQ==
X-Gm-Message-State: AOAM530N3sCjuhX5uZQUP/kW+ZM1AuY/Fl8BCZxKLEYvdO+KtBc7xlCh
	pF7U/07lCgBE1dE54SultxSQr4GjNLg87sOw
X-Google-Smtp-Source: ABdhPJyg+z/CHjFUq3CwkKwQGRGphu1dLg3tDlGprW0uMuSUiedR9s6088Zc1DG6wEC9/Stfh5X7rw==
X-Received: by 2002:a2e:9304:: with SMTP id e4mr9599063ljh.244.1629323386130; 
	Wed, 18 Aug 2021 14:49:46 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
	[209.85.167.49])
	by smtp.gmail.com with ESMTPSA id n26sm87605lfq.71.2021.08.18.14.49.44
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 18 Aug 2021 14:49:44 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id w20so7788529lfu.7
	for <cluster-devel@redhat.com>; Wed, 18 Aug 2021 14:49:44 -0700 (PDT)
X-Received: by 2002:ac2:5a1a:: with SMTP id q26mr7636192lfn.41.1629323384436; 
	Wed, 18 Aug 2021 14:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210803191818.993968-1-agruenba@redhat.com>
	<CAHk-=wj+_Y7NQ-NhhE0jk52c9ZB0VJbO1AjtMJFB8wP=PO+bdw@mail.gmail.com>
	<CAHc6FU6H5q20qiQ5FX1726i0FJHyh=Y46huWkCBZTR3sk+3Dhg@mail.gmail.com>
In-Reply-To: <CAHc6FU6H5q20qiQ5FX1726i0FJHyh=Y46huWkCBZTR3sk+3Dhg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Aug 2021 14:49:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=whBCm3G5yibbvQsTn00fA16a688NTU_geQV158DnRy+bQ@mail.gmail.com>
Message-ID: <CAHk-=whBCm3G5yibbvQsTn00fA16a688NTU_geQV158DnRy+bQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
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
Cc: kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v5 00/12] gfs2: Fix mmap + page fault
	deadlocks
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

[ Sorry for the delay, I was on the road and this fell through the cracks ]

On Mon, Aug 16, 2021 at 12:14 PM Andreas Gruenbacher
<agruenba@redhat.com> wrote:
>
> On Tue, Aug 3, 2021 at 9:45 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Hmm. Have you tried to figure out why that "still returns 0" happens?
>
> The call stack is:
>
> gup_pte_range
> gup_pmd_range
> gup_pud_range
> gup_p4d_range
> gup_pgd_range
> lockless_pages_from_mm
> internal_get_user_pages_fast
> get_user_pages_fast
> iov_iter_get_pages
> __bio_iov_iter_get_pages
> bio_iov_iter_get_pages
> iomap_dio_bio_actor
> iomap_dio_actor
> iomap_apply
> iomap_dio_rw
> gfs2_file_direct_write
>
> In gup_pte_range, pte_special(pte) is true and so we return 0.

Ok, so that is indeed something that the fast-case can't handle,
because some of the special code wants to have the mm_lock so that it
can look at the vma flags (eg "vm_normal_page()" and friends.

That said, some of these cases even the full GUP won't ever handle,
simply because a mapping doesn't necessarily even _have_ a 'struct
page' associated with it if it's a VM_IO mapping.

So it turns out that you can't just always do
fault_in_iov_iter_readable() and then assume that you can do
iov_iter_get_pages() and repeat until successful.

We could certainly make get_user_pages_fast() handle a few more cases,
but I get the feeling that we need to have separate error cases for
EFAULT - no page exists - and the "page exists, but cannot be mapped
as a 'struct page'" case.

I also do still think that even regardless of that, we want to just
add a FOLL_NOFAULT flag that just disables calling handle_mm_fault(),
and then you can use the regular get_user_pages().

That at least gives us the full _normal_ page handling stuff.

                   Linus

