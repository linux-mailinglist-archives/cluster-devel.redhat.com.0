Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CAC56D436
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Jul 2022 07:15:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657516501;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=73WQtLAfublxnxlmb+ZkF+V6P0Xfh+eOQ9htm4JxrAc=;
	b=gkgLG7D6Cch2rqNHMjnMw2+X8hWU8Y5+epnz++Qv/A0OJwDycu/QufqibpgTbgPhn5zRqn
	7IYIM1VeuPOd4M3266azeD9hUU4OA6dSaG16KOy8mlWbY14GpFpfGN/5N1Cmh2G2JQRTxh
	Us67/kALwNXL+/HXJ6vHXZFXJV1HCTo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-pyTIFZ0OMtOe-_pZI6LMYw-1; Mon, 11 Jul 2022 01:14:58 -0400
X-MC-Unique: pyTIFZ0OMtOe-_pZI6LMYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16DA52813D21;
	Mon, 11 Jul 2022 05:14:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B370918EB7;
	Mon, 11 Jul 2022 05:14:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8319B1947054;
	Mon, 11 Jul 2022 05:14:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0B5071947040 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 11 Jul 2022 05:14:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D04DB1121315; Mon, 11 Jul 2022 05:14:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC31B1121314
 for <cluster-devel@redhat.com>; Mon, 11 Jul 2022 05:14:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1F6D3C01C0B
 for <cluster-devel@redhat.com>; Mon, 11 Jul 2022 05:14:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-aIkzRgYDNQWGEeRtti5jhg-1; Mon, 11 Jul 2022 01:14:47 -0400
X-MC-Unique: aIkzRgYDNQWGEeRtti5jhg-1
Received: from 089144197153.atnat0006.highway.a1.net ([89.144.197.153]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oAkpC-00Fpwv-RI; Mon, 11 Jul 2022 04:15:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Naohiro Aota <naohiro.aota@wdc.com>
Date: Mon, 11 Jul 2022 06:14:58 +0200
Message-Id: <20220711041459.1062583-4-hch@lst.de>
In-Reply-To: <20220711041459.1062583-1-hch@lst.de>
References: <20220711041459.1062583-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH 3/4] zonefs: remove ->writepage
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
Cc: cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

->writepage is only used for single page writeback from memory reclaim,
and not called at all for cgroup writeback.  Follow the lead of XFS
and remove ->writepage and rely entirely on ->writepages.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/zonefs/super.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index 053299758deb9..062c3f1da0327 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -232,13 +232,6 @@ static const struct iomap_writeback_ops zonefs_writeback_ops = {
 	.map_blocks		= zonefs_write_map_blocks,
 };
 
-static int zonefs_writepage(struct page *page, struct writeback_control *wbc)
-{
-	struct iomap_writepage_ctx wpc = { };
-
-	return iomap_writepage(page, wbc, &wpc, &zonefs_writeback_ops);
-}
-
 static int zonefs_writepages(struct address_space *mapping,
 			     struct writeback_control *wbc)
 {
@@ -266,7 +259,6 @@ static int zonefs_swap_activate(struct swap_info_struct *sis,
 static const struct address_space_operations zonefs_file_aops = {
 	.read_folio		= zonefs_read_folio,
 	.readahead		= zonefs_readahead,
-	.writepage		= zonefs_writepage,
 	.writepages		= zonefs_writepages,
 	.dirty_folio		= filemap_dirty_folio,
 	.release_folio		= iomap_release_folio,
-- 
2.30.2

