Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F243AF59
	for <lists+cluster-devel@lfdr.de>; Tue, 26 Oct 2021 11:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635241502;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xaM9TTYxS+zHZ2czT8usDFfzNg+0Vbk9+uFHYAEJF0k=;
	b=RaendBcIaKpS/Evb90GNPP8u8vEbc8G6koWPoVw5ZL/Wf4muyjoJdVoEVsXNttidtqWa7a
	i3ERhRwUdyfcMghmL9uOIYBcGi/UCG/MXoEn9Y2n4XZle27Npr5DKtH8S2LKtlau9+L57y
	L5XrVzbiws3exltP3dMAVJlpxXVjceo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-2-VM7HklNBGbO3ZtobxTBA-1; Tue, 26 Oct 2021 05:44:59 -0400
X-MC-Unique: 2-VM7HklNBGbO3ZtobxTBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA55119067E1;
	Tue, 26 Oct 2021 09:44:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25A701835B;
	Tue, 26 Oct 2021 09:44:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 604BF1806D04;
	Tue, 26 Oct 2021 09:44:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19Q9ieTw005831 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 26 Oct 2021 05:44:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0699319D9D; Tue, 26 Oct 2021 09:44:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.143])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9B8419C79;
	Tue, 26 Oct 2021 09:44:31 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: "Theodore Ts'o" <tytso@mit.edu>
Date: Tue, 26 Oct 2021 11:44:30 +0200
Message-Id: <20211026094430.3669156-1-agruenba@redhat.com>
In-Reply-To: <YXeOVZqer+GFBkXO@mit.edu>
References: <YXeOVZqer+GFBkXO@mit.edu>
	<20211019134204.3382645-1-agruenba@redhat.com>
	<CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
	<YXBFqD9WVuU8awIv@arm.com>
	<CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
	<YXCbv5gdfEEtAYo8@arm.com>
	<CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
	<YXL9tRher7QVmq6N@arm.com>
	<CAHc6FU6JC4ZOwA8t854WbNdmuiNL9DPq0FPga8guATaoCtvsaw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Paul Mackerras <paulus@ozlabs.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v8 00/17] gfs2: Fix mmap + page fault
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Ted,

here's an updated version of Dave Hansen's original commit, but note
that generic/208 won't run on ext4 with data journaling enabled:

  $ MOUNT_OPTIONS='-o data=journal' TEST_DIR=/mnt/test TEST_DEV=/dev/vdb ./tests/generic/208
  QA output created by 208
  208 not run: ext4 data journaling doesn't support O_DIRECT

Thanks,
Andreas

--

Based on commit 998ef75ddb57 ("fs: do not prefault sys_write() user
buffer pages") by Dave Hansen <dave.hansen@linux.intel.com>, but:

* Fix generic_perform_write as well as iomap_write_iter.

* copy_page_from_iter_atomic() doesn't trigger page faults, so there's no need
  to disable page faults around it [see commit 9e8c2af96e0d ("callers of
  iov_copy_from_user_atomic() don't need pagecache_disable()")].

* If fault_in_iov_iter_readable() fails to fault in the entire buffer,
  we still want to read everything up to the fault position.  This depends on
  commit a6294593e8a1 ("iov_iter: Turn iov_iter_fault_in_readable into
  fault_in_iov_iter_readable").

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/buffered-io.c | 20 +++++++-------------
 mm/filemap.c           | 20 +++++++-------------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 1753c26c8e76..d8809cd9ab31 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -744,17 +744,6 @@ static loff_t iomap_write_iter(struct iomap_iter *iter, struct iov_iter *i)
 		if (bytes > length)
 			bytes = length;
 
-		/*
-		 * Bring in the user page that we'll copy from _first_.
-		 * Otherwise there's a nasty deadlock on copying from the
-		 * same page as we're writing to, without it being marked
-		 * up-to-date.
-		 */
-		if (unlikely(fault_in_iov_iter_readable(i, bytes))) {
-			status = -EFAULT;
-			break;
-		}
-
 		status = iomap_write_begin(iter, pos, bytes, &page);
 		if (unlikely(status))
 			break;
@@ -777,9 +766,14 @@ static loff_t iomap_write_iter(struct iomap_iter *iter, struct iov_iter *i)
 			 * halfway through, might be a race with munmap,
 			 * might be severe memory pressure.
 			 */
-			if (copied)
+			if (copied) {
 				bytes = copied;
-			goto again;
+				goto again;
+			}
+			if (fault_in_iov_iter_readable(i, bytes) != bytes)
+				goto again;
+			status = -EFAULT;
+			break;
 		}
 		pos += status;
 		written += status;
diff --git a/mm/filemap.c b/mm/filemap.c
index 4dd5edcd39fd..467cdb7d086d 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3751,17 +3751,6 @@ ssize_t generic_perform_write(struct file *file,
 						iov_iter_count(i));
 
 again:
-		/*
-		 * Bring in the user page that we will copy from _first_.
-		 * Otherwise there's a nasty deadlock on copying from the
-		 * same page as we're writing to, without it being marked
-		 * up-to-date.
-		 */
-		if (unlikely(fault_in_iov_iter_readable(i, bytes))) {
-			status = -EFAULT;
-			break;
-		}
-
 		if (fatal_signal_pending(current)) {
 			status = -EINTR;
 			break;
@@ -3794,9 +3783,14 @@ ssize_t generic_perform_write(struct file *file,
 			 * halfway through, might be a race with munmap,
 			 * might be severe memory pressure.
 			 */
-			if (copied)
+			if (copied) {
 				bytes = copied;
-			goto again;
+				goto again;
+			}
+			if (fault_in_iov_iter_readable(i, bytes) != bytes)
+				goto again;
+			status = -EFAULT;
+			break;
 		}
 		pos += status;
 		written += status;
-- 
2.26.3

