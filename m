Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C14C6EF79A
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Apr 2023 17:16:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682522174;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6F+h5oIy/R9Dg3140BJ/ZmJClYZzDddPKN9bBzhi4G4=;
	b=H/Bx15hLFItw6Pp0BW0gwU2Y9fqoHH1kqDBmxij4gQ5JUFLvD3zzxiDebMoVAZeUOpfiNc
	8YR2wmMep9r2OuEkqphwhz6Q77/wZLyUSr5KYFVcB7JjWVGIVEIaWItWW3u2quYnXu3WHz
	Ni4G1l9Kv7oAdBGPbw+xPkFB1FoeRzE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-Ew_lR1nCNW-vvD22-NxPmg-1; Wed, 26 Apr 2023 11:14:41 -0400
X-MC-Unique: Ew_lR1nCNW-vvD22-NxPmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C35138145B0;
	Wed, 26 Apr 2023 15:13:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45FCEC15BA0;
	Wed, 26 Apr 2023 15:13:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D04B11946A43;
	Wed, 26 Apr 2023 15:13:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C4CF119465BD for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Apr 2023 14:46:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A1F902166B41; Wed, 26 Apr 2023 14:46:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.22.9.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B7AF2166B44
 for <cluster-devel@redhat.com>; Wed, 26 Apr 2023 14:46:17 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 26 Apr 2023 10:46:16 -0400
Message-Id: <20230426144616.76625-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH] gfs2: fix minor comment typos
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/bmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index c739b258a2d9..8d611fbcf0bd 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1729,8 +1729,8 @@ static int punch_hole(struct gfs2_inode *ip, u64 offset, u64 length)
 
 	if (offset >= maxsize) {
 		/*
-		 * The starting point lies beyond the allocated meta-data;
-		 * there are no blocks do deallocate.
+		 * The starting point lies beyond the allocated metadata;
+		 * there are no blocks to deallocate.
 		 */
 		return 0;
 	}
-- 
2.40.0

