Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F28476CF09F
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Mar 2023 19:09:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680109739;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wOSVNAp03D6yJbEXU5lvzsL+Loo8YVcL8MPqkfE/PTM=;
	b=NGH43uP6tGHtE3sUH1r0LE1PljgRK1zQIpYSzkfPIfQz0njBROwe/VHgKKsVQUKuAv4VyM
	XzsCXfZWy4pMoDwBNYUFnKM7Nqa331MSKHb8uxwDqlNAgR3+8GEHQ2lCiixBzW7pKfU0fo
	9dcWfqCPZzxn2mngchAYlb6DXBDR9PY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-xbYBPRv6MEKfpJ2E9EI9Mg-1; Wed, 29 Mar 2023 13:08:57 -0400
X-MC-Unique: xbYBPRv6MEKfpJ2E9EI9Mg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B13428237C6;
	Wed, 29 Mar 2023 17:08:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F6F214171BB;
	Wed, 29 Mar 2023 17:08:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 52A39194658D;
	Wed, 29 Mar 2023 17:08:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8EAC01946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 17:08:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 727A81121331; Wed, 29 Mar 2023 17:08:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A9A71121330
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 17:08:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A90685A5A3
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 17:08:17 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-8kWTFayMMVupJBTtAOqSDQ-1; Wed, 29 Mar 2023 13:08:11 -0400
X-MC-Unique: 8kWTFayMMVupJBTtAOqSDQ-1
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="338882636"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 01:07:06 +0800
IronPort-SDR: XVdMWJJohG6lSy+iVCzHHpgHwl7+Z3/SaGV9m+hyd9pjMD1HsVq6Mw6S7GlaAIO5hsBnh+DyxA
 3baK65raq9BPHjFu1Ol33UmfZylcRTqErelAAQXg2YOG60KSqHZmhLSnvfhqPJHqieDpGe90qt
 5oLZYsv8qMFs0Cd2QPQvT/Bqnc8JKVL3/OVxCCpz/GLvuZLJJJnB+j7Gv/qvXqoeMYbaaOfSAC
 ZMzhCPdYkgXzicC4UcSXOQ/0pa+Ai+8rPOpXoMyoP1SaqhwF3RljGFNT6FARlE8LUiUy7KReGf
 XUk=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 09:23:16 -0700
IronPort-SDR: BtjkC8ComN1O7uUI2Q3Yo6aG1eA7nqScdNM5LexHUYipB8t3szY5zi2i62F3kkpHkyVnHuIOGM
 Ek1ZitEwQvILodyDt/DD/P+4JSQ4FfZCzk5nYQwqhwhLdGUxHoidj3oHzHVwykM3dzMqWELiYj
 t3kpcItSpp4K3NBCUe8+FOUVxWGvOPb+JBxKANt7O1k/TIuS3Ep1qDEGkSLpmmBcrzqjxJn4El
 2r0OJA5Y8NchSO4KSKjNHUAPoqdlwW5gG7Yff3aztbuLDzUEUgexB49y05wzoFymc9aBcG688l
 mnM=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.72])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Mar 2023 10:07:05 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 29 Mar 2023 10:06:02 -0700
Message-Id: <8758569c543389604d8a6a9460de086246fabe89.1680108414.git.johannes.thumshirn@wdc.com>
In-Reply-To: <cover.1680108414.git.johannes.thumshirn@wdc.com>
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH 16/19] md: raid1: use __bio_add_page for
 adding single page to bio
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
Cc: linux-raid@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 cluster-devel@redhat.com, Chaitanya Kulkarni <kch@nvidia.com>,
 Song Liu <song@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Mike Snitzer <snitzer@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 David Sterba <dsterba@suse.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The sync request code uses bio_add_page() to add a page to a newly created bio.
bio_add_page() can fail, but the return value is never checked.

Use __bio_add_page() as adding a single page to a newly created bio is
guaranteed to succeed.

This brings us a step closer to marking bio_add_page() as __must_check.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/md/raid1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index bd7c339a84a1..c226d293992f 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -2915,7 +2915,7 @@ static sector_t raid1_sync_request(struct mddev *mddev, sector_t sector_nr,
 				 * won't fail because the vec table is big
 				 * enough to hold all these pages
 				 */
-				bio_add_page(bio, page, len, 0);
+				__bio_add_page(bio, page, len, 0);
 			}
 		}
 		nr_sectors += len>>9;
-- 
2.39.2

