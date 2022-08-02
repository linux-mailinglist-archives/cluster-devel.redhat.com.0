Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D645880EB
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Aug 2022 19:21:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659460882;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V0n61k7DFxGxV8/ka8vyNS9JAnE181an5DApAVHAXfs=;
	b=MRXOvwliavGkxS6NWtyZX6WX+YQKg/7ZS35ABkox4+P1FGgLpcOQ96DykrCiSPtryYE8sd
	pfUW18LpT3N38A/B2bl3cGdGN/1nHuJ/nO7ndvEcufOdPnK+7eyA4krrWO+OPkGtkLCwVh
	1hAcJX/b5P2n49MRWnU74eBsKk7iUfI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-7pEEhMKAM8CDD7MxBUWAAQ-1; Tue, 02 Aug 2022 13:21:16 -0400
X-MC-Unique: 7pEEhMKAM8CDD7MxBUWAAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73D4D101A5B9;
	Tue,  2 Aug 2022 17:21:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30AAF2166B26;
	Tue,  2 Aug 2022 17:21:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C1EFC1946A50;
	Tue,  2 Aug 2022 17:21:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 842F21946A50 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 17:21:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5F30F1121315; Tue,  2 Aug 2022 17:21:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 286861121314;
 Tue,  2 Aug 2022 17:21:11 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  2 Aug 2022 13:21:06 -0400
Message-Id: <20220802172108.3396447-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH dlm/next 1/3] fs: dlm: allow lockspaces have
 zero lvblen
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
Cc: cluster-devel@redhat.com, dave@stgolabs.net, josh@joshtriplett.org,
 paulmck@kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

A dlm user can never use DLM_LKF_VALBLK flag with DLM API calls so a zero
lvblen should be allowed as per lockspace parameter.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lockspace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 0dc72756a0da..65fd60d8f2d5 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -416,7 +416,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	if (namelen > DLM_LOCKSPACE_LEN || namelen == 0)
 		return -EINVAL;
 
-	if (!lvblen || (lvblen % 8))
+	if (lvblen % 8)
 		return -EINVAL;
 
 	if (!try_module_get(THIS_MODULE))
-- 
2.31.1

