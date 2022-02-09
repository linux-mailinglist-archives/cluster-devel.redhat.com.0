Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA5D4AFD80
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Feb 2022 20:31:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-YkIzseXKOOq_VB_wuD4CYA-1; Wed, 09 Feb 2022 14:31:40 -0500
X-MC-Unique: YkIzseXKOOq_VB_wuD4CYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 736C3184C5E8;
	Wed,  9 Feb 2022 19:31:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60B55196F1;
	Wed,  9 Feb 2022 19:31:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E83244BB7C;
	Wed,  9 Feb 2022 19:31:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 219JVYLR001505 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 9 Feb 2022 14:31:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 82CF9140240C; Wed,  9 Feb 2022 19:31:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7ED99141DC29
	for <cluster-devel@redhat.com>; Wed,  9 Feb 2022 19:31:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 013371C05EBB
	for <cluster-devel@redhat.com>; Wed,  9 Feb 2022 19:31:34 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-365-fC10NPCQMvuEhYnRpN4THA-1; Wed, 09 Feb 2022 14:31:30 -0500
X-MC-Unique: fC10NPCQMvuEhYnRpN4THA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1nHsNu-008U5F-Dw; Wed, 09 Feb 2022 19:12:10 +0000
Date: Wed, 9 Feb 2022 19:12:10 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <YgQSCoD5j9KbpHsA@casper.infradead.org>
References: <20220209085243.3136536-1-lee.jones@linaro.org>
	<20220209150904.GA22025@lst.de> <YgPk9HhIeFM43b/a@google.com>
MIME-Version: 1.0
In-Reply-To: <YgPk9HhIeFM43b/a@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 09, 2022 at 03:59:48PM +0000, Lee Jones wrote:
> On Wed, 09 Feb 2022, Christoph Hellwig wrote:
> 
> > On Wed, Feb 09, 2022 at 08:52:43AM +0000, Lee Jones wrote:
> > > This reverts commit 60263d5889e6dc5987dc51b801be4955ff2e4aa7.
> > > 
> > > Reverting since this commit opens a potential avenue for abuse.
> > > 
> > > The C-reproducer and more information can be found at the link below.
> > > 
> > > With this patch applied, I can no longer get the repro to trigger.
> > 
> > Well, maybe you should actually debug and try to understand what is
> > going on before blindly reverting random commits.
> 
> That is not a reasonable suggestion.
> 
> Requesting that someone becomes an area expert on a huge and complex
> subject such as file systems (various) in order to fix your broken
> code is not rational.

Sending a patch to revert a change you don't understand is also
not rational.  If you've bisected it to a single change -- great!
If reverting the patch still fixes the bug -- also great!  But
don't send a patch when you clearly don't understand what the
patch did.

> If you'd like to use the PoC provided as a basis to test your own
> solution, then go right ahead.  However, as it stands this API should
> be considered to contain security risk and should be patched as
> quickly as can be mustered.  Reversion of the offending commit seems
> to be the fastest method to achieve that currently.

This is incoherent.  There is no security risk.

