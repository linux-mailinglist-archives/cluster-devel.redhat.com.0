Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 92EE7341BE9
	for <lists+cluster-devel@lfdr.de>; Fri, 19 Mar 2021 13:02:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616155330;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=1kpLd1SH1z2GKb2gyI0elZ6otXHkN5SNsLHOPQAllLE=;
	b=WF/iJh4GE/pm977VDGZBlRLrZtk2dPnZsSj4G5sQ93DxgskTVBFAaD2DT+vpfph1QWxcyK
	ObbXfPKUqVC45NvoG3esm69NNrZqhE9NctDqedv6sRxF7U7ovatpWfVeUzfiFbs457n5XM
	v1Ht8zsI4Dk32aU885K7QeMI5+Z5Tfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-TKtsVocnNOSWiipHlGyeww-1; Fri, 19 Mar 2021 08:02:07 -0400
X-MC-Unique: TKtsVocnNOSWiipHlGyeww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF13C190B2AE;
	Fri, 19 Mar 2021 12:02:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B9D110016F8;
	Fri, 19 Mar 2021 12:02:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0AF1B1809C83;
	Fri, 19 Mar 2021 12:01:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12JC1siL006682 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 19 Mar 2021 08:01:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54BB91045EA3; Fri, 19 Mar 2021 12:01:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EC721042B4C
	for <cluster-devel@redhat.com>; Fri, 19 Mar 2021 12:01:50 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49F624BB7B
	for <cluster-devel@redhat.com>; Fri, 19 Mar 2021 12:01:50 +0000 (UTC)
Date: Fri, 19 Mar 2021 08:01:50 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <609149767.64749965.1616155310235.JavaMail.zimbra@redhat.com>
In-Reply-To: <231070692.64749919.1616155157979.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.96, 10.4.195.23]
Thread-Topic: gfs2: Eliminate gh parameter from go_xmote_bh func
Thread-Index: BXgicx8jZs6cCcUMclFMXn22+4RIpg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Eliminate gh parameter from
	go_xmote_bh func
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The only glock that uses go_xmote_bh glops function is the freeze glock
which uses freeze_go_xmote_bh. It does not use its gh parameter, so
this patch eliminates the unneeded parameter.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c  | 2 +-
 fs/gfs2/glops.c  | 2 +-
 fs/gfs2/incore.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 9567520d79f7..f6f66c83b4ff 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -566,7 +566,7 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
 	if (state != LM_ST_UNLOCKED) {
 		if (glops->go_xmote_bh) {
 			spin_unlock(&gl->gl_lockref.lock);
-			rv = glops->go_xmote_bh(gl, gh);
+			rv = glops->go_xmote_bh(gl);
 			spin_lock(&gl->gl_lockref.lock);
 			if (rv) {
 				do_error(gl, rv);
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 8e32d569c8bf..469a9306eee4 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -597,7 +597,7 @@ static int freeze_go_sync(struct gfs2_glock *gl)
  *
  */
 
-static int freeze_go_xmote_bh(struct gfs2_glock *gl, struct gfs2_holder *gh)
+static int freeze_go_xmote_bh(struct gfs2_glock *gl)
 {
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	struct gfs2_inode *ip = GFS2_I(sdp->sd_jdesc->jd_inode);
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 0957119f7744..f406a01a31ed 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -217,7 +217,7 @@ struct lm_lockname {
 
 struct gfs2_glock_operations {
 	int (*go_sync) (struct gfs2_glock *gl);
-	int (*go_xmote_bh) (struct gfs2_glock *gl, struct gfs2_holder *gh);
+	int (*go_xmote_bh) (struct gfs2_glock *gl);
 	void (*go_inval) (struct gfs2_glock *gl, int flags);
 	int (*go_demote_ok) (const struct gfs2_glock *gl);
 	int (*go_lock) (struct gfs2_holder *gh);

