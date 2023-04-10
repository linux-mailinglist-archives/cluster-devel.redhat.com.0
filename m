Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5316DCAD0
	for <lists+cluster-devel@lfdr.de>; Mon, 10 Apr 2023 20:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681151631;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=72Xo1aCLl64kmgIJwphrQsmMo7nFyRwF0AzgvMg0VAs=;
	b=HJfJpUgoQY/FOENbhdI1212t8WwGhWsK4U3Pl7YWZYD6bRpGYJpHFj9akh+Xv03m681KQA
	p/GkqcoW2dVMezyoNBvclidN4dpSxjHDCi1Fzq9fDn7oBMjZ+qXZuPDeMjgTP+UOtbv5kS
	1QtVBy3T9my0w5T+Maxv9vGwdJ2tl9Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-mp1UtBzgML2ZKyydSS6Uqw-1; Mon, 10 Apr 2023 14:33:47 -0400
X-MC-Unique: mp1UtBzgML2ZKyydSS6Uqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FBD13C0ED55;
	Mon, 10 Apr 2023 18:33:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 981E8C15BB8;
	Mon, 10 Apr 2023 18:33:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4096819465BD;
	Mon, 10 Apr 2023 18:33:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 67E311946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 10 Apr 2023 18:33:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4941140C83AC; Mon, 10 Apr 2023 18:33:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.net (unknown [10.2.17.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B6E240C20FA
 for <cluster-devel@redhat.com>; Mon, 10 Apr 2023 18:33:44 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 10 Apr 2023 14:33:41 -0400
Message-Id: <20230410183341.210414-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH] gfs2: Use gfs2_holder_initialized for jindex
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Before this patch function init_journal() used a local variable jindex to
keep track of whether it needed to dequeue the jindex holder when errors
were found. It also uselessly set the variable just before returning from
the function. This patch simplifies the code by eliminatinng the local
variable in favor of using function gfs2_holder_initialized.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/ops_fstype.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 6de901c3b89b..9af9ddb61ca0 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -734,13 +734,11 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 	struct inode *master = d_inode(sdp->sd_master_dir);
 	struct gfs2_holder ji_gh;
 	struct gfs2_inode *ip;
-	int jindex = 1;
 	int error = 0;
 
-	if (undo) {
-		jindex = 0;
+	gfs2_holder_mark_uninitialized(&ji_gh);
+	if (undo)
 		goto fail_statfs;
-	}
 
 	sdp->sd_jindex = gfs2_lookup_simple(master, "jindex");
 	if (IS_ERR(sdp->sd_jindex)) {
@@ -852,7 +850,6 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 	sdp->sd_log_idle = 1;
 	set_bit(SDF_JOURNAL_CHECKED, &sdp->sd_flags);
 	gfs2_glock_dq_uninit(&ji_gh);
-	jindex = 0;
 	INIT_WORK(&sdp->sd_freeze_work, gfs2_freeze_func);
 	return 0;
 
@@ -869,7 +866,7 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 		gfs2_glock_dq_uninit(&sdp->sd_journal_gh);
 fail_jindex:
 	gfs2_jindex_free(sdp);
-	if (jindex)
+	if (gfs2_holder_initialized(&ji_gh))
 		gfs2_glock_dq_uninit(&ji_gh);
 fail:
 	iput(sdp->sd_jindex);
-- 
2.39.2

