Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 125EF4B296C
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Feb 2022 16:50:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644594626;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S4AOyoes4dQ7Oz/aQw5PM+WcPulPsa9By2IM+TK/SQo=;
	b=Wf+6Z0NMpyZjK8B90N2ZYmFFcDo2qKlePsbVScemTvXSPJohUJ0iBUz4cyGO9xOyhz8tng
	1dTCWlosD4jBXX+Pic/MWy+tH/8KPqVoxGpKEHp6bEXvwl8Ju0wObV8RDDUNR38u5beQHa
	uVY0QgCUmo0APVYmwy1pw4weqkJG4i8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-veIkVezkMOWWCzKIk8mxZQ-1; Fri, 11 Feb 2022 10:50:24 -0500
X-MC-Unique: veIkVezkMOWWCzKIk8mxZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FCBD1091DA0;
	Fri, 11 Feb 2022 15:50:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02AA97B9FE;
	Fri, 11 Feb 2022 15:50:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C7191809CB8;
	Fri, 11 Feb 2022 15:50:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21BFo8L1029724 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Feb 2022 10:50:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC2567CAE1; Fri, 11 Feb 2022 15:50:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (unknown [10.2.16.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95ACD7CADB
	for <cluster-devel@redhat.com>; Fri, 11 Feb 2022 15:50:08 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 11 Feb 2022 10:50:08 -0500
Message-Id: <20220211155008.108304-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: use i_lock spin_lock for inode qadata
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, functions gfs2_qa_get and _put used the i_rw_mutex to
prevent simultaneous access to its i_qadata. But i_rw_mutex is now used
for many other things, including iomap_begin and end, which causes a
conflict according to lockdep. We cannot just remove the lock since
simultaneous opens (gfs2_open -> gfs2_open_common -> gfs2_qa_get) can
then stomp on each others values for i_qadata.

This patch solves the conflict by using the i_lock spin_lock in the inode
to prevent simultaneous access.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/quota.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index be0997e24d60..dc77080a82bb 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -531,34 +531,42 @@ static void qdsb_put(struct gfs2_quota_data *qd)
  */
 int gfs2_qa_get(struct gfs2_inode *ip)
 {
-	int error = 0;
 	struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
+	struct inode *inode = &ip->i_inode;
 
 	if (sdp->sd_args.ar_quota == GFS2_QUOTA_OFF)
 		return 0;
 
-	down_write(&ip->i_rw_mutex);
+	spin_lock(&inode->i_lock);
 	if (ip->i_qadata == NULL) {
-		ip->i_qadata = kmem_cache_zalloc(gfs2_qadata_cachep, GFP_NOFS);
-		if (!ip->i_qadata) {
-			error = -ENOMEM;
-			goto out;
-		}
+		struct gfs2_qadata *tmp;
+
+		spin_unlock(&inode->i_lock);
+		tmp = kmem_cache_zalloc(gfs2_qadata_cachep, GFP_NOFS);
+		if (!tmp)
+			return -ENOMEM;
+
+		spin_lock(&inode->i_lock);
+		if (ip->i_qadata == NULL)
+			ip->i_qadata = tmp;
+		else
+			kmem_cache_free(gfs2_qadata_cachep, tmp);
 	}
 	ip->i_qadata->qa_ref++;
-out:
-	up_write(&ip->i_rw_mutex);
-	return error;
+	spin_unlock(&inode->i_lock);
+	return 0;
 }
 
 void gfs2_qa_put(struct gfs2_inode *ip)
 {
-	down_write(&ip->i_rw_mutex);
+	struct inode *inode = &ip->i_inode;
+
+	spin_lock(&inode->i_lock);
 	if (ip->i_qadata && --ip->i_qadata->qa_ref == 0) {
 		kmem_cache_free(gfs2_qadata_cachep, ip->i_qadata);
 		ip->i_qadata = NULL;
 	}
-	up_write(&ip->i_rw_mutex);
+	spin_unlock(&inode->i_lock);
 }
 
 int gfs2_quota_hold(struct gfs2_inode *ip, kuid_t uid, kgid_t gid)
-- 
2.34.1

