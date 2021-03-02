Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6DECF329921
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Mar 2021 11:08:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-Remu541oNwm-jgqvyRHAIw-1; Tue, 02 Mar 2021 05:08:56 -0500
X-MC-Unique: Remu541oNwm-jgqvyRHAIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D062CC7400;
	Tue,  2 Mar 2021 10:08:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DC2877701;
	Tue,  2 Mar 2021 10:08:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC9E457DFA;
	Tue,  2 Mar 2021 10:08:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1229L9RZ010708 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Mar 2021 04:21:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7894A2026D13; Tue,  2 Mar 2021 09:21:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7337C2026D48
	for <cluster-devel@redhat.com>; Tue,  2 Mar 2021 09:21:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 438DE1871D9F
	for <cluster-devel@redhat.com>; Tue,  2 Mar 2021 09:21:06 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
	(out30-133.freemail.mail.aliyun.com [115.124.30.133]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-200-aqVJQfD2OzSgPcITnnGDEQ-1;
	Tue, 02 Mar 2021 04:21:01 -0500
X-MC-Unique: aqVJQfD2OzSgPcITnnGDEQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
	TI=SMTPD_---0UQ4OqHi_1614676527
Received: from
	j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
	fp:SMTPD_---0UQ4OqHi_1614676527) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 02 Mar 2021 17:15:28 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: rpeterso@redhat.com
Date: Tue,  2 Mar 2021 17:15:26 +0800
Message-Id: <1614676526-102967-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 02 Mar 2021 05:08:39 -0500
Cc: cluster-devel@redhat.com, Yang Li <yang.lee@linux.alibaba.com>,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: Remove unneeded return variable
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"

This patch removes unneeded return variables, using only
'0' instead.
It fixes the following warning detected by coccinelle:
./fs/gfs2/super.c:592:5-10: Unneeded variable: "error". Return "0" on
line 628

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 fs/gfs2/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 861ed5f..fe2dae4 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -589,7 +589,6 @@ static void gfs2_dirty_inode(struct inode *inode, int flags)
 
 int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 {
-	int error = 0;
 	int log_write_allowed = test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 
 	gfs2_flush_delete_work(sdp);
@@ -625,7 +624,7 @@ int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 	if (!log_write_allowed)
 		sdp->sd_vfs->s_flags |= SB_RDONLY;
 
-	return error;
+	return 0;
 }
 
 /**
-- 
1.8.3.1

