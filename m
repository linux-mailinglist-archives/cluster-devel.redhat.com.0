Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A8648CBE1
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015636;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zMMyY/rflppg1glvl7cAywCtmVh9jEC57CLrrkqIKp4=;
	b=SwBOqN9Ef/9+H6tIDJ3iNcu58BQNcdIocwZa7os6sDymO+dVJCejwkmQG5wJN3+CQYA6+q
	sVKa5JsSYF6JIXPxktP5YGuop94xr5P/wu5dsSi34ehJ4LORtK7zm+PlE6gjxcJ8BH+5xv
	TVrSDUeZlEimJiFCoDD26tzwFUcg9Uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-dk_MnUL2PqC9zGRMAbzNKg-1; Wed, 12 Jan 2022 14:27:12 -0500
X-MC-Unique: dk_MnUL2PqC9zGRMAbzNKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8726190B2A2;
	Wed, 12 Jan 2022 19:27:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B723C19711;
	Wed, 12 Jan 2022 19:27:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4A561809CB8;
	Wed, 12 Jan 2022 19:27:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJR0Vv009253 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F233845D67; Wed, 12 Jan 2022 19:26:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B81160657
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:26:58 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:33 +0000
Message-Id: <20220112192650.1426415-2-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 01/18] libgfs2: Move debugging printf out of
	build_master()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
index a562dc50..95ad3ac9 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -38,10 +38,6 @@ int build_master(struct gfs2_sbd *sdp)
 	if (sdp->master_dir == NULL)
 		return -1;
 
-	if (cfg_debug) {
-		printf("\nMaster dir:\n");
-		lgfs2_dinode_print(bh->b_data);
-	}
 	sdp->master_dir->bh_owned = 1;
 	return 0;
 }
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 6f30b2d3..dbee5cab 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -1205,6 +1205,10 @@ int main(int argc, char *argv[])
 		fprintf(stderr, _("Error building '%s': %s\n"), "master", strerror(errno));
 		exit(EXIT_FAILURE);
 	}
+	if (opts.debug) {
+		printf("Metafs inode:\n");
+		lgfs2_dinode_print(sbd.master_dir->i_bh->b_data);
+	}
 	sbd.sd_meta_dir = sbd.master_dir->i_num;
 
 	error = lgfs2_build_jindex(sbd.master_dir, mkfs_journals, opts.journals);
-- 
2.34.1

