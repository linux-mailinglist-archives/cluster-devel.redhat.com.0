Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6A64E35DFB0
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Apr 2021 15:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618319181;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YTgvgtgW5tNoWYgRFiKGGJ64aoDhgOrwWSZ54L2nqRA=;
	b=PHV61OvkgzhPEtDgkneW3Ad6QiHSORMl+BnHbn8/P07NZEcuDCKznOplRZjocylq9VCZ/o
	JcsBMDEcp8+9Jlpq92JsOv4ro1xNgUjRiu2ZBWsdWk6ckWjwWH3Z1u9A9L0FeO4Kxik5kQ
	qNOl8+IjqUvVD5p19wZfeL8Gv2J9uDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-vSMbqxKwNHK4BI1AYKq-QA-1; Tue, 13 Apr 2021 09:06:20 -0400
X-MC-Unique: vSMbqxKwNHK4BI1AYKq-QA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F0681926DBC;
	Tue, 13 Apr 2021 13:06:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 712455D9CA;
	Tue, 13 Apr 2021 13:06:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E7F944A5B;
	Tue, 13 Apr 2021 13:06:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13DD6Dvf031094 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Apr 2021 09:06:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 25E441042AB0; Tue, 13 Apr 2021 13:06:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.36.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 788DA1042A9C
	for <cluster-devel@redhat.com>; Tue, 13 Apr 2021 13:06:12 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 13 Apr 2021 14:05:32 +0100
Message-Id: <20210413130532.1277163-6-anprice@redhat.com>
In-Reply-To: <20210413130532.1277163-1-anprice@redhat.com>
References: <20210413130532.1277163-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 5/5] fsck.gfs2: Improve rindex consistency
	check
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before we were ignoring the flag set by rindex_read to tell whether
there are bad entries and the rindex was (sometimes) fixed by subsequent
checks failing. Check that flag and enable an rindex repair test that
previously failed.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/initialize.c | 2 +-
 tests/fsck.at          | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index 4c266d9a..58dd23d3 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -751,7 +751,7 @@ static int fetch_rgrps_level(struct gfs2_sbd *sdp, enum rgindex_trust_level lvl,
 	if (rg_repair(sdp, lvl, ok) != 0)
 		goto fail;
 
-	if (rindex_read(sdp, count, ok) != 0)
+	if (rindex_read(sdp, count, ok) != 0 || !*ok)
 		goto fail;
 
 	ret = read_rgrps(sdp, *count);
diff --git a/tests/fsck.at b/tests/fsck.at
index 3b1c5af3..538d41ad 100644
--- a/tests/fsck.at
+++ b/tests/fsck.at
@@ -36,10 +36,10 @@ AT_KEYWORDS(fsck.gfs2 fsck)
 GFS_NUKERG_CHECK([mkfs.gfs2 -O -p lock_nolock $GFS_TGT], [-r 1])
 AT_CLEANUP
 
-#AT_SETUP([Fix bad rindex entry #0])
-#AT_KEYWORDS(fsck.gfs2 fsck)
-#GFS_NUKERG_CHECK([mkfs.gfs2 -O -p lock_nolock $GFS_TGT], [-i 0])
-#AT_CLEANUP
+AT_SETUP([Fix bad rindex entry #0])
+AT_KEYWORDS(fsck.gfs2 fsck)
+GFS_NUKERG_CHECK([mkfs.gfs2 -O -p lock_nolock $GFS_TGT], [-i 0])
+AT_CLEANUP
 
 AT_SETUP([Fix bad rindex entry #1])
 AT_KEYWORDS(fsck.gfs2 fsck)
-- 
2.30.2

