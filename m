Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0465E38CDF0
	for <lists+cluster-devel@lfdr.de>; Fri, 21 May 2021 21:09:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621624157;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h/hgOuoFH/2PQKbb2YxVLN3uqZrpVqkaBgUoCYkyRNc=;
	b=jJlgZ45VdHX9iX41uz/IjjB6LCXf+AmCsFfqoVwDTF1jfh0ou9T8KX/+Yek2M0ttNmBR3J
	STpXlXtTcmhKkG2ik3ZyjE9KrJ89rdlLz0wVHVrOA2PJMESlc3YgVRs01bzqmMbZOMRR2B
	p76yODjtfWqT9oXw+/SpOEK09leGPyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-3FVwM350OAWm-dgonIs-Og-1; Fri, 21 May 2021 15:09:15 -0400
X-MC-Unique: 3FVwM350OAWm-dgonIs-Og-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68E3B107ACCD;
	Fri, 21 May 2021 19:09:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C7245D6DC;
	Fri, 21 May 2021 19:09:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4CEFD44A66;
	Fri, 21 May 2021 19:09:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14LJ9AA2005192 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 15:09:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C2B25C8AA; Fri, 21 May 2021 19:09:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-19.rdu2.redhat.com [10.10.115.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 038A45C648;
	Fri, 21 May 2021 19:09:09 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 21 May 2021 15:08:40 -0400
Message-Id: <20210521190848.350176-9-aahringo@redhat.com>
In-Reply-To: <20210521190848.350176-1-aahringo@redhat.com>
References: <20210521190848.350176-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv6 v5.13-rc1 dlm/next 08/16] fs: dlm: public
	header in out utility
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
2.26.3

