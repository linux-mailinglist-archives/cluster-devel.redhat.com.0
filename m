Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B8E4F5C0A
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Apr 2022 13:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649243811;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UXpwr2FddwwDlrSSVfDXyJFNDUJZx7XB5GQOifsRqzY=;
	b=XOMIylN5oDCr6bgzhD1Kc+wA2r5BsNenY5/fFVrSvhTToTKaNuPMbWxGkYzVf+gnpnlqya
	vITuF4Pm+3WaSARNXnDWC6+OuP4jvhy+ERI6skHTyZgAXyCXzd3idXwyvOQ4v8gAlwCqY9
	qB33ifQ+4l0qKK0BT5y5AdHvxyE9wj4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-avfdJjyyMK2pRdez4oOJeQ-1; Wed, 06 Apr 2022 07:16:48 -0400
X-MC-Unique: avfdJjyyMK2pRdez4oOJeQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C1D4811E90;
	Wed,  6 Apr 2022 11:16:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5FE3D515A52;
	Wed,  6 Apr 2022 11:16:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 19CCF194036C;
	Wed,  6 Apr 2022 11:16:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 31BC81949763 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 11:16:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0CB74515A59; Wed,  6 Apr 2022 11:16:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E62C515A52;
 Wed,  6 Apr 2022 11:16:44 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  6 Apr 2022 13:16:43 +0200
Message-Id: <20220406111643.973001-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Cluster-devel] [PATCH] gfs2: Mark flock glock holders as GL_NOPID
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add the GL_NOPID flag for flock glock holders.  Clean up the flag
setting code in do_flock.

In add_to_queue(), since flock glock holders now always have the
GL_NOPID flag set, there is no need to separately check for those types
of locks anymore.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c  | 7 +++++--
 fs/gfs2/glock.c | 2 --
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 22b41acfbbc3..6f57a132ef26 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1469,7 +1469,9 @@ static int do_flock(struct file *file, int cmd, struct file_lock *fl)
 	int sleeptime;
 
 	state = (fl->fl_type == F_WRLCK) ? LM_ST_EXCLUSIVE : LM_ST_SHARED;
-	flags = (IS_SETLKW(cmd) ? 0 : LM_FLAG_TRY_1CB) | GL_EXACT;
+	flags = GL_EXACT | GL_NOPID;
+	if (!IS_SETLKW(cmd))
+		flags |= LM_FLAG_TRY_1CB;
 
 	mutex_lock(&fp->f_fl_mutex);
 
@@ -1495,7 +1497,8 @@ static int do_flock(struct file *file, int cmd, struct file_lock *fl)
 		error = gfs2_glock_nq(fl_gh);
 		if (error != GLR_TRYFAILED)
 			break;
-		fl_gh->gh_flags = LM_FLAG_TRY | GL_EXACT;
+		fl_gh->gh_flags &= ~LM_FLAG_TRY_1CB;
+		fl_gh->gh_flags |= LM_FLAG_TRY;
 		msleep(sleeptime);
 	}
 	if (error) {
diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 106a994b20c0..26169cedcefc 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1508,8 +1508,6 @@ __acquires(&gl->gl_lockref.lock)
 	list_for_each_entry(gh2, &gl->gl_holders, gh_list) {
 		if (likely(gh2->gh_owner_pid != gh->gh_owner_pid))
 			continue;
-		if (gh->gh_gl->gl_ops->go_type == LM_TYPE_FLOCK)
-			continue;
 		if (test_bit(HIF_MAY_DEMOTE, &gh2->gh_iflags))
 			continue;
 		if (!pid_is_meaningful(gh2))
-- 
2.35.1

