Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD9B517250
	for <lists+cluster-devel@lfdr.de>; Mon,  2 May 2022 17:14:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651504492;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EFpaF1tjVXsDj/CGeqQbnHHtz3fqg2Y6Zb0Fs9WVY1g=;
	b=HAxmS42sCiAOPYf33ighebOKcLCCQ6DKyQvUqmk9vY+7MaDVseKVxr83zq27SGq0NHz3qv
	eZjblAREkCV4aOF8wDtgdoG8VgjNreUhfIuPl66SjRUH3ml0nyWIdXLy4k3TrLJxnrWPU0
	Ty+CE27fGM1uOVT1cZ1FJgq8OJvFKiY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-v9hjSPTvP4-aAPTyLQBpSA-1; Mon, 02 May 2022 11:14:47 -0400
X-MC-Unique: v9hjSPTvP4-aAPTyLQBpSA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB9DA1014A63;
	Mon,  2 May 2022 15:14:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D445314C3B47;
	Mon,  2 May 2022 15:14:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AB6A7194706B;
	Mon,  2 May 2022 15:14:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CD4B6194705E for <cluster-devel@listman.corp.redhat.com>;
 Mon,  2 May 2022 15:14:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BEFD32166B4A; Mon,  2 May 2022 15:14:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F1722166B41;
 Mon,  2 May 2022 15:14:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  2 May 2022 11:14:10 -0400
Message-Id: <20220502151410.4049410-3-aahringo@redhat.com>
In-Reply-To: <20220502151410.4049410-1-aahringo@redhat.com>
References: <20220502151410.4049410-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 3/3] fs: dlm: use kref_put_lock in
 __put_lkb
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will optimize __put_lkb() by using kref_put_lock(). The
function kref_put_lock() will only held the lock if the reference is
going to be zero, if not the lock will never be hold.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index a331210434b2..226822f49d30 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1268,9 +1268,11 @@ static void kill_lkb(struct kref *kref)
 static int __put_lkb(struct dlm_ls *ls, struct dlm_lkb *lkb)
 {
 	uint32_t lkid = lkb->lkb_id;
+	int rv;
 
-	spin_lock(&ls->ls_lkbidr_spin);
-	if (kref_put(&lkb->lkb_ref, kill_lkb)) {
+	rv = kref_put_lock(&lkb->lkb_ref, kill_lkb,
+			   &ls->ls_lkbidr_spin);
+	if (rv) {
 		idr_remove(&ls->ls_lkbidr, lkid);
 		spin_unlock(&ls->ls_lkbidr_spin);
 
@@ -1280,11 +1282,9 @@ static int __put_lkb(struct dlm_ls *ls, struct dlm_lkb *lkb)
 		if (lkb->lkb_lvbptr && is_master_copy(lkb))
 			dlm_free_lvb(lkb->lkb_lvbptr);
 		dlm_free_lkb(lkb);
-		return 1;
-	} else {
-		spin_unlock(&ls->ls_lkbidr_spin);
-		return 0;
 	}
+
+	return rv;
 }
 
 int dlm_put_lkb(struct dlm_lkb *lkb)
-- 
2.31.1

