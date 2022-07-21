Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3398F57D64C
	for <lists+cluster-devel@lfdr.de>; Thu, 21 Jul 2022 23:54:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658440441;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zH9TDDMVkOcitYcBwao7CbPA3FTtgET3ZFMF76yyeRk=;
	b=JSD2zCPqa/j2tcWhvtpkmg0TAOy7v/OjVnJsAHPg82xbUswmQ9gCHkQUVcKpCvMD9BJchY
	HPkBAW11dfvEV1ogDscCiI0ZTEogj+2UgNv4iXsbXkUeMQ7+2EcQiLLJEwznt6ECA+F1xA
	3Wjz6Q0dIhds6bSsA4/jDy7cY0btQUM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-_33vlMlMMl2GR180uoGiyw-1; Thu, 21 Jul 2022 17:53:59 -0400
X-MC-Unique: _33vlMlMMl2GR180uoGiyw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3E013801F5B;
	Thu, 21 Jul 2022 21:53:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4A9DC33AE6;
	Thu, 21 Jul 2022 21:53:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BF9A71953561;
	Thu, 21 Jul 2022 21:53:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DF5341953544 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 21 Jul 2022 21:53:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C12032027EB5; Thu, 21 Jul 2022 21:53:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E34A2026D64;
 Thu, 21 Jul 2022 21:53:50 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 21 Jul 2022 17:53:39 -0400
Message-Id: <20220721215340.936838-3-aahringo@redhat.com>
In-Reply-To: <20220721215340.936838-1-aahringo@redhat.com>
References: <20220721215340.936838-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH dlm/next 2/3] fs: dlm: avoid double
 list_add() for lkb->lkb_cb_list
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The dlm_add_cb() can run multiple times for a lkb to add a callback and
calling list_add() to calling queue_work() for later. If it's getting
called multiple times while test_bit(LSFL_CB_DELAY, &ls->ls_flags)
is true we need to ensure it was added only once or the list getting
corrupted. The list holder lkb->lkb_cb_list is being used with
list_del_init()/INIT_LIST_HEAD() and can be used with list_empty()
to check if it is not being part of a list.

Cc: stable@vger.kernel.org
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index a44cc42b6317..0271796d36b1 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -202,7 +202,8 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
 
 		mutex_lock(&ls->ls_cb_mutex);
 		if (test_bit(LSFL_CB_DELAY, &ls->ls_flags)) {
-			list_add(&lkb->lkb_cb_list, &ls->ls_cb_delay);
+			if (list_empty(&lkb->lkb_cb_list))
+				list_add(&lkb->lkb_cb_list, &ls->ls_cb_delay);
 		} else {
 			queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
 		}
-- 
2.31.1

