Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A41E6ACF7B
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Mar 2023 21:48:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678135714;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+xydjeAc5MoVNrmSFOd0wBqHN/puJMZGxvjsWfEPqHI=;
	b=FXcqs2PEFfvOk+Bcuf4gGDUlWkaa1E4bG6fpiQUgIpknmlDH0yCpFsVDx7xm1kF4ljBNdO
	RInHQU8MtG6D4ZOcv6Twwt1pkUjY7vt8/J0MjRukbFuXR92y1Bvkeip7WT7SRoc5q8ZXM7
	JCX60MSbsKgvuKbDwMH1cPWh2K90/+8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-M3vPJMxnONylKsbVPBgnIA-1; Mon, 06 Mar 2023 15:48:31 -0500
X-MC-Unique: M3vPJMxnONylKsbVPBgnIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DF153813F35;
	Mon,  6 Mar 2023 20:48:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 633481121314;
	Mon,  6 Mar 2023 20:48:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 481BF19465B3;
	Mon,  6 Mar 2023 20:48:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 024FC1946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 20:48:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E9B37440DE; Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C61AE51FF;
 Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  6 Mar 2023 15:48:18 -0500
Message-Id: <20230306204819.2747646-12-aahringo@redhat.com>
In-Reply-To: <20230306204819.2747646-1-aahringo@redhat.com>
References: <20230306204819.2747646-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v6.3-rc1 11/12] fs: dlm: switch lkb_sbflags
 to atomic ops
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch moves lkb_sbflags handling to atomic bits ops. This should
prepare for a possible manipulating of lkb_sbflags flags at the same
time by concurrent execution.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h | 28 +++++++++++++++++++++++++++-
 fs/dlm/lock.c         | 22 +++++++++++-----------
 2 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index e2925f554bc7..986a9d7b1f33 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -235,7 +235,7 @@ struct dlm_lkb {
 	uint32_t		lkb_id;		/* our lock ID */
 	uint32_t		lkb_remid;	/* lock ID on remote partner */
 	uint32_t		lkb_exflags;	/* external flags from caller */
-	uint32_t		lkb_sbflags;	/* lksb flags */
+	unsigned long		lkb_sbflags;	/* lksb flags */
 	unsigned long		lkb_dflags;	/* distributed flags */
 	unsigned long		lkb_iflags;	/* internal flags */
 	uint32_t		lkb_lvbseq;	/* lvb sequence number */
@@ -760,6 +760,26 @@ static inline uint32_t dlm_dflags_val(const struct dlm_lkb *lkb)
 			     __DLM_DFL_MAX_BIT);
 }
 
+/* coming from UAPI header
+ *
+ * TODO:
+ * Move this to UAPI header and let other values point to them and use BIT()
+ */
+#define DLM_SBF_DEMOTED_BIT	0
+#define __DLM_SBF_MIN_BIT	DLM_SBF_DEMOTED_BIT
+#define DLM_SBF_VALNOTVALID_BIT	1
+#define DLM_SBF_ALTMODE_BIT	2
+#define __DLM_SBF_MAX_BIT	DLM_SBF_ALTMODE_BIT
+
+static inline uint32_t dlm_sbflags_val(const struct dlm_lkb *lkb)
+{
+	/* be sure the next person updates this */
+	BUILD_BUG_ON(BIT(__DLM_SBF_MAX_BIT) != DLM_SBF_ALTMODE);
+
+	return dlm_flags_val(&lkb->lkb_sbflags, __DLM_SBF_MIN_BIT,
+			     __DLM_SBF_MAX_BIT);
+}
+
 static inline void dlm_set_flags_val(unsigned long *addr, uint32_t val,
 				     uint32_t min, uint32_t max)
 {
@@ -779,6 +799,12 @@ static inline void dlm_set_dflags_val(struct dlm_lkb *lkb, uint32_t val)
 			  __DLM_DFL_MAX_BIT);
 }
 
+static inline void dlm_set_sbflags_val(struct dlm_lkb *lkb, uint32_t val)
+{
+	dlm_set_flags_val(&lkb->lkb_sbflags, val, __DLM_SBF_MIN_BIT,
+			  __DLM_SBF_MAX_BIT);
+}
+
 int dlm_plock_init(void);
 void dlm_plock_exit(void);
 
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 507a03fe2279..1582c8b1404c 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -228,12 +228,12 @@ static inline int force_blocking_asts(struct dlm_lkb *lkb)
 
 static inline int is_demoted(struct dlm_lkb *lkb)
 {
-	return (lkb->lkb_sbflags & DLM_SBF_DEMOTED);
+	return test_bit(DLM_SBF_DEMOTED_BIT, &lkb->lkb_sbflags);
 }
 
 static inline int is_altmode(struct dlm_lkb *lkb)
 {
-	return (lkb->lkb_sbflags & DLM_SBF_ALTMODE);
+	return test_bit(DLM_SBF_ALTMODE_BIT, &lkb->lkb_sbflags);
 }
 
 static inline int is_granted(struct dlm_lkb *lkb)
@@ -298,7 +298,7 @@ static void queue_cast(struct dlm_rsb *r, struct dlm_lkb *lkb, int rv)
 	    test_and_clear_bit(DLM_IFL_DEADLOCK_CANCEL_BIT, &lkb->lkb_iflags))
 		rv = -EDEADLK;
 
-	dlm_add_cb(lkb, DLM_CB_CAST, lkb->lkb_grmode, rv, lkb->lkb_sbflags);
+	dlm_add_cb(lkb, DLM_CB_CAST, lkb->lkb_grmode, rv, dlm_sbflags_val(lkb));
 }
 
 static inline void queue_cast_overlap(struct dlm_rsb *r, struct dlm_lkb *lkb)
@@ -1770,7 +1770,7 @@ static void set_lvb_lock(struct dlm_rsb *r, struct dlm_lkb *lkb)
 	}
 
 	if (rsb_flag(r, RSB_VALNOTVALID))
-		lkb->lkb_sbflags |= DLM_SBF_VALNOTVALID;
+		set_bit(DLM_SBF_VALNOTVALID_BIT, &lkb->lkb_sbflags);
 }
 
 static void set_lvb_unlock(struct dlm_rsb *r, struct dlm_lkb *lkb)
@@ -2242,7 +2242,7 @@ static int can_be_granted(struct dlm_rsb *r, struct dlm_lkb *lkb, int now,
 	    conversion_deadlock_detect(r, lkb)) {
 		if (lkb->lkb_exflags & DLM_LKF_CONVDEADLK) {
 			lkb->lkb_grmode = DLM_LOCK_NL;
-			lkb->lkb_sbflags |= DLM_SBF_DEMOTED;
+			set_bit(DLM_SBF_DEMOTED_BIT, &lkb->lkb_sbflags);
 		} else if (err) {
 			*err = -EDEADLK;
 		} else {
@@ -2269,7 +2269,7 @@ static int can_be_granted(struct dlm_rsb *r, struct dlm_lkb *lkb, int now,
 		lkb->lkb_rqmode = alt;
 		rv = _can_be_granted(r, lkb, now, 0);
 		if (rv)
-			lkb->lkb_sbflags |= DLM_SBF_ALTMODE;
+			set_bit(DLM_SBF_ALTMODE_BIT, &lkb->lkb_sbflags);
 		else
 			lkb->lkb_rqmode = rqmode;
 	}
@@ -2685,7 +2685,7 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	}
 
 	lkb->lkb_exflags = args->flags;
-	lkb->lkb_sbflags = 0;
+	dlm_set_sbflags_val(lkb, 0);
 	lkb->lkb_astfn = args->astfn;
 	lkb->lkb_astparam = args->astparam;
 	lkb->lkb_bastfn = args->bastfn;
@@ -2836,7 +2836,7 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
  out_ok:
 	/* an overlapping op shouldn't blow away exflags from other op */
 	lkb->lkb_exflags |= args->flags;
-	lkb->lkb_sbflags = 0;
+	dlm_set_sbflags_val(lkb, 0);
 	lkb->lkb_astparam = args->astparam;
 	rv = 0;
  out:
@@ -3408,7 +3408,7 @@ static void send_args(struct dlm_rsb *r, struct dlm_lkb *lkb,
 	ms->m_lkid     = cpu_to_le32(lkb->lkb_id);
 	ms->m_remid    = cpu_to_le32(lkb->lkb_remid);
 	ms->m_exflags  = cpu_to_le32(lkb->lkb_exflags);
-	ms->m_sbflags  = cpu_to_le32(lkb->lkb_sbflags);
+	ms->m_sbflags  = cpu_to_le32(dlm_sbflags_val(lkb));
 	ms->m_flags    = cpu_to_le32(dlm_dflags_val(lkb));
 	ms->m_lvbseq   = cpu_to_le32(lkb->lkb_lvbseq);
 	ms->m_status   = cpu_to_le32(lkb->lkb_status);
@@ -3673,7 +3673,7 @@ static int send_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms_in,
 static void receive_flags(struct dlm_lkb *lkb, struct dlm_message *ms)
 {
 	lkb->lkb_exflags = le32_to_cpu(ms->m_exflags);
-	lkb->lkb_sbflags = le32_to_cpu(ms->m_sbflags);
+	dlm_set_sbflags_val(lkb, le32_to_cpu(ms->m_sbflags));
 	dlm_set_dflags_val(lkb, le32_to_cpu(ms->m_flags));
 }
 
@@ -3683,7 +3683,7 @@ static void receive_flags_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
 	if (local)
 		return;
 
-	lkb->lkb_sbflags = le32_to_cpu(ms->m_sbflags);
+	dlm_set_sbflags_val(lkb, le32_to_cpu(ms->m_sbflags));
 	dlm_set_dflags_val(lkb, le32_to_cpu(ms->m_flags));
 }
 
-- 
2.31.1

