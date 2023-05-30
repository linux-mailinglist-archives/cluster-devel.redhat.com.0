Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 244087167F6
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 17:52:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685461925;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lesC7ZHzHc7ah/ToJ8yOzNcL34jZPc+O7TdhQ2cqcu8=;
	b=i6jVJHEx/RGGR4w6C4JqGI77fjFfIEYvT7BpnZCmEWPABR2Ar5QrWU9tpPfLUqbk4NmUFU
	K+bFsAQ+FY3u5LdajlRVMHdk81j6qCs55iY6LhGS0uYxfkwJ6Y+b7ka/hA0FjuGEOzpllx
	eKcvjvS9hljGeAqbch6CYvWnIp/e+AQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-1JOQknrsPXG9Qw5y9WEgXQ-1; Tue, 30 May 2023 11:51:57 -0400
X-MC-Unique: 1JOQknrsPXG9Qw5y9WEgXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42FFE1C09045;
	Tue, 30 May 2023 15:51:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3781840C6EC4;
	Tue, 30 May 2023 15:51:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9DE57193F51B;
	Tue, 30 May 2023 15:50:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5B28719465A2 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 30 May 2023 15:49:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3A17340CFD45; Tue, 30 May 2023 15:49:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 330A540CFD47
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 15:49:53 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 194EA803C82
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 15:49:53 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-K4Rg0Jv4Pw2FwVjtX8jqqg-2; Tue, 30 May 2023 11:49:49 -0400
X-MC-Unique: K4Rg0Jv4Pw2FwVjtX8jqqg-2
X-IronPort-AV: E=Sophos;i="6.00,204,1681142400"; d="scan'208";a="231905701"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 May 2023 23:49:48 +0800
IronPort-SDR: u5LjIzeIZ1PumzpvK4C/Ynnz2ua78VNOaPApx90ttOc8s2hPTJpHaKxV4ldVL7Nek1KvbyJmB9
 +pD/AmWE/baidhhvCI0SMargITJsz5qR7F8mnBj9QbBZ85FkWAMyXf/3kmLTsbi7XJnpj4kF7u
 HwTLW6/0QVFpjofZIzSDiajtVyeU+RBFk0Y/Yta7xvQQd9ljuSo5QYdC6PozmOkxQDZqXiqZZ+
 SuLt5hrzd5qHif7hx1uluPuXzvosohUFkIPJs4Bapi7Un8CwGQ9nXSmcWcNmlpOxgMIYdbtRq5
 qQQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 08:04:41 -0700
IronPort-SDR: MKlOX/uF8wNEct5950xnnV315MLl9jdeWlyzj552Na9mJDZsmp05yot7aD76Oi4Xbupl3BrWor
 CH08la1ldQbZ9LbsD2PbKhD1eEz/Wv7IO4J88KwTSohJz4Tcq8kYJ5TJv5OIor4ThvImZ+P9EU
 dnuo5e3IdJkZtM6PymLdROP06o8OObtizuI8cob1Ebk7RJhUIOuDEY5ObLtCjGKqVpe5/yRxRA
 o0I5mrkdFpgizKWYnBAUJNxt+kr6dHKCyqjCW1az0geORLLKn3tAB7Qv9196t3xurORVn7mWMo
 rkk=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 30 May 2023 08:49:45 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 30 May 2023 08:49:09 -0700
Message-Id: <1ee0465c7b2634a4435e65a4d0b06019a73d8389.1685461490.git.johannes.thumshirn@wdc.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH v6 06/20] md: raid5-log: use __bio_add_page
 to add single page
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
 linux-block@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 gouhao@uniontech.com, linux-mm@kvack.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The raid5 log metadata submission code uses bio_add_page() to add a page
to a newly created bio. bio_add_page() can fail, but the return value is
never checked.

Use __bio_add_page() as adding a single page to a newly created bio is
guaranteed to succeed.

This brings us a step closer to marking bio_add_page() as __must_check.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/md/raid5-cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/raid5-cache.c b/drivers/md/raid5-cache.c
index 46182b955aef..852b265c5db4 100644
--- a/drivers/md/raid5-cache.c
+++ b/drivers/md/raid5-cache.c
@@ -792,7 +792,7 @@ static struct r5l_io_unit *r5l_new_meta(struct r5l_log *log)
 	io->current_bio = r5l_bio_alloc(log);
 	io->current_bio->bi_end_io = r5l_log_endio;
 	io->current_bio->bi_private = io;
-	bio_add_page(io->current_bio, io->meta_page, PAGE_SIZE, 0);
+	__bio_add_page(io->current_bio, io->meta_page, PAGE_SIZE, 0);
 
 	r5_reserve_log_entry(log, io);
 
-- 
2.40.1

