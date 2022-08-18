Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 486ED598B3B
	for <lists+cluster-devel@lfdr.de>; Thu, 18 Aug 2022 20:32:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660847569;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NT1jxqgUe3Xvn6HkwN+hQ12zIzESFp2/2T8fbkqDfEY=;
	b=cdwChBkgzMmFmS/I8SGQcXBXnxnKzUOK2+6pvOYsY/8r3Edm+MJzTvc+Hofx0Wtos0kGnE
	rmlynpRgq98P8exOMQUaM6mxDDXYjYvfPAnk1/jcvCc9I1N22DFnd9jar7ayw38oviSfp2
	o+KBALABqPp4ZdrnHSVStjlArz04gxE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-gdcjuM76O3ej6RJ96cvT3A-1; Thu, 18 Aug 2022 14:32:45 -0400
X-MC-Unique: gdcjuM76O3ej6RJ96cvT3A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35BFE801755;
	Thu, 18 Aug 2022 18:32:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 00F0C140EBE3;
	Thu, 18 Aug 2022 18:32:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 51C8C194E11C;
	Thu, 18 Aug 2022 18:32:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D49D51946A42 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 18:32:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B61F1C15BC0; Thu, 18 Aug 2022 18:32:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.2.17.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9166FC15BBA
 for <cluster-devel@redhat.com>; Thu, 18 Aug 2022 18:32:39 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 18 Aug 2022 13:32:36 -0500
Message-Id: <20220818183238.121677-2-rpeterso@redhat.com>
In-Reply-To: <20220818183238.121677-1-rpeterso@redhat.com>
References: <20220818183238.121677-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Cluster-devel] [GFS2 v3 PATCH 1/3] gfs2: Prevent double iput for
 journal on error
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

When a gfs2 file system is withdrawn it does iput on its journal to
allow recovery from another cluster node. If it's unable to get a
replacement inode for whatever reason, the journal descriptor would
still be pointing at the evicted inode. So when unmount clears out the
list of journals, it would do a second iput referencing the pointer.
To avoid this, set the inode pointer to NULL.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/util.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 8241029a2a5d..95c79a3ec161 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -204,6 +204,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 	 * exception code in glock_dq.
 	 */
 	iput(inode);
+	sdp->sd_jdesc->jd_inode = NULL;
 	/*
 	 * Wait until the journal inode's glock is freed. This allows try locks
 	 * on other nodes to be successful, otherwise we remain the owner of
-- 
2.37.2

