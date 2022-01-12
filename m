Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB6948CBEB
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015657;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/ZQf944RDpYV8QJVBrdL4/3Phmhine76H4Iin+0Vadk=;
	b=NBZj4vK294R0LYeOp/to/QIVBj7w5xh+gh79CLDsWKI7zj6RxEr5OFfSnvsa71A5kPZktz
	XGW1eaargHhsOt078PTRh5Kp6yKAijyi6ShP2ywaMQnhjEbBrTNI/Y3m2rgWmsReFjnur8
	neQXbJ+2Eg6IUbEw11DIiCx8WAExlrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-bBTOP-aXMzaQPYy56vVRFQ-1; Wed, 12 Jan 2022 14:27:34 -0500
X-MC-Unique: bBTOP-aXMzaQPYy56vVRFQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A91E881CCB5;
	Wed, 12 Jan 2022 19:27:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 989D51970E;
	Wed, 12 Jan 2022 19:27:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 834C34A700;
	Wed, 12 Jan 2022 19:27:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJRS8V009391 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EA85C45D6D; Wed, 12 Jan 2022 19:27:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D71C60BD8
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:27 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:46 +0000
Message-Id: <20220112192650.1426415-15-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 14/18] libgfs2: Move debugging output out of
	do_init_inum()
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

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/libgfs2/structures.c | 3 ---
 gfs2/mkfs/main_mkfs.c     | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index d4a08c43..9b78ed51 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -465,9 +465,6 @@ int do_init_inum(struct gfs2_sbd *sdp)
 	if (count != sizeof(uint64_t))
 		return -1;
 
-	if (cfg_debug)
-		printf("\nNext Inum: %"PRIu64"\n",
-		       sdp->md.next_inum);
 	return 0;
 }
 
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 36341d99..ae192bd4 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -1356,6 +1356,9 @@ int main(int argc, char *argv[])
 	sbd.sd_locktable[GFS2_LOCKNAME_LEN - 1] = '\0';
 
 	do_init_inum(&sbd);
+	if (opts.debug)
+		printf("\nNext Inum: %"PRIu64"\n", sbd.md.next_inum);
+
 	do_init_statfs(&sbd, &sc);
 	if (opts.debug) {
 		printf("\nStatfs:\n");
-- 
2.34.1

