Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A83122CD82D
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Dec 2020 14:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607003411;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=AaMtu4oshNrVjVOBJshekRfFTTjqgqDqMY54TQNy1qU=;
	b=DkJjY/9ktFZLHXlwE9ZfC2BRcPxF/Ctu5+8ApfB9ZRoyc6YnJaQIlfkatjckfmTlVUdrAp
	Uk1VQkFih6QNOPvqf4bG8YLGiiCsi3ntMYoUv5oMN3MMi9ExGPidEovHHy7ecd955KgsDS
	RDS4ptBCEN9IssP1R9X51aicV0V5cIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-xdBaSx1SPW6pOdk71Sn0lQ-1; Thu, 03 Dec 2020 08:50:09 -0500
X-MC-Unique: xdBaSx1SPW6pOdk71Sn0lQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 593C0817B9E;
	Thu,  3 Dec 2020 13:50:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A88C10016F4;
	Thu,  3 Dec 2020 13:50:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 140705002C;
	Thu,  3 Dec 2020 13:50:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3DntNR012915 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 08:49:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6768410016F6; Thu,  3 Dec 2020 13:49:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C28010016F4;
	Thu,  3 Dec 2020 13:49:55 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 536821809CA2;
	Thu,  3 Dec 2020 13:49:55 +0000 (UTC)
Date: Thu, 3 Dec 2020 08:49:55 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1955990783.31309994.1607003395266.JavaMail.zimbra@redhat.com>
In-Reply-To: <1532030071.31309682.1607003348976.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.72, 10.4.195.8]
Thread-Topic: gfs2: Remove sb_start_write from gfs2_statfs_sync
Thread-Index: yPKi5Awpdh0QPHiNifhyQXnsnn5ZTQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Remove sb_start_write from
	gfs2_statfs_sync
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Before this patch, function gfs2_statfs_sync called sb_start_write and
sb_end_write. This is completely unnecessary because, aside from grabbing
glocks, gfs2_statfs_sync does all its updates to statfs with a transaction:
gfs2_trans_begin and _end. And transactions always do sb_start_intwrite in
gfs2_trans_begin and sb_end_intwrite in gfs2_trans_end.

This patch simply removes the call to sb_start_write.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index b3d951ab8068..2f56acc41c04 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -353,7 +353,6 @@ int gfs2_statfs_sync(struct super_block *sb, int type)
 	struct buffer_head *m_bh, *l_bh;
 	int error;
 
-	sb_start_write(sb);
 	error = gfs2_glock_nq_init(m_ip->i_gl, LM_ST_EXCLUSIVE, GL_NOCACHE,
 				   &gh);
 	if (error)
@@ -392,7 +391,6 @@ int gfs2_statfs_sync(struct super_block *sb, int type)
 out_unlock:
 	gfs2_glock_dq_uninit(&gh);
 out:
-	sb_end_write(sb);
 	return error;
 }
 

