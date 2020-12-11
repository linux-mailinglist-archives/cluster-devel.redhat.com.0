Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9672D79C1
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Dec 2020 16:47:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607701657;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sf9N0l1hyadgaPlJhRKE1j6E4+E0brDIzrIfjgJei70=;
	b=fZU/iqZjPsMnDzpxNaIOuiizRjVivX88M45Vkjk/xF9EHoYcl3tr7fOJbQLPZQeSzHjIUk
	uyFtwqh3Lrm9IZ1BYtBFmVI55OQqygJIxjCqC3eKofakNHR95YUIioClC0dLmoh7L5awOT
	J+qWdVsy3Q8UNka55IBX9HeaGAGaHoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-dSv9VzcrMsKfgrN-yw_95w-1; Fri, 11 Dec 2020 10:47:35 -0500
X-MC-Unique: dSv9VzcrMsKfgrN-yw_95w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A007310054FF;
	Fri, 11 Dec 2020 15:47:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1C285F708;
	Fri, 11 Dec 2020 15:47:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA0861809C9F;
	Fri, 11 Dec 2020 15:47:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BBFlOv9013743 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Dec 2020 10:47:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4602C5F9A6; Fri, 11 Dec 2020 15:47:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-44.rdu2.redhat.com [10.10.114.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA7C15F708;
	Fri, 11 Dec 2020 15:47:23 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 11 Dec 2020 10:47:18 -0500
Message-Id: <20201211154718.99346-3-aahringo@redhat.com>
In-Reply-To: <20201211154718.99346-1-aahringo@redhat.com>
References: <20201211154718.99346-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 2/2] fs: dlm: transparently align
	name buffer
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds a zeroed temporary buffer to align the given resource
name of a dlm lock user space request transparently to a 4 byte aligned
buffer. I hit the assert while running the recent pending patch which
contains a 4 byte aligned assert for the dlm header msglength field.
It's important that the allocation and msglength field is 4 byte aligned
as the dlm_header structure is natural aligned to 4 byte values. The
internal dlm allocator can return the next remaining space from a
previously allocated length. The buffer will not be aligned to 4 byte
anymore if this case occurs. At receiving side we cannot parse the next
dlm message because the next dlm header starts at a unaligned address as
well.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/user.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index 9f2f743eeb31..70a5116df9fe 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -236,6 +236,7 @@ void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
 static int device_user_lock(struct dlm_user_proc *proc,
 			    struct dlm_lock_params *params)
 {
+	unsigned char name[DLM_RESNAME_MAXLEN] = {};
 	struct dlm_ls *ls;
 	struct dlm_user_args *ua;
 	uint32_t lkid;
@@ -270,17 +271,19 @@ static int device_user_lock(struct dlm_user_proc *proc,
 				         params->lkid, params->lvb,
 					 (unsigned long) params->timeout);
 	} else if (params->flags & DLM_LKF_ORPHAN) {
+		memcpy(name, params->name, params->namelen);
 		error = dlm_user_adopt_orphan(ls, ua,
 					 params->mode, params->flags,
-					 params->name, params->namelen,
+					 name, ALIGN(params->namelen, 4),
 					 (unsigned long) params->timeout,
 					 &lkid);
 		if (!error)
 			error = lkid;
 	} else {
+		memcpy(name, params->name, params->namelen);
 		error = dlm_user_request(ls, ua,
 					 params->mode, params->flags,
-					 params->name, params->namelen,
+					 name, ALIGN(params->namelen, 4),
 					 (unsigned long) params->timeout);
 		if (!error)
 			error = ua->lksb.sb_lkid;
-- 
2.26.2

