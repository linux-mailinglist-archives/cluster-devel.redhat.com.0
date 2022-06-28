Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7DD55EFC1
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Jun 2022 22:46:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656449183;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BcsVY1OPkKZ0bSTMBzDtRfeW2FEqJiWVDTUaBARc3oQ=;
	b=U2vYV5bBdiqgUmNE4tlr8N4rXlcKTHBb5TTQ+uk43MWiSl6tw0rK3M4NkwRMVvT52i7is6
	35DDfrEj/ssn1joBohhORWk1WZpj1oy8FwtT/zdXZaTWuPTTP7cAcV/ikuuM5GUSFoAiZn
	gFq/cR//6LsMzSRou0i3IZ8NrtpzQAA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-ihHeztEbMnCVHG-tQq9UxA-1; Tue, 28 Jun 2022 16:46:20 -0400
X-MC-Unique: ihHeztEbMnCVHG-tQq9UxA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D222E1C08970;
	Tue, 28 Jun 2022 20:46:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C83BE40334D;
	Tue, 28 Jun 2022 20:46:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 76C7E1947058;
	Tue, 28 Jun 2022 20:46:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3B7A019466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue, 28 Jun 2022 20:46:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 174D740C1289; Tue, 28 Jun 2022 20:46:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2721D4050C4A;
 Tue, 28 Jun 2022 20:46:17 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 28 Jun 2022 22:46:10 +0200
Message-Id: <20220628204611.651126-5-agruenba@redhat.com>
In-Reply-To: <20220628204611.651126-1-agruenba@redhat.com>
References: <20220628204611.651126-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 4/5] gfs2: Mark flock glock holders as
 GL_NOPID
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
Cc: linux-fsdevel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add the GL_NOPID flag for flock glock holders.  Clean up the flag
setting code in do_flock.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 25f4080bc973..1383f9598011 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1472,7 +1472,9 @@ static int do_flock(struct file *file, int cmd, struct file_lock *fl)
 	int sleeptime;
 
 	state = (fl->fl_type == F_WRLCK) ? LM_ST_EXCLUSIVE : LM_ST_SHARED;
-	flags = (IS_SETLKW(cmd) ? 0 : LM_FLAG_TRY_1CB) | GL_EXACT;
+	flags = GL_EXACT | GL_NOPID;
+	if (!IS_SETLKW(cmd))
+		flags |= LM_FLAG_TRY_1CB;
 
 	mutex_lock(&fp->f_fl_mutex);
 
@@ -1500,7 +1502,8 @@ static int do_flock(struct file *file, int cmd, struct file_lock *fl)
 		error = gfs2_glock_nq(fl_gh);
 		if (error != GLR_TRYFAILED)
 			break;
-		fl_gh->gh_flags = LM_FLAG_TRY | GL_EXACT;
+		fl_gh->gh_flags &= ~LM_FLAG_TRY_1CB;
+		fl_gh->gh_flags |= LM_FLAG_TRY;
 		msleep(sleeptime);
 	}
 	if (error) {
-- 
2.35.1

