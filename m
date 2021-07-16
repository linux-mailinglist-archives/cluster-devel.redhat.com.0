Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 89EDE3CBDAD
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Jul 2021 22:23:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626466986;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Xa6UGsRyJv1oqSmKFEZFEBjU/u2X4UuK4Ap4NG02Xws=;
	b=SnaebSfR0Ry4CMrznTXaWoFdeb7Yve3uPLTQK1pPTQHN/cAYYptmFXLhPnSgnJoI/FCVT2
	LPVHynw569GR6uhE2gM+PVe9fVuDbbBQsdRpLyWX2YSIxKitO4aQcSrBEXQF1g6d3X1lLf
	w8YsxZATxZSC0t7zcXg5efgWIt/eBEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-gGjhJ56OPOGuFa0HdIY11A-1; Fri, 16 Jul 2021 16:23:05 -0400
X-MC-Unique: gGjhJ56OPOGuFa0HdIY11A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C6FF9F92E;
	Fri, 16 Jul 2021 20:23:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 703EC60862;
	Fri, 16 Jul 2021 20:23:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A5FE4EA2F;
	Fri, 16 Jul 2021 20:23:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16GKMv5W026034 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 16 Jul 2021 16:22:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3949F5D741; Fri, 16 Jul 2021 20:22:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC3035D6AB;
	Fri, 16 Jul 2021 20:22:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 16 Jul 2021 16:22:36 -0400
Message-Id: <20210716202245.1262791-4-aahringo@redhat.com>
In-Reply-To: <20210716202245.1262791-1-aahringo@redhat.com>
References: <20210716202245.1262791-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v5.14-rc1 03/12] fs: dlm: fix typo in tlv
	prefix
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch fixes a small typo in a unused struct field. It should named
be t_pad instead of o_pad. Came over this as I updated wireshark
dissector.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 91d1ca3a121a..5f57538b5d45 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -468,7 +468,7 @@ struct dlm_rcom {
 struct dlm_opt_header {
 	uint16_t	t_type;
 	uint16_t	t_length;
-	uint32_t	o_pad;
+	uint32_t	t_pad;
 	/* need to be 8 byte aligned */
 	char		t_value[];
 };
-- 
2.27.0

