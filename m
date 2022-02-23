Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A584C19B2
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Feb 2022 18:15:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645636507;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IUguZxWY3Did4lqc4ZkkFJxQFxPSkUjKbL2B+iuPgaE=;
	b=N/n/3P3u/zicwT/uPQFFyUasl16p5A7Zy0wEJ+gnKnhC6xM0sANTfImsaTd5A3E7ZkEJYn
	j4N5DT8+HSGSKBY4oAnDEkEK50i4BwY4HjEt5gT3NxBGiQ2SiyY5YI9gVMcyq6svJTAVWP
	aD4kmsOTU/jV8r5cfAAYuQnOp3DrltY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-N4s3g3qtPRuzOMJFLaIZgA-1; Wed, 23 Feb 2022 12:15:03 -0500
X-MC-Unique: N4s3g3qtPRuzOMJFLaIZgA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F11B81854E2D;
	Wed, 23 Feb 2022 17:15:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFFDF2ED88;
	Wed, 23 Feb 2022 17:15:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDE554BB40;
	Wed, 23 Feb 2022 17:15:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21NH8pel009248 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Feb 2022 12:08:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6021D838EA; Wed, 23 Feb 2022 17:08:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02571838EC;
	Wed, 23 Feb 2022 17:08:50 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Feb 2022 12:08:22 -0500
Message-Id: <20220223170829.830864-3-aahringo@redhat.com>
In-Reply-To: <20220223170829.830864-1-aahringo@redhat.com>
References: <20220223170829.830864-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, viro@zeniv.linux.org.uk
Subject: [Cluster-devel] [PATCH/RFC dlm/next 2/9] fs: dlm: use __le types
	for options header
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch changes to use __le types directly in the dlm option headers
structures which are casted at the right dlm message buffer positions.

Currently only midcomms.c using those headers which already was calling
endian conversions on-the-fly without using in/out functionality like
other endianness handling in dlm. Using __le types now will hopefully get
useful warnings in future if we do comparison against host byte order
values.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 74a9590a4dd5..2bd1b249f2ee 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -460,9 +460,9 @@ struct dlm_rcom {
 };
 
 struct dlm_opt_header {
-	uint16_t	t_type;
-	uint16_t	t_length;
-	uint32_t	t_pad;
+	__le16		t_type;
+	__le16		t_length;
+	__le32		t_pad;
 	/* need to be 8 byte aligned */
 	char		t_value[];
 };
@@ -472,8 +472,8 @@ struct dlm_opts {
 	struct dlm_header	o_header;
 	uint8_t			o_nextcmd;
 	uint8_t			o_pad;
-	uint16_t		o_optlen;
-	uint32_t		o_pad2;
+	__le16			o_optlen;
+	__le32			o_pad2;
 	char			o_opts[];
 };
 
-- 
2.31.1

