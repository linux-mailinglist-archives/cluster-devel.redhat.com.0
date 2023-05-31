Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F2B717F5E
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 13:59:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685534383;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kfbXVXnOIfMtfpOW0KwQK8XZeszf1+haBQT/gEejogo=;
	b=irv3KZ3jehifWbVA3eNwdhXgMuE1xMA4Hn+ylRhSnuvuioIIRAKANP+cIOHPTZsuyxj8KE
	ljY0LWlhPzNyL+9XUY3ouKGP1Nc8e16wl/2pj3G+7POD1yxShDpve+zupPrlMjLHeLacnt
	Bji4Fd1uGmh3Uq8GIg5nlnilVzwCXGM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-AmbOJYgCOqyRSj6J-1vqRw-1; Wed, 31 May 2023 07:59:39 -0400
X-MC-Unique: AmbOJYgCOqyRSj6J-1vqRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D95A29DD990;
	Wed, 31 May 2023 11:59:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FD2F112132C;
	Wed, 31 May 2023 11:59:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 529CF1946A42;
	Wed, 31 May 2023 11:59:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 121C11946595 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 11:38:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 00BFF40C6CD0; Wed, 31 May 2023 11:38:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED83040C6EC4
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:38:53 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D42573C397CB
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:38:53 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-WjI13IwpPr6BnBGPMTpzwg-4; Wed, 31 May 2023 07:38:48 -0400
X-MC-Unique: WjI13IwpPr6BnBGPMTpzwg-4
X-IronPort-AV: E=Sophos;i="6.00,207,1681142400"; d="scan'208";a="336547323"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2023 19:38:47 +0800
IronPort-SDR: WfNC8LZzFeZWOgcWq3dviokcgso7ycm/aGahbRqXbanPpx0iwAbSk+dBksqv8vMsqdSTgqVHtz
 FcITRjZ/cAfa/8X8/Lnyy8uhk85jDdWIu+k1bqtvEonX33F9Y5edVAXqMNxoPss0Pof2papkoo
 U/aiiRQHIeKr/Eh5pEEGZCRurQSqa41E5jBvbcRvz1NR8o2UrzXoMjtvDDOJ8YIpAXEQXZ7L7B
 z12nGxSndM6iSZI/L6FmgJbWxse7xCDLopcHnP6mYKU/j3GzHEaDpmTQQ80MRYOiFGAtqyCIoO
 rTo=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 03:53:39 -0700
IronPort-SDR: wdGMh6RNwdOX9z4wdyOHz0JvcWnTxFxGSKK/Ksg1OEFa4Jnxlt7c8CxWzsVNAu2ywef95mpqNU
 ++V+oN65aC0F0CO/k7+uxwXrD2xBIlIAW/4YajUF+5M5LBD17djJUfzwWjiukxq53hNVFSJ6CI
 yu4F60MLSwbe59TOiyeVfu8WZa1gI81OkAT9SVASu8e5yW94xRpcY7/vQk1Oa/QapeNZY6vge2
 gwnPQvZctrblCXkEJ9Cv8zda976C695H1+iX0Z83/DZFwmmRmaJzmH7HMD20s+gJ3CO71NCI2W
 lZ8=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 31 May 2023 04:38:43 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 31 May 2023 04:37:55 -0700
Message-Id: <d7cfd04d410accee4148d8c0e51230bcb8b4bb8f.1685461490.git.johannes.thumshirn@wdc.com>
In-Reply-To: <cover.1685461490.git.johannes.thumshirn@wdc.com>
References: <cover.1685461490.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH v6 13/20] md: check for failure when adding
 pages in alloc_behind_master_bio
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
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Song Liu <song@kernel.org>, dm-devel@redhat.com,
 Christoph Hellwig <hch@lst.de>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Mike Snitzer <snitzer@kernel.org>,
 Ming Lei <ming.lei@redhat.com>, linux-raid@vger.kernel.org,
 Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>,
 gouha7@uniontech.com, linux-block@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, linux-mm@kvack.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

alloc_behind_master_bio() can possibly add multiple pages to a bio, but it
is not checking for the return value of bio_add_page() if adding really
succeeded.

Check if the page adding succeeded and if not bail out.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/md/raid1.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 68a9e2d9985b..8283ef177f6c 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -1147,7 +1147,10 @@ static void alloc_behind_master_bio(struct r1bio *r1_bio,
 		if (unlikely(!page))
 			goto free_pages;
 
-		bio_add_page(behind_bio, page, len, 0);
+		if (!bio_add_page(behind_bio, page, len, 0)) {
+			free_page(page);
+			goto free_pages;
+		}
 
 		size -= len;
 		i++;
-- 
2.40.1

