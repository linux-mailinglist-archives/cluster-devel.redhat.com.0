Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 935506EB218
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Apr 2023 21:07:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682104044;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=t2g45M7hDrgYySor8dQDXrJhXCJSCppPH3dd6sPgirE=;
	b=PlmZH8a7PbnIqAQSKfNnn6PDc+y65U0xJGITN1oYOWDK/bY2Tt3rrv1NzvL77g+lJFO8ni
	rD9Atm5p1SCTvNwdYBOSiTyTBr2+ymrL5P4Vos9iaRh5ubyodrC8VE3LpASS7ycPllOZiu
	02aVeq6TnQODz5Z80lD8uLVIN4zl3Pc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-97sDfyCcOMC8IyprIO19aQ-1; Fri, 21 Apr 2023 15:07:17 -0400
X-MC-Unique: 97sDfyCcOMC8IyprIO19aQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C6D33C025B1;
	Fri, 21 Apr 2023 19:07:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81518492B00;
	Fri, 21 Apr 2023 19:07:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 377291946A47;
	Fri, 21 Apr 2023 19:07:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 25FA619466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Apr 2023 19:07:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0BB892026D25; Fri, 21 Apr 2023 19:07:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.net (unknown [10.2.16.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D25802026D16
 for <cluster-devel@redhat.com>; Fri, 21 Apr 2023 19:07:12 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Apr 2023 15:07:07 -0400
Message-Id: <20230421190710.397684-2-rpeterso@redhat.com>
In-Reply-To: <20230421190710.397684-1-rpeterso@redhat.com>
References: <20230421190710.397684-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [GFS2 PATCH 1/4] gfs2: return errors from
 gfs2_ail_empty_gl
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Before this patch, function gfs2_ail_empty_gl did not return errors it
encountered from __gfs2_trans_begin. Those errors usually came from the
fact that the file system was made read-only, often due to unmount,
(but theoretically could be due to -o remount,ro) which prevented
the transaction from starting.

The inability to start a transaction prevented its revokes from being
properly written to the journal for glocks during unmount (and
transition to ro).

That meant glocks could be unlocked without the metadata properly
revoked in the journal. So other nodes could grab the glock thinking
that their lvb values were correct, but in fact corresponded to the
glock without its revokes properly synced. That presented as lvb
mismatch errors.

This patch allows gfs2_ail_empty_gl to return the error properly to
the caller.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 6e33c8058059..8e245d793e6b 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -90,7 +90,7 @@ static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	struct gfs2_trans tr;
 	unsigned int revokes;
-	int ret;
+	int ret = 0;
 
 	revokes = atomic_read(&gl->gl_ail_count);
 
@@ -124,15 +124,15 @@ static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
 	memset(&tr, 0, sizeof(tr));
 	set_bit(TR_ONSTACK, &tr.tr_flags);
 	ret = __gfs2_trans_begin(&tr, sdp, 0, revokes, _RET_IP_);
-	if (ret)
-		goto flush;
-	__gfs2_ail_flush(gl, 0, revokes);
-	gfs2_trans_end(sdp);
+	if (!ret) {
+		__gfs2_ail_flush(gl, 0, revokes);
+		gfs2_trans_end(sdp);
+	}
 
 flush:
 	gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 		       GFS2_LFC_AIL_EMPTY_GL);
-	return 0;
+	return ret;
 }
 
 void gfs2_ail_flush(struct gfs2_glock *gl, bool fsync)
@@ -326,7 +326,9 @@ static int inode_go_sync(struct gfs2_glock *gl)
 	ret = gfs2_inode_metasync(gl);
 	if (!error)
 		error = ret;
-	gfs2_ail_empty_gl(gl);
+	ret = gfs2_ail_empty_gl(gl);
+	if (!error)
+		error = ret;
 	/*
 	 * Writeback of the data mapping may cause the dirty flag to be set
 	 * so we have to clear it again here.
-- 
2.39.2

