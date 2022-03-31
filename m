Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6824EECD2
	for <lists+cluster-devel@lfdr.de>; Fri,  1 Apr 2022 14:04:50 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-mRTJJehYNLi5r2smdUcu6w-1; Fri, 01 Apr 2022 08:04:46 -0400
X-MC-Unique: mRTJJehYNLi5r2smdUcu6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE49F3C1485F;
	Fri,  1 Apr 2022 12:04:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5DF41400C2F;
	Fri,  1 Apr 2022 12:04:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 695031940340;
	Fri,  1 Apr 2022 12:04:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C1ED619451F3 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 31 Mar 2022 22:40:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B5C092166B4C; Thu, 31 Mar 2022 22:40:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B07212166B3F
 for <cluster-devel@redhat.com>; Thu, 31 Mar 2022 22:40:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 865F6811E78
 for <cluster-devel@redhat.com>; Thu, 31 Mar 2022 22:40:31 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-PMeeJyLsO6mrRrevU-Wn5g-1; Thu, 31 Mar 2022 18:40:29 -0400
X-MC-Unique: PMeeJyLsO6mrRrevU-Wn5g-1
Received: by mail-ed1-f42.google.com with SMTP id b15so953734edn.4;
 Thu, 31 Mar 2022 15:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K4PijKfHqVSR8jpN9OjGMTbj1kKE70x0H0mGmScT4hA=;
 b=ij5hFPiRwZPoammMge8p5D82sXeGGuggib13g08Wkfz0/eNg8/KkF+jjz28gdk/8Vj
 oPqWSvJCjrb0A/Lr+WLpzvYoJgZkzgPaCej7AK8oFjIMzbc4ZAg/62uPSfYA4wRQr4h0
 yfUQZaQQx/tePs2PO8YKx5trUIeJO/SmYnKTtHY21DSLUyhDPvqV86PSbxlpRd/gEEP2
 Mb9dZtm71WC4XsBl0c+v0GvXJ+s6rzYm0NifgsyMAnc9CaH+EoeYvzTDfx1463/wNgCe
 UTGguh+Nih6oRmNEzSiNZZ6jzy7uucNoR0psVtjzBjtZoVyWLEeF/M/uUaVrTZu6oVkQ
 WmwA==
X-Gm-Message-State: AOAM533xF1E7X2SI0N+o4DqkRmLjpoeTFonoNJmYNgMgNhI2FnXxtZYr
 U04ZoA4RGPj4VdiM9/6tplEUNbq5T7xFdLOg
X-Google-Smtp-Source: ABdhPJziH3omYLkme2QH6lxqgk+xvHYZw5BgMrkqY/Y8acIgiYDBiMIm8SAS0sCsvtXhCWey1za7sg==
X-Received: by 2002:aa7:d682:0:b0:419:3b78:e489 with SMTP id
 d2-20020aa7d682000000b004193b78e489mr18676652edr.372.1648766428107; 
 Thu, 31 Mar 2022 15:40:28 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 j21-20020a170906255500b006e08c4862ccsm278505ejb.96.2022.03.31.15.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 15:40:27 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
Date: Fri,  1 Apr 2022 00:38:57 +0200
Message-Id: <20220331223857.902911-2-jakobkoschel@gmail.com>
In-Reply-To: <20220331223857.902911-1-jakobkoschel@gmail.com>
References: <20220331223857.902911-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mailman-Approved-At: Fri, 01 Apr 2022 12:04:43 +0000
Subject: [Cluster-devel] [PATCH 2/2] gfs2: replace usage of found with
 dedicated list iterator variable
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
Cc: linux-kernel@vger.kernel.org, "Bos, H.J." <h.j.bos@vu.nl>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>, cluster-devel@redhat.com,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Jakob Koschel <jakobkoschel@gmail.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

To move the list iterator variable into the list_for_each_entry_*()
macro in the future it should be avoided to use the list iterator
variable after the loop body.

To *never* use the list iterator variable after the loop it was
concluded to use a separate iterator variable instead of a
found boolean [1].

This removes the need to use a found variable and simply checking if
the variable was set, can determine if the break/goto was hit.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 fs/gfs2/quota.c    | 13 ++++++-------
 fs/gfs2/recovery.c | 22 ++++++++++------------
 2 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index be0997e24d60..dafd04fb9164 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -443,7 +443,7 @@ static int qd_check_sync(struct gfs2_sbd *sdp, struct gfs2_quota_data *qd,
 
 static int qd_fish(struct gfs2_sbd *sdp, struct gfs2_quota_data **qdp)
 {
-	struct gfs2_quota_data *qd = NULL;
+	struct gfs2_quota_data *qd = NULL, *iter;
 	int error;
 	int found = 0;
 
@@ -454,15 +454,14 @@ static int qd_fish(struct gfs2_sbd *sdp, struct gfs2_quota_data **qdp)
 
 	spin_lock(&qd_lock);
 
-	list_for_each_entry(qd, &sdp->sd_quota_list, qd_list) {
-		found = qd_check_sync(sdp, qd, &sdp->sd_quota_sync_gen);
-		if (found)
+	list_for_each_entry(iter, &sdp->sd_quota_list, qd_list) {
+		found = qd_check_sync(sdp, iter, &sdp->sd_quota_sync_gen);
+		if (found) {
+			qd = iter;
 			break;
+		}
 	}
 
-	if (!found)
-		qd = NULL;
-
 	spin_unlock(&qd_lock);
 
 	if (qd) {
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index 016ed1b2ca1d..2bb085a72e8e 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -55,17 +55,16 @@ int gfs2_replay_read_block(struct gfs2_jdesc *jd, unsigned int blk,
 int gfs2_revoke_add(struct gfs2_jdesc *jd, u64 blkno, unsigned int where)
 {
 	struct list_head *head = &jd->jd_revoke_list;
-	struct gfs2_revoke_replay *rr;
-	int found = 0;
+	struct gfs2_revoke_replay *rr = NULL, *iter;
 
-	list_for_each_entry(rr, head, rr_list) {
-		if (rr->rr_blkno == blkno) {
-			found = 1;
+	list_for_each_entry(iter, head, rr_list) {
+		if (iter->rr_blkno == blkno) {
+			rr = iter;
 			break;
 		}
 	}
 
-	if (found) {
+	if (rr) {
 		rr->rr_where = where;
 		return 0;
 	}
@@ -83,18 +82,17 @@ int gfs2_revoke_add(struct gfs2_jdesc *jd, u64 blkno, unsigned int where)
 
 int gfs2_revoke_check(struct gfs2_jdesc *jd, u64 blkno, unsigned int where)
 {
-	struct gfs2_revoke_replay *rr;
+	struct gfs2_revoke_replay *rr = NULL, *iter;
 	int wrap, a, b, revoke;
-	int found = 0;
 
-	list_for_each_entry(rr, &jd->jd_revoke_list, rr_list) {
-		if (rr->rr_blkno == blkno) {
-			found = 1;
+	list_for_each_entry(iter, &jd->jd_revoke_list, rr_list) {
+		if (iter->rr_blkno == blkno) {
+			rr = iter;
 			break;
 		}
 	}
 
-	if (!found)
+	if (!rr)
 		return 0;
 
 	wrap = (rr->rr_where < jd->jd_replay_tail);
-- 
2.25.1

