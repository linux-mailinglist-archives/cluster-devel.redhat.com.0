Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 776F634AD9F
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 18:34:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616780039;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h/hgOuoFH/2PQKbb2YxVLN3uqZrpVqkaBgUoCYkyRNc=;
	b=i1P7kfptnCHO2PKN3QJDCZcs+JS0IDlScQtlYG1kjt85Pxmf7PVSXEmq18fOgyUUh5hnzI
	kUNz+rQXo2s6NqGyADsGBvZE3/9ji6jAZH/TVANFBPHobyKjOOG02vsJ6MHJGMB81oVLr4
	WHXR/lkTSPul/SrnHWOhxWl68YwRTRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-7BdNdGHkNaq7m8qM-8YrYg-1; Fri, 26 Mar 2021 13:33:57 -0400
X-MC-Unique: 7BdNdGHkNaq7m8qM-8YrYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B19B7A40C2;
	Fri, 26 Mar 2021 17:33:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91ACE88F0E;
	Fri, 26 Mar 2021 17:33:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16FE34A7C9;
	Fri, 26 Mar 2021 17:33:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12QHXlrC009392 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 13:33:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E2DF010023B5; Fri, 26 Mar 2021 17:33:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-117-90.rdu2.redhat.com [10.10.117.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F1DC1000324;
	Fri, 26 Mar 2021 17:33:47 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 26 Mar 2021 13:33:30 -0400
Message-Id: <20210326173337.44231-2-aahringo@redhat.com>
In-Reply-To: <20210326173337.44231-1-aahringo@redhat.com>
References: <20210326173337.44231-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com, gnault@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 1/8] fs: dlm: public header in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

