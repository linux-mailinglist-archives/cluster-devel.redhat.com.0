Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B6C79912D
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Sep 2023 22:46:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694205989;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cS51scFgc0lWSr9U8u6JlVjS3BlUsky5hp1ad3COmtw=;
	b=XctOaQd8IhI5u6x2YPKa/pMm/sPIn4XPIfXWZo2zgqLwsD9EUspEHyUUN96PPWGMJj2EY4
	K/EYToW6d4Q4mJ7SiRrgzd70lw2ykhO1Dyw/obidWMTiRGjlYfuBeks+eKw5iDHGCJEENT
	8NsHMK7cTUC7n7l7w1nS8+NNn1FckgE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-dBoTFEs-OxOVLv69E8zeDQ-1; Fri, 08 Sep 2023 16:46:26 -0400
X-MC-Unique: dBoTFEs-OxOVLv69E8zeDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FD79382255B;
	Fri,  8 Sep 2023 20:46:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 638592013570;
	Fri,  8 Sep 2023 20:46:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 02EE71946A48;
	Fri,  8 Sep 2023 20:46:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EF69E1946597 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  8 Sep 2023 20:46:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E1EA220BAE37; Fri,  8 Sep 2023 20:46:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7DD321EE56A;
 Fri,  8 Sep 2023 20:46:23 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri,  8 Sep 2023 16:46:09 -0400
Message-Id: <20230908204611.1910601-8-aahringo@redhat.com>
In-Reply-To: <20230908204611.1910601-1-aahringo@redhat.com>
References: <20230908204611.1910601-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [RFC dlm/next 08/10] fs: dlm: ls_recv_active
 semaphore to rwlock
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch converts the ls_recv_active semaphore to a rwlock to not
sleep during dlm message processing.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h | 2 +-
 fs/dlm/lock.c         | 4 ++--
 fs/dlm/lockspace.c    | 2 +-
 fs/dlm/member.c       | 4 ++--
 fs/dlm/recoverd.c     | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 9106e20e6c20..6a1b2c806f72 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -622,7 +622,7 @@ struct dlm_ls {
 	uint64_t		ls_recover_seq;
 	struct dlm_recover	*ls_recover_args;
 	struct rw_semaphore	ls_in_recovery;	/* block local requests */
-	struct rw_semaphore	ls_recv_active;	/* block dlm_recv */
+	rwlock_t		ls_recv_active;	/* block dlm_recv */
 	struct list_head	ls_requestqueue;/* queue remote requests */
 	rwlock_t		ls_requestqueue_lock;
 	struct dlm_rcom		*ls_recover_buf;
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 1031f233a3ad..dccc0b888ca1 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -4831,7 +4831,7 @@ void dlm_receive_buffer(const union dlm_packet *p, int nodeid)
 	/* this rwsem allows dlm_ls_stop() to wait for all dlm_recv threads to
 	   be inactive (in this ls) before transitioning to recovery mode */
 
-	down_read(&ls->ls_recv_active);
+	read_lock(&ls->ls_recv_active);
 	if (hd->h_cmd == DLM_MSG)
 		dlm_receive_message(ls, &p->message, nodeid);
 	else if (hd->h_cmd == DLM_RCOM)
@@ -4839,7 +4839,7 @@ void dlm_receive_buffer(const union dlm_packet *p, int nodeid)
 	else
 		log_error(ls, "invalid h_cmd %d from %d lockspace %x",
 			  hd->h_cmd, nodeid, le32_to_cpu(hd->u.h_lockspace));
-	up_read(&ls->ls_recv_active);
+	read_unlock(&ls->ls_recv_active);
 
 	dlm_put_lockspace(ls);
 }
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 265d69752b90..e35ea06200b5 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -552,7 +552,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	ls->ls_recover_seq = get_random_u64();
 	ls->ls_recover_args = NULL;
 	init_rwsem(&ls->ls_in_recovery);
-	init_rwsem(&ls->ls_recv_active);
+	rwlock_init(&ls->ls_recv_active);
 	INIT_LIST_HEAD(&ls->ls_requestqueue);
 	rwlock_init(&ls->ls_requestqueue_lock);
 	spin_lock_init(&ls->ls_clear_proc_locks);
diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 707cebcdc533..ac1b555af9d6 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -630,7 +630,7 @@ int dlm_ls_stop(struct dlm_ls *ls)
 	 * message to the requestqueue without races.
 	 */
 
-	down_write(&ls->ls_recv_active);
+	write_lock(&ls->ls_recv_active);
 
 	/*
 	 * Abort any recovery that's in progress (see RECOVER_STOP,
@@ -654,7 +654,7 @@ int dlm_ls_stop(struct dlm_ls *ls)
 	 * requestqueue for later.
 	 */
 
-	up_write(&ls->ls_recv_active);
+	write_unlock(&ls->ls_recv_active);
 
 	/*
 	 * This in_recovery lock does two things:
diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
index 4d17491dea2f..c47bcc8be398 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -32,7 +32,7 @@ static int enable_locking(struct dlm_ls *ls, uint64_t seq)
 {
 	int error = -EINTR;
 
-	down_write(&ls->ls_recv_active);
+	write_lock(&ls->ls_recv_active);
 
 	spin_lock(&ls->ls_recover_lock);
 	if (ls->ls_recover_seq == seq) {
@@ -44,7 +44,7 @@ static int enable_locking(struct dlm_ls *ls, uint64_t seq)
 	}
 	spin_unlock(&ls->ls_recover_lock);
 
-	up_write(&ls->ls_recv_active);
+	write_unlock(&ls->ls_recv_active);
 	return error;
 }
 
-- 
2.31.1

