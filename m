Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 608BC5606F8
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Jun 2022 19:06:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656522368;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mf+wX13xE2Px9NwPIpkY6fg9VmVrF+HWA97QjtYfdgQ=;
	b=Tbi6RkYKJdmdC8kInJjFqQPc8N/1OErUgc3M6F4DhLwlZJByVgZ87RQ8RV4nqDNd0Gwlf9
	yrNrvus6Xo5GRaCUatvVxEB+jRXzWQSUL4VondyJwEVR56S96RvuvFCb6N+SWV/G2S/wWT
	jV+6Y/qWi2LFz38+Tm8ejOo0mB4EVJE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-cn1bzQCiPceVNUQYy6dLJg-1; Wed, 29 Jun 2022 13:06:04 -0400
X-MC-Unique: cn1bzQCiPceVNUQYy6dLJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F10629324A0;
	Wed, 29 Jun 2022 17:06:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 039DD1415108;
	Wed, 29 Jun 2022 17:06:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 48717194706D;
	Wed, 29 Jun 2022 17:06:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5FE941947058 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 16:37:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4F050492CA3; Wed, 29 Jun 2022 16:37:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE25A492C3B;
 Wed, 29 Jun 2022 16:37:15 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 29 Jun 2022 18:37:06 +0200
Message-Id: <20220629163711.732931-5-agruenba@redhat.com>
In-Reply-To: <20220629163711.732931-1-agruenba@redhat.com>
References: <20220629163711.732931-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 4/9] gfs2: Add new go_held glock operation
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Right now, inode_go_instantiate() contains functionality that relates to
how a glock is held rather than the glock itself, like waiting for
pending direct I/O to complete and completing interrupted truncates.
This code is meant to be run each time a holder is acquired, but
go_instantiate is actually only called once, when the glock is
instantiated.

To fix that, introduce a new go_held glock operation that is called each
time a glock holder is acquired.  Move the holder specific code in
inode_go_instantiate() over to inode_go_held().

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  | 10 ++++++++--
 fs/gfs2/glops.c  | 19 +++++++++++++------
 fs/gfs2/incore.h |  1 +
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 347c7bc1fae3..6fe088644d7d 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -488,7 +488,7 @@ int gfs2_instantiate(struct gfs2_holder *gh)
 
 again:
 	if (!test_bit(GLF_INSTANTIATE_NEEDED, &gl->gl_flags))
-		return 0;
+		goto done;
 
 	/*
 	 * Since we unlock the lockref lock, we set a flag to indicate
@@ -511,7 +511,13 @@ int gfs2_instantiate(struct gfs2_holder *gh)
 	if (!ret)
 		clear_bit(GLF_INSTANTIATE_NEEDED, &gl->gl_flags);
 	clear_and_wake_up_bit(GLF_INSTANTIATE_IN_PROG, &gl->gl_flags);
-	return ret;
+	if (ret)
+		return ret;
+
+done:
+	if (glops->go_held)
+		return glops->go_held(gh);
+	return 0;
 }
 
 /**
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index c387f80ca65e..4e0a9909087c 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -489,14 +489,21 @@ static int inode_go_instantiate(struct gfs2_holder *gh)
 {
 	struct gfs2_glock *gl = gh->gh_gl;
 	struct gfs2_inode *ip = gl->gl_object;
-	int error = 0;
 
 	if (!ip) /* no inode to populate - read it in later */
-		goto out;
+		return 0;
 
-	error = gfs2_inode_refresh(ip);
-	if (error)
-		goto out;
+	return gfs2_inode_refresh(ip);
+}
+
+static int inode_go_held(struct gfs2_holder *gh)
+{
+	struct gfs2_glock *gl = gh->gh_gl;
+	struct gfs2_inode *ip = gl->gl_object;
+	int error = 0;
+
+	if (!ip) /* no inode to populate - read it in later */
+		return 0;
 
 	if (gh->gh_state != LM_ST_DEFERRED)
 		inode_dio_wait(&ip->i_inode);
@@ -506,7 +513,6 @@ static int inode_go_instantiate(struct gfs2_holder *gh)
 	    (gh->gh_state == LM_ST_EXCLUSIVE))
 		error = gfs2_truncatei_resume(ip);
 
-out:
 	return error;
 }
 
@@ -730,6 +736,7 @@ const struct gfs2_glock_operations gfs2_inode_glops = {
 	.go_inval = inode_go_inval,
 	.go_demote_ok = inode_go_demote_ok,
 	.go_instantiate = inode_go_instantiate,
+	.go_held = inode_go_held,
 	.go_dump = inode_go_dump,
 	.go_type = LM_TYPE_INODE,
 	.go_flags = GLOF_ASPACE | GLOF_LRU | GLOF_LVB,
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 9e319c8f9efd..15e4258a1dad 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -220,6 +220,7 @@ struct gfs2_glock_operations {
 	void (*go_inval) (struct gfs2_glock *gl, int flags);
 	int (*go_demote_ok) (const struct gfs2_glock *gl);
 	int (*go_instantiate) (struct gfs2_holder *gh);
+	int (*go_held)(struct gfs2_holder *gh);
 	void (*go_dump)(struct seq_file *seq, struct gfs2_glock *gl,
 			const char *fs_id_buf);
 	void (*go_callback)(struct gfs2_glock *gl, bool remote);
-- 
2.35.1

