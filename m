Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4277069E9A5
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Feb 2023 22:40:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677015651;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=30n5QNLnEMojF3+SruAUoKcBh2OcSQLbIo/xki8lNz8=;
	b=adpQq4SqO67GzBIn1RUQrFlxGHBSbsXgtZ/SvaN85LoWwsuiFmDYMvn/lUKH5PapYfMd8T
	WtzMGZ5d7xI9qkQb2suUCrSIOiKRimctVzX5GgtKwELi5qNlfw28ujQdXGeIV/8FHgPpv/
	UbTDDE/vweV094chBCIkmVAR/y/ZH30=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-TYnf5lo_O52qDwYgbRLrXg-1; Tue, 21 Feb 2023 16:40:50 -0500
X-MC-Unique: TYnf5lo_O52qDwYgbRLrXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A1072823802;
	Tue, 21 Feb 2023 21:40:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2EA38440DE;
	Tue, 21 Feb 2023 21:40:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0D52B194658C;
	Tue, 21 Feb 2023 21:40:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D7ED61946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 21 Feb 2023 21:40:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BA979440DE; Tue, 21 Feb 2023 21:40:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94AA0440D9;
 Tue, 21 Feb 2023 21:40:35 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 21 Feb 2023 16:40:11 -0500
Message-Id: <20230221214014.871804-4-aahringo@redhat.com>
In-Reply-To: <20230221214014.871804-1-aahringo@redhat.com>
References: <20230221214014.871804-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH dlm/next 3/6] fs: dlm: fix
 DLM_IFL_CB_PENDING gets overwritten
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch introduce a new internal flag per lkb value to handle
internal flags which are handled not on wire. The current lkb internal
flags stored as lkb->lkb_flags are split in upper and lower bits, the
lower bits are used to share internal flags over wire for other cluster
wide lkb copies on other nodes.

In commit 61bed0baa4db ("fs: dlm: use a non-static queue for callbacks")
we introduced a new internal flag for pending callbacks for the dlm
callback queue. This flag is protected by the lkb->lkb_cb_lock lock.
This patch overlooked that on dlm receive path and the mentioned upper
and lower bits, that dlm will read the flags, mask it and write it
back. As example receive_flags() in fs/dlm/lock.c. This flag
manipulation is not done atomically and is not protected by
lkb->lkb_cb_lock. This has unknown side effects of the current callback
handling.

In future we should move to set/clear/test bit functionality and avoid
read, mask and writing back flag values. In later patches we will move
the upper parts to the new introduced internal lkb flags which are not
shared between other cluster nodes to the new non shared internal flag
field to avoid similar issues.

Cc: stable@vger.kernel.org
Fixes: 61bed0baa4db ("fs: dlm: use a non-static queue for callbacks")
Reported-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c          | 9 ++++-----
 fs/dlm/dlm_internal.h | 7 ++++++-
 fs/dlm/user.c         | 2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 26fef9945cc9..7daffdd99f99 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -45,7 +45,7 @@ void dlm_purge_lkb_callbacks(struct dlm_lkb *lkb)
 		kref_put(&cb->ref, dlm_release_callback);
 	}
 
-	lkb->lkb_flags &= ~DLM_IFL_CB_PENDING;
+	clear_bit(DLM_IFLNS_CB_PENDING, &lkb->lkb_insflags);
 
 	/* invalidate */
 	dlm_callback_set_last_ptr(&lkb->lkb_last_cast, NULL);
@@ -103,10 +103,9 @@ int dlm_enqueue_lkb_callback(struct dlm_lkb *lkb, uint32_t flags, int mode,
 	cb->sb_status = status;
 	cb->sb_flags = (sbflags & 0x000000FF);
 	kref_init(&cb->ref);
-	if (!(lkb->lkb_flags & DLM_IFL_CB_PENDING)) {
-		lkb->lkb_flags |= DLM_IFL_CB_PENDING;
+	if (!test_and_set_bit(DLM_IFLNS_CB_PENDING, &lkb->lkb_insflags))
 		rv = DLM_ENQUEUE_CALLBACK_NEED_SCHED;
-	}
+
 	list_add_tail(&cb->list, &lkb->lkb_callbacks);
 
 	if (flags & DLM_CB_CAST)
@@ -209,7 +208,7 @@ void dlm_callback_work(struct work_struct *work)
 		spin_lock(&lkb->lkb_cb_lock);
 		rv = dlm_dequeue_lkb_callback(lkb, &cb);
 		if (rv == DLM_DEQUEUE_CALLBACK_EMPTY) {
-			lkb->lkb_flags &= ~DLM_IFL_CB_PENDING;
+			clear_bit(DLM_IFLNS_CB_PENDING, &lkb->lkb_insflags);
 			spin_unlock(&lkb->lkb_cb_lock);
 			break;
 		}
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index ab1a55337a6e..b967b4d7d55d 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -211,7 +211,11 @@ struct dlm_args {
 #endif
 #define DLM_IFL_DEADLOCK_CANCEL	0x01000000
 #define DLM_IFL_STUB_MS		0x02000000 /* magic number for m_flags */
-#define DLM_IFL_CB_PENDING	0x04000000
+
+/* lkb_insflags */
+
+#define DLM_IFLNS_CB_PENDING	0
+
 /* least significant 2 bytes are message changed, they are full transmitted
  * but at receive side only the 2 bytes LSB will be set.
  *
@@ -246,6 +250,7 @@ struct dlm_lkb {
 	uint32_t		lkb_exflags;	/* external flags from caller */
 	uint32_t		lkb_sbflags;	/* lksb flags */
 	uint32_t		lkb_flags;	/* internal flags */
+	unsigned long		lkb_insflags;	/* internal non shared flags */
 	uint32_t		lkb_lvbseq;	/* lvb sequence number */
 
 	int8_t			lkb_status;     /* granted, waiting, convert */
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index 35129505ddda..98488a1b702d 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -884,7 +884,7 @@ static ssize_t device_read(struct file *file, char __user *buf, size_t count,
 		goto try_another;
 	case DLM_DEQUEUE_CALLBACK_LAST:
 		list_del_init(&lkb->lkb_cb_list);
-		lkb->lkb_flags &= ~DLM_IFL_CB_PENDING;
+		clear_bit(DLM_IFLNS_CB_PENDING, &lkb->lkb_insflags);
 		break;
 	case DLM_DEQUEUE_CALLBACK_SUCCESS:
 		break;
-- 
2.31.1

