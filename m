Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD51FB19
	for <lists+cluster-devel@lfdr.de>; Wed, 15 May 2019 21:40:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD86030B32DD;
	Wed, 15 May 2019 19:39:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7F9860E39;
	Wed, 15 May 2019 19:39:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ACDE91806B0E;
	Wed, 15 May 2019 19:39:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FJcLZm028965 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 15:38:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E510860F9C; Wed, 15 May 2019 19:38:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-119.phx2.redhat.com [10.3.116.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AFBAE60BF7
	for <cluster-devel@redhat.com>; Wed, 15 May 2019 19:38:21 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 15 May 2019 14:37:56 -0500
Message-Id: <20190515193818.7642-4-rpeterso@redhat.com>
In-Reply-To: <20190515193818.7642-1-rpeterso@redhat.com>
References: <20190515193818.7642-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v4 PATCH 03/25] gfs2: log which portion of
	the journal is replayed
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 15 May 2019 19:39:59 +0000 (UTC)

When a journal is replayed, gfs2 logs a message similar to:

jid=X: Replaying journal...

This patch adds the tail and block number so that the range of the
replayed block is also printed. These values will match the values
shown if the journal is dumped with gfs2_edit -p journalX. The
resulting output looks something like this:

jid=1: Replaying journal...0x28b7 to 0x2beb

This will allow us to better debug file system corruption problems.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/recovery.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index 389b3ef77e20..4ce2bfdbefdc 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -391,7 +391,8 @@ void gfs2_recover_func(struct work_struct *work)
 		}
 
 		t_tlck = ktime_get();
-		fs_info(sdp, "jid=%u: Replaying journal...\n", jd->jd_jid);
+		fs_info(sdp, "jid=%u: Replaying journal...0x%x to 0x%x\n",
+			jd->jd_jid, head.lh_tail, head.lh_blkno);
 
 		for (pass = 0; pass < 2; pass++) {
 			lops_before_scan(jd, &head, pass);
-- 
2.20.1

