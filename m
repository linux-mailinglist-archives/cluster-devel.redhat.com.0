Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B175AEEB
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Jul 2023 14:58:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689857928;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Sx/HzIS/UO4hgoN0aFqF4zaXoqar7pWy8ZsgfEG48iA=;
	b=PRHwyPcxHOuToxOPLDUqRa4pCIh7oW7A4VnbeZc9AhHbgYGFBBcIQgnIESgY5+uf6LlSZW
	ocMS/tqOPXVmsFPgGAjn98R2Rr7VeSWw0WWNZeMoNNyt+5XrC0ZXdeNQAYYBY3fvGDAifC
	nqjRsPtLhoiuNVsNORhT5K4DlDNVOQc=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-xRIahSy4NLqtC13QcmTORg-1; Thu, 20 Jul 2023 08:58:45 -0400
X-MC-Unique: xRIahSy4NLqtC13QcmTORg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 134103852D8C;
	Thu, 20 Jul 2023 12:58:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 077F8492B02;
	Thu, 20 Jul 2023 12:58:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BAF5F1946A45;
	Thu, 20 Jul 2023 12:58:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7FCCD19465BA for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Jul 2023 12:58:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9F0DA2166B29; Thu, 20 Jul 2023 12:58:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22A4D2166B25;
 Thu, 20 Jul 2023 12:58:14 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: chuck.lever@oracle.com
Date: Thu, 20 Jul 2023 08:58:04 -0400
Message-Id: <20230720125806.1385279-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [RFC v6.5-rc2 1/3] fs: lockd: nlm_blocked list race
 fixes
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
Cc: cluster-devel@redhat.com, linux-nfs@vger.kernel.org, neilb@suse.de,
 jlayton@kernel.org, Dai.Ngo@oracle.com, tom@talpey.com, kolga@netapp.com,
 anna@kernel.org, trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch fixes races when lockd accessing the global nlm_blocked list.
It was mostly safe to access the list because everything was accessed
from the lockd kernel thread context but there exists cases like
nlmsvc_grant_deferred() that could manipulate the nlm_blocked list and
it can be called from any context.

Cc: stable@vger.kernel.org
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/lockd/svclock.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
index c43ccdf28ed9..28abec5c451d 100644
--- a/fs/lockd/svclock.c
+++ b/fs/lockd/svclock.c
@@ -131,12 +131,14 @@ static void nlmsvc_insert_block(struct nlm_block *block, unsigned long when)
 static inline void
 nlmsvc_remove_block(struct nlm_block *block)
 {
+	spin_lock(&nlm_blocked_lock);
 	if (!list_empty(&block->b_list)) {
-		spin_lock(&nlm_blocked_lock);
 		list_del_init(&block->b_list);
 		spin_unlock(&nlm_blocked_lock);
 		nlmsvc_release_block(block);
+		return;
 	}
+	spin_unlock(&nlm_blocked_lock);
 }
 
 /*
@@ -152,6 +154,7 @@ nlmsvc_lookup_block(struct nlm_file *file, struct nlm_lock *lock)
 				file, lock->fl.fl_pid,
 				(long long)lock->fl.fl_start,
 				(long long)lock->fl.fl_end, lock->fl.fl_type);
+	spin_lock(&nlm_blocked_lock);
 	list_for_each_entry(block, &nlm_blocked, b_list) {
 		fl = &block->b_call->a_args.lock.fl;
 		dprintk("lockd: check f=%p pd=%d %Ld-%Ld ty=%d cookie=%s\n",
@@ -161,9 +164,11 @@ nlmsvc_lookup_block(struct nlm_file *file, struct nlm_lock *lock)
 				nlmdbg_cookie2a(&block->b_call->a_args.cookie));
 		if (block->b_file == file && nlm_compare_locks(fl, &lock->fl)) {
 			kref_get(&block->b_count);
+			spin_unlock(&nlm_blocked_lock);
 			return block;
 		}
 	}
+	spin_unlock(&nlm_blocked_lock);
 
 	return NULL;
 }
@@ -185,16 +190,19 @@ nlmsvc_find_block(struct nlm_cookie *cookie)
 {
 	struct nlm_block *block;
 
+	spin_lock(&nlm_blocked_lock);
 	list_for_each_entry(block, &nlm_blocked, b_list) {
 		if (nlm_cookie_match(&block->b_call->a_args.cookie,cookie))
 			goto found;
 	}
+	spin_unlock(&nlm_blocked_lock);
 
 	return NULL;
 
 found:
 	dprintk("nlmsvc_find_block(%s): block=%p\n", nlmdbg_cookie2a(cookie), block);
 	kref_get(&block->b_count);
+	spin_unlock(&nlm_blocked_lock);
 	return block;
 }
 
@@ -317,6 +325,7 @@ void nlmsvc_traverse_blocks(struct nlm_host *host,
 
 restart:
 	mutex_lock(&file->f_mutex);
+	spin_lock(&nlm_blocked_lock);
 	list_for_each_entry_safe(block, next, &file->f_blocks, b_flist) {
 		if (!match(block->b_host, host))
 			continue;
@@ -325,11 +334,13 @@ void nlmsvc_traverse_blocks(struct nlm_host *host,
 		if (list_empty(&block->b_list))
 			continue;
 		kref_get(&block->b_count);
+		spin_unlock(&nlm_blocked_lock);
 		mutex_unlock(&file->f_mutex);
 		nlmsvc_unlink_block(block);
 		nlmsvc_release_block(block);
 		goto restart;
 	}
+	spin_unlock(&nlm_blocked_lock);
 	mutex_unlock(&file->f_mutex);
 }
 
-- 
2.31.1

