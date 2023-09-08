Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB93799132
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Sep 2023 22:46:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694205991;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PeMTXPCYptSjwCoAJ8B3ThddmP+gLHY2FpqvtYa2hEg=;
	b=J5X09EW3Q3UkgI8RK8X7YjSY/tad4n47JHYkpDUy3BUkDZeTqqphotfUSM/nR3iIxBypAG
	JvN5L6j4Oi4mbm2TbwLvFHFGQEeXXKO92Mhxg51/b+9Dt4ZELvzXCTFHOI2Llr+5qf8Hr6
	iQ3ikdYzwU7IlgEyQTF89JDntwXoD4o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-DSEXX9NrOESqa0MS5eBciQ-1; Fri, 08 Sep 2023 16:46:26 -0400
X-MC-Unique: DSEXX9NrOESqa0MS5eBciQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52897181792C;
	Fri,  8 Sep 2023 20:46:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DFDE4412F2D0;
	Fri,  8 Sep 2023 20:46:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D534B19466DF;
	Fri,  8 Sep 2023 20:46:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0406C1946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  8 Sep 2023 20:46:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EAD1C21EE56A; Fri,  8 Sep 2023 20:46:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C13FD21EE56D;
 Fri,  8 Sep 2023 20:46:22 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri,  8 Sep 2023 16:46:04 -0400
Message-Id: <20230908204611.1910601-3-aahringo@redhat.com>
In-Reply-To: <20230908204611.1910601-1-aahringo@redhat.com>
References: <20230908204611.1910601-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [RFC dlm/next 03/10] fs: dlm: remove explicit
 scheduling points
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch prepares to switch some locks to a spinlock. In this case we
need to remove some explicit schedule points when a spinlock is held.
We might have less scheduling points to try to serve others, we need to
see if this still makes problems when we remove them and find other
solutions.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c         | 2 --
 fs/dlm/recover.c      | 1 -
 fs/dlm/requestqueue.c | 1 -
 3 files changed, 4 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 970b8499b66f..61eb285c613c 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -4979,7 +4979,6 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 			log_error(ls, "invalid lkb wait_type %d %d",
 				  lkb->lkb_wait_type, wait_type);
 		}
-		schedule();
 	}
 	mutex_unlock(&ls->ls_waiters_mutex);
 	kfree(ms_local);
@@ -5218,7 +5217,6 @@ void dlm_recover_purge(struct dlm_ls *ls)
 		}
 		unlock_rsb(r);
 		unhold_rsb(r);
-		cond_resched();
 	}
 	up_write(&ls->ls_root_sem);
 
diff --git a/fs/dlm/recover.c b/fs/dlm/recover.c
index ce6dc914cb86..752002304ca9 100644
--- a/fs/dlm/recover.c
+++ b/fs/dlm/recover.c
@@ -543,7 +543,6 @@ int dlm_recover_masters(struct dlm_ls *ls, uint64_t seq)
 		else
 			error = recover_master(r, &count, seq);
 		unlock_rsb(r);
-		cond_resched();
 		total++;
 
 		if (error) {
diff --git a/fs/dlm/requestqueue.c b/fs/dlm/requestqueue.c
index c05940afd063..ef7b7c8d6907 100644
--- a/fs/dlm/requestqueue.c
+++ b/fs/dlm/requestqueue.c
@@ -106,7 +106,6 @@ int dlm_process_requestqueue(struct dlm_ls *ls)
 			error = -EINTR;
 			break;
 		}
-		schedule();
 	}
 
 	return error;
-- 
2.31.1

