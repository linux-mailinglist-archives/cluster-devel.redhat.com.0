Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0C76EC630
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 08:22:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682317366;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ygZamnLPppSKQbVI2TYtcZ1SuuieTgm7wFWt/6s68PI=;
	b=TjoJrh7YLI41OCJjo8T3mW2FG8uKoj9eofNnpHnlRrF4mt8hYD/EkVueAE7CT5a6jo5lGp
	sOwHhZ7bnSzENqQZJKQ/S12tkvbuvwqno5YM47jKtvklpgVEoix1dE2dXJIwI/aNo/Wop1
	v21CGb/RcmaFfeYJ+6fc6Weq2+1WJk8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-zp_xxXgXNf61BGyw00rlvg-1; Mon, 24 Apr 2023 02:22:41 -0400
X-MC-Unique: zp_xxXgXNf61BGyw00rlvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65BF687B2A7;
	Mon, 24 Apr 2023 06:22:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 59C5A14171FF;
	Mon, 24 Apr 2023 06:22:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3CA111946589;
	Mon, 24 Apr 2023 06:22:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1961E1946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 06:22:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 000BA404DC40; Mon, 24 Apr 2023 06:22:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECFB440C2064
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 06:22:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2F968996F2
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 06:22:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-EJK6XPmPPr-zNH3uUCvQgQ-1; Mon, 24 Apr 2023 02:22:34 -0400
X-MC-Unique: EJK6XPmPPr-zNH3uUCvQgQ-1
Received: from [2001:4bb8:189:a74f:e8a5:5f73:6d2:23b8] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pqp5b-00FPB8-1e; Mon, 24 Apr 2023 05:50:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Apr 2023 07:49:24 +0200
Message-Id: <20230424054926.26927-16-hch@lst.de>
In-Reply-To: <20230424054926.26927-1-hch@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH 15/17] block: stop setting ->direct_IO
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
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Direct I/O on block devices now nevers goes through aops->direct_IO.
Stop setting it and set the FMODE_CAN_ODIRECT in ->open instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/fops.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index fd510b6142bd57..318247832a7bcf 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -428,7 +428,6 @@ const struct address_space_operations def_blk_aops = {
 	.writepage	= blkdev_writepage,
 	.write_begin	= blkdev_write_begin,
 	.write_end	= blkdev_write_end,
-	.direct_IO	= blkdev_direct_IO,
 	.migrate_folio	= buffer_migrate_folio_norefs,
 	.is_dirty_writeback = buffer_check_dirty_writeback,
 };
@@ -481,7 +480,7 @@ static int blkdev_open(struct inode *inode, struct file *filp)
 	 * during an unstable branch.
 	 */
 	filp->f_flags |= O_LARGEFILE;
-	filp->f_mode |= FMODE_NOWAIT | FMODE_BUF_RASYNC;
+	filp->f_mode |= FMODE_CAN_ODIRECT | FMODE_NOWAIT | FMODE_BUF_RASYNC;
 
 	if (filp->f_flags & O_NDELAY)
 		filp->f_mode |= FMODE_NDELAY;
-- 
2.39.2

