Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5DC4C1997
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Feb 2022 18:11:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645636282;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Le4P4TnxAth0en6LYVNk1HEeArQUMP47nNimF4uiADA=;
	b=NmvGjxe5i7RXeMLX7n2b5syhpiREy/fKKohrCz14FolnhB6Xe3lIlgNq8c5bFD5P6DZCLD
	dUmj+dzMqTIpxg/zFIZ29VoHXn5elp3Z2If0056Jxynly/yaS3jxDiSHtgSEMWzEGzqsqZ
	RzAU2aOVXti3nLAZHPBv5pRYF6ircN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-vz_pyfD9PM6zgUa28jC38Q-1; Wed, 23 Feb 2022 12:11:19 -0500
X-MC-Unique: vz_pyfD9PM6zgUa28jC38Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CA3F1091DAD;
	Wed, 23 Feb 2022 17:11:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB2B3108132F;
	Wed, 23 Feb 2022 17:11:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A70934EE45;
	Wed, 23 Feb 2022 17:11:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21NH8sY4009284 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Feb 2022 12:08:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 09E68838E9; Wed, 23 Feb 2022 17:08:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F928838E6;
	Wed, 23 Feb 2022 17:08:53 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Feb 2022 12:08:27 -0500
Message-Id: <20220223170829.830864-8-aahringo@redhat.com>
In-Reply-To: <20220223170829.830864-1-aahringo@redhat.com>
References: <20220223170829.830864-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, viro@zeniv.linux.org.uk
Subject: [Cluster-devel] [PATCH/RFC dlm/next 7/9] fs: dlm: remove __user
	conversion warnings
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

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

