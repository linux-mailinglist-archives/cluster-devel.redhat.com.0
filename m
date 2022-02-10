Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B74F54B0A5C
	for <lists+cluster-devel@lfdr.de>; Thu, 10 Feb 2022 11:17:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-IJGf2weLPdW97nrv2nX_ww-1; Thu, 10 Feb 2022 05:16:56 -0500
X-MC-Unique: IJGf2weLPdW97nrv2nX_ww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08921190A7A1;
	Thu, 10 Feb 2022 10:16:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17E8327C49;
	Thu, 10 Feb 2022 10:16:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 098221809CB8;
	Thu, 10 Feb 2022 10:16:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21AAGhQb013054 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 10 Feb 2022 05:16:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7FFF02166BA9; Thu, 10 Feb 2022 10:16:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BC012166BA4
	for <cluster-devel@redhat.com>; Thu, 10 Feb 2022 10:16:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AB3A811E78
	for <cluster-devel@redhat.com>; Thu, 10 Feb 2022 10:16:40 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-512-WkYw2ThJMMKOCuy1mMTGmg-1; Thu, 10 Feb 2022 05:16:38 -0500
X-MC-Unique: WkYw2ThJMMKOCuy1mMTGmg-1
Received: by mail-wm1-f47.google.com with SMTP id r131so3140754wma.1
	for <cluster-devel@redhat.com>; Thu, 10 Feb 2022 02:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=p2L2JMGAHF/fA4cXJq0+NeV9Ap/R7fib8dscPh33vcg=;
	b=Gpw4HwfdsqXKfyXXjoBmkFFDpY5gpXG7ohjjY5a3Vb33j7OFamMyBAF9YzX/pkrAqS
	4UOjXxxntxK2Jq+m3gbObYUG/e3uKGLv7X4OwH6QL8gqjbZvzn0ZIeGu0SbWUCPfvh1d
	zTs1wrAFKoFG34JW//wCuLeoOZCgftVJJJdu3uvZ3t1FZd3mwOZc9vxC4oY+ws4oRdgY
	Zu6LxnH5S4SzRbpYRaVwMr1LM2fyyLvOso3zRoxS6k0M7RGGXUykT74n2buXja5ozfRi
	I4q6iNvMn4P+xOxst0577xv9L8awYEsVjdIDdIgEwJ0msGfQ6VjwHqtMlXeWRVsKglIV
	Sylg==
X-Gm-Message-State: AOAM533dlCUmSpeHdWy3qxCfgeJKoktyzcM+X/bk+U2S3+QOgkdvP32b
	dWn66dsCGmbnkzlk4hDa5UScrg==
X-Google-Smtp-Source: ABdhPJyqF2XvTy7u6DWP/6ivautdkeYnX0LG3m5hhXZW9KBraONCYgZP5/iwGcxiCbFl24LtFFh+PA==
X-Received: by 2002:a05:600c:2058:: with SMTP id
	p24mr1538504wmg.3.1644488197579; 
	Thu, 10 Feb 2022 02:16:37 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
	[86.27.177.88])
	by smtp.gmail.com with ESMTPSA id y1sm1328053wmi.36.2022.02.10.02.15.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Feb 2022 02:15:55 -0800 (PST)
Date: Thu, 10 Feb 2022 10:15:52 +0000
From: Lee Jones <lee.jones@linaro.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <YgTl2Lm9Vk50WNSj@google.com>
References: <20220209085243.3136536-1-lee.jones@linaro.org>
	<20220210045911.GF8338@magnolia>
MIME-Version: 1.0
In-Reply-To: <20220210045911.GF8338@magnolia>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	linux-kernel@vger.kernel.org, Stable <stable@vger.kernel.org>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Ritesh Harjani <riteshh@linux.ibm.com>,
	Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Goldwyn Rodrigues <rgoldwyn@suse.com>,
	syzbot+0ed9f769264276638893@syzkaller.appspotmail.com
Subject: Re: [Cluster-devel] [PATCH 1/1] Revert "iomap: fall back to
 buffered writes for invalidation failures"
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, 09 Feb 2022, Darrick J. Wong wrote:

> On Wed, Feb 09, 2022 at 08:52:43AM +0000, Lee Jones wrote:
> > This reverts commit 60263d5889e6dc5987dc51b801be4955ff2e4aa7.
> > 
> > Reverting since this commit opens a potential avenue for abuse.
> 
> What kind of abuse?  Did you conclude there's an avenue solely because
> some combination of userspace rigging produced a BUG warning?  Or is
> this a real problem that someone found?

Genuine question: Is the ability for userspace to crash the kernel
not enough to cause concern?  I would have thought that we'd want to
prevent this.

If by 'real problem' you mean; privilege escalation, memory corruption
or data leakage, then no, I haven't found any evidence of that.
However, that's not to say these aren't possible as a result of this
issue, just that I do not have the skills or knowledge to be able to
turn this into a demonstrable attack vector.

However, if you say there is no issue, I'm happy to take your word.

> > The C-reproducer and more information can be found at the link below.
> 
> No.  Post the information and your analysis here.  I'm not going to dig
> into some Google site to find out what happened, and I'm not going to
> assume that future developers will be able to access that URL to learn
> why this patch was created.

The link provided doesn't contain any further analysis.  Only the
reproducer and kernel configuration used, which are both too large to
enter into a Git commit.

> >   kernel BUG at fs/ext4/inode.c:2647!
> >   invalid opcode: 0000 [#1] PREEMPT SMP KASAN
> >   CPU: 0 PID: 459 Comm: syz-executor359 Tainted: G        W         5.10.93-syzkaller-01028-g0347b1658399 #0
> 
> What BUG on fs/ext4/inode.c:2647?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/fs/ext4/inode.c?h=v5.10.93#n2647
> 
> All I see is a call to pagevec_release()?  There's a BUG_ON further up
> if we wait for page writeback but then it still has Writeback set.  But
> I don't see anything in pagevec_release that would actually result in a
> BUG warning.

Right, this BUG back-trace was taken from the kernel I received the
bug report for.  I should have used the one I triggered in Mainline,
apologies for that.

The real source of the BUG is in the inlined call to page_buffers().

Here is the link for the latest release kernel:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/fs/ext4/inode.c?h=v5.16#n2620

#define page_buffers(page)                                      \
        ({                                                      \
                BUG_ON(!PagePrivate(page));                     \
                ((struct buffer_head *)page_private(page));     \
        })

> Oh, right, this is one of those inscrutable syzkaller things, where a
> person can spend hours figuring out what the hell it set up.

A link to the config used (again too big to enter into a commit
message), can be easily sourced from the link provided.

> Yeah...no, you don't get to submit patches to core kernel code, claim
> it's not your responsibility to know anything about a subsystem that you
> want to patch, and then expect us to do the work for you.  If you pick
> up a syzkaller report, you get to figure out what broke, why, and how to
> fix it in a reasonable manner.
> 
> You're a maintainer, would you accept a patch like this?

No.  I would share my knowledge to provide a helpful review and work
with the contributor to find a solution (if applicable).

> OH WAIT, you're running this on the Android 5.10 kernel, aren't you?
> The BUG report came from page_buffers failing to find any buffer heads
> attached to the page.
> https://android.googlesource.com/kernel/common/+/refs/heads/android12-5.10-2022-02/fs/ext4/inode.c#2647

Yes, the H/W I have to prototype these on is a phone and the report
that came in was specifically built against the aforementioned
kernel.

> Yeah, don't care.

"There is nothing to worry about, as it's intended behaviour"?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

