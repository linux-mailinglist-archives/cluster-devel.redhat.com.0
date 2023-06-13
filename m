Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B86A72E651
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jun 2023 16:53:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686668001;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bKrsb1B0/rpBrgmF8dW858gOHqQxYBnU7p+Zs23fEF4=;
	b=K9XZQDbwL+Eicq0Zoh+phOWVsB45Qjq37nXAhh2cfr5FYs6w3qRLYvRD0kGa8J93xx5Sv6
	RbDR8zNS4YshhQz4JNwsatBQZaO2vHAbEeUja/6kFOI/lNjd/dqnu9Oev7zK+qHARyQf6X
	jlWSebybRIdmMBFhWX2fylhaIn861Ss=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-EZQ_by4cMGaDrQVAn14DrA-1; Tue, 13 Jun 2023 10:53:17 -0400
X-MC-Unique: EZQ_by4cMGaDrQVAn14DrA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3B04803DDF;
	Tue, 13 Jun 2023 14:53:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D30F492CA6;
	Tue, 13 Jun 2023 14:53:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 343601946A46;
	Tue, 13 Jun 2023 14:53:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CEDA5194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue, 13 Jun 2023 14:52:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BB7DC492CAC; Tue, 13 Jun 2023 14:52:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BDE8492CA6;
 Tue, 13 Jun 2023 14:52:57 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 13 Jun 2023 16:52:57 +0200
Message-Id: <20230613145257.1316318-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH] gfs2: retry interrupted internal reads
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The iomap-based read operations done by gfs2 for its system files, such
as rindex, may sometimes be interrupted and return -EINTR.   This
confuses some users of gfs2_internal_read().  Fix that by retrying
interrupted reads.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/aops.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index d95125714ebb..dacc21b1ae00 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -491,13 +491,16 @@ int gfs2_internal_read(struct gfs2_inode *ip, char *buf, loff_t *pos,
 	void *p;
 
 	do {
-		amt = size - copied;
-		if (offset + size > PAGE_SIZE)
-			amt = PAGE_SIZE - offset;
 		page = read_cache_page(mapping, index, gfs2_read_folio, NULL);
-		if (IS_ERR(page))
+		if (IS_ERR(page)) {
+			if (PTR_ERR(page) == -EINTR)
+				continue;
 			return PTR_ERR(page);
+		}
 		p = kmap_atomic(page);
+		amt = size - copied;
+		if (offset + size > PAGE_SIZE)
+			amt = PAGE_SIZE - offset;
 		memcpy(buf + copied, p + offset, amt);
 		kunmap_atomic(p);
 		put_page(page);
-- 
2.40.0

