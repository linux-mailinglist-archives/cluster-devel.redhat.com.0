Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CED51546B40
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Jun 2022 19:06:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654880790;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ja8kAfjs0suP1AzhYauNawhLg86K1HZrQzzxJDLUZ2Y=;
	b=T/8rW0qlwenFzpKoLFYNrZaZjwGobRTWTntmgKKwK3YM6sdHs8+zcvBCgGywekXfpcKOub
	gzREyZDof2PEVvkA3RMCGnCx4C4kxgVY7gAberNgRWnTlw44bnqQpcGzs9xe9inBLlN/Y7
	O5aH/1bU5OxfTjy8JBNLJeNJt9bxI0Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-SvI1mW7qNJCOJEQ-g5O83A-1; Fri, 10 Jun 2022 13:06:27 -0400
X-MC-Unique: SvI1mW7qNJCOJEQ-g5O83A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D4602949BCC;
	Fri, 10 Jun 2022 17:06:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32C00492C3B;
	Fri, 10 Jun 2022 17:06:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 208F51947067;
	Fri, 10 Jun 2022 17:06:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ADE0719466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Jun 2022 17:06:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9834E17452; Fri, 10 Jun 2022 17:06:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79A1E1730C;
 Fri, 10 Jun 2022 17:06:23 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 10 Jun 2022 13:06:15 -0400
Message-Id: <20220610170616.3480642-7-aahringo@redhat.com>
In-Reply-To: <20220610170616.3480642-1-aahringo@redhat.com>
References: <20220610170616.3480642-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v5.19-rc1 6/7] fs: dlm: change -EINVAL
 recovery error to -EAGAIN
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch changes a -EINVAL error for dlm_master_lookup() to -EAGAIN.
It is a critical error which should not happened, if it happens there
exists an issue. However we still track those issues inside the lock but
if they happen we try to run recovery again if those issues will get
resolved. If not recovery has a logic to fail this node after several
retries.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 226822f49d30..ad32a883c1fd 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1018,7 +1018,10 @@ int dlm_master_lookup(struct dlm_ls *ls, int from_nodeid, char *name, int len,
 			  from_nodeid, dir_nodeid, our_nodeid, hash,
 			  ls->ls_num_nodes);
 		*r_nodeid = -1;
-		return -EINVAL;
+		/* this case should never occur, we try again
+		 * to hope it got resolved
+		 */
+		return -EAGAIN;
 	}
 
  retry:
-- 
2.31.1

