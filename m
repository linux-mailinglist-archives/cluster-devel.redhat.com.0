Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id AD0013DF5FE
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Aug 2021 21:49:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-yMhb3ECONvCYhvc9gJjXFA-1; Tue, 03 Aug 2021 15:49:43 -0400
X-MC-Unique: yMhb3ECONvCYhvc9gJjXFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 025F8107ACF5;
	Tue,  3 Aug 2021 19:49:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E82741383C;
	Tue,  3 Aug 2021 19:49:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4FDA180BAB0;
	Tue,  3 Aug 2021 19:49:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 173JjTvc013549 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Aug 2021 15:45:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1A14BDAF37; Tue,  3 Aug 2021 19:45:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14AA59E9B
	for <cluster-devel@redhat.com>; Tue,  3 Aug 2021 19:45:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8667D89C7E2
	for <cluster-devel@redhat.com>; Tue,  3 Aug 2021 19:45:26 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-573-B-DwKuiLPx2fOOrftg-eLA-1; Tue, 03 Aug 2021 15:45:24 -0400
X-MC-Unique: B-DwKuiLPx2fOOrftg-eLA-1
Received: by mail-lj1-f182.google.com with SMTP id a7so29492414ljq.11
	for <cluster-devel@redhat.com>; Tue, 03 Aug 2021 12:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wgvkBYw+RpMWC0ZlFt+HsFq+ODf+zPXLM/hz4eQHmew=;
	b=OUYmhGaIGO1llQuMSGuA5+M1GxfUIez9wPqT0h3OWYTyYDinIodWncOlVWctEXl+Ge
	tqWlcUzndcTX+meb/k3goRFQQibf5vGMybZcHhBVtrWZ7ir1/B9fqqoikaKMS6M2rcNc
	WofdS4XqzQI/sfAzrhxdDJTVpne57m6jTJW3oMNVIH16kUd55ymYAgUFsxgG5mcrDiZw
	iYFJJKOzzX8oWPloolJgxmICxJlBUg6BU4I8WcB5wzBw1RSD6wuPn4Zb5qJt84vNuR0I
	uOm0FuzqOHZnGblRJNxroflCkJ9gCwrQhpu7E91r7ZrjHxua8b2fxH4go51ehssGXQv8
	tJBw==
X-Gm-Message-State: AOAM533Z+WooReDJoqmgweDyBZFU3NvTrh0aLRE6Fx+BVKoXV6JfkE0S
	em4p8eGe0NVZWrpcsMTRYUcnzTJa/CwDWpCn
X-Google-Smtp-Source: ABdhPJyJVkEPbyAWCMheDyzdNfCRsuwUdO34GiyY8TN5hLJs8rtDR6UDluJmQVgVMkt5bmO9y019/Q==
X-Received: by 2002:a2e:535c:: with SMTP id t28mr15487093ljd.129.1628019922908;
	Tue, 03 Aug 2021 12:45:22 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
	[209.85.208.178])
	by smtp.gmail.com with ESMTPSA id t20sm29931ljk.113.2021.08.03.12.45.20
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Aug 2021 12:45:21 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id m18so5736071ljo.1
	for <cluster-devel@redhat.com>; Tue, 03 Aug 2021 12:45:20 -0700 (PDT)
X-Received: by 2002:a2e:84c7:: with SMTP id q7mr15542412ljh.61.1628019920208; 
	Tue, 03 Aug 2021 12:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210803191818.993968-1-agruenba@redhat.com>
In-Reply-To: <20210803191818.993968-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 3 Aug 2021 12:45:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj+_Y7NQ-NhhE0jk52c9ZB0VJbO1AjtMJFB8wP=PO+bdw@mail.gmail.com>
Message-ID: <CAHk-=wj+_Y7NQ-NhhE0jk52c9ZB0VJbO1AjtMJFB8wP=PO+bdw@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 3, 2021 at 12:18 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
>
> With this patch queue, fstest generic/208 (aio-dio-invalidate-failure.c)
> endlessly spins in gfs2_file_direct_write.  It looks as if there's a bug
> in get_user_pages_fast when called with FOLL_FAST_ONLY:
>
>  (1) The test case performs an aio write into a 32 MB buffer.
>
>  (2) The buffer is initially not in memory, so when iomap_dio_rw() ->
>      ... -> bio_iov_iter_get_pages() is called with the iter->noio flag
>      set, we get to get_user_pages_fast() with FOLL_FAST_ONLY set.
>      get_user_pages_fast() returns 0, which causes
>      bio_iov_iter_get_pages to return -EFAULT.
>
>  (3) Then gfs2_file_direct_write faults in the entire buffer with
>      fault_in_iov_iter_readable(), which succeeds.
>
>  (4) With the buffer in memory, we retry the iomap_dio_rw() ->
>      ... -> bio_iov_iter_get_pages() -> ... -> get_user_pages_fast().
>      This should succeed now, but get_user_pages_fast() still returns 0.

Hmm. Have you tried to figure out why that "still returns 0" happens?

One option - for debugging only - would be to introduce a new flag to
get_user_pages_fast() tyhat says "print out reason if failed" and make
the retry (but not the original one) have that flag set.

There are a couple of things of note when it comes to "get_user_pages_fast()":

 (a) some architectures don't even enable it

 (b) it can be very picky about the page table contents, and wants the
accessed bit to already be set (or the dirty bit, in the case of a
write).

but (a) shouldn't be an issue on any common platform and (b) shouldn't
be an issue with  fault_in_iov_iter_readable() that actually does a
__get_user() so it will access through the page tables.

(It might be more of an issue with fault_in_iov_iter_writable() due to
walking the page tables by hand - if we don't do the proper
access/dirty setting, I could see get_user_pages_fast() failing).

Anyway, for reason (a) I do think that eventually we should probably
introduce FOLL_NOFAULT, and allow the full "slow" page table walk -
just not calling down to handle_mm_fault() if it fails.

But (a) should be a non-issue in your test environment, and so it
would be interesting to hear what it is that fails. Because scanning
through the patches, they all _look_ fine to me (apart from the one
comment about return values, which is more about being consistent with
copy_to/from_user() and making the code simpler - not about
correctness)

                       Linus

