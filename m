Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1E08BA11
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Aug 2019 15:25:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 865BF307D95F;
	Tue, 13 Aug 2019 13:25:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7D817EE71;
	Tue, 13 Aug 2019 13:25:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0D116B49C;
	Tue, 13 Aug 2019 13:25:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7DDPJ3w004094 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Aug 2019 09:25:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7E05326FA9; Tue, 13 Aug 2019 13:25:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 785A5194B6
	for <cluster-devel@redhat.com>; Tue, 13 Aug 2019 13:25:15 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3DD46B49C;
	Tue, 13 Aug 2019 13:25:15 +0000 (UTC)
Date: Tue, 13 Aug 2019 09:25:15 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1565165225.8246488.1565702715752.JavaMail.zimbra@redhat.com>
In-Reply-To: <1754775198.8245715.1565702615096.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.116.97, 10.4.195.18]
Thread-Topic: gfs2: Fix possible fs name overflows
Thread-Index: hNWSXBHiTSpdZ81euEqO54ZIK1683w==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Fix possible fs name overflows
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 13 Aug 2019 13:25:27 +0000 (UTC)

Hi,

This patch fixes three places in which temporary character buffers
could overflow due to the addition of the file system id from patch
3792ce973f07. Thanks to Dan Carpenter for pointing it out.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 2 +-
 fs/gfs2/rgrp.c  | 2 +-
 fs/gfs2/util.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index e23fb8b7b020..a27dbd3dec01 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1788,8 +1788,8 @@ void gfs2_dump_glock(struct seq_file *seq, struct gfs2_glock *gl, bool fsid)
 	unsigned long long dtime;
 	const struct gfs2_holder *gh;
 	char gflags_buf[32];
-	char fs_id_buf[GFS2_FSNAME_LEN + 3 * sizeof(int) + 2];
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
+	char fs_id_buf[sizeof(sdp->sd_fsname) + 7];
 
 	memset(fs_id_buf, 0, sizeof(fs_id_buf));
 	if (fsid && sdp) /* safety precaution */
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 49ac0a5e74ea..2466bb44a23c 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -2285,7 +2285,7 @@ void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_glock *gl,
 static void gfs2_rgrp_error(struct gfs2_rgrpd *rgd)
 {
 	struct gfs2_sbd *sdp = rgd->rd_sbd;
-	char fs_id_buf[GFS2_FSNAME_LEN + 3 * sizeof(int) + 2];
+	char fs_id_buf[sizeof(sdp->sd_fsname) + 7];
 
 	fs_warn(sdp, "rgrp %llu has an error, marking it readonly until umount\n",
 		(unsigned long long)rgd->rd_addr);
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 83f6c582773a..c45159133d8e 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -178,7 +178,7 @@ int gfs2_consist_rgrpd_i(struct gfs2_rgrpd *rgd, int cluster_wide,
 			 const char *function, char *file, unsigned int line)
 {
 	struct gfs2_sbd *sdp = rgd->rd_sbd;
-	char fs_id_buf[GFS2_FSNAME_LEN + 3 * sizeof(int) + 2];
+	char fs_id_buf[sizeof(sdp->sd_fsname) + 7];
 	int rv;
 
 	sprintf(fs_id_buf, "fsid=%s: ", sdp->sd_fsname);

