Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5624E255903
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Aug 2020 13:01:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598612468;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=raF2jLKeyOM8Dq1XwavYSgCQdWaUwEJe0ljDFFO+XBs=;
	b=GjizRUiV2kO0l5460gW5BM4P1a57z90oNGlwWeJ4tugV6N/yLf1AfKrvubLgkALNcBeZcJ
	H2VehKH3PgcP27a5u7zd/oZ+jp/WS4UD1cmts9/TJrOu1otV5pQwKOH9EjYEUZFSellwsR
	jHTMPeRtKi2vk9d3+3t90zgiHpu2xe4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-_-P9WMenNZ-AIamI9MpC-A-1; Fri, 28 Aug 2020 07:01:06 -0400
X-MC-Unique: _-P9WMenNZ-AIamI9MpC-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE2B710059A4;
	Fri, 28 Aug 2020 11:01:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1060808BA;
	Fri, 28 Aug 2020 11:01:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7995EA221A;
	Fri, 28 Aug 2020 11:01:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07SB0sVX000874 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 28 Aug 2020 07:00:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9ACFC60FC2; Fri, 28 Aug 2020 11:00:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.213])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBA8D6198B
	for <cluster-devel@redhat.com>; Fri, 28 Aug 2020 11:00:50 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 28 Aug 2020 12:00:48 +0100
Message-Id: <20200828110048.331810-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] mkfs.gfs2: Tighten minimum journal size
	checks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

mkfs.gfs2 chooses the default journal size based on the block size and
the size of the target device, and when the device is small enough a
minimum journal size is enforced. If the block size is less than 4K and
the device is small enough a journal size can be chosen that is smaller
than the minimum and gfs2 will not mount it, as it has a hardcoded check
for >=8MB journals. To avoid that we can just clamp the journal size
back to 8MB in these cases. A validity check for the minimum has already
been done in default_journal_size().

Resolves: rhbz#1779806

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/mkfs/main_mkfs.c | 8 +++++++-
 tests/mkfs.at         | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 3fb2eb92..df194dff 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -929,11 +929,17 @@ static void sbd_init(struct gfs2_sbd *sdp, struct mkfs_opts *opts, unsigned bsiz
 	   will fit. For user-provided journal sizes, limit it to half of the fs. */
 	if (!opts->got_jsize) {
 		int default_jsize = default_journal_size(sdp->bsize, sdp->device.length / opts->journals);
+		unsigned jsize_mb;
+
 		if (default_jsize < 0) {
 			fprintf(stderr, _("gfs2 will not fit on this device.\n"));
 			exit(1);
 		}
-		opts->jsize = (default_jsize * sdp->bsize) >> 20;
+		jsize_mb = (default_jsize * sdp->bsize) >> 20;
+		if (jsize_mb < GFS2_MIN_JSIZE)
+			opts->jsize = GFS2_MIN_JSIZE;
+		else
+			opts->jsize = jsize_mb;
 	} else if ((((opts->jsize * opts->journals) << 20) / sdp->bsize) > (sdp->device.length / 2)) {
 		unsigned max_jsize = (sdp->device.length / 2 * sdp->bsize / opts->journals) >> 20;
 
diff --git a/tests/mkfs.at b/tests/mkfs.at
index 96c4f6ab..73cdfee6 100644
--- a/tests/mkfs.at
+++ b/tests/mkfs.at
@@ -78,6 +78,8 @@ AT_CLEANUP
 AT_SETUP([Min. journal size])
 AT_KEYWORDS(mkfs.gfs2 mkfs)
 GFS_FSCK_CHECK([$GFS_MKFS -p lock_nolock -J 8 $GFS_TGT])
+GFS_FSCK_CHECK([$GFS_MKFS -p lock_nolock -b 1024 $GFS_TGT 511996])
+AT_CHECK([gfs2_edit -p journal0 field di_size $GFS_TGT | tr -d '\n'], 0, [8388608], [ignore])
 AT_CLEANUP
 
 AT_SETUP([Max. quota change file size])
-- 
2.26.2

