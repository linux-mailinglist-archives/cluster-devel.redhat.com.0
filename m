Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D54E83858
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Aug 2019 20:02:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E33DF7E436;
	Tue,  6 Aug 2019 18:01:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DD00608A5;
	Tue,  6 Aug 2019 18:01:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C45AE203;
	Tue,  6 Aug 2019 18:01:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x76HqN9l012072 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 6 Aug 2019 13:52:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AE51E60C57; Tue,  6 Aug 2019 17:52:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A959160C44
	for <cluster-devel@redhat.com>; Tue,  6 Aug 2019 17:52:21 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E54C18005A4
	for <cluster-devel@redhat.com>; Tue,  6 Aug 2019 17:52:21 +0000 (UTC)
Date: Tue, 6 Aug 2019 13:52:21 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <775740225.7054994.1565113941324.JavaMail.zimbra@redhat.com>
In-Reply-To: <1868688025.7054949.1565113904519.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.116.200, 10.4.195.22]
Thread-Topic: gfs2: untangle the logic in gfs2_drevalidate
Thread-Index: sbfYJBNuypysycK/BYIiied0qiA67A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: untangle the logic in
	gfs2_drevalidate
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 06 Aug 2019 18:02:01 +0000 (UTC)

Hi,

Before this patch, function gfs2_drevalidate was a horrific tangle of
unreadable labels, cases and goto statements. This patch tries to
simplify the logic and make it more readable.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/dentry.c | 45 +++++++++++----------------------------------
 1 file changed, 11 insertions(+), 34 deletions(-)

diff --git a/fs/gfs2/dentry.c b/fs/gfs2/dentry.c
index a7bb76e9a82b..26d73f94ae45 100644
--- a/fs/gfs2/dentry.c
+++ b/fs/gfs2/dentry.c
@@ -38,7 +38,7 @@ static int gfs2_drevalidate(struct dentry *dentry, unsigned int flags)
 	struct inode *inode;
 	struct gfs2_holder d_gh;
 	struct gfs2_inode *ip = NULL;
-	int error;
+	int error, valid = 0;
 	int had_lock = 0;
 
 	if (flags & LOOKUP_RCU)
@@ -51,53 +51,30 @@ static int gfs2_drevalidate(struct dentry *dentry, unsigned int flags)
 
 	if (inode) {
 		if (is_bad_inode(inode))
-			goto invalid;
+			goto out;
 		ip = GFS2_I(inode);
 	}
 
-	if (sdp->sd_lockstruct.ls_ops->lm_mount == NULL)
-		goto valid;
+	if (sdp->sd_lockstruct.ls_ops->lm_mount == NULL) {
+		valid = 1;
+		goto out;
+	}
 
 	had_lock = (gfs2_glock_is_locked_by_me(dip->i_gl) != NULL);
 	if (!had_lock) {
 		error = gfs2_glock_nq_init(dip->i_gl, LM_ST_SHARED, 0, &d_gh);
 		if (error)
-			goto fail;
-	} 
-
-	error = gfs2_dir_check(d_inode(parent), &dentry->d_name, ip);
-	switch (error) {
-	case 0:
-		if (!inode)
-			goto invalid_gunlock;
-		break;
-	case -ENOENT:
-		if (!inode)
-			goto valid_gunlock;
-		goto invalid_gunlock;
-	default:
-		goto fail_gunlock;
+			goto out;
 	}
 
-valid_gunlock:
-	if (!had_lock)
-		gfs2_glock_dq_uninit(&d_gh);
-valid:
-	dput(parent);
-	return 1;
+	error = gfs2_dir_check(d_inode(parent), &dentry->d_name, ip);
+	valid = (!error && inode) || ((error == -ENOENT) && !inode);
 
-invalid_gunlock:
 	if (!had_lock)
 		gfs2_glock_dq_uninit(&d_gh);
-invalid:
+out:
 	dput(parent);
-	return 0;
-
-fail_gunlock:
-	gfs2_glock_dq_uninit(&d_gh);
-fail:
-	dput(parent);
-	return 0;
+	return valid;
 }
 
 static int gfs2_dhash(const struct dentry *dentry, struct qstr *str)

