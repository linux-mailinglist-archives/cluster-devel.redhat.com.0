Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A3E4F1A0F
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102844;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IUguZxWY3Did4lqc4ZkkFJxQFxPSkUjKbL2B+iuPgaE=;
	b=JDDMdxHbk7voxueXih1BMugT+eobW7gOwtcJ1s8v7IcCitTIxfxVzT/2dXIcjD5FuzNbxA
	1yXwtbuRLdWZRxaZhGRWZJUsYIL7cYBlnRjEQR8ppylOtlUbQK3yaYADH/kc18812xWDLI
	WAp1livG4afUlRM2s3w6TuRlEb+scxI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-hEpeB4rJMGWmGDR6mpMn0w-1; Mon, 04 Apr 2022 16:07:19 -0400
X-MC-Unique: hEpeB4rJMGWmGDR6mpMn0w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A52D53C021A3;
	Mon,  4 Apr 2022 20:07:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E735E428EFE;
	Mon,  4 Apr 2022 20:07:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3B859194E013;
	Mon,  4 Apr 2022 20:06:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 85C61193F6D9 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 67BE07C43; Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A0007C28;
 Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:38 -0400
Message-Id: <20220404200646.3170301-12-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 11/19] fs: dlm: use __le
 types for options header
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

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

