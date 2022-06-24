Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E406B558CD3
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jun 2022 03:29:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656034154;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9tHwD527h/fNDSk5BSdp/ZZP5yasjtoep/6zxREkxT0=;
	b=Udux1aNHkWeLXqlPLYIV9TpcTrB63jI6RDJZLy3OwHz9Je3SoMKvFMTRqcGXzF7CpOml46
	dVoPjTfb9mPxCt/mk5zRp46rg/xSoP7dnCnleQ/eXoORZKNvNPfam3wdPk28lBuAEEgGno
	tXarN9Gee2NWo4nLIMMTpRgxDGtYLow=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-yM7pNky3Ofip3TNzd-HPWA-1; Thu, 23 Jun 2022 21:29:11 -0400
X-MC-Unique: yM7pNky3Ofip3TNzd-HPWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 788933C0D199;
	Fri, 24 Jun 2022 01:29:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 807A02026D64;
	Fri, 24 Jun 2022 01:29:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CC06B194B95F;
	Fri, 24 Jun 2022 01:29:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 34C071947065 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 24 Jun 2022 01:29:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1692041616B; Fri, 24 Jun 2022 01:29:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB84741617E;
 Fri, 24 Jun 2022 01:29:04 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 23 Jun 2022 21:28:58 -0400
Message-Id: <20220624012900.2355825-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm/next 1/3] fs: dlm: move assert into
 release function
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch moves the assert if unhold_lkb() hits lkb->lkb_ref zero into
the release function. Instead of kill_lkb() which has an assert if
lkb->lkb_status is non-zero. The assert in kill_lkb() has nothing todo
with unhold a lkb and probably was only used here to call something if
it it's zero. The unhold_lkb() should never release a lkb so we move the
assert to the release functionality.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 739f09d0951c..dac7eb75dba9 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1310,6 +1310,13 @@ static inline void hold_lkb(struct dlm_lkb *lkb)
 	kref_get(&lkb->lkb_ref);
 }
 
+static void unhold_lkb_assert(struct kref *kref)
+{
+	struct dlm_lkb *lkb = container_of(kref, struct dlm_lkb, lkb_ref);
+
+	DLM_ASSERT(false, dlm_print_lkb(lkb););
+}
+
 /* This is called when we need to remove a reference and are certain
    it's not the last ref.  e.g. del_lkb is always called between a
    find_lkb/put_lkb and is always the inverse of a previous add_lkb.
@@ -1317,9 +1324,7 @@ static inline void hold_lkb(struct dlm_lkb *lkb)
 
 static inline void unhold_lkb(struct dlm_lkb *lkb)
 {
-	int rv;
-	rv = kref_put(&lkb->lkb_ref, kill_lkb);
-	DLM_ASSERT(!rv, dlm_print_lkb(lkb););
+	kref_put(&lkb->lkb_ref, unhold_lkb_assert);
 }
 
 static void lkb_add_ordered(struct list_head *new, struct list_head *head,
-- 
2.31.1

