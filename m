Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 04DD940054D
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Sep 2021 20:49:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-WF5YJTnoOXqiKQbkxY7dbg-1; Fri, 03 Sep 2021 14:49:42 -0400
X-MC-Unique: WF5YJTnoOXqiKQbkxY7dbg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30407802B9F;
	Fri,  3 Sep 2021 18:49:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FF036A91E;
	Fri,  3 Sep 2021 18:49:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05C4544A5A;
	Fri,  3 Sep 2021 18:49:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 183Im3R3018858 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Sep 2021 14:48:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 155DD117C2F6; Fri,  3 Sep 2021 18:48:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10C0A117C2CF
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 18:47:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C83888647A
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 18:47:59 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-564-CAEug5dqMKydOJNEc7f1yA-1;
	Fri, 03 Sep 2021 14:47:57 -0400
X-MC-Unique: CAEug5dqMKydOJNEc7f1yA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 779DE610A1;
	Fri,  3 Sep 2021 18:47:56 +0000 (UTC)
Date: Fri, 3 Sep 2021 11:47:55 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20210903184755.GC9892@magnolia>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-17-agruenba@redhat.com>
	<20210827183018.GJ12664@magnolia>
	<CAHc6FU44mGza=G4prXh08=RJZ0Wu7i6rBf53BjURj8oyX5Q8iA@mail.gmail.com>
	<20210827213239.GH12597@magnolia>
	<CAHk-=whCCyxkk+wfDZ5bQNX62MfdprBLpy_RwpSFhFziA2Oecg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=whCCyxkk+wfDZ5bQNX62MfdprBLpy_RwpSFhFziA2Oecg@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 16/19] iomap: Add done_before
	argument to iomap_dio_rw
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 27, 2021 at 03:35:06PM -0700, Linus Torvalds wrote:
> On Fri, Aug 27, 2021 at 2:32 PM Darrick J. Wong <djwong@kernel.org> wrote:
> >
> > No, because you totally ignored the second question:
> >
> > If the directio operation succeeds even partially and the PARTIAL flag
> > is set, won't that push the iov iter ahead by however many bytes
> > completed?
> >
> > We already finished the IO for the first page, so the second attempt
> > should pick up where it left off, i.e. the second page.
> 
> Darrick, I think you're missing the point.
> 
> It's the *return*value* that is the issue, not the iovec.
> 
> The iovec is updated as you say. But the return value from the async
> part is - without Andreas' patch - only the async part of it.
> 
> With Andreas' patch, the async part will now return the full return
> value, including the part that was done synchronously.
> 
> And the return value is returned from that async part, which somehow
> thus needs to know what predated it.

Aha, that was the missing piece, thank you.  I'd forgotten that
iomap_dio_complete_work calls iocb->ki_complete with the return value of
iomap_dio_complete, which means that the iomap_dio has to know if there
was a previous transfer that stopped short so that the caller could do
more work and resubmit.

> Could that pre-existing part perhaps be saved somewhere else? Very
> possibly. That 'struct iomap_dio' addition is kind of ugly. So maybe
> what Andreas did could be done differently.

There's probably a more elegant way for the ->ki_complete functions to
figure out how much got transferred, but that's sufficiently ugly and
invasive so as not to be suitable for a bug fix.

> But I think you guys are arguing past each other.

Yes, definitely.

--D

> 
>            Linus

