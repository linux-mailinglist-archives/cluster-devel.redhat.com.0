Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B604E4E278A
	for <lists+cluster-devel@lfdr.de>; Mon, 21 Mar 2022 14:33:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647869590;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iySWMzU1XlpKHE4XEgQ+InnJLncuMozjeoUgRnxmEk4=;
	b=HLX0isCaQHutJ2zfn63Lk3otGHYLfnbwWLEfwlXFRzBjIF2UHQ2mH7tUU1oq6x7wy4W9x/
	FUVaDrDeeJ0O/Ifnk/6oBV4rZOmHBz+b9qn3DugMwBhM6i9xyQTDnUKRWW1bUfmfnMSmTj
	/peAZUAqMLwb67ng56zMXQ3Hs/CEdZc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-JK0E36ZvO0i7mhjyZkqKzg-1; Mon, 21 Mar 2022 09:33:07 -0400
X-MC-Unique: JK0E36ZvO0i7mhjyZkqKzg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6B8A3C1984A;
	Mon, 21 Mar 2022 13:33:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99EF54428F2;
	Mon, 21 Mar 2022 13:33:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1F44D1947BBF;
	Mon, 21 Mar 2022 13:33:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9140119451F1 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 21 Mar 2022 13:33:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 80BA74428FF; Mon, 21 Mar 2022 13:33:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E59894428F2;
 Mon, 21 Mar 2022 13:33:00 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 21 Mar 2022 14:32:59 +0100
Message-Id: <20220321133259.2059728-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH] gfs2: Fix gfs2_file_buffered_write endless
 loop workaround
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Since commit 554c577cee95b, gfs2_file_buffered_write() can accidentally
return a truncated iov_iter, which will break generic_write_sync() in
gfs2_file_write_iter().  Fix that.

Fixes: 554c577cee95b ("gfs2: Prevent endless loops in gfs2_file_buffered_write")
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 44bb886eefce..19a038bc33bc 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1084,6 +1084,7 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 	gfs2_holder_uninit(gh);
 	if (statfs_gh)
 		kfree(statfs_gh);
+	from->count = orig_count - read;
 	return read ? read : ret;
 }
 
-- 
2.33.1

