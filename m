Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5CE3F2173
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Aug 2021 22:17:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-PI7L1r4WP4-qe0Cc9W7cuw-1; Thu, 19 Aug 2021 16:17:19 -0400
X-MC-Unique: PI7L1r4WP4-qe0Cc9W7cuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBBEA18C8C03;
	Thu, 19 Aug 2021 20:17:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86C505D741;
	Thu, 19 Aug 2021 20:17:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E3A24BB7C;
	Thu, 19 Aug 2021 20:17:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17JKEgiZ016560 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Aug 2021 16:14:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74127107262; Thu, 19 Aug 2021 20:14:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E3D010727E
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 20:14:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE94F802A9C
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 20:14:38 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-512-kdRscfrmNqeU1zWqN7prbA-1; Thu, 19 Aug 2021 16:14:37 -0400
X-MC-Unique: kdRscfrmNqeU1zWqN7prbA-1
Received: by mail-lf1-f46.google.com with SMTP id o10so15440530lfr.11
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 13:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GYLpQkQZuRNvZVwWVHs6hiU3DKifELOt1KfkaMF5F2A=;
	b=MP40F7QUq8cCqoqBPJ2/slpYPIlf5G17kdtJyeyOD9E1B2HknWykMV8Ae7+fAeWsVy
	gfkwuHEnrSh6CuEaAeXhBQZRvDMoWmeJ9yoY0UUwekMGiy0cAOrYke0OMouTB+vkM7EK
	BajgZyOICnk0PxxsxH/YBOgTGsm0a/9Q4bwBvXPX2uWCFJKJvDNl/tPYOb33Epd9U/1x
	wQLbxdU99itVWbtDUWlFAZx/yx6BlIc93mJZ8yNQ1v/VO+td871/gfPXBh9mo/+/I84G
	FAi3/CC99zy6bP4DYMmdBlF2AxhlTsbChMTRty8O2wTyusarLwjPN/yEDniYkTI0kmQ2
	2I1g==
X-Gm-Message-State: AOAM531QU7G09e9rihWngbf+YyvMhsMS7v17azk4VixVHLeEiWeQAT3y
	zVM5NuoFshadRmz5nTI9ZvkSf7o/fJpXTT3iCCs=
X-Google-Smtp-Source: ABdhPJz5ak4gRsio3POh/nyIU+s6yWRsC0+YLN5IO4LZkQGXNx+ntjMiQf2TG7bTF/yBjBs3VZtjmA==
X-Received: by 2002:ac2:4d16:: with SMTP id r22mr12527845lfi.430.1629404075447;
	Thu, 19 Aug 2021 13:14:35 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
	[209.85.208.170]) by smtp.gmail.com with ESMTPSA id
	t18sm405850lfk.239.2021.08.19.13.14.33 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 19 Aug 2021 13:14:34 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id q21so13466501ljj.6
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 13:14:33 -0700 (PDT)
X-Received: by 2002:a2e:8808:: with SMTP id x8mr13668362ljh.220.1629404073513; 
	Thu, 19 Aug 2021 13:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210803191818.993968-1-agruenba@redhat.com>
	<CAHk-=wj+_Y7NQ-NhhE0jk52c9ZB0VJbO1AjtMJFB8wP=PO+bdw@mail.gmail.com>
	<CAHc6FU6H5q20qiQ5FX1726i0FJHyh=Y46huWkCBZTR3sk+3Dhg@mail.gmail.com>
	<CAHk-=whBCm3G5yibbvQsTn00fA16a688NTU_geQV158DnRy+bQ@mail.gmail.com>
	<CAHc6FU5HHFwuJBCNuU0e_N0ehaFrzbUrCuTJyaLNC4qxwfazYA@mail.gmail.com>
In-Reply-To: <CAHc6FU5HHFwuJBCNuU0e_N0ehaFrzbUrCuTJyaLNC4qxwfazYA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Aug 2021 13:14:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgumKBhggjyR7Ff6V8VKxaJK1yA-LpWdzZFSqFyqYq0Dw@mail.gmail.com>
Message-ID: <CAHk-=wgumKBhggjyR7Ff6V8VKxaJK1yA-LpWdzZFSqFyqYq0Dw@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 19, 2021 at 12:41 PM Andreas Gruenbacher
<agruenba@redhat.com> wrote:
>
> Hmm, what if GUP is made to skip VM_IO vmas without adding anything to
> the pages array? That would match fault_in_iov_iter_writeable, which
> is modeled after __mm_populate and which skips VM_IO and VM_PFNMAP
> vmas.

I don't understand what you mean.. GUP already skips VM_IO (and
VM_PFNMAP) pages. It just returns EFAULT.

We could make it return another error. We already have DAX and
FOLL_LONGTERM returning -EOPNOTSUPP.

Of course, I think some code ends up always just returning "number of
pages looked up" and might return 0 for "no pages" rather than the
error for the first page.

So we may end up having interfaces that then lose that explanation
error code, but I didn't check.

But we couldn't make it just say "skip them and try later addresses",
if that is what you meant. THAT makes no sense - that would just make
GUP look up some other address than what was asked for.

> > I also do still think that even regardless of that, we want to just
> > add a FOLL_NOFAULT flag that just disables calling handle_mm_fault(),
> > and then you can use the regular get_user_pages().
> >
> > That at least gives us the full _normal_ page handling stuff.
>
> And it does fix the generic/208 failure.

Good. So I think the approach is usable, even if we might have corner
cases left.

So I think the remaining issue is exactly things like VM_IO and
VM_PFNMAP. Do the fstests have test-cases for things like this? It
_is_ quite specialized, it might be a good idea to have that.

Of course, doing direct-IO from special memory regions with zerocopy
might be something special people actually want to do. But I think
we've had that VM_IO flag testing there basically forever, so I don't
think it has ever worked (for some definition of "ever").

            Linus

