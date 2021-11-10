Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3581A44C6AF
	for <lists+cluster-devel@lfdr.de>; Wed, 10 Nov 2021 19:15:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636568152;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=so+sBHeqgvGbAB6xWn0/t+WSQWf4kEYIfTA/NVWhLec=;
	b=XxeE+768TgswWBTazHZmU19+voLkAzEJsN3bd5hSeXsbClYpFDnE43dOfPgZwK59RRP1lq
	XPe6pPVEmtp4dDt2XZOwiXvsPTXTnYNXMQbnFl8/b3J3mbwFPrViO49ojNzbWVNPx0XC/a
	IpQwcqcjbZ9DWtuQmxoj931/Rcb9arA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-IE9fhJprMy-rWNZrU312GA-1; Wed, 10 Nov 2021 13:15:48 -0500
X-MC-Unique: IE9fhJprMy-rWNZrU312GA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D75B51922961;
	Wed, 10 Nov 2021 18:15:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C08019D9D;
	Wed, 10 Nov 2021 18:15:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1873318199EE;
	Wed, 10 Nov 2021 18:15:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AAHjI2f031415 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 10 Nov 2021 12:45:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 06EAC67859; Wed, 10 Nov 2021 17:45:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.195.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7173367854;
	Wed, 10 Nov 2021 17:44:58 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 10 Nov 2021 18:44:57 +0100
Message-Id: <20211110174457.533866-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	cluster-devel@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [Cluster-devel] [RFC] gfs2: Prevent endless loops in
	gfs2_file_buffered_write
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Linus,

in commit 00bfe02f4796 ("gfs2: Fix mmap + page fault deadlocks for
buffered I/O"), I've managed to introduce a hang in gfs2 due to the
following check in iomap_write_iter:

  if (unlikely(fault_in_iov_iter_readable(i, bytes))) {

which fails if any of the iov iterator cannot be faulted in for reading.
At the filesystem level, we're retrying the rest of the write if any of
the iov iterator can be faulted in, so we can end up in a loop without
ever making progress.  The fix in iomap_write_iter would be as follows:

  if (unlikely(fault_in_iov_iter_readable(i, bytes) == bytes)) {

The same bug exists in generic_perform_write, but I'm not aware of any
callers of generic_perform_write that have page faults turned off.

Is this fix still appropriate for 5.16, or should we work around it in
the filesystem as below for now?

A related post-5.16 option would be to turn the pre-faulting in
iomap_write_iter and generic_perform_write into post-faulting, but at
the very least, that still needs a bit of performance analysis:

  https://lore.kernel.org/linux-fsdevel/20211026094430.3669156-1-agruenba@redhat.com/
  https://lore.kernel.org/linux-fsdevel/20211027212138.3722977-1-agruenba@redhat.com/

Thanks,
Andreas

---
 fs/gfs2/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index c486b702e00f..3e718cfc19a7 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1013,6 +1013,7 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 	struct gfs2_holder *statfs_gh = NULL;
 	size_t prev_count = 0, window_size = 0;
+	size_t orig_count = iov_iter_count(from);
 	size_t read = 0;
 	ssize_t ret;
 
@@ -1057,6 +1058,7 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 	if (inode == sdp->sd_rindex)
 		gfs2_glock_dq_uninit(statfs_gh);
 
+	from->count = orig_count - read;
 	if (should_fault_in_pages(ret, from, &prev_count, &window_size)) {
 		size_t leftover;
 
@@ -1064,6 +1066,7 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 		leftover = fault_in_iov_iter_readable(from, window_size);
 		gfs2_holder_disallow_demote(gh);
 		if (leftover != window_size) {
+			from->count = min(from->count, window_size - leftover);
 			if (!gfs2_holder_queued(gh)) {
 				if (read)
 					goto out_uninit;
-- 
2.31.1

