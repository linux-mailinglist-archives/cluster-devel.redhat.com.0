Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 226116ACF7A
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Mar 2023 21:48:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678135713;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/k50SxpSBV21901h/QUTbnpIOa3StdohyYJDs81EUyg=;
	b=GbRuivIZN9fcuKn3F1eiwMYSUqKoGkoqzI46Ww7Hxj3EKGKILhr2bBHqm60UMH0TUdk63W
	AVvOmofSC6sEE8R1UDiI34JdhbsFlmYgYmyiXas03/68jVEKs5k6uXVLpsK6g/cpbmW+cN
	77tTRH6cC4YwFowWfAWCeKfrnpXK1ms=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-bsuuJkf1Psuq4PkoO2jHUw-1; Mon, 06 Mar 2023 15:48:30 -0500
X-MC-Unique: bsuuJkf1Psuq4PkoO2jHUw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E8A93C10239;
	Mon,  6 Mar 2023 20:48:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82FA7492C3E;
	Mon,  6 Mar 2023 20:48:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3139B19465B9;
	Mon,  6 Mar 2023 20:48:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 299631946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 20:48:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1F93D440DF; Mon,  6 Mar 2023 20:48:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF16451FF;
 Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  6 Mar 2023 15:48:19 -0500
Message-Id: <20230306204819.2747646-13-aahringo@redhat.com>
In-Reply-To: <20230306204819.2747646-1-aahringo@redhat.com>
References: <20230306204819.2747646-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v6.3-rc1 12/12] fs: dlm: switch ls_exflags
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

As other flag handling in dlm we switch ls_exflags to use atomic
operation to manipulate flags. This should prepare for a possible
manipulating of lkb_exflags flags at the same time by concurrent
execution.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h | 23 ++++++++++++++++++++++-
 fs/dlm/lockspace.c    |  2 +-
 fs/dlm/rcom.c         |  6 +++---
 3 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 986a9d7b1f33..48e9152555a8 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -548,7 +548,7 @@ struct dlm_ls {
 	dlm_lockspace_t		*ls_local_handle;
 	uint32_t		ls_global_id;	/* global unique lockspace ID */
 	uint32_t		ls_generation;
-	uint32_t		ls_exflags;
+	unsigned long		ls_exflags;
 	int			ls_lvblen;
 	atomic_t		ls_count;	/* refcount of processes in
 						   the dlm using this ls */
@@ -771,6 +771,11 @@ static inline uint32_t dlm_dflags_val(const struct dlm_lkb *lkb)
 #define DLM_SBF_ALTMODE_BIT	2
 #define __DLM_SBF_MAX_BIT	DLM_SBF_ALTMODE_BIT
 
+#define DLM_LSFL_TIMEWARN_BIT	1
+#define __DLM_LSFL_MIN_BIT	DLM_LSFL_TIMEWARN_BIT
+#define DLM_LSFL_NEWEXCL_BIT	3
+#define __DLM_LSFL_MAX_BIT	DLM_LSFL_NEWEXCL_BIT
+
 static inline uint32_t dlm_sbflags_val(const struct dlm_lkb *lkb)
 {
 	/* be sure the next person updates this */
@@ -780,6 +785,16 @@ static inline uint32_t dlm_sbflags_val(const struct dlm_lkb *lkb)
 			     __DLM_SBF_MAX_BIT);
 }
 
+static inline uint32_t dlm_ls_exflags_val(const struct dlm_ls *ls)
+{
+	/* be sure the next person updates this */
+	BUILD_BUG_ON(BIT(__DLM_LSFL_MIN_BIT) != DLM_LSFL_TIMEWARN ||
+		     BIT(__DLM_LSFL_MAX_BIT) != DLM_LSFL_NEWEXCL);
+
+	return dlm_flags_val(&ls->ls_exflags, __DLM_LSFL_MIN_BIT,
+			     __DLM_LSFL_MAX_BIT);
+}
+
 static inline void dlm_set_flags_val(unsigned long *addr, uint32_t val,
 				     uint32_t min, uint32_t max)
 {
@@ -805,6 +820,12 @@ static inline void dlm_set_sbflags_val(struct dlm_lkb *lkb, uint32_t val)
 			  __DLM_SBF_MAX_BIT);
 }
 
+static inline void dlm_set_ls_exflags(struct dlm_ls *ls, uint32_t val)
+{
+	dlm_set_flags_val(&ls->ls_exflags, val, __DLM_LSFL_MIN_BIT,
+			  __DLM_LSFL_MAX_BIT);
+}
+
 int dlm_plock_init(void);
 void dlm_plock_exit(void);
 
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 67261b7b1f0e..c47fcb292870 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -490,7 +490,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	/* ls_exflags are forced to match among nodes, and we don't
 	 * need to require all nodes to have some flags set
 	 */
-	ls->ls_exflags = (flags & ~(DLM_LSFL_FS | DLM_LSFL_NEWEXCL));
+	dlm_set_ls_exflags(ls, flags & ~(DLM_LSFL_FS | DLM_LSFL_NEWEXCL));
 
 	size = READ_ONCE(dlm_config.ci_rsbtbl_size);
 	ls->ls_rsbtbl_size = size;
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index f4afdf892f78..5f0d7fe34b35 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -114,7 +114,7 @@ static void set_rcom_config(struct dlm_ls *ls, struct rcom_config *rf,
 			    uint32_t num_slots)
 {
 	rf->rf_lvblen = cpu_to_le32(ls->ls_lvblen);
-	rf->rf_lsflags = cpu_to_le32(ls->ls_exflags);
+	rf->rf_lsflags = cpu_to_le32(dlm_ls_exflags_val(ls));
 
 	rf->rf_our_slot = cpu_to_le16(ls->ls_slot);
 	rf->rf_num_slots = cpu_to_le16(num_slots);
@@ -133,9 +133,9 @@ static int check_rcom_config(struct dlm_ls *ls, struct dlm_rcom *rc, int nodeid)
 	}
 
 	if (le32_to_cpu(rf->rf_lvblen) != ls->ls_lvblen ||
-	    le32_to_cpu(rf->rf_lsflags) != ls->ls_exflags) {
+	    le32_to_cpu(rf->rf_lsflags) != dlm_ls_exflags_val(ls)) {
 		log_error(ls, "config mismatch: %d,%x nodeid %d: %d,%x",
-			  ls->ls_lvblen, ls->ls_exflags, nodeid,
+			  ls->ls_lvblen, dlm_ls_exflags_val(ls), nodeid,
 			  le32_to_cpu(rf->rf_lvblen),
 			  le32_to_cpu(rf->rf_lsflags));
 		return -EPROTO;
-- 
2.31.1

