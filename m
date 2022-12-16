Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A0764ED6C
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Dec 2022 16:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671203202;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VO+moG/oEppC7fzqfjLDfJ6GvGE7XkJyRsj4uh85qjM=;
	b=JeihWz0LW/KftBjdKaJy6RyaKaGZwNadf8psw3A86VOkW8l2dE+aONYqaSBrHq1gr+0I04
	2N8BCwf470mYa+OwafsBD0iznUM5az496dgaS3CvSSZ3fsbR+//lmLADXT9Re3jcbKrbLZ
	NLYMN23IpcSmOV3Atgj0zyRz5QE7mK8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-SYOIwGfeNMGnjW31dPJ3Qw-1; Fri, 16 Dec 2022 10:06:37 -0500
X-MC-Unique: SYOIwGfeNMGnjW31dPJ3Qw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CFD729AB3E7;
	Fri, 16 Dec 2022 15:06:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 92320492C14;
	Fri, 16 Dec 2022 15:06:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 550311946A6B;
	Fri, 16 Dec 2022 15:06:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C56F21946594 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 16 Dec 2022 15:06:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AA4A51400E6D; Fri, 16 Dec 2022 15:06:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-182.brq.redhat.com [10.40.192.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9912E14171C0;
 Fri, 16 Dec 2022 15:06:32 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Fri, 16 Dec 2022 16:06:21 +0100
Message-Id: <20221216150626.670312-3-agruenba@redhat.com>
In-Reply-To: <20221216150626.670312-1-agruenba@redhat.com>
References: <20221216150626.670312-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [RFC v3 2/7] iomap: Add iomap_folio_done helper
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
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add an iomap_folio_done() helper to encapsulate unlocking the folio,
calling ->page_done(), and putting the folio.  This doesn't change the
functionality.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/buffered-io.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 347010c6a652..8ce9abb29d46 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -575,6 +575,19 @@ static int __iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
 	return 0;
 }
 
+static void iomap_folio_done(struct iomap_iter *iter, loff_t pos, size_t ret,
+		struct folio *folio)
+{
+	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
+
+	if (folio)
+		folio_unlock(folio);
+	if (page_ops && page_ops->page_done)
+		page_ops->page_done(iter->inode, pos, ret, &folio->page);
+	if (folio)
+		folio_put(folio);
+}
+
 static int iomap_write_begin_inline(const struct iomap_iter *iter,
 		struct folio *folio)
 {
@@ -616,7 +629,8 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 			fgp, mapping_gfp_mask(iter->inode->i_mapping));
 	if (!folio) {
 		status = (iter->flags & IOMAP_NOWAIT) ? -EAGAIN : -ENOMEM;
-		goto out_no_page;
+		iomap_folio_done(iter, pos, 0, NULL);
+		return status;
 	}
 
 	/*
@@ -656,13 +670,9 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 	return 0;
 
 out_unlock:
-	folio_unlock(folio);
-	folio_put(folio);
+	iomap_folio_done(iter, pos, 0, folio);
 	iomap_write_failed(iter->inode, pos, len);
 
-out_no_page:
-	if (page_ops && page_ops->page_done)
-		page_ops->page_done(iter->inode, pos, 0, NULL);
 	return status;
 }
 
@@ -712,7 +722,6 @@ static size_t iomap_write_end_inline(const struct iomap_iter *iter,
 static size_t iomap_write_end(struct iomap_iter *iter, loff_t pos, size_t len,
 		size_t copied, struct folio *folio)
 {
-	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
 	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	loff_t old_size = iter->inode->i_size;
 	size_t ret;
@@ -736,11 +745,8 @@ static size_t iomap_write_end(struct iomap_iter *iter, loff_t pos, size_t len,
 		iter->iomap.flags |= IOMAP_F_SIZE_CHANGED;
 		folio_may_straddle_isize(iter->inode, folio, old_size, pos);
 	}
-	folio_unlock(folio);
 
-	if (page_ops && page_ops->page_done)
-		page_ops->page_done(iter->inode, pos, ret, &folio->page);
-	folio_put(folio);
+	iomap_folio_done(iter, pos, ret, folio);
 
 	if (ret < len)
 		iomap_write_failed(iter->inode, pos + ret, len - ret);
-- 
2.38.1

