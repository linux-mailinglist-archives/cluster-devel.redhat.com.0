Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6946EB215
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Apr 2023 21:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682104041;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d9/2nHXFfzimrHt4n9wuG8gYzOjlr6rJqSwyTle0qQ8=;
	b=VtPKupX28zQaZB1/vfXPHMITLoiIM1pGeiCOVK60Vspij4p0ByS/hj2v6uyg3XmyXqZ7au
	eYOPeSdTJccUOf62XIJZiiZfu98cViX1MISHq7l1JYRoCjmbUXoi1/gvJaCyt13gTvHmjm
	dcKCV43ywDUR7Y0YUsn+RICw5SfgdR0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-NAqkWyIwNqWKQ-OGJqhEsg-1; Fri, 21 Apr 2023 15:07:16 -0400
X-MC-Unique: NAqkWyIwNqWKQ-OGJqhEsg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 761A3886067;
	Fri, 21 Apr 2023 19:07:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7069663A51;
	Fri, 21 Apr 2023 19:07:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2C1B21946A47;
	Fri, 21 Apr 2023 19:07:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6FBD119466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Apr 2023 19:07:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 539E92026D25; Fri, 21 Apr 2023 19:07:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.net (unknown [10.2.16.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2603C2026D16
 for <cluster-devel@redhat.com>; Fri, 21 Apr 2023 19:07:13 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Apr 2023 15:07:08 -0400
Message-Id: <20230421190710.397684-3-rpeterso@redhat.com>
In-Reply-To: <20230421190710.397684-1-rpeterso@redhat.com>
References: <20230421190710.397684-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [GFS2 PATCH 2/4] gfs2: Perform second log flush in
 gfs2_make_fs_ro
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Before this patch function gfs2_make_fs_ro called gfs2_log_flush once to
finalize the log. However, if there's dirty metadata, log flushes tend
to sync the metadata and formulate revokes. Before this patch, those
revokes may not be written out to the journal immediately, which meant
unresolved glocks could still have revokes in their ail lists. When the
glock worker runs, it tries to transition the glock, but the unresolved
revokes in the ail still need to be written, so it tries to start a
transaction. It's impossible to start a transaction because at that
point the GFS2_LOG_HEAD_FLUSH_SHUTDOWN has been set by gfs2_make_fs_ro.
That cause the glock worker to get an error, and unable to write the
revokes. The calling sequence looked something like this:

gfs2_make_fs_ro
   gfs2_log_flush - with GFS2_LOG_HEAD_FLUSH_SHUTDOWN flag set
	if (flags & GFS2_LOG_HEAD_FLUSH_SHUTDOWN)
		clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
...meanwhile...
glock_work_func
   do_xmote
      rgrp_go_sync (or possibly inode_go_sync)
         ...
         gfs2_ail_empty_gl
            __gfs2_trans_begin
               if (unlikely(!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))) {
               ...
                  return -EROFS;

The previous patch in the series ("gfs2: return errors from
gfs2_ail_empty_gl") now causes the transaction error to no longer be
ignored, so it causes a warning from MOST of the xfstests:

WARNING: CPU: 11 PID: X at fs/gfs2/super.c:603 gfs2_put_super [gfs2]

which corresponds to:

WARN_ON(gfs2_withdrawing(sdp));

The withdraw was triggered silently from do_xmote by:

	if (unlikely(sdp->sd_log_error && !gfs2_withdrawn(sdp)))
		gfs2_withdraw_delayed(sdp);

This patch adds a second log_flush to gfs2_make_fs_ro: one to sync the
data and one to sync any outstanding revokes and finalize the journal.
Note that both of these log flushes need to be "special," in other
words, not GFS2_LOG_HEAD_FLUSH_NORMAL.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index a83fa62106f0..5eed8c237500 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -552,6 +552,15 @@ void gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 		gfs2_quota_sync(sdp->sd_vfs, 0);
 		gfs2_statfs_sync(sdp->sd_vfs, 0);
 
+		/* We do two log flushes here. The first one commits dirty inodes
+		 * and rgrps to the journal, but queues up revokes to the ail list.
+		 * The second flush writes out and removes the revokes.
+		 *
+		 * The first must be done before the FLUSH_SHUTDOWN code
+		 * clears the LIVE flag, otherwise it will not be able to start
+		 * a transaction to write its revokes, and the error will cause
+		 * a withdraw of the file system. */
+		gfs2_log_flush(sdp, NULL, GFS2_LFC_MAKE_FS_RO);
 		gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
 			       GFS2_LFC_MAKE_FS_RO);
 		wait_event_timeout(sdp->sd_log_waitq,
-- 
2.39.2

