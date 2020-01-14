Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A1B7213AFA8
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 17:40:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579020058;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3u2kUA6coBdN3dgWHg2Sb1VRgP/A+2k5escnkKqNrfs=;
	b=fHhZB00Hnz5Px7Pcr7uQLnLI2gDkFSc90bdvm6W53lC8aP+R8AtBQs0rUveMw8tPo32VBC
	hY/n6TDNQIdw3rnncQrqvK7vTsYlVOmUV1ghGdFyu/gMTQej2vC4vDchorqyUibf7fCB2s
	Q/vQ4TBV4KBI2IrzCKovSz7b0uEIJ/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-N1keg2lyMHWMwSDovGAGpA-1; Tue, 14 Jan 2020 11:40:57 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B2F013419B;
	Tue, 14 Jan 2020 16:40:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D47A884BBB;
	Tue, 14 Jan 2020 16:40:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8EA2B845C4;
	Tue, 14 Jan 2020 16:40:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EGeqOA021572 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 11:40:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5019C2166B2B; Tue, 14 Jan 2020 16:40:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B9C42166B28
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C12B8F7A3E
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-345-hfgh1fRYOZO1HQzsFzVjbA-1; Tue, 14 Jan 2020 11:40:50 -0500
Received: from [2001:4bb8:18c:4f54:fcbb:a92b:61e1:719] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irOnr-000073-FS; Tue, 14 Jan 2020 16:12:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org, 
	cluster-devel@redhat.com
Date: Tue, 14 Jan 2020 17:12:13 +0100
Message-Id: <20200114161225.309792-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: hfgh1fRYOZO1HQzsFzVjbA-1
X-MC-Unique: N1keg2lyMHWMwSDovGAGpA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00EGeqOA021572
X-loop: cluster-devel@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] RFC: hold i_rwsem until aio completes
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Asynchronous read/write operations currently use a rather magic locking
scheme, were access to file data is normally protected using a rw_semaphore=
,
but if we are doing aio where the syscall returns to userspace before the
I/O has completed we also use an atomic_t to track the outstanding aio
ops.  This scheme has lead to lots of subtle bugs in file systems where
didn't wait to the count to reach zero, and due to its adhoc nature also
means we have to serialize direct I/O writes that are smaller than the
file system block size.

All this is solved by releasing i_rwsem only when the I/O has actually
completed, but doings so is against to mantras of Linux locking primites:

 (1) no unlocking by another process than the one that acquired it
 (2) no return to userspace with locks held

It actually happens we have various places that work around this.  A few
callers do non-owner unlocks of rwsems, which are pretty nasty for
PREEMPT_RT as the owner tracking doesn't work.  OTOH the file system
freeze code has both problems and works around them a little better,
although in a somewhat awkward way, in that it releases the lockdep
object when returning to userspace, and reacquires it when done, and
also clears the rwsem owner when returning to userspace, and then sets
the new onwer before unlocking.

This series tries to follow that scheme, also it doesn't fully work.  The
first issue is that the rwsem code has a bug where it doesn't properly
handle clearing the owner.  This series has a patch to fix that, but it
is ugly and might not be correct so some help is needed.  Second I/O
completions often come from interrupt context, which means the re-acquire
is recorded as from irq context, leading to warnings about incorrect
contexts.  I wonder if we could just have a bit in lockdep that says
returning to userspace is ok for this particular lock?  That would also
clean up the fsfreeze situation a lot.

Let me know what you think of all this.  While I converted all the iomap
using file systems only XFS is actually tested.

Diffstat:

 24 files changed, 144 insertions(+), 180 deletions(-)


