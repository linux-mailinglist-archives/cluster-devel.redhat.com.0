Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E6539717F9D
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 14:08:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685534881;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7tVUjP4+PH6St5yF3wX9Wp96WFgE/j1N0ByIBSNUfaQ=;
	b=QrHEaTVy+HGfzIg9pRZuetPiwF4npqAIh7V8MYej7bR6lU6L/i31Lw1vlgarRxH1GAX04X
	BA/SXYwggXVOM+bISumuCOQZKAk0/KIcsMQfP06SSQA9mkILrHNo1KEPUXvQN9A2HApbTd
	0ZAyBcli7N35HEbJOkLsBHTOdejHCDs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-t0_0qiMjN3-BWNn3h5Oh2Q-1; Wed, 31 May 2023 08:07:56 -0400
X-MC-Unique: t0_0qiMjN3-BWNn3h5Oh2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6E7E101A531;
	Wed, 31 May 2023 12:07:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB3BFC154D7;
	Wed, 31 May 2023 12:07:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7B61319451C5;
	Wed, 31 May 2023 12:07:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2034E1946595 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 11:51:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1BCCC40CFD47; Wed, 31 May 2023 11:51:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 149E740CFD45
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:51:52 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC381802E58
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:51:51 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-yjVw1Jb-Og2WEw8gnMWwpg-1; Wed, 31 May 2023 07:51:46 -0400
X-MC-Unique: yjVw1Jb-Og2WEw8gnMWwpg-1
X-IronPort-AV: E=Sophos;i="6.00,207,1681142400"; d="scan'208";a="344179958"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2023 19:51:43 +0800
IronPort-SDR: hZpTgtU/BNtJXkCHA0y5OXbVnwIp4YiG3wqvo7XSEl1ApSZ522U1OCbG1K2O1yoEwG7tYCm0wT
 ZahT48G1+2gHQr0x99t3iLc7UPIMflasX5cUBY1u5iS8B23cKelGDROBIcmCHnRv382eZJLOtY
 Lzt0I+IaRNyAkqWKZzOTk0SCNBarR/IJXLYiwHspvrf1qX/J5dhFts3c052RGLWnaeu4BeJyjR
 HP/13AJdDbwmR0JrLDyWfXbiDBOC9pVUgYer58nviYPN+A5ngxFafFuOad9q+6ezHNacononae
 wG0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 04:06:36 -0700
IronPort-SDR: xo459tElfFqtwBDe2sQAJqvwfBpbSzCQVTTIg+wPUWJFH5rvf87QZ0/LRdMy+YjMhlouZBBxmo
 sSFHKg9lUYcIkRHQv54nV+2OgEzxoHzxVahxn3BeeKZAyYylUuWRRTeDS6dvBOIxkJePE/rTcC
 eYbX1rHn5bbth8QftqRWLPHth0Gq61eGFZ6K61AfXG67LUgq2wZH8hWCBqD5V+7su+uSzYeeSR
 Ss5cmfzwMHsFg984FR8v7pis/w9ow+W2i6iaGIo6tiECTtkMKiiQqzdfNTk2BbJ95DDObBEoN5
 z/8=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 31 May 2023 04:51:38 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 31 May 2023 04:50:39 -0700
Message-Id: <f9a4dee5e81389fd70ffc442da01006538e55aca.1685532726.git.johannes.thumshirn@wdc.com>
In-Reply-To: <cover.1685532726.git.johannes.thumshirn@wdc.com>
References: <cover.1685532726.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH v7 16/20] dm-crypt: use __bio_add_page to
 add single page to clone bio
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
 Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, gouha7@uniontech.com,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

crypt_alloc_buffer() already allocates enough entries in the clone bio's
vector, so adding a page to the bio can't fail. Use __bio_add_page() to
reflect this.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/md/dm-crypt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 8b47b913ee83..09e37ebf7cc8 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1693,8 +1693,7 @@ static struct bio *crypt_alloc_buffer(struct dm_crypt_io *io, unsigned int size)
 
 		len = (remaining_size > PAGE_SIZE) ? PAGE_SIZE : remaining_size;
 
-		bio_add_page(clone, page, len, 0);
-
+		__bio_add_page(clone, page, len, 0);
 		remaining_size -= len;
 	}
 
-- 
2.40.1

