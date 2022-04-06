Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8174F5C08
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Apr 2022 13:16:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649243808;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nDPGsVNAMjpnWCoLRa/FALv8DfoFDgmBMal6p7i8qy0=;
	b=Gl0PpwcDHGAL/BaO9aGce4ApFrZoGFBYy0r9ger8CNROmWAjEUPohAC2NsHhVzDCQwLiRd
	hpm1xVZD2U+0v8YWoTNXR4bPpDDfUc8gMGB1Cr8GP8hJiqNjk0aM1aOtsm7wBeI+dzlj2C
	mpvIGi2Q6W4+JzDloSm4s7gpsm+mX+k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-n8re5qNDN5eWRSzOQC_llw-1; Wed, 06 Apr 2022 07:16:46 -0400
X-MC-Unique: n8re5qNDN5eWRSzOQC_llw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACE653C1411B;
	Wed,  6 Apr 2022 11:16:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CD5E40CF905;
	Wed,  6 Apr 2022 11:16:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 366CD194036C;
	Wed,  6 Apr 2022 11:16:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E79521949762 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 11:16:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A81D040470D0; Wed,  6 Apr 2022 11:16:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16D7040D1B9D;
 Wed,  6 Apr 2022 11:16:40 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  6 Apr 2022 13:16:39 +0200
Message-Id: <20220406111639.972968-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH] gfs2: Replace list_prepare_entry() with
 list_entry()
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In gfs2_before_commit(), use list_entry() instead of
list_prepare_entry() for letting the iterator variables
point at the list head.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/lops.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 6ba51cbb94cf..9816d9330456 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -653,7 +653,7 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 				bool is_databuf)
 {
 	struct gfs2_log_descriptor *ld;
-	struct gfs2_bufdata *bd1 = NULL, *bd2;
+	struct gfs2_bufdata *bd1, *bd2;
 	struct page *page;
 	unsigned int num;
 	unsigned n;
@@ -661,7 +661,8 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 
 	gfs2_log_lock(sdp);
 	list_sort(NULL, blist, blocknr_cmp);
-	bd1 = bd2 = list_prepare_entry(bd1, blist, bd_list);
+	/* bd1 and bd2 initially point at the list head */
+	bd1 = bd2 = list_entry(blist, struct gfs2_bufdata, bd_list);
 	while(total) {
 		num = total;
 		if (total > limit)
-- 
2.35.1

