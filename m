Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 361E8218BF9
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Jul 2020 17:44:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-5LCGbVNAMcGFGhLUhEjXBQ-1; Wed, 08 Jul 2020 11:44:07 -0400
X-MC-Unique: 5LCGbVNAMcGFGhLUhEjXBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF2891083E87;
	Wed,  8 Jul 2020 15:44:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FE0378479;
	Wed,  8 Jul 2020 15:44:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C60E1806B0B;
	Wed,  8 Jul 2020 15:44:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068FgLiZ000629 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 11:42:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D7856112C087; Wed,  8 Jul 2020 15:42:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2E8E10031FE
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 15:42:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF0618EF3A5
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 15:42:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-422-pCYP_uZcOl-MFJRs6OVRMw-1;
	Wed, 08 Jul 2020 11:42:15 -0400
X-MC-Unique: pCYP_uZcOl-MFJRs6OVRMw-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 92C86206DF;
	Wed,  8 Jul 2020 15:42:13 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed,  8 Jul 2020 11:42:07 -0400
Message-Id: <20200708154208.3200232-4-sashal@kernel.org>
In-Reply-To: <20200708154208.3200232-1-sashal@kernel.org>
References: <20200708154208.3200232-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 068FgLiZ000629
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 4.14 4/5] gfs2: read-only mounts
	should grab the sd_freeze_gl glock
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit b780cc615ba4795a7ef0e93b19424828a5ad456a ]

Before this patch, only read-write mounts would grab the freeze
glock in read-only mode, as part of gfs2_make_fs_rw. So the freeze
glock was never initialized. That meant requests to freeze, which
request the glock in EX, were granted without any state transition.
That meant you could mount a gfs2 file system, which is currently
frozen on a different cluster node, in read-only mode.

This patch makes read-only mounts lock the freeze glock in SH mode,
which will block for file systems that are frozen on another node.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/ops_fstype.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 7ed0359ebac61..2de67588ac2d8 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1179,7 +1179,17 @@ static int fill_super(struct super_block *sb, struct gfs2_args *args, int silent
 		goto fail_per_node;
 	}
 
-	if (!sb_rdonly(sb)) {
+	if (sb_rdonly(sb)) {
+		struct gfs2_holder freeze_gh;
+
+		error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED,
+					   GL_EXACT, &freeze_gh);
+		if (error) {
+			fs_err(sdp, "can't make FS RO: %d\n", error);
+			goto fail_per_node;
+		}
+		gfs2_glock_dq_uninit(&freeze_gh);
+	} else {
 		error = gfs2_make_fs_rw(sdp);
 		if (error) {
 			fs_err(sdp, "can't make FS RW: %d\n", error);
-- 
2.25.1


