Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 95FF842976B
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 21:16:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-EpFl32gsOKGzN7i-13hV6Q-1; Mon, 11 Oct 2021 15:16:12 -0400
X-MC-Unique: EpFl32gsOKGzN7i-13hV6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82DDF100B3AD;
	Mon, 11 Oct 2021 19:16:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7466960BE5;
	Mon, 11 Oct 2021 19:16:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A00084E58E;
	Mon, 11 Oct 2021 19:16:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BJG5AK027253 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 15:16:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DC874047279; Mon, 11 Oct 2021 19:16:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29B424047272
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:16:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1197D811E9A
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:16:05 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-359-RpbQcBalO8CIAr9keyT_LQ-1; Mon, 11 Oct 2021 15:16:02 -0400
X-MC-Unique: RpbQcBalO8CIAr9keyT_LQ-1
Received: by mail-lf1-f50.google.com with SMTP id z11so68882986lfj.4
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 12:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8GEklByxwtz5UkrPD1VA8xZriJ2DJzNE/WJEIN7V+8A=;
	b=Esfzg20Pu0FF+Q1M4QImzyfprp2ysGaaYGvpIZoZ4+Ve7F30gh5AcMiGf1Y95BBIVK
	D5DGeja8AZnhMNjvdv8rORNxVGWjwKWRKFPv0R1TfsicSdJUtnjzvExWcW9IAPBnlEaZ
	7ujm5llbwKaTyBYQfmwZo2oxAPhbZqb/jHxykjDNgKS79nP5T7ADKpSm/1SM2GktPEfm
	J+1V7J2ArZMn5eimHoixjaDA6xjad/7fts1erq5wh/ZF2mPMCSqEGS48DsXymt4rtyn3
	Bv37VYlL7WgxDKYY2+bxUbhjCfp8g7rTbQBbnSaIhAX8veySEKZnSNrAarNSloV04/4Q
	cCHQ==
X-Gm-Message-State: AOAM533hnGuORf0OLji5LNLVRLfg6YLk17+5shl/3gveMetvwN+FMwSd
	xJXugyYRH1QtDIKHi+GAz2woTBMBXdlCJbp4
X-Google-Smtp-Source: ABdhPJwsH9/AzVR90t7/+0FdOH0KnSqAgOWht4ZwO4cQKhJUVPD5Y6v3rXUNhqhw0NNBHk9oSB3EYA==
X-Received: by 2002:a05:651c:b1e:: with SMTP id
	b30mr24132443ljr.341.1633979760524; 
	Mon, 11 Oct 2021 12:16:00 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
	[209.85.167.54])
	by smtp.gmail.com with ESMTPSA id a17sm802443ljp.22.2021.10.11.12.15.59
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 11 Oct 2021 12:15:59 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id i24so75825028lfj.13
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 12:15:59 -0700 (PDT)
X-Received: by 2002:a05:6512:12d3:: with SMTP id
	p19mr30204794lfg.280.1633979759600; 
	Mon, 11 Oct 2021 12:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-6-agruenba@redhat.com>
	<YSkz025ncjhyRmlB@zeniv-ca.linux.org.uk>
	<CAHk-=wh5p6zpgUUoY+O7e74X9BZyODhnsqvv=xqnTaLRNj3d_Q@mail.gmail.com>
	<YSk7xfcHVc7CxtQO@zeniv-ca.linux.org.uk>
	<CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
	<YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSqOUb7yZ7kBoKRY@zeniv-ca.linux.org.uk> <YS40qqmXL7CMFLGq@arm.com>
	<YS5KudP4DBwlbPEp@zeniv-ca.linux.org.uk> <YWR2cPKeDrc0uHTK@arm.com>
In-Reply-To: <YWR2cPKeDrc0uHTK@arm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 11 Oct 2021 12:15:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjvQWj7mvdrgTedUW50c2fkdn6Hzxtsk-=ckkMrFoTXjQ@mail.gmail.com>
Message-ID: <CAHk-=wjvQWj7mvdrgTedUW50c2fkdn6Hzxtsk-=ckkMrFoTXjQ@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Josef Bacik <josef@toxicpanda.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Will Deacon <will@kernel.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Cluster-devel] [RFC][arm64] possible infinite loop in btrfs
	search_ioctl()
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

On Mon, Oct 11, 2021 at 10:38 AM Catalin Marinas
<catalin.marinas@arm.com> wrote:
>
> I cleaned up this patch [1] but I realised it still doesn't solve it.
> The arm64 __copy_to_user_inatomic(), while ensuring progress if called
> in a loop, it does not guarantee precise copy to the fault position.

That should be ok., We've always allowed the user copy to return early
if it does word copies and hits a page crosser that causes a fault.

Any user then has the choice of:

 - partial copies are bad

 - partial copies are handled and then you retry from the place
copy_to_user() failed at

and in that second case, the next time around, you'll get the fault
immediately (or you'll make some more progress - maybe the user copy
loop did something different just because the length and/or alignment
was different).

If you get the fault immediately, that's -EFAULT.

And if you make some more progress, it's again up to the caller to
rinse and repeat.

End result: user copy functions do not have to report errors exactly.
It is the caller that has to handle the situation.

Most importantly: "exact error or not" doesn't actually _matter_ to
the caller. If the caller does the right thing for an exact error, it
will do the right thing for an inexact one too. See above.

> The copy_to_sk(), after returning an error, starts again from the previous
> sizeof(sh) boundary rather than from where the __copy_to_user_inatomic()
> stopped. So it can get stuck attempting to copy the same search header.

That seems to be purely a copy_to_sk() bug.

Or rather, it looks like a bug in the caller. copy_to_sk() itself does

                if (copy_to_user_nofault(ubuf + *sk_offset, &sh, sizeof(sh))) {
                        ret = 0;
                        goto out;
                }

and the comment says

         *  0: all items from this leaf copied, continue with next

but that comment is then obviously not actually true in that it's not
"continue with next" at all.

But this is all very much a bug in the btrfs
search_ioctl()/copy_to_sk() code: it simply doesn't do the proper
thing for a partial result.

Because no, "just retry the whole thing" is by definition not the proper thing.

That said, I think that if we can have faults at non-page-aligned
boundaries, then we just need to make fault_in_pages_writeable() check
non-page boundaries.

> An ugly fix is to fall back to byte by byte copying so that we can
> attempt the actual fault address in fault_in_pages_writeable().

No, changing the user copy machinery is wrong. The caller really has
to do the right thing with partial results.

And I think we need to make fault_in_pages_writeable() match the
actual faulting cases - maybe remote the "pages" part of the name?

That would fix the btrfs code - it's not doing the right thing as-is,
but it's "close enough' to right that I think fixing
fault_in_pages_writeable() should fix it.

No?

             Linus

