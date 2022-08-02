Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CCA5880E9
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Aug 2022 19:21:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659460878;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ylMT19acVJnhVIQA2sS/OqLxCnpTSWG7gACD/N/if9g=;
	b=U4Hy3oOCygbv/jqSu0447gxQn/d3gRbOz+hcGCvI3oIjkp/oqRzm3v0l22ypqMLZojKyuL
	AUMlaoXAvpHPaAVDat2Ztk+Z+z/8U+NRoHPP199ZzkD5dL631hGvFHtvwdeKlhZHxy+R+K
	Ra7DwdDSUDvm4frZfGIaligQnGD5wjo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-UhIX4LzoOAeKM5YRjqX-Jw-1; Tue, 02 Aug 2022 13:21:16 -0400
X-MC-Unique: UhIX4LzoOAeKM5YRjqX-Jw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C2751C05AB4;
	Tue,  2 Aug 2022 17:21:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2613140D0160;
	Tue,  2 Aug 2022 17:21:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B28581946A4E;
	Tue,  2 Aug 2022 17:21:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B16301946A50 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 17:21:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8F0EF1121319; Tue,  2 Aug 2022 17:21:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6866F1121314;
 Tue,  2 Aug 2022 17:21:11 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  2 Aug 2022 13:21:07 -0400
Message-Id: <20220802172108.3396447-2-aahringo@redhat.com>
In-Reply-To: <20220802172108.3396447-1-aahringo@redhat.com>
References: <20220802172108.3396447-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH dlm/next 2/3] fs: dlm: const void resource
 name parameter
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
Cc: cluster-devel@redhat.com, dave@stgolabs.net, josh@joshtriplett.org,
 paulmck@kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The resource name parameter should never be changed by DLM so we declare
it as const. At some point it is handled as a char pointer, a resource
name can be a non printable ascii string as well. This patch change it
to handle it as void pointer as it is offered by DLM API.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c              | 23 +++++++++++++----------
 fs/dlm/lock.h              |  2 +-
 include/linux/dlm.h        |  2 +-
 include/trace/events/dlm.h |  4 ++--
 4 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 078af3805a88..fb64f5a53603 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -401,7 +401,7 @@ static int pre_rsb_struct(struct dlm_ls *ls)
    unlock any spinlocks, go back and call pre_rsb_struct again.
    Otherwise, take an rsb off the list and return it. */
 
-static int get_rsb_struct(struct dlm_ls *ls, char *name, int len,
+static int get_rsb_struct(struct dlm_ls *ls, const void *name, int len,
 			  struct dlm_rsb **r_ret)
 {
 	struct dlm_rsb *r;
@@ -412,7 +412,8 @@ static int get_rsb_struct(struct dlm_ls *ls, char *name, int len,
 		count = ls->ls_new_rsb_count;
 		spin_unlock(&ls->ls_new_rsb_spin);
 		log_debug(ls, "find_rsb retry %d %d %s",
-			  count, dlm_config.ci_new_rsb_count, name);
+			  count, dlm_config.ci_new_rsb_count,
+			  (const char *)name);
 		return -EAGAIN;
 	}
 
@@ -448,7 +449,7 @@ static int rsb_cmp(struct dlm_rsb *r, const char *name, int nlen)
 	return memcmp(r->res_name, maxname, DLM_RESNAME_MAXLEN);
 }
 
-int dlm_search_rsb_tree(struct rb_root *tree, char *name, int len,
+int dlm_search_rsb_tree(struct rb_root *tree, const void *name, int len,
 			struct dlm_rsb **r_ret)
 {
 	struct rb_node *node = tree->rb_node;
@@ -546,7 +547,7 @@ static int rsb_insert(struct dlm_rsb *rsb, struct rb_root *tree)
  * while that rsb has a potentially stale master.)
  */
 
-static int find_rsb_dir(struct dlm_ls *ls, char *name, int len,
+static int find_rsb_dir(struct dlm_ls *ls, const void *name, int len,
 			uint32_t hash, uint32_t b,
 			int dir_nodeid, int from_nodeid,
 			unsigned int flags, struct dlm_rsb **r_ret)
@@ -724,7 +725,7 @@ static int find_rsb_dir(struct dlm_ls *ls, char *name, int len,
    dlm_recover_locks) before we've made ourself master (in
    dlm_recover_masters). */
 
-static int find_rsb_nodir(struct dlm_ls *ls, char *name, int len,
+static int find_rsb_nodir(struct dlm_ls *ls, const void *name, int len,
 			  uint32_t hash, uint32_t b,
 			  int dir_nodeid, int from_nodeid,
 			  unsigned int flags, struct dlm_rsb **r_ret)
@@ -818,8 +819,9 @@ static int find_rsb_nodir(struct dlm_ls *ls, char *name, int len,
 	return error;
 }
 
-static int find_rsb(struct dlm_ls *ls, char *name, int len, int from_nodeid,
-		    unsigned int flags, struct dlm_rsb **r_ret)
+static int find_rsb(struct dlm_ls *ls, const void *name, int len,
+		    int from_nodeid, unsigned int flags,
+		    struct dlm_rsb **r_ret)
 {
 	uint32_t hash, b;
 	int dir_nodeid;
@@ -3316,8 +3318,9 @@ static int _cancel_lock(struct dlm_rsb *r, struct dlm_lkb *lkb)
  * request_lock(), convert_lock(), unlock_lock(), cancel_lock()
  */
 
-static int request_lock(struct dlm_ls *ls, struct dlm_lkb *lkb, char *name,
-			int len, struct dlm_args *args)
+static int request_lock(struct dlm_ls *ls, struct dlm_lkb *lkb,
+			const void *name, int len,
+			struct dlm_args *args)
 {
 	struct dlm_rsb *r;
 	int error;
@@ -3416,7 +3419,7 @@ int dlm_lock(dlm_lockspace_t *lockspace,
 	     int mode,
 	     struct dlm_lksb *lksb,
 	     uint32_t flags,
-	     void *name,
+	     const void *name,
 	     unsigned int namelen,
 	     uint32_t parent_lkid,
 	     void (*ast) (void *astarg),
diff --git a/fs/dlm/lock.h b/fs/dlm/lock.h
index a7b6474f009d..40c76b5544da 100644
--- a/fs/dlm/lock.h
+++ b/fs/dlm/lock.h
@@ -36,7 +36,7 @@ static inline void dlm_adjust_timeouts(struct dlm_ls *ls) { }
 int dlm_master_lookup(struct dlm_ls *ls, int nodeid, char *name, int len,
 		      unsigned int flags, int *r_nodeid, int *result);
 
-int dlm_search_rsb_tree(struct rb_root *tree, char *name, int len,
+int dlm_search_rsb_tree(struct rb_root *tree, const void *name, int len,
 			struct dlm_rsb **r_ret);
 
 void dlm_recover_purge(struct dlm_ls *ls);
diff --git a/include/linux/dlm.h b/include/linux/dlm.h
index f5f55c2138ae..c6bc2b5ee7e6 100644
--- a/include/linux/dlm.h
+++ b/include/linux/dlm.h
@@ -131,7 +131,7 @@ int dlm_lock(dlm_lockspace_t *lockspace,
 	     int mode,
 	     struct dlm_lksb *lksb,
 	     uint32_t flags,
-	     void *name,
+	     const void *name,
 	     unsigned int namelen,
 	     uint32_t parent_lkid,
 	     void (*lockast) (void *astarg),
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index 92d263aab848..546579dee6a9 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -49,7 +49,7 @@
 /* note: we begin tracing dlm_lock_start() only if ls and lkb are found */
 TRACE_EVENT(dlm_lock_start,
 
-	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, void *name,
+	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, const void *name,
 		 unsigned int namelen, int mode, __u32 flags),
 
 	TP_ARGS(ls, lkb, name, namelen, mode, flags),
@@ -91,7 +91,7 @@ TRACE_EVENT(dlm_lock_start,
 
 TRACE_EVENT(dlm_lock_end,
 
-	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, void *name,
+	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, const void *name,
 		 unsigned int namelen, int mode, __u32 flags, int error,
 		 bool kernel_lock),
 
-- 
2.31.1

