Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF4F709B2C
	for <lists+cluster-devel@lfdr.de>; Fri, 19 May 2023 17:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684509695;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EKPdRJxeZfArqM51E1t6WoY518B2TAb5mlcXggG3JfU=;
	b=WlQonvyBIS8wByDKULuM5eCoT86/f19JA6grSuNAjOF08Apfq1bY3j6UT1wOGrsuzzZIYs
	Nr+x0FxNUl8ETr6+02E1YR8B9ROGltg4W3ovfkHq7WofwpGxg7yNZ9FgLHIqiAKsibe56s
	K54E8Gp3MUddByWbRxs/F1PNl5JmMkU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-AGjd-CKvMoyPd_p45xPgTg-1; Fri, 19 May 2023 11:21:32 -0400
X-MC-Unique: AGjd-CKvMoyPd_p45xPgTg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A708800888;
	Fri, 19 May 2023 15:21:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F78F2026D49;
	Fri, 19 May 2023 15:21:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E253519465BC;
	Fri, 19 May 2023 15:21:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7B3BB19465A4 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 19 May 2023 15:21:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6E0E6477F55; Fri, 19 May 2023 15:21:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FB034F2DE0;
 Fri, 19 May 2023 15:21:30 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 19 May 2023 11:21:25 -0400
Message-Id: <20230519152128.65272-2-aahringo@redhat.com>
In-Reply-To: <20230519152128.65272-1-aahringo@redhat.com>
References: <20230519152128.65272-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH v6.4-rc2 2/5] fs: dlm: fix cleanup pending
 ops when interrupted
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch mainly reverts what commit b92a4e3f86b1 ("fs: dlm: change posix
lock sigint handling") introduced. Except two things, checking if
op->done got true under ops_lock after it got interrupted and changing
"no op" messages to debug printout.

There is currently problems with cleaning up pending operations. The
main idea of commit b92a4e3f86b1 ("fs: dlm: change posix lock sigint
handling") was to wait for a reply and if it was interrupted then the
cleanup routine e.g. list_del(), do_unlock_close() will be executed.

This requires that for every dlm op request a answer in dev_write()
comes back. The cleanup routine do_unlock_close() is not operating in
the dlm user space software on a per request basis and will cleanup
everything else what matches certain plock op fields which concludes
that we don't get anymore for all request a result back. This will
have some leftovers inside the dlm plock recv_list which will never
being deleted.

It was confirmed with a new debugfs entry to look if some plock lists
have still entries left when there is no posix lock activity, checked
by dlm_tool plocks $LS, ongoing anymore. In the specific testcase on
a gfs2 mountpoint the following command was executed:

stress-ng --fcntl 32

and the stress-ng program was killed after certain time.

Due the fact that do_unlock_close() cleans more than just a specific
operation and the dlm operation is already removed by list_del(). This
list_del() can either be operating on send_list or recv_list. If it hits
recv_list it still can be that answers coming back for an ongoing
operation and do_unlock_close() is not synchronized with the list_del().
This will end in "no op ..." log_print(), to not confuse the user about
such issues which seems to be there by design we move this logging
information to pr_debug() as those are expected log messages.

Cc: stable@vger.kernel.org
Fixes: b92a4e3f86b1 ("fs: dlm: change posix lock sigint handling")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index ff364901f22b..fea2157fac5b 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -30,8 +30,6 @@ struct plock_async_data {
 struct plock_op {
 	struct list_head list;
 	int done;
-	/* if lock op got interrupted while waiting dlm_controld reply */
-	bool sigint;
 	struct dlm_plock_info info;
 	/* if set indicates async handling */
 	struct plock_async_data *data;
@@ -167,12 +165,14 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 			spin_unlock(&ops_lock);
 			goto do_lock_wait;
 		}
-
-		op->sigint = true;
+		list_del(&op->list);
 		spin_unlock(&ops_lock);
+
 		log_debug(ls, "%s: wait interrupted %x %llx pid %d",
 			  __func__, ls->ls_global_id,
 			  (unsigned long long)number, op->info.pid);
+		do_unlock_close(&op->info);
+		dlm_release_plock_op(op);
 		goto out;
 	}
 
@@ -434,19 +434,6 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 		if (iter->info.fsid == info.fsid &&
 		    iter->info.number == info.number &&
 		    iter->info.owner == info.owner) {
-			if (iter->sigint) {
-				list_del(&iter->list);
-				spin_unlock(&ops_lock);
-
-				pr_debug("%s: sigint cleanup %x %llx pid %d",
-					  __func__, iter->info.fsid,
-					  (unsigned long long)iter->info.number,
-					  iter->info.pid);
-				do_unlock_close(&iter->info);
-				memcpy(&iter->info, &info, sizeof(info));
-				dlm_release_plock_op(iter);
-				return count;
-			}
 			list_del_init(&iter->list);
 			memcpy(&iter->info, &info, sizeof(info));
 			if (iter->data)
@@ -465,8 +452,8 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 		else
 			wake_up(&recv_wq);
 	} else
-		log_print("%s: no op %x %llx", __func__,
-			  info.fsid, (unsigned long long)info.number);
+		pr_debug("%s: no op %x %llx", __func__,
+			 info.fsid, (unsigned long long)info.number);
 	return count;
 }
 
-- 
2.31.1

