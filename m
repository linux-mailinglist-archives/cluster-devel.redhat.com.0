Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0085D63F4C3
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Dec 2022 17:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669910802;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qqommci96us+QVDcXaQm47rsizn+sT4z8GqL5KIOQ8U=;
	b=HwOdpX2mzTK4zZpsztKL1rZHtV2nc0WFbJ7zQXYnyC3OuFtUKprlc8UkW/QM9e1zbMMHns
	trfS3xx4n+J8AUnzOeP4lRWwiK2iq40Uj+CRVIZVzy5Ic1SXjzWLj+dNLumutgPUjUGg6A
	qIVbG+1GHdzhLAK4k27UwH7ZLkkSRzA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-sHSrUduMPZ61EzW610dDyA-1; Thu, 01 Dec 2022 11:06:41 -0500
X-MC-Unique: sHSrUduMPZ61EzW610dDyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9629E1C05EC2;
	Thu,  1 Dec 2022 16:06:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8AFDE568D3;
	Thu,  1 Dec 2022 16:06:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 50C6D19465B2;
	Thu,  1 Dec 2022 16:06:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6111919465A0 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Dec 2022 16:06:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 53EC3111E3FD; Thu,  1 Dec 2022 16:06:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-141.brq.redhat.com [10.40.192.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AB4D111E3FA;
 Thu,  1 Dec 2022 16:06:27 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Thu,  1 Dec 2022 17:06:19 +0100
Message-Id: <20221201160619.1247788-4-agruenba@redhat.com>
In-Reply-To: <20221201160619.1247788-1-agruenba@redhat.com>
References: <20221201160619.1247788-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [RFC 3/3] gfs2: Fix race between shrinker and
 gfs2_iomap_folio_done
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In gfs2_iomap_folio_done(), add the modified buffer heads to the current
transaction while the folio is still locked.  Otherwise, the shrinker
can come in and free them before we get to gfs2_page_add_databufs().

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 18dcaa95408e..d8d9ee843ac9 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -990,18 +990,17 @@ gfs2_iomap_folio_done(struct inode *inode, struct folio *folio,
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 
-	folio_unlock(folio);
-
 	if (!gfs2_is_stuffed(ip))
 		gfs2_page_add_databufs(ip, &folio->page, offset_in_page(pos),
 				       copied);
 
+	folio_unlock(folio);
+	folio_put(folio);
+
 	if (tr->tr_num_buf_new)
 		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
 
 	gfs2_trans_end(sdp);
-
-	folio_put(folio);
 }
 
 static const struct iomap_folio_ops gfs2_iomap_folio_ops = {
-- 
2.38.1

