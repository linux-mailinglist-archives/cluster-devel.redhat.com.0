Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 121744F1A09
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102842;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Le4P4TnxAth0en6LYVNk1HEeArQUMP47nNimF4uiADA=;
	b=FumO99s99WH9LwhkSJdOdqkvkzEEoqiZLDgSzlVskIy8VPBLdqiv6qBaAcxVJeyPofmcbo
	/v9ni74Z8jURsjlrtDKRJoxvo+oFNVvxvo/CyuJI/R7DAn4wfLT3oKn0SkIQCxKBksMtdQ
	qLX2YjAOGwFXuUtn8cFhs5L7XT1C2lY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-I7ifaP9vPzO71v64S80pPg-1; Mon, 04 Apr 2022 16:07:19 -0400
X-MC-Unique: I7ifaP9vPzO71v64S80pPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 217B61C05AC7;
	Mon,  4 Apr 2022 20:07:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C30840F494B;
	Mon,  4 Apr 2022 20:07:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C23F2194E009;
	Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5D888193F6E9 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 407FC7C2A; Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 229727C43;
 Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:43 -0400
Message-Id: <20220404200646.3170301-17-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 16/19] fs: dlm: remove
 __user conversion warnings
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch avoids the following sparse warning:

fs/dlm/user.c:111:38: warning: incorrect type in assignment (different address spaces)
fs/dlm/user.c:111:38:    expected void [noderef] __user *castparam
fs/dlm/user.c:111:38:    got void *
fs/dlm/user.c:112:37: warning: incorrect type in assignment (different address spaces)
fs/dlm/user.c:112:37:    expected void [noderef] __user *castaddr
fs/dlm/user.c:112:37:    got void *
fs/dlm/user.c:113:38: warning: incorrect type in assignment (different address spaces)
fs/dlm/user.c:113:38:    expected void [noderef] __user *bastparam
fs/dlm/user.c:113:38:    got void *
fs/dlm/user.c:114:37: warning: incorrect type in assignment (different address spaces)
fs/dlm/user.c:114:37:    expected void [noderef] __user *bastaddr
fs/dlm/user.c:114:37:    got void *
fs/dlm/user.c:115:33: warning: incorrect type in assignment (different address spaces)
fs/dlm/user.c:115:33:    expected struct dlm_lksb [noderef] __user *lksb
fs/dlm/user.c:115:33:    got void *
fs/dlm/user.c:130:39: warning: cast removes address space '__user' of expression
fs/dlm/user.c:131:40: warning: cast removes address space '__user' of expression
fs/dlm/user.c:132:36: warning: cast removes address space '__user' of expression

So far I see there is no direct handling of copying a pointer value to
another pointer value. The handling only copies the actual pointer
address to a scalar type or vice versa. This should be okay because it
never handles dereferencing anything of those addresses in the kernel
space. To get rid of those warnings we doing some different casting
which results in no warnings in sparse or compiler.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/user.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index e5cefa90b1ce..1060b24f18d4 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -108,11 +108,11 @@ static void compat_input(struct dlm_write_request *kb,
 		kb->i.lock.parent = kb32->i.lock.parent;
 		kb->i.lock.xid = kb32->i.lock.xid;
 		kb->i.lock.timeout = kb32->i.lock.timeout;
-		kb->i.lock.castparam = (void *)(long)kb32->i.lock.castparam;
-		kb->i.lock.castaddr = (void *)(long)kb32->i.lock.castaddr;
-		kb->i.lock.bastparam = (void *)(long)kb32->i.lock.bastparam;
-		kb->i.lock.bastaddr = (void *)(long)kb32->i.lock.bastaddr;
-		kb->i.lock.lksb = (void *)(long)kb32->i.lock.lksb;
+		kb->i.lock.castparam = (__user void *)(long)kb32->i.lock.castparam;
+		kb->i.lock.castaddr = (__user void *)(long)kb32->i.lock.castaddr;
+		kb->i.lock.bastparam = (__user void *)(long)kb32->i.lock.bastparam;
+		kb->i.lock.bastaddr = (__user void *)(long)kb32->i.lock.bastaddr;
+		kb->i.lock.lksb = (__user void *)(long)kb32->i.lock.lksb;
 		memcpy(kb->i.lock.lvb, kb32->i.lock.lvb, DLM_USER_LVB_LEN);
 		memcpy(kb->i.lock.name, kb32->i.lock.name, namelen);
 	}
@@ -127,9 +127,9 @@ static void compat_output(struct dlm_lock_result *res,
 	res32->version[1] = res->version[1];
 	res32->version[2] = res->version[2];
 
-	res32->user_astaddr = (__u32)(long)res->user_astaddr;
-	res32->user_astparam = (__u32)(long)res->user_astparam;
-	res32->user_lksb = (__u32)(long)res->user_lksb;
+	res32->user_astaddr = (__u32)(__force long)res->user_astaddr;
+	res32->user_astparam = (__u32)(__force long)res->user_astparam;
+	res32->user_lksb = (__u32)(__force long)res->user_lksb;
 	res32->bast_mode = res->bast_mode;
 
 	res32->lvb_offset = res->lvb_offset;
-- 
2.31.1

