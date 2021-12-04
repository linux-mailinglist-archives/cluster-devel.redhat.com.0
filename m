Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4781468406
	for <lists+cluster-devel@lfdr.de>; Sat,  4 Dec 2021 11:27:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638613659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5eac//DiqlhavwBSZcU+c/1vue6+GYNGgF/ZFSrNPXs=;
	b=Nup0y/n0jfqcgeqdOs5sWzk6Jrbbty2GRM3DhMxwohHwelS4ihdqX4QfbGWIW/V5KJWFAZ
	fsbTe/n5x7YyPBIaGb1WTuqCmcqK9WHYWxZGcLR5wKclrg7NcbTdTYrEelDjMoBzI9Opzz
	Q76rPbKjCeEfEf9ggs2i6tYGK67Dllg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-VbJrDS4dMAmnrDaUkTj13g-1; Sat, 04 Dec 2021 05:27:38 -0500
X-MC-Unique: VbJrDS4dMAmnrDaUkTj13g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58C61100CD01;
	Sat,  4 Dec 2021 10:27:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 493785C640;
	Sat,  4 Dec 2021 10:27:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67E4D4A7C8;
	Sat,  4 Dec 2021 10:27:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B4ARVl5017301 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 4 Dec 2021 05:27:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EB7445C642; Sat,  4 Dec 2021 10:27:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.192.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 344645C640;
	Sat,  4 Dec 2021 10:27:31 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat,  4 Dec 2021 11:27:16 +0100
Message-Id: <20211204102718.19482-2-agruenba@redhat.com>
In-Reply-To: <20211204102718.19482-1-agruenba@redhat.com>
References: <20211204102718.19482-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 2/4] gfs2: gfs2_inode_lookup cleanup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

In gfs2_inode_lookup, once the inode has been looked up, we check if the
inode generation (no_formal_ino) is the one we're looking for.  If it
isn't and the inode wasn't in the inode cache, we discard the newly
looked up inode.  This is unnecessary, complicates the code, and makes
future changes to gfs2_inode_lookup harder, so change the code to retain
newly looked up inodes instead.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/inode.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 6424b903e885..806357f0c7ee 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -208,20 +208,15 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 			gfs2_glock_dq_uninit(&i_gh);
 
 		gfs2_set_iop(inode);
+		unlock_new_inode(inode);
 	}
 
 	if (no_formal_ino && ip->i_no_formal_ino &&
 	    no_formal_ino != ip->i_no_formal_ino) {
-		error = -ESTALE;
-		if (inode->i_state & I_NEW)
-			goto fail;
 		iput(inode);
-		return ERR_PTR(error);
+		return ERR_PTR(-ESTALE);
 	}
 
-	if (inode->i_state & I_NEW)
-		unlock_new_inode(inode);
-
 	return inode;
 
 fail:
-- 
2.33.1

