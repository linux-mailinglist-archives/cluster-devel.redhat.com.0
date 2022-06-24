Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEC6558CD4
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jun 2022 03:29:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656034155;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+yTFj0h0xLYaBfwk3R63XDd7D/A/0hn9V27IUkZePVk=;
	b=gHWt7m0rKam47SmRLb59/pVK6bz/qalRfn25J2pP9g4ZBY06IJ10G3hP44f8v33P2dzuKA
	X3esxve9yG528U6Oz+EnnjTtXECTqcWINS6DoGWXIa4ZyLmHq2X1yy/VlGvlU6ClBgpqq1
	bnELw1ozN22SZa9oFU1ki+U1suNxyqc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-A3vF2K5uMBWwN_WR-ePAgg-1; Thu, 23 Jun 2022 21:29:11 -0400
X-MC-Unique: A3vF2K5uMBWwN_WR-ePAgg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 777E7185A7B2;
	Fri, 24 Jun 2022 01:29:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 996A92166B26;
	Fri, 24 Jun 2022 01:29:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E7205194B96B;
	Fri, 24 Jun 2022 01:29:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7F69E1947065 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 24 Jun 2022 01:29:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 613CE40334F; Fri, 24 Jun 2022 01:29:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44A7E40C5BF;
 Fri, 24 Jun 2022 01:29:05 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 23 Jun 2022 21:29:00 -0400
Message-Id: <20220624012900.2355825-3-aahringo@redhat.com>
In-Reply-To: <20220624012900.2355825-1-aahringo@redhat.com>
References: <20220624012900.2355825-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm/next 3/3] fs: dlm: fix context imbalance
 warning in put_rsb()
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch fixes the following sparse warning:

warning: context imbalance in 'put_rsb' - unexpected unlock

it does this by unlock the ls_rsbtbl[bucket].lock lock inside of the
release functionality of kref_put_lock() and do a __releases() annotation
at the release function.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 4b5cff76d376..70ee15c44bd2 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -352,12 +352,9 @@ static void put_rsb(struct dlm_rsb *r)
 {
 	struct dlm_ls *ls = r->res_ls;
 	uint32_t bucket = r->res_bucket;
-	int rv;
 
-	rv = kref_put_lock(&r->res_ref, toss_rsb,
-			   &ls->ls_rsbtbl[bucket].lock);
-	if (rv)
-		spin_unlock(&ls->ls_rsbtbl[bucket].lock);
+	kref_put_lock(&r->res_ref, toss_rsb,
+		      &ls->ls_rsbtbl[bucket].lock);
 }
 
 void dlm_put_rsb(struct dlm_rsb *r)
@@ -1140,20 +1137,24 @@ void dlm_dump_rsb_name(struct dlm_ls *ls, char *name, int len)
 }
 
 static void toss_rsb(struct kref *kref)
+	__releases(&ls->ls_rsbtbl[bucket].lock)
 {
 	struct dlm_rsb *r = container_of(kref, struct dlm_rsb, res_ref);
+	uint32_t bucket = r->res_bucket;
 	struct dlm_ls *ls = r->res_ls;
 
 	DLM_ASSERT(list_empty(&r->res_root_list), dlm_print_rsb(r););
 	kref_init(&r->res_ref);
-	rb_erase(&r->res_hashnode, &ls->ls_rsbtbl[r->res_bucket].keep);
-	rsb_insert(r, &ls->ls_rsbtbl[r->res_bucket].toss);
+	rb_erase(&r->res_hashnode, &ls->ls_rsbtbl[bucket].keep);
+	rsb_insert(r, &ls->ls_rsbtbl[bucket].toss);
 	r->res_toss_time = jiffies;
-	ls->ls_rsbtbl[r->res_bucket].flags |= DLM_RTF_SHRINK;
+	ls->ls_rsbtbl[bucket].flags |= DLM_RTF_SHRINK;
 	if (r->res_lvbptr) {
 		dlm_free_lvb(r->res_lvbptr);
 		r->res_lvbptr = NULL;
 	}
+
+	spin_unlock(&ls->ls_rsbtbl[bucket].lock);
 }
 
 /* See comment for unhold_lkb */
-- 
2.31.1

