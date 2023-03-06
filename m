Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB06A6ACF74
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Mar 2023 21:48:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678135712;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qYA61ZJIygdyw9i/Q9Y1J/lqVci4fZXgkQ+4QJ+NyZY=;
	b=XS/P4IFmG4FgramAVhinNvzG3fXduJPkdTIz/+dwTrO5Rk2PM6QYcueu7zfBEO03S45zk4
	owDmWfn4M9YjTvuKvusciTd7ptWsOdZ3o+UsVMd0HiTNJa9nsOSH0+3M/vUaS4WhF//Arw
	br/FMdxHqnxI1H6tx5UrVourlWbJ/wY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-WhTjSCRwNZ2lqsbROrDqoA-1; Mon, 06 Mar 2023 15:48:29 -0500
X-MC-Unique: WhTjSCRwNZ2lqsbROrDqoA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94EBC802D2E;
	Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B88AC16029;
	Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 09E1D19465B9;
	Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1124B1946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 20:48:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 054A2440E0; Mon,  6 Mar 2023 20:48:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D560951FF;
 Mon,  6 Mar 2023 20:48:25 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  6 Mar 2023 15:48:08 -0500
Message-Id: <20230306204819.2747646-2-aahringo@redhat.com>
In-Reply-To: <20230306204819.2747646-1-aahringo@redhat.com>
References: <20230306204819.2747646-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v6.3-rc1 01/12] fs: dlm: fix
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
 fs/dlm/dlm_internal.h | 5 ++++-
 fs/dlm/user.c         | 2 +-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 26fef9945cc9..39805aea3336 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -45,7 +45,7 @@ void dlm_purge_lkb_callbacks(struct dlm_lkb *lkb)
 		kref_put(&cb->ref, dlm_release_callback);
 	}
 
-	lkb->lkb_flags &= ~DLM_IFL_CB_PENDING;
+	clear_bit(DLM_IFL_CB_PENDING_BIT, &lkb->lkb_iflags);
 
 	/* invalidate */
 	dlm_callback_set_last_ptr(&lkb->lkb_last_cast, NULL);
@@ -103,10 +103,9 @@ int dlm_enqueue_lkb_callback(struct dlm_lkb *lkb, uint32_t flags, int mode,
 	cb->sb_status = status;
 	cb->sb_flags = (sbflags & 0x000000FF);
 	kref_init(&cb->ref);
-	if (!(lkb->lkb_flags & DLM_IFL_CB_PENDING)) {
-		lkb->lkb_flags |= DLM_IFL_CB_PENDING;
+	if (!test_and_set_bit(DLM_IFL_CB_PENDING_BIT, &lkb->lkb_iflags))
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
+			clear_bit(DLM_IFL_CB_PENDING_BIT, &lkb->lkb_iflags);
 			spin_unlock(&lkb->lkb_cb_lock);
 			break;
 		}
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index ab1a55337a6e..9bf70962bc49 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -211,7 +211,9 @@ struct dlm_args {
 #endif
 #define DLM_IFL_DEADLOCK_CANCEL	0x01000000
 #define DLM_IFL_STUB_MS		0x02000000 /* magic number for m_flags */
-#define DLM_IFL_CB_PENDING	0x04000000
+
+#define DLM_IFL_CB_PENDING_BIT	0
+
 /* least significant 2 bytes are message changed, they are full transmitted
  * but at receive side only the 2 bytes LSB will be set.
  *
@@ -246,6 +248,7 @@ struct dlm_lkb {
 	uint32_t		lkb_exflags;	/* external flags from caller */
 	uint32_t		lkb_sbflags;	/* lksb flags */
 	uint32_t		lkb_flags;	/* internal flags */
+	unsigned long		lkb_iflags;	/* internal flags */
 	uint32_t		lkb_lvbseq;	/* lvb sequence number */
 
 	int8_t			lkb_status;     /* granted, waiting, convert */
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index 35129505ddda..688a480879e4 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -884,7 +884,7 @@ static ssize_t device_read(struct file *file, char __user *buf, size_t count,
 		goto try_another;
 	case DLM_DEQUEUE_CALLBACK_LAST:
 		list_del_init(&lkb->lkb_cb_list);
-		lkb->lkb_flags &= ~DLM_IFL_CB_PENDING;
+		clear_bit(DLM_IFL_CB_PENDING_BIT, &lkb->lkb_iflags);
 		break;
 	case DLM_DEQUEUE_CALLBACK_SUCCESS:
 		break;
-- 
2.31.1

