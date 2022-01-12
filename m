Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B31CF48CBE9
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015652;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wg9spcC6R9/hHPSXRL933XrmlPNbwS1wafN9WGUG4ns=;
	b=VQu0/+/B8GUP7b2ZWzoqvWl7wtf70hhacdoUsaF3fIQ+VFFMWOp5aqTkdQNa7LiuVoB+Od
	mcO3niHf0R9Cvu3lrDfHhd/hFX516durVbZgmhI91CFU/621CVJ/o9MoS6WPMS7u+jjJ9Z
	VB5LXf45sOPNVmiZoXTX1QgthEqjDjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-alg3M4o0NFW3xra1INNL1Q-1; Wed, 12 Jan 2022 14:27:29 -0500
X-MC-Unique: alg3M4o0NFW3xra1INNL1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C012E101AFA7;
	Wed, 12 Jan 2022 19:27:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF39B4BC4A;
	Wed, 12 Jan 2022 19:27:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AF3F4A7CB;
	Wed, 12 Jan 2022 19:27:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJRQEG009375 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3D1C32B178; Wed, 12 Jan 2022 19:27:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D50B60657
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:24 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:44 +0000
Message-Id: <20220112192650.1426415-13-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 12/18] libgfs2: Move debugging printf out of
	build_root()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

mkfs.gfs2 is the only place it could ever get printed so move it there
instead.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/libgfs2/structures.c | 4 ----
 gfs2/mkfs/main_mkfs.c     | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 6cc0a8dd..7ac38f92 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -450,10 +450,6 @@ int build_root(struct gfs2_sbd *sdp)
 	if (sdp->md.rooti == NULL)
 		return -1;
 
-	if (cfg_debug) {
-		printf("\nRoot directory:\n");
-		lgfs2_dinode_print(bh->b_data);
-	}
 	sdp->md.rooti->bh_owned = 1;
 	return 0;
 }
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 56a3b7d2..9a73ff7b 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -1343,6 +1343,10 @@ int main(int argc, char *argv[])
 		printf("%s", _("Done\n"));
 
 	build_root(&sbd);
+	if (opts.debug) {
+		printf("\nRoot directory:\n");
+		lgfs2_dinode_print(sbd.md.rooti->i_bh->b_data);
+	}
 	sbd.sd_root_dir = sbd.md.rooti->i_num;
 
 	strncpy(sbd.sd_lockproto, opts.lockproto, GFS2_LOCKNAME_LEN - 1);
-- 
2.34.1

