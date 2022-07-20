Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB4757B960
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Jul 2022 17:15:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658330142;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZRJHG0S7r40lf030CYi2lHNU4fnY8OsjSiwm/jnWeMo=;
	b=B13p50D9RHS9oimiKv553I0Fw5ZvY/b4RU6bDWEHXdTzAi39xehdfQuV5QvM0tE3DZwKzW
	CyqvMUea30npTBr6+4IJKyzwdk/UobSZyzpkBZ9hH+rvH3TjjfzMT0xnlQ2AYJF/OGg3+E
	XZ2JFS3thV2RFZ9FTUGfUEBaPtQKegY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-YXmIboZMO2GCr1MH23Rzdw-1; Wed, 20 Jul 2022 11:15:37 -0400
X-MC-Unique: YXmIboZMO2GCr1MH23Rzdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00FFA3801F59;
	Wed, 20 Jul 2022 15:15:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D32B18EA8;
	Wed, 20 Jul 2022 15:15:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AD1F31923C89;
	Wed, 20 Jul 2022 15:15:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 999391947066 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 20 Jul 2022 15:04:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 78D1C112131B; Wed, 20 Jul 2022 15:04:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55CC81121314;
 Wed, 20 Jul 2022 15:04:32 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 20 Jul 2022 11:04:28 -0400
Message-Id: <20220720150429.2985107-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCHv2 dlm/next 1/2] fs: dlm: use __func__ for
 function name
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

There are several times of using hard-coded function names inside the
format string. When changing code checkpatch will drop a warning about
this. This patch prepares to not dropping a checkpatch warning when
introduce the same log message for a different loglevel by using
__func__ instead of a hard-coded function name.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 16d339d383cd..026c203ff529 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -2901,7 +2901,7 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	rv = 0;
  out:
 	if (rv)
-		log_debug(ls, "validate_lock_args %d %x %x %x %d %d %s",
+		log_debug(ls, "%s %d %x %x %x %d %d %s", __func__,
 			  rv, lkb->lkb_id, lkb->lkb_flags, args->flags,
 			  lkb->lkb_status, lkb->lkb_wait_type,
 			  lkb->lkb_resource->res_name);
@@ -3038,7 +3038,7 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 	rv = 0;
  out:
 	if (rv)
-		log_debug(ls, "validate_unlock_args %d %x %x %x %x %d %s", rv,
+		log_debug(ls, "%s %d %x %x %x %x %d %s", __func__, rv,
 			  lkb->lkb_id, lkb->lkb_flags, lkb->lkb_exflags,
 			  args->flags, lkb->lkb_wait_type,
 			  lkb->lkb_resource->res_name);
-- 
2.31.1

