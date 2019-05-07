Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AAC16C3F
	for <lists+cluster-devel@lfdr.de>; Tue,  7 May 2019 22:32:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8FFA4369CC;
	Tue,  7 May 2019 20:32:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 796F217B90;
	Tue,  7 May 2019 20:32:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5CD4318089CC;
	Tue,  7 May 2019 20:32:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x47KWHjm018851 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 16:32:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D1B3608CA; Tue,  7 May 2019 20:32:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE0F417CC3;
	Tue,  7 May 2019 20:32:16 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  7 May 2019 22:31:59 +0200
Message-Id: <20190507203204.26008-7-agruenba@redhat.com>
In-Reply-To: <20190507203204.26008-1-agruenba@redhat.com>
References: <20190507203204.26008-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 07/12] gfs2: Remove unnecessary extern
	declarations
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 07 May 2019 20:32:19 +0000 (UTC)

Make log operations statuc; they are only used locally.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/lops.c | 6 +++---
 fs/gfs2/lops.h | 5 -----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 2fd61853ba63..6c1ec6c60639 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -870,7 +870,7 @@ static void databuf_lo_after_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 }
 
 
-const struct gfs2_log_operations gfs2_buf_lops = {
+static const struct gfs2_log_operations gfs2_buf_lops = {
 	.lo_before_commit = buf_lo_before_commit,
 	.lo_after_commit = buf_lo_after_commit,
 	.lo_before_scan = buf_lo_before_scan,
@@ -879,7 +879,7 @@ const struct gfs2_log_operations gfs2_buf_lops = {
 	.lo_name = "buf",
 };
 
-const struct gfs2_log_operations gfs2_revoke_lops = {
+static const struct gfs2_log_operations gfs2_revoke_lops = {
 	.lo_before_commit = revoke_lo_before_commit,
 	.lo_after_commit = revoke_lo_after_commit,
 	.lo_before_scan = revoke_lo_before_scan,
@@ -888,7 +888,7 @@ const struct gfs2_log_operations gfs2_revoke_lops = {
 	.lo_name = "revoke",
 };
 
-const struct gfs2_log_operations gfs2_databuf_lops = {
+static const struct gfs2_log_operations gfs2_databuf_lops = {
 	.lo_before_commit = databuf_lo_before_commit,
 	.lo_after_commit = databuf_lo_after_commit,
 	.lo_scan_elements = databuf_lo_scan_elements,
diff --git a/fs/gfs2/lops.h b/fs/gfs2/lops.h
index 4e81742de7a0..320fbf28d2fb 100644
--- a/fs/gfs2/lops.h
+++ b/fs/gfs2/lops.h
@@ -20,11 +20,6 @@
 	((sizeof(struct gfs2_log_descriptor) + (2 * sizeof(__be64) - 1)) & \
 	 ~(2 * sizeof(__be64) - 1))
 
-extern const struct gfs2_log_operations gfs2_glock_lops;
-extern const struct gfs2_log_operations gfs2_buf_lops;
-extern const struct gfs2_log_operations gfs2_revoke_lops;
-extern const struct gfs2_log_operations gfs2_databuf_lops;
-
 extern const struct gfs2_log_operations *gfs2_log_ops[];
 extern u64 gfs2_log_bmap(struct gfs2_sbd *sdp);
 extern void gfs2_log_write(struct gfs2_sbd *sdp, struct page *page,
-- 
2.20.1

