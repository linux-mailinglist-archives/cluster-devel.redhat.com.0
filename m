Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB283347C2
	for <lists+cluster-devel@lfdr.de>; Wed, 10 Mar 2021 20:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615403889;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GLUSCQBPfFcYiDek7/P0uo/Gx4ViRUzVZKqcbYNmilU=;
	b=VEwvwrUDO92Ou+ib2Tpd0zZMSvw2S8TQyAOoed20o4p6FDILdR/xsDYuyu0gFGRa2ekFyg
	ZC0X4QJp4ov5KYkTgev7lP3rXqf/64Y5EvXFfbHhWAOm1m+ddOlxXOGBlM4AwUOvIjeSMq
	AC8L6HJm6Efr+uE0a5brhpEeOTwQjW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-AVlfy661MmyITAHAL-m_Lw-1; Wed, 10 Mar 2021 14:18:07 -0500
X-MC-Unique: AVlfy661MmyITAHAL-m_Lw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B6EECC622;
	Wed, 10 Mar 2021 19:18:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 597BE5D9DB;
	Wed, 10 Mar 2021 19:18:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 437D757DC0;
	Wed, 10 Mar 2021 19:18:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12AJHuSq004754 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 10 Mar 2021 14:17:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B5D161037EB5; Wed, 10 Mar 2021 19:17:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-190.rdu2.redhat.com [10.10.114.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F371F101E24A;
	Wed, 10 Mar 2021 19:17:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 10 Mar 2021 14:17:38 -0500
Message-Id: <20210310191745.80824-2-aahringo@redhat.com>
In-Reply-To: <20210310191745.80824-1-aahringo@redhat.com>
References: <20210310191745.80824-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com, gnault@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 1/8] fs: dlm: public header in
	out utility
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch allows to use header_out() and header_in() outside of dlm
util functionality.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/util.c | 4 ++--
 fs/dlm/util.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/util.c b/fs/dlm/util.c
index cfd0d00b19ae..74a8c5bfe9b5 100644
--- a/fs/dlm/util.c
+++ b/fs/dlm/util.c
@@ -20,7 +20,7 @@
 #define DLM_ERRNO_ETIMEDOUT	       110
 #define DLM_ERRNO_EINPROGRESS	       115
 
-static void header_out(struct dlm_header *hd)
+void header_out(struct dlm_header *hd)
 {
 	hd->h_version		= cpu_to_le32(hd->h_version);
 	hd->h_lockspace		= cpu_to_le32(hd->h_lockspace);
@@ -28,7 +28,7 @@ static void header_out(struct dlm_header *hd)
 	hd->h_length		= cpu_to_le16(hd->h_length);
 }
 
-static void header_in(struct dlm_header *hd)
+void header_in(struct dlm_header *hd)
 {
 	hd->h_version		= le32_to_cpu(hd->h_version);
 	hd->h_lockspace		= le32_to_cpu(hd->h_lockspace);
diff --git a/fs/dlm/util.h b/fs/dlm/util.h
index cc719ca9397e..d46f23c7a6a0 100644
--- a/fs/dlm/util.h
+++ b/fs/dlm/util.h
@@ -15,6 +15,8 @@ void dlm_message_out(struct dlm_message *ms);
 void dlm_message_in(struct dlm_message *ms);
 void dlm_rcom_out(struct dlm_rcom *rc);
 void dlm_rcom_in(struct dlm_rcom *rc);
+void header_out(struct dlm_header *hd);
+void header_in(struct dlm_header *hd);
 
 #endif
 
-- 
2.26.2

