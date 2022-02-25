Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA9D4C4EB1
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Feb 2022 20:25:23 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-MoIo4H4HMRChJ3KW_4opyg-1; Fri, 25 Feb 2022 14:25:19 -0500
X-MC-Unique: MoIo4H4HMRChJ3KW_4opyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA1AF1091DA0;
	Fri, 25 Feb 2022 19:25:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E36D825E3;
	Fri, 25 Feb 2022 19:25:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5EE064ED66;
	Fri, 25 Feb 2022 19:25:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21PJP0CG009265 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 25 Feb 2022 14:25:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 13A841454543; Fri, 25 Feb 2022 19:25:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F82A1454542
	for <cluster-devel@redhat.com>; Fri, 25 Feb 2022 19:25:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA0FF800960
	for <cluster-devel@redhat.com>; Fri, 25 Feb 2022 19:24:59 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-222-AqO5aWMSNDCcoOML7URzew-1; Fri, 25 Feb 2022 14:24:56 -0500
X-MC-Unique: AqO5aWMSNDCcoOML7URzew-1
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
	[108.7.220.252]) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21PJOZlb031119
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 25 Feb 2022 14:24:36 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 5FD3515C0036; Fri, 25 Feb 2022 14:24:35 -0500 (EST)
Date: Fri, 25 Feb 2022 14:24:35 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <Yhks88tO3Em/G370@mit.edu>
References: <Yg0m6IjcNmfaSokM@google.com>
MIME-Version: 1.0
In-Reply-To: <Yg0m6IjcNmfaSokM@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Ritesh Harjani <riteshh@linux.ibm.com>,
	linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: [Cluster-devel] [PATCH -v2] ext4: don't BUG if kernel subsystems
 dirty pages without asking ext4 first
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[un]pin_user_pages_remote is dirtying pages without properly warning
the file system in advance (or faulting in the file data if the page
is not yet in the page cache).  This was noted by Jan Kara in 2018[1]
and more recently has resulted in bug reports by Syzbot in various
Android kernels[2].

This is technically a bug in the mm/gup.c codepath, but arguably ext4
is fragile in that a buggy get_user_pages() implementation causes ext4
to crash, where as other file systems are not crashing (although in
some cases the user data will be lost since gup code is not properly
informing the file system to potentially allocate blocks or reserve
space when writing into a sparse portion of file).  I suspect in real
life it is rare that people are using RDMA into file-backed memory,
which is why no one has complained to ext4 developers except fuzzing
programs.

So instead of crashing with a BUG, issue a warning (since there may be
potential data loss) and just mark the page as clean to avoid
unprivileged denial of service attacks until the problem can be
properly fixed.  More discussion and background can be found in the
thread starting at [2].

[1] https://www.spinics.net/lists/linux-mm/msg142700.html
[2] https://lore.kernel.org/r/Yg0m6IjcNmfaSokM@google.com

Reported-by: syzbot+d59332e2db681cf18f0318a06e994ebbb529a8db@syzkaller.appspotmail.com
Reported-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Theodore Ts'o <tytso@mit.edu>
---
 fs/ext4/inode.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 01c9e4f743ba..f8fefbf67306 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1993,6 +1993,15 @@ static int ext4_writepage(struct page *page,
 	else
 		len = PAGE_SIZE;
 
+	/* Should never happen but for buggy gup code */
+	if (!page_has_buffers(page)) {
+		ext4_warning_inode(inode,
+		   "page %lu does not have buffers attached", page->index);
+		ClearPageDirty(page);
+		unlock_page(page);
+		return 0;
+	}
+
 	page_bufs = page_buffers(page);
 	/*
 	 * We cannot do block allocation or other extent handling in this
@@ -2588,12 +2597,28 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
 			     (mpd->wbc->sync_mode == WB_SYNC_NONE)) ||
 			    unlikely(page->mapping != mapping)) {
 				unlock_page(page);
-				continue;
+				goto out;
 			}
 
 			wait_on_page_writeback(page);
 			BUG_ON(PageWriteback(page));
 
+			/*
+			 * Should never happen but for buggy code in
+			 * other subsystemsa that call
+			 * set_page_dirty() without properly warning
+			 * the file system first.  See [1] for more
+			 * information.
+			 *
+			 * [1] https://www.spinics.net/lists/linux-mm/msg142700.html
+			 */
+			if (!page_has_buffers(page)) {
+				ext4_warning_inode(mpd->inode, "page %lu does not have buffers attached", page->index);
+				ClearPageDirty(page);
+				unlock_page(page);
+				continue;
+			}
+
 			if (mpd->map.m_len == 0)
 				mpd->first_page = page->index;
 			mpd->next_page = page->index + 1;
-- 
2.31.0

