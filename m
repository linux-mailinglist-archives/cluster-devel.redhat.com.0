Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D79D4F6700
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Apr 2022 19:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649266478;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IyvFf+DCL2hc/t3WsFdKzZll3I/o2aU4yKX6j4s525g=;
	b=AkSJJAkR4uwJVtfvh1TmzCUXGN6FtDQov3oY8umdpo//7sMi12jdbtuBWrGdolpj8GgKmm
	YwYrzl+l6r3yC+/5ouXUPjWJ/qNBJDV6Ni3+ar59HBc7VmEolnN6CP620jSiC4MvQzxAgg
	UcaGrjwpp6rWP5xYAV72lKk8Duw4UaU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-sNA5j_JPP2qiCk-XFOJYsg-1; Wed, 06 Apr 2022 13:34:33 -0400
X-MC-Unique: sNA5j_JPP2qiCk-XFOJYsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66C4018F0274;
	Wed,  6 Apr 2022 17:34:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0B58145BA43;
	Wed,  6 Apr 2022 17:34:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D2B21194036B;
	Wed,  6 Apr 2022 17:34:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5320A194034B for <cluster-devel@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 17:34:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2448340D2823; Wed,  6 Apr 2022 17:34:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7905640D2825;
 Wed,  6 Apr 2022 17:34:17 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  6 Apr 2022 13:34:15 -0400
Message-Id: <20220406173416.3882304-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm/next 1/2] fs: dlm: fix wake_up() calls
 for pending remove
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch move the wake_up() call at the point when a remove message
completed. Before it was only when a remove message was going to be
sent. The possible waiter in wait_pending_remove() waits until a remove
is done if the resource name matches with the per ls variable
ls->ls_remove_name. If this is the case we must wait until a pending
remove is done which is indicated if DLM_WAIT_PENDING_COND() returns
false which will always be the case when ls_remove_len and
ls_remove_name are unset to indicate that a remove is not going on
anymore.

Fixes: 21d9ac1a5376 ("fs: dlm: use event based wait for pending remove")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 29e80039e7ca..137cf09b51e5 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1810,7 +1810,6 @@ static void shrink_bucket(struct dlm_ls *ls, int b)
 		memcpy(ls->ls_remove_name, name, DLM_RESNAME_MAXLEN);
 		spin_unlock(&ls->ls_remove_spin);
 		spin_unlock(&ls->ls_rsbtbl[b].lock);
-		wake_up(&ls->ls_remove_wait);
 
 		send_remove(r);
 
@@ -1819,6 +1818,7 @@ static void shrink_bucket(struct dlm_ls *ls, int b)
 		ls->ls_remove_len = 0;
 		memset(ls->ls_remove_name, 0, DLM_RESNAME_MAXLEN);
 		spin_unlock(&ls->ls_remove_spin);
+		wake_up(&ls->ls_remove_wait);
 
 		dlm_free_rsb(r);
 	}
@@ -4096,7 +4096,6 @@ static void send_repeat_remove(struct dlm_ls *ls, char *ms_name, int len)
 	memcpy(ls->ls_remove_name, name, DLM_RESNAME_MAXLEN);
 	spin_unlock(&ls->ls_remove_spin);
 	spin_unlock(&ls->ls_rsbtbl[b].lock);
-	wake_up(&ls->ls_remove_wait);
 
 	rv = _create_message(ls, sizeof(struct dlm_message) + len,
 			     dir_nodeid, DLM_MSG_REMOVE, &ms, &mh);
@@ -4112,6 +4111,7 @@ static void send_repeat_remove(struct dlm_ls *ls, char *ms_name, int len)
 	ls->ls_remove_len = 0;
 	memset(ls->ls_remove_name, 0, DLM_RESNAME_MAXLEN);
 	spin_unlock(&ls->ls_remove_spin);
+	wake_up(&ls->ls_remove_wait);
 }
 
 static int receive_request(struct dlm_ls *ls, struct dlm_message *ms)
-- 
2.31.1

