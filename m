Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD50257D64E
	for <lists+cluster-devel@lfdr.de>; Thu, 21 Jul 2022 23:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658440445;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cUZPffc2iGWAkRDa4SlYxAuEhSJ5M3HLG7UhtiIHZEo=;
	b=JiG9M2U5jsDXkv6GTrQeieP8GTpqRxDinH6r1tlcPb06Vmk5ZqQi4b+e/k9Zs/PYOaa2b3
	N7uoZlJlZYF+Fo58y3A6b99rti6s2wJHTA3/MdIQlUS/PkDG5P8WCa4z/CazKY7lkpC/5R
	AnaAtNd+DzfeDPfVMreqh0b6wZ7BC2c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-CaR4EcjINSifRbH1c2RU7A-1; Thu, 21 Jul 2022 17:53:59 -0400
X-MC-Unique: CaR4EcjINSifRbH1c2RU7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D333D811E75;
	Thu, 21 Jul 2022 21:53:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD7922166B2B;
	Thu, 21 Jul 2022 21:53:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 197F0195354F;
	Thu, 21 Jul 2022 21:53:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AF5231953544 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 21 Jul 2022 21:53:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 957EB2027EB5; Thu, 21 Jul 2022 21:53:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 722C22026D64;
 Thu, 21 Jul 2022 21:53:50 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 21 Jul 2022 17:53:38 -0400
Message-Id: <20220721215340.936838-2-aahringo@redhat.com>
In-Reply-To: <20220721215340.936838-1-aahringo@redhat.com>
References: <20220721215340.936838-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH dlm/next 1/3] fs: dlm: fix race between
 test_bit() and queue_work()
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will fix a race by surround ls_cb_mutex in set_bit() and the
test_bit() and it's conditional code blocks for LSFL_CB_DELAY.

The function dlm_callback_stop() has the idea to stop all callbacks and
flush all currently queued onces. The set_bit() is not enough because
there can be still queue_work() around after the workqueue was flushed.
To avoid queue_work() after set_bit() we surround both by ls_cb_mutex
lock.

Cc: stable@vger.kernel.org
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 19ef136f9e4f..a44cc42b6317 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -200,13 +200,13 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
 	if (!prev_seq) {
 		kref_get(&lkb->lkb_ref);
 
+		mutex_lock(&ls->ls_cb_mutex);
 		if (test_bit(LSFL_CB_DELAY, &ls->ls_flags)) {
-			mutex_lock(&ls->ls_cb_mutex);
 			list_add(&lkb->lkb_cb_list, &ls->ls_cb_delay);
-			mutex_unlock(&ls->ls_cb_mutex);
 		} else {
 			queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
 		}
+		mutex_unlock(&ls->ls_cb_mutex);
 	}
  out:
 	mutex_unlock(&lkb->lkb_cb_mutex);
@@ -288,7 +288,9 @@ void dlm_callback_stop(struct dlm_ls *ls)
 
 void dlm_callback_suspend(struct dlm_ls *ls)
 {
+	mutex_lock(&ls->ls_cb_mutex);
 	set_bit(LSFL_CB_DELAY, &ls->ls_flags);
+	mutex_unlock(&ls->ls_cb_mutex);
 
 	if (ls->ls_callback_wq)
 		flush_workqueue(ls->ls_callback_wq);
-- 
2.31.1

