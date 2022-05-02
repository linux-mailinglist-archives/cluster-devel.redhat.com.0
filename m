Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC723517251
	for <lists+cluster-devel@lfdr.de>; Mon,  2 May 2022 17:14:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651504492;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D0y2TyVZToiH7SzlD+/WkJI224YeRJP8DATqYB3JhJo=;
	b=UCUbGXfmr/SIgm6Zt03F26P016mJRyulF1XIn8lflVpWuIpINf2MFz6ymDa8Q2tdzD/HeD
	1Gt91eWo/CUyq9p5M7IrO5GsH6VIpGi5TPEmmKHarhtL9Z2su8vTWae2cKcdVpK7ofUC8u
	Qc16YGWExcigbQ3F5U4aK4IbgsrcUTY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-Fmbwn5m5NPqZeQ8rrtiD9A-1; Mon, 02 May 2022 11:14:47 -0400
X-MC-Unique: Fmbwn5m5NPqZeQ8rrtiD9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9EF129AB45D;
	Mon,  2 May 2022 15:14:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0A7CC52C84;
	Mon,  2 May 2022 15:14:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 906171947062;
	Mon,  2 May 2022 15:14:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9125A194705E for <cluster-devel@listman.corp.redhat.com>;
 Mon,  2 May 2022 15:14:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6ED3F2166B4B; Mon,  2 May 2022 15:14:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B9B42166B49;
 Mon,  2 May 2022 15:14:33 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  2 May 2022 11:14:08 -0400
Message-Id: <20220502151410.4049410-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 1/3] fs: dlm: remove unnecessary
 error assign
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch removes unnecessary error assigns to 0 at places we know that
error is zero because it was checked on non-zero before.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index d19cfa03c9bb..97ca728dc194 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -602,7 +602,6 @@ static int find_rsb_dir(struct dlm_ls *ls, char *name, int len,
 	 */
 
 	kref_get(&r->res_ref);
-	error = 0;
 	goto out_unlock;
 
 
@@ -1091,7 +1090,6 @@ int dlm_master_lookup(struct dlm_ls *ls, int from_nodeid, char *name, int len,
 	if (result)
 		*result = DLM_LU_ADD;
 	*r_nodeid = from_nodeid;
-	error = 0;
  out_unlock:
 	spin_unlock(&ls->ls_rsbtbl[b].lock);
 	return error;
@@ -5747,7 +5745,6 @@ int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
 
 	attach_lkb(r, lkb);
 	add_lkb(r, lkb, rl->rl_status);
-	error = 0;
 	ls->ls_recover_locks_in++;
 
 	if (!list_empty(&r->res_waitqueue) || !list_empty(&r->res_convertqueue))
-- 
2.31.1

