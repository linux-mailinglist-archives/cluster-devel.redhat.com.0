Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 830881BE48
	for <lists+cluster-devel@lfdr.de>; Mon, 13 May 2019 21:59:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 688503086220;
	Mon, 13 May 2019 19:59:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E328F1001E75;
	Mon, 13 May 2019 19:59:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 167FA41F58;
	Mon, 13 May 2019 19:59:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4DJxDB0029506 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 May 2019 15:59:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39F485C21F; Mon, 13 May 2019 19:59:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-40.brq.redhat.com [10.40.204.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5558F5C1B4;
	Mon, 13 May 2019 19:59:07 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 13 May 2019 21:59:04 +0200
Message-Id: <20190513195904.15726-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, "Tobin C. Harding" <tobin@kernel.org>
Subject: [Cluster-devel] [PATCH] gfs2: Fix error path kobject memory leak
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Mon, 13 May 2019 19:59:23 +0000 (UTC)

From: "Tobin C. Harding" <tobin@kernel.org>

If a call to kobject_init_and_add() fails we must call kobject_put()
otherwise we leak memory.

Function gfs2_sys_fs_add always calls kobject_init_and_add() which
always calls kobject_init().

It is safe to leave object destruction up to the kobject release
function and never free it manually.

Remove call to kfree() and always call kobject_put() in the error path.

Signed-off-by: Tobin C. Harding <tobin@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/sys.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index 1787d295834e..08e4996adc23 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -650,7 +650,6 @@ int gfs2_sys_fs_add(struct gfs2_sbd *sdp)
 	char ro[20];
 	char spectator[20];
 	char *envp[] = { ro, spectator, NULL };
-	int sysfs_frees_sdp = 0;
 
 	sprintf(ro, "RDONLY=%d", sb_rdonly(sb));
 	sprintf(spectator, "SPECTATOR=%d", sdp->sd_args.ar_spectator ? 1 : 0);
@@ -661,8 +660,6 @@ int gfs2_sys_fs_add(struct gfs2_sbd *sdp)
 	if (error)
 		goto fail_reg;
 
-	sysfs_frees_sdp = 1; /* Freeing sdp is now done by sysfs calling
-				function gfs2_sbd_release. */
 	error = sysfs_create_group(&sdp->sd_kobj, &tune_group);
 	if (error)
 		goto fail_reg;
@@ -687,10 +684,7 @@ int gfs2_sys_fs_add(struct gfs2_sbd *sdp)
 fail_reg:
 	free_percpu(sdp->sd_lkstats);
 	fs_err(sdp, "error %d adding sysfs files\n", error);
-	if (sysfs_frees_sdp)
-		kobject_put(&sdp->sd_kobj);
-	else
-		kfree(sdp);
+	kobject_put(&sdp->sd_kobj);
 	sb->s_fs_info = NULL;
 	return error;
 }
-- 
2.20.1

