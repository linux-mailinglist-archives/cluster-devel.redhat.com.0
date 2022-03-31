Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8E04EECD1
	for <lists+cluster-devel@lfdr.de>; Fri,  1 Apr 2022 14:04:50 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-IuQLeWM0N22fxHWVSmA7bA-1; Fri, 01 Apr 2022 08:04:46 -0400
X-MC-Unique: IuQLeWM0N22fxHWVSmA7bA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E00AC10A5CCF;
	Fri,  1 Apr 2022 12:04:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54598400E10D;
	Fri,  1 Apr 2022 12:04:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BD9AB1940345;
	Fri,  1 Apr 2022 12:04:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8BD6719451F3 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 31 Mar 2022 22:02:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E6EC1432879; Thu, 31 Mar 2022 22:02:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2D53432869
 for <cluster-devel@redhat.com>; Thu, 31 Mar 2022 22:02:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1CB180029D
 for <cluster-devel@redhat.com>; Thu, 31 Mar 2022 22:02:24 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-5c7eN085MDGsjEnJSBXVjg-1; Thu, 31 Mar 2022 18:02:20 -0400
X-MC-Unique: 5c7eN085MDGsjEnJSBXVjg-1
Received: by mail-ed1-f47.google.com with SMTP id c62so866784edf.5;
 Thu, 31 Mar 2022 15:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6f0oJeP6cPKgr/ko31ztKU+CVJ2YQLwk0JpTcyTaytg=;
 b=5bkBcxPoIgAhWBBwxxDTq/xZqfV9dsKXIHIMFtTrfD/MinfuoDFJwE4zRwZBLoBY+G
 WOuyp8TlwwJeZfx0JL+cuTiZJumJC6xOtXH+NCYbdRMTne5QacgtIV8w48Q7Vv/TGUjr
 BLxB9Qai9LcuKuDjWoAudpaqZl3XxevICmMke7zuGeuZ14o0RkW4+glolGsEBX0f4dh3
 +AUC2QZq3DpmuaujJIF4gCRUu1T5ntT8wFvaSGt1I2OuMNug6cedVPfRW+xJuFxQkNDB
 BgQEuXFK1IjNRBaUCmSuzWcEj3G4zxUaEacIb5FlfQX9THimBNw5/srsEkyCDjRytmjW
 wsdg==
X-Gm-Message-State: AOAM533gIf2vjqvuLeESgZNjSb+ShCIrB9StmZOyGRwoB1vfo3u2PSN9
 jWKYAQ8QAuJfud6/dhRriOLRZGWwDHrgBA==
X-Google-Smtp-Source: ABdhPJzrJvU31t1SDNBcaMG4kzEqCtT28PM99lWZaLo/24NQM3zrfcIKGutesI0c+u3dMEtPiik3cg==
X-Received: by 2002:a05:6402:b15:b0:419:fb4:e2e4 with SMTP id
 bm21-20020a0564020b1500b004190fb4e2e4mr18233106edb.147.1648764139045; 
 Thu, 31 Mar 2022 15:02:19 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 n21-20020a170906725500b006e10a7d6d03sm238050ejk.219.2022.03.31.15.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 15:02:18 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Christine Caulfield <ccaulfie@redhat.com>
Date: Fri,  1 Apr 2022 00:00:13 +0200
Message-Id: <20220331220013.884633-2-jakobkoschel@gmail.com>
In-Reply-To: <20220331220013.884633-1-jakobkoschel@gmail.com>
References: <20220331220013.884633-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Fri, 01 Apr 2022 12:04:43 +0000
Subject: [Cluster-devel] [PATCH 2/2] dlm: replace usage of found with
 dedicated list iterator variable
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
Cc: linux-kernel@vger.kernel.org, "Bos, H.J." <h.j.bos@vu.nl>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>, cluster-devel@redhat.com,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Jakob Koschel <jakobkoschel@gmail.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

To move the list iterator variable into the list_for_each_entry_*()
macro in the future it should be avoided to use the list iterator
variable after the loop body.

To *never* use the list iterator variable after the loop it was
concluded to use a separate iterator variable instead of a
found boolean [1].

This removes the need to use a found variable and simply checking if
the variable was set, can determine if the break/goto was hit.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 fs/dlm/lock.c    | 53 +++++++++++++++++++++++-------------------------
 fs/dlm/plock.c   | 25 ++++++++++++-----------
 fs/dlm/recover.c | 35 ++++++++++++++++----------------
 3 files changed, 55 insertions(+), 58 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 66e92617d7ea..729c1ca8824f 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1870,7 +1870,7 @@ static void del_timeout(struct dlm_lkb *lkb)
 void dlm_scan_timeout(struct dlm_ls *ls)
 {
 	struct dlm_rsb *r;
-	struct dlm_lkb *lkb;
+	struct dlm_lkb *lkb = NULL, *iter;
 	int do_cancel, do_warn;
 	s64 wait_us;
 
@@ -1881,27 +1881,28 @@ void dlm_scan_timeout(struct dlm_ls *ls)
 		do_cancel = 0;
 		do_warn = 0;
 		mutex_lock(&ls->ls_timeout_mutex);
-		list_for_each_entry(lkb, &ls->ls_timeout, lkb_time_list) {
+		list_for_each_entry(iter, &ls->ls_timeout, lkb_time_list) {
 
 			wait_us = ktime_to_us(ktime_sub(ktime_get(),
-					      		lkb->lkb_timestamp));
+					      iter->lkb_timestamp));
 
-			if ((lkb->lkb_exflags & DLM_LKF_TIMEOUT) &&
-			    wait_us >= (lkb->lkb_timeout_cs * 10000))
+			if ((iter->lkb_exflags & DLM_LKF_TIMEOUT) &&
+			    wait_us >= (iter->lkb_timeout_cs * 10000))
 				do_cancel = 1;
 
-			if ((lkb->lkb_flags & DLM_IFL_WATCH_TIMEWARN) &&
+			if ((iter->lkb_flags & DLM_IFL_WATCH_TIMEWARN) &&
 			    wait_us >= dlm_config.ci_timewarn_cs * 10000)
 				do_warn = 1;
 
 			if (!do_cancel && !do_warn)
 				continue;
-			hold_lkb(lkb);
+			hold_lkb(iter);
+			lkb = iter;
 			break;
 		}
 		mutex_unlock(&ls->ls_timeout_mutex);
 
-		if (!do_cancel && !do_warn)
+		if (!lkb)
 			break;
 
 		r = lkb->lkb_resource;
@@ -5261,21 +5262,18 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 
 static struct dlm_lkb *find_resend_waiter(struct dlm_ls *ls)
 {
-	struct dlm_lkb *lkb;
-	int found = 0;
+	struct dlm_lkb *lkb = NULL, *iter;
 
 	mutex_lock(&ls->ls_waiters_mutex);
-	list_for_each_entry(lkb, &ls->ls_waiters, lkb_wait_reply) {
-		if (lkb->lkb_flags & DLM_IFL_RESEND) {
-			hold_lkb(lkb);
-			found = 1;
+	list_for_each_entry(iter, &ls->ls_waiters, lkb_wait_reply) {
+		if (iter->lkb_flags & DLM_IFL_RESEND) {
+			hold_lkb(iter);
+			lkb = iter;
 			break;
 		}
 	}
 	mutex_unlock(&ls->ls_waiters_mutex);
 
-	if (!found)
-		lkb = NULL;
 	return lkb;
 }
 
@@ -5929,37 +5927,36 @@ int dlm_user_adopt_orphan(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 		     int mode, uint32_t flags, void *name, unsigned int namelen,
 		     unsigned long timeout_cs, uint32_t *lkid)
 {
-	struct dlm_lkb *lkb;
+	struct dlm_lkb *lkb = NULL, *iter;
 	struct dlm_user_args *ua;
 	int found_other_mode = 0;
-	int found = 0;
 	int rv = 0;
 
 	mutex_lock(&ls->ls_orphans_mutex);
-	list_for_each_entry(lkb, &ls->ls_orphans, lkb_ownqueue) {
-		if (lkb->lkb_resource->res_length != namelen)
+	list_for_each_entry(iter, &ls->ls_orphans, lkb_ownqueue) {
+		if (iter->lkb_resource->res_length != namelen)
 			continue;
-		if (memcmp(lkb->lkb_resource->res_name, name, namelen))
+		if (memcmp(iter->lkb_resource->res_name, name, namelen))
 			continue;
-		if (lkb->lkb_grmode != mode) {
+		if (iter->lkb_grmode != mode) {
 			found_other_mode = 1;
 			continue;
 		}
 
-		found = 1;
-		list_del_init(&lkb->lkb_ownqueue);
-		lkb->lkb_flags &= ~DLM_IFL_ORPHAN;
-		*lkid = lkb->lkb_id;
+		lkb = iter;
+		list_del_init(&iter->lkb_ownqueue);
+		iter->lkb_flags &= ~DLM_IFL_ORPHAN;
+		*lkid = iter->lkb_id;
 		break;
 	}
 	mutex_unlock(&ls->ls_orphans_mutex);
 
-	if (!found && found_other_mode) {
+	if (!lkb && found_other_mode) {
 		rv = -EAGAIN;
 		goto out;
 	}
 
-	if (!found) {
+	if (!lkb) {
 		rv = -ENOENT;
 		goto out;
 	}
diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index c38b2b8ffd1d..c7ac0377822c 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -419,8 +419,8 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 			 loff_t *ppos)
 {
 	struct dlm_plock_info info;
-	struct plock_op *op;
-	int found = 0, do_callback = 0;
+	struct plock_op *op = NULL, *iter;
+	int do_callback = 0;
 
 	if (count != sizeof(info))
 		return -EINVAL;
@@ -432,24 +432,25 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 		return -EINVAL;
 
 	spin_lock(&ops_lock);
-	list_for_each_entry(op, &recv_list, list) {
-		if (op->info.fsid == info.fsid &&
-		    op->info.number == info.number &&
-		    op->info.owner == info.owner) {
-			struct plock_xop *xop = (struct plock_xop *)op;
-			list_del_init(&op->list);
-			memcpy(&op->info, &info, sizeof(info));
+	list_for_each_entry(iter, &recv_list, list) {
+		if (iter->info.fsid == info.fsid &&
+		    iter->info.number == info.number &&
+		    iter->info.owner == info.owner) {
+			struct plock_xop *xop = (struct plock_xop *)iter;
+
+			list_del_init(&iter->list);
+			memcpy(&iter->info, &info, sizeof(info));
 			if (xop->callback)
 				do_callback = 1;
 			else
-				op->done = 1;
-			found = 1;
+				iter->done = 1;
+			op = iter;
 			break;
 		}
 	}
 	spin_unlock(&ops_lock);
 
-	if (found) {
+	if (op) {
 		if (do_callback)
 			dlm_plock_callback(op);
 		else
diff --git a/fs/dlm/recover.c b/fs/dlm/recover.c
index 8928e99dfd47..15ad5c2c9dfc 100644
--- a/fs/dlm/recover.c
+++ b/fs/dlm/recover.c
@@ -732,10 +732,9 @@ void dlm_recovered_lock(struct dlm_rsb *r)
 
 static void recover_lvb(struct dlm_rsb *r)
 {
-	struct dlm_lkb *lkb, *high_lkb = NULL;
+	struct dlm_lkb *lkb = NULL, *iter, *high_lkb = NULL;
 	uint32_t high_seq = 0;
 	int lock_lvb_exists = 0;
-	int big_lock_exists = 0;
 	int lvblen = r->res_ls->ls_lvblen;
 
 	if (!rsb_flag(r, RSB_NEW_MASTER2) &&
@@ -751,37 +750,37 @@ static void recover_lvb(struct dlm_rsb *r)
 	/* we are the new master, so figure out if VALNOTVALID should
 	   be set, and set the rsb lvb from the best lkb available. */
 
-	list_for_each_entry(lkb, &r->res_grantqueue, lkb_statequeue) {
-		if (!(lkb->lkb_exflags & DLM_LKF_VALBLK))
+	list_for_each_entry(iter, &r->res_grantqueue, lkb_statequeue) {
+		if (!(iter->lkb_exflags & DLM_LKF_VALBLK))
 			continue;
 
 		lock_lvb_exists = 1;
 
-		if (lkb->lkb_grmode > DLM_LOCK_CR) {
-			big_lock_exists = 1;
+		if (iter->lkb_grmode > DLM_LOCK_CR) {
+			lkb = iter;
 			goto setflag;
 		}
 
-		if (((int)lkb->lkb_lvbseq - (int)high_seq) >= 0) {
-			high_lkb = lkb;
-			high_seq = lkb->lkb_lvbseq;
+		if (((int)iter->lkb_lvbseq - (int)high_seq) >= 0) {
+			high_lkb = iter;
+			high_seq = iter->lkb_lvbseq;
 		}
 	}
 
-	list_for_each_entry(lkb, &r->res_convertqueue, lkb_statequeue) {
-		if (!(lkb->lkb_exflags & DLM_LKF_VALBLK))
+	list_for_each_entry(iter, &r->res_convertqueue, lkb_statequeue) {
+		if (!(iter->lkb_exflags & DLM_LKF_VALBLK))
 			continue;
 
 		lock_lvb_exists = 1;
 
-		if (lkb->lkb_grmode > DLM_LOCK_CR) {
-			big_lock_exists = 1;
+		if (iter->lkb_grmode > DLM_LOCK_CR) {
+			lkb = iter;
 			goto setflag;
 		}
 
-		if (((int)lkb->lkb_lvbseq - (int)high_seq) >= 0) {
-			high_lkb = lkb;
-			high_seq = lkb->lkb_lvbseq;
+		if (((int)iter->lkb_lvbseq - (int)high_seq) >= 0) {
+			high_lkb = iter;
+			high_seq = iter->lkb_lvbseq;
 		}
 	}
 
@@ -790,7 +789,7 @@ static void recover_lvb(struct dlm_rsb *r)
 		goto out;
 
 	/* lvb is invalidated if only NL/CR locks remain */
-	if (!big_lock_exists)
+	if (!lkb)
 		rsb_set_flag(r, RSB_VALNOTVALID);
 
 	if (!r->res_lvbptr) {
@@ -799,7 +798,7 @@ static void recover_lvb(struct dlm_rsb *r)
 			goto out;
 	}
 
-	if (big_lock_exists) {
+	if (lkb) {
 		r->res_lvbseq = lkb->lkb_lvbseq;
 		memcpy(r->res_lvbptr, lkb->lkb_lvbptr, lvblen);
 	} else if (high_lkb) {
-- 
2.25.1

