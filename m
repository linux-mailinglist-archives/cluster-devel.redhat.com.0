Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D016D4B280B
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Feb 2022 15:37:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-LKXXxixHOnugnwUKjKU1DQ-1; Fri, 11 Feb 2022 09:37:51 -0500
X-MC-Unique: LKXXxixHOnugnwUKjKU1DQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A1B7100CCDC;
	Fri, 11 Feb 2022 14:37:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACFDD2B59A;
	Fri, 11 Feb 2022 14:37:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0A4D1809CB8;
	Fri, 11 Feb 2022 14:37:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21BEbUI3022586 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Feb 2022 09:37:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B8F9F2166BB3; Fri, 11 Feb 2022 14:37:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4DB32166B47
	for <cluster-devel@redhat.com>; Fri, 11 Feb 2022 14:37:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1614802317
	for <cluster-devel@redhat.com>; Fri, 11 Feb 2022 14:37:27 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-588-BlvTQQ18OwaiD9gYnUz95w-1; Fri, 11 Feb 2022 09:37:24 -0500
X-MC-Unique: BlvTQQ18OwaiD9gYnUz95w-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1nIX2t-00AThU-BS; Fri, 11 Feb 2022 14:37:11 +0000
Date: Fri, 11 Feb 2022 14:37:11 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <YgZ0lyr91jw6JaHg@casper.infradead.org>
References: <20220209085243.3136536-1-lee.jones@linaro.org>
	<20220210045911.GF8338@magnolia> <YgTl2Lm9Vk50WNSj@google.com>
MIME-Version: 1.0
In-Reply-To: <YgTl2Lm9Vk50WNSj@google.com>
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
	"Darrick J. Wong" <djwong@kernel.org>,
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 10, 2022 at 10:15:52AM +0000, Lee Jones wrote:
> On Wed, 09 Feb 2022, Darrick J. Wong wrote:
> 
> > On Wed, Feb 09, 2022 at 08:52:43AM +0000, Lee Jones wrote:
> > > This reverts commit 60263d5889e6dc5987dc51b801be4955ff2e4aa7.
> > > 
> > > Reverting since this commit opens a potential avenue for abuse.
> > 
> > What kind of abuse?  Did you conclude there's an avenue solely because
> > some combination of userspace rigging produced a BUG warning?  Or is
> > this a real problem that someone found?
> 
> Genuine question: Is the ability for userspace to crash the kernel
> not enough to cause concern?  I would have thought that we'd want to
> prevent this.

The kernel doesn't crash.  It's a BUG().  That means it kills the
task which caused the BUG().  If you've specified that the kernel should
crash on seeing a BUG(), well, you made that decision, and you get to
live with the consequences.

> The link provided doesn't contain any further analysis.  Only the
> reproducer and kernel configuration used, which are both too large to
> enter into a Git commit.

But not too large to put in an email.  Which you should have sent to
begin with, not a stupid reversion commit.

> > OH WAIT, you're running this on the Android 5.10 kernel, aren't you?
> > The BUG report came from page_buffers failing to find any buffer heads
> > attached to the page.
> > https://android.googlesource.com/kernel/common/+/refs/heads/android12-5.10-2022-02/fs/ext4/inode.c#2647
> 
> Yes, the H/W I have to prototype these on is a phone and the report
> that came in was specifically built against the aforementioned
> kernel.
> 
> > Yeah, don't care.
> 
> "There is nothing to worry about, as it's intended behaviour"?

No.  You've come in like a fucking meteorite full of arrogance and
ignorance.  Nobody's reacting well to you right now.  Start again,
write a good bug report in a new thread.

