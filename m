Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4A04C1999
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Feb 2022 18:11:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645636308;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fcIyY9H2oU+GjdmONdTT6yr2BKzqlZgIhwnbL+9AbpE=;
	b=e9RUBew2UWcxJDdYdro6GtcbcrpLdu6mPL2eJjC1qDiaq5jQgFzf9pLyy22FY5hmMuKLaK
	xl+C1G4jkEujVFCOfsNx+pUEO+TLD4oUSvGO/3LiSNZegPY8tx3yfN7zgy/zVJXwQ/YO9n
	2kyV4lKSOHTnY36opDR/avnFCgJb3dc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-LlFCUFU1M5687PEXJUhytA-1; Wed, 23 Feb 2022 12:11:37 -0500
X-MC-Unique: LlFCUFU1M5687PEXJUhytA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60F6880DDEF;
	Wed, 23 Feb 2022 17:11:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F70B7DE5B;
	Wed, 23 Feb 2022 17:11:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 387A31809C98;
	Wed, 23 Feb 2022 17:11:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21NH8t9G009300 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Feb 2022 12:08:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0859D838EA; Wed, 23 Feb 2022 17:08:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF25838E6;
	Wed, 23 Feb 2022 17:08:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Feb 2022 12:08:29 -0500
Message-Id: <20220223170829.830864-10-aahringo@redhat.com>
In-Reply-To: <20220223170829.830864-1-aahringo@redhat.com>
References: <20220223170829.830864-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, viro@zeniv.linux.org.uk
Subject: [Cluster-devel] [PATCH/RFC dlm/next 9/9] fs: dlm: cleanup lock
	handling in dlm_master_lookup
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

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
index 013d46cc58e0..96ad11221065 100644
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

