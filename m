Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFC0588165
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Aug 2022 19:58:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659463103;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=26M1cXLTFCu4acT3sZD6TnkVyCtQSTdDRByu2l/Q/+s=;
	b=M2TExhSMWWcr7YtMgS8KgpYB4stCS/TQ5c17PdrPogPwSKVo8GOUR4emXGd9ijIqHcrM8O
	JNY9XKO10PST8EgG2zNsP2mewY/6HQ1MJObGVcsQIe61qJNZGJjKwss9e1T71JA4uGwNEP
	9EGTAl0Zyoo/vRblnyJvuBqf2WRbFc8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-pRu0ev-dMOao3OYNqfzVGA-1; Tue, 02 Aug 2022 13:58:16 -0400
X-MC-Unique: pRu0ev-dMOao3OYNqfzVGA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E90F1C06EE2;
	Tue,  2 Aug 2022 17:58:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 431D0C15D4F;
	Tue,  2 Aug 2022 17:58:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9B4631946A65;
	Tue,  2 Aug 2022 17:58:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 365F61946A57 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 17:58:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A5AD91400E74; Tue,  2 Aug 2022 17:58:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.2.16.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DA371415118
 for <cluster-devel@redhat.com>; Tue,  2 Aug 2022 17:58:12 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue,  2 Aug 2022 12:58:09 -0500
Message-Id: <20220802175811.438067-2-rpeterso@redhat.com>
In-Reply-To: <20220802175811.438067-1-rpeterso@redhat.com>
References: <20220802175811.438067-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Cluster-devel] [PATCH 1/3] gfs2: Prevent double iput for journal
 on error
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

When a gfs2 file system is withdrawn it does iput on its journal to
allow recovery from another cluster node. If it's unable to get a
replacement inode for whatever reason, the journal descriptor would
still be pointing at the evicted inode. So when unmount clears out the
list of journals, it would do a second iput referencing the pointer.
To avoid this, set the journal inode pointer to NULL.

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
2.36.1

