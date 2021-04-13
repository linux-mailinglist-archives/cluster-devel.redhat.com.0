Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A53AA35DFAD
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Apr 2021 15:06:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618319179;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RkBoK4tF0JBzu0YJBqloVSezmPF/gOACO9WAC8teLVc=;
	b=IgYQSLL233wEojmNdTKjUeY+XMNpQtSmarBOBWuBpvy8E+44XOkG1echJYtcNp9RSBgYhG
	85IJnVttxrzSL4IQYZzn1HhYpmLS/GYamCaEnBEnqr/LhsjSKz03qVWqnc6pV7AMwqDTLq
	AcpZJpn8xK4ZChO7cpC9DlzTaacUozA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-OUWVGuM9PaK3rEVy2iPq1w-1; Tue, 13 Apr 2021 09:06:18 -0400
X-MC-Unique: OUWVGuM9PaK3rEVy2iPq1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCC558030A0;
	Tue, 13 Apr 2021 13:06:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EF1319C46;
	Tue, 13 Apr 2021 13:06:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9EAF644A5F;
	Tue, 13 Apr 2021 13:06:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13DD68XJ031034 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Apr 2021 09:06:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8533E1042A9C; Tue, 13 Apr 2021 13:06:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.36.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC76C1059A46
	for <cluster-devel@redhat.com>; Tue, 13 Apr 2021 13:06:07 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 13 Apr 2021 14:05:28 +0100
Message-Id: <20210413130532.1277163-2-anprice@redhat.com>
In-Reply-To: <20210413130532.1277163-1-anprice@redhat.com>
References: <20210413130532.1277163-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/5] fsck.gfs2: Refactor fetch_rgrps()
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

Split out the code that fetches the rgrps at a trust level into its own
function and restructure it with gotos as subsequent changes would add
too much nesting otherwise.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/initialize.c | 59 ++++++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index 5f176dca..0cafeb95 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -730,13 +730,9 @@ static int ri_update(struct gfs2_sbd *sdp, int *rgcount, int *ok)
 	return -1;
 }
 
-/**
- * fetch_rgrps - fetch the resource groups from disk, and check their integrity
- */
-static int fetch_rgrps(struct gfs2_sbd *sdp)
+static int fetch_rgrps_level(struct gfs2_sbd *sdp, enum rgindex_trust_level lvl, int *count, int *ok)
 {
-	enum rgindex_trust_level trust_lvl;
-	int rgcount, ok = 1;
+	int ret = 1;
 
 	const char *level_desc[] = {
 		_("Checking if all rgrp and rindex values are good"),
@@ -752,30 +748,43 @@ static int fetch_rgrps(struct gfs2_sbd *sdp)
 		_("Too many rgrp misses: rgrps must be unevenly spaced"),
 		_("Too much damage found: we cannot rebuild this rindex"),
 	};
-	/*******************************************************************
-	 ********  Validate and read in resource group information  ********
-	 *******************************************************************/
+
+	log_notice(_("Level %d resource group check: %s.\n"), lvl + 1, level_desc[lvl]);
+
+	if (rg_repair(sdp, lvl, count, ok) != 0)
+		goto fail;
+
+	ret = ri_update(sdp, count, ok);
+	if (ret != 0)
+		goto fail;
+
+	log_notice(_("(level %d passed)\n"), lvl + 1);
+	return 0;
+fail:
+	if (ret == -1)
+		log_err(_("(level %d failed: %s)\n"), lvl + 1, fail_desc[lvl]);
+	else
+		log_err(_("(level %d failed at block %d (0x%x): %s)\n"), lvl + 1,
+		        ret, ret, fail_desc[lvl]);
+	return ret;
+}
+
+/**
+ * fetch_rgrps - fetch the resource groups from disk, and check their integrity
+ */
+static int fetch_rgrps(struct gfs2_sbd *sdp)
+{
+	enum rgindex_trust_level trust_lvl;
+	int rgcount;
+	int ok = 1;
+
 	log_notice(_("Validating resource group index.\n"));
 	for (trust_lvl = blind_faith; trust_lvl <= indignation; trust_lvl++) {
 		int ret = 0;
 
-		log_notice(_("Level %d resource group check: %s.\n"), trust_lvl + 1,
-			  level_desc[trust_lvl]);
-		if ((rg_repair(sdp, trust_lvl, &rgcount, &ok) == 0) &&
-		    ((ret = ri_update(sdp, &rgcount, &ok)) == 0)) {
-			log_notice(_("(level %d passed)\n"), trust_lvl + 1);
+		ret = fetch_rgrps_level(sdp, trust_lvl, &rgcount, &ok);
+		if (ret == 0)
 			break;
-		} else {
-			if (ret == -1)
-				log_err( _("(level %d failed: %s)\n"),
-					 trust_lvl + 1, fail_desc[trust_lvl]);
-			else
-				log_err( _("(level %d failed at block %lld "
-					   "(0x%llx): %s)\n"), trust_lvl + 1,
-					 (unsigned long long)ret,
-					 (unsigned long long)ret,
-					 fail_desc[trust_lvl]);
-		}
 		if (fsck_abort)
 			break;
 	}
-- 
2.30.2

