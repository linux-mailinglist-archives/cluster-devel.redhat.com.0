Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DD84F1A16
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102847;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hzKWdERaJj1XvC8TWMPBI0+cOSTz7M7xYf14+CRvcWQ=;
	b=PXyJldtPmrYThTk912+DeXWGw3K6nno1SRO/cPSmv8wlLWA5ZT4MnsUf3+ZuovObIBtANL
	eK4aegCfOjD61opnqgRmAuRtVU/0OuSnfdcQ2gokqnwMXex5Fh2F6WZVV3CH3xIu00fUhp
	dGPoI3MP94Od+8Q8r3Nm1h0iBwVrFZY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-kRupIKHzNJK4mBxK-je6HQ-1; Mon, 04 Apr 2022 16:07:23 -0400
X-MC-Unique: kRupIKHzNJK4mBxK-je6HQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1AAE3C021A2;
	Mon,  4 Apr 2022 20:07:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6340341638C;
	Mon,  4 Apr 2022 20:07:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E9FE3194EB87;
	Mon,  4 Apr 2022 20:06:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ABDC6193F510 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8CD9B7C28; Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EC778145;
 Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:45 -0400
Message-Id: <20220404200646.3170301-19-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 18/19] fs: dlm: cleanup
 lock handling in dlm_master_lookup
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will remove the following warning by sparse:

fs/dlm/lock.c:1049:9: warning: context imbalance in 'dlm_master_lookup' - different lock contexts for basic block

I tried to find any issues with the current handling and I did not find
any. However it is hard to follow the lock handling in this area of
dlm_master_lookup() and I suppose that sparse cannot realize that there
are no issues. The variable "toss_list" makes it really hard to follow
the lock handling because if it's set the rsb lock/refcount isn't held
but the ls->ls_rsbtbl[b].lock is held and this is one reason why the rsb
lock/refcount does not need to be held. If it's not set the
ls->ls_rsbtbl[b].lock is not held but the rsb lock/refcount is held. The
indicator of toss_list will be used to store the actual lock state.
Another possibility is that a retry can happen and then it's hard to
follow the specific code part. I did not find any issues but sparse
cannot realize that there are no issues.

To make it more easier to understand for developers and sparse as well,
we remove the toss_list variable which indicates a specific lock state
and move handling in between of this lock state in a separate function.
This function can be called now in case when the initial lock states are
taken which was previously signalled if toss_list was set or not. The
advantage here is that we can release all locks/refcounts in mostly the
same code block as it was taken.

Afterwards sparse had no issues to figure out that there are no problems
with the current lock behaviour.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 189 +++++++++++++++++++++++++++-----------------------
 1 file changed, 102 insertions(+), 87 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 25468b5e65ad..29e80039e7ca 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -880,6 +880,88 @@ static int validate_master_nodeid(struct dlm_ls *ls, struct dlm_rsb *r,
 	}
 }
 
+static void __dlm_master_lookup(struct dlm_ls *ls, struct dlm_rsb *r, int our_nodeid,
+				int from_nodeid, bool toss_list, unsigned int flags,
+				int *r_nodeid, int *result)
+{
+	int fix_master = (flags & DLM_LU_RECOVER_MASTER);
+	int from_master = (flags & DLM_LU_RECOVER_DIR);
+
+	if (r->res_dir_nodeid != our_nodeid) {
+		/* should not happen, but may as well fix it and carry on */
+		log_error(ls, "%s res_dir %d our %d %s", __func__,
+			  r->res_dir_nodeid, our_nodeid, r->res_name);
+		r->res_dir_nodeid = our_nodeid;
+	}
+
+	if (fix_master && dlm_is_removed(ls, r->res_master_nodeid)) {
+		/* Recovery uses this function to set a new master when
+		 * the previous master failed.  Setting NEW_MASTER will
+		 * force dlm_recover_masters to call recover_master on this
+		 * rsb even though the res_nodeid is no longer removed.
+		 */
+
+		r->res_master_nodeid = from_nodeid;
+		r->res_nodeid = from_nodeid;
+		rsb_set_flag(r, RSB_NEW_MASTER);
+
+		if (toss_list) {
+			/* I don't think we should ever find it on toss list. */
+			log_error(ls, "%s fix_master on toss", __func__);
+			dlm_dump_rsb(r);
+		}
+	}
+
+	if (from_master && (r->res_master_nodeid != from_nodeid)) {
+		/* this will happen if from_nodeid became master during
+		 * a previous recovery cycle, and we aborted the previous
+		 * cycle before recovering this master value
+		 */
+
+		log_limit(ls, "%s from_master %d master_nodeid %d res_nodeid %d first %x %s",
+			  __func__, from_nodeid, r->res_master_nodeid,
+			  r->res_nodeid, r->res_first_lkid, r->res_name);
+
+		if (r->res_master_nodeid == our_nodeid) {
+			log_error(ls, "from_master %d our_master", from_nodeid);
+			dlm_dump_rsb(r);
+			goto ret_assign;
+		}
+
+		r->res_master_nodeid = from_nodeid;
+		r->res_nodeid = from_nodeid;
+		rsb_set_flag(r, RSB_NEW_MASTER);
+	}
+
+	if (!r->res_master_nodeid) {
+		/* this will happen if recovery happens while we're looking
+		 * up the master for this rsb
+		 */
+
+		log_debug(ls, "%s master 0 to %d first %x %s", __func__,
+			  from_nodeid, r->res_first_lkid, r->res_name);
+		r->res_master_nodeid = from_nodeid;
+		r->res_nodeid = from_nodeid;
+	}
+
+	if (!from_master && !fix_master &&
+	    (r->res_master_nodeid == from_nodeid)) {
+		/* this can happen when the master sends remove, the dir node
+		 * finds the rsb on the keep list and ignores the remove,
+		 * and the former master sends a lookup
+		 */
+
+		log_limit(ls, "%s from master %d flags %x first %x %s",
+			  __func__, from_nodeid, flags, r->res_first_lkid,
+			  r->res_name);
+	}
+
+ ret_assign:
+	*r_nodeid = r->res_master_nodeid;
+	if (result)
+		*result = DLM_LU_MATCH;
+}
+
 /*
  * We're the dir node for this res and another node wants to know the
  * master nodeid.  During normal operation (non recovery) this is only
@@ -914,10 +996,8 @@ int dlm_master_lookup(struct dlm_ls *ls, int from_nodeid, char *name, int len,
 {
 	struct dlm_rsb *r = NULL;
 	uint32_t hash, b;
-	int from_master = (flags & DLM_LU_RECOVER_DIR);
-	int fix_master = (flags & DLM_LU_RECOVER_MASTER);
 	int our_nodeid = dlm_our_nodeid();
-	int dir_nodeid, error, toss_list = 0;
+	int dir_nodeid, error;
 
 	if (len > DLM_RESNAME_MAXLEN)
 		return -EINVAL;
@@ -949,103 +1029,38 @@ int dlm_master_lookup(struct dlm_ls *ls, int from_nodeid, char *name, int len,
 	error = dlm_search_rsb_tree(&ls->ls_rsbtbl[b].keep, name, len, &r);
 	if (!error) {
 		/* because the rsb is active, we need to lock_rsb before
-		   checking/changing re_master_nodeid */
+		 * checking/changing re_master_nodeid
+		 */
 
 		hold_rsb(r);
 		spin_unlock(&ls->ls_rsbtbl[b].lock);
 		lock_rsb(r);
-	} else {
-		error = dlm_search_rsb_tree(&ls->ls_rsbtbl[b].toss, name, len, &r);
-		if (error)
-			goto not_found;
-
-		/* because the rsb is inactive (on toss list), it's not refcounted
-		 * and lock_rsb is not used, but is protected by the rsbtbl lock
-		 */
-
-		toss_list = 1;
-	}
-
-	if (r->res_dir_nodeid != our_nodeid) {
-		/* should not happen, but may as well fix it and carry on */
-		log_error(ls, "dlm_master_lookup res_dir %d our %d %s",
-			  r->res_dir_nodeid, our_nodeid, r->res_name);
-		r->res_dir_nodeid = our_nodeid;
-	}
-
-	if (fix_master && dlm_is_removed(ls, r->res_master_nodeid)) {
-		/* Recovery uses this function to set a new master when
-		   the previous master failed.  Setting NEW_MASTER will
-		   force dlm_recover_masters to call recover_master on this
-		   rsb even though the res_nodeid is no longer removed. */
-
-		r->res_master_nodeid = from_nodeid;
-		r->res_nodeid = from_nodeid;
-		rsb_set_flag(r, RSB_NEW_MASTER);
-
-		if (toss_list) {
-			/* I don't think we should ever find it on toss list. */
-			log_error(ls, "dlm_master_lookup fix_master on toss");
-			dlm_dump_rsb(r);
-		}
-	}
 
-	if (from_master && (r->res_master_nodeid != from_nodeid)) {
-		/* this will happen if from_nodeid became master during
-		   a previous recovery cycle, and we aborted the previous
-		   cycle before recovering this master value */
+		__dlm_master_lookup(ls, r, our_nodeid, from_nodeid, false,
+				    flags, r_nodeid, result);
 
-		log_limit(ls, "dlm_master_lookup from_master %d "
-			  "master_nodeid %d res_nodeid %d first %x %s",
-			  from_nodeid, r->res_master_nodeid, r->res_nodeid,
-			  r->res_first_lkid, r->res_name);
-
-		if (r->res_master_nodeid == our_nodeid) {
-			log_error(ls, "from_master %d our_master", from_nodeid);
-			dlm_dump_rsb(r);
-			goto out_found;
-		}
+		/* the rsb was active */
+		unlock_rsb(r);
+		put_rsb(r);
 
-		r->res_master_nodeid = from_nodeid;
-		r->res_nodeid = from_nodeid;
-		rsb_set_flag(r, RSB_NEW_MASTER);
+		return 0;
 	}
 
-	if (!r->res_master_nodeid) {
-		/* this will happen if recovery happens while we're looking
-		   up the master for this rsb */
-
-		log_debug(ls, "dlm_master_lookup master 0 to %d first %x %s",
-			  from_nodeid, r->res_first_lkid, r->res_name);
-		r->res_master_nodeid = from_nodeid;
-		r->res_nodeid = from_nodeid;
-	}
+	error = dlm_search_rsb_tree(&ls->ls_rsbtbl[b].toss, name, len, &r);
+	if (error)
+		goto not_found;
 
-	if (!from_master && !fix_master &&
-	    (r->res_master_nodeid == from_nodeid)) {
-		/* this can happen when the master sends remove, the dir node
-		   finds the rsb on the keep list and ignores the remove,
-		   and the former master sends a lookup */
+	/* because the rsb is inactive (on toss list), it's not refcounted
+	 * and lock_rsb is not used, but is protected by the rsbtbl lock
+	 */
 
-		log_limit(ls, "dlm_master_lookup from master %d flags %x "
-			  "first %x %s", from_nodeid, flags,
-			  r->res_first_lkid, r->res_name);
-	}
+	__dlm_master_lookup(ls, r, our_nodeid, from_nodeid, true, flags,
+			    r_nodeid, result);
 
- out_found:
-	*r_nodeid = r->res_master_nodeid;
-	if (result)
-		*result = DLM_LU_MATCH;
+	r->res_toss_time = jiffies;
+	/* the rsb was inactive (on toss list) */
+	spin_unlock(&ls->ls_rsbtbl[b].lock);
 
-	if (toss_list) {
-		r->res_toss_time = jiffies;
-		/* the rsb was inactive (on toss list) */
-		spin_unlock(&ls->ls_rsbtbl[b].lock);
-	} else {
-		/* the rsb was active */
-		unlock_rsb(r);
-		put_rsb(r);
-	}
 	return 0;
 
  not_found:
-- 
2.31.1

