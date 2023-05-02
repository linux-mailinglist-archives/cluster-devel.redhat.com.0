Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 647706F4157
	for <lists+cluster-devel@lfdr.de>; Tue,  2 May 2023 12:22:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683022949;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A3Uxb7ToyZzCXpo6dytQ6jfGB5eFnK50HXW6JYeP39Q=;
	b=e1Hn8yRJYYsM9RwkYE82Z1M5ToFBNZmC1c/qj4LbX9vCoItF7ihAzCll/1guat+aLUbA6y
	mVjpQKWGjrTxZo129K1jlZ/GXPxwi8ZECsYLZ3wYYOvAOma5qBkDpmgOT91oh1H6W/ZnN6
	s7IMUY1zlCH8oVRXjJXEVBg9PHnqCGg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-8gOw5ywhNxChjL_91H4Llg-1; Tue, 02 May 2023 06:22:09 -0400
X-MC-Unique: 8gOw5ywhNxChjL_91H4Llg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBDE13C10143;
	Tue,  2 May 2023 10:22:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DED2F2166B29;
	Tue,  2 May 2023 10:22:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AB32919465B1;
	Tue,  2 May 2023 10:22:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4E15019465B5 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  2 May 2023 10:21:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0F5BF1121331; Tue,  2 May 2023 10:21:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07E93112132E
 for <cluster-devel@redhat.com>; Tue,  2 May 2023 10:21:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E00D910334A1
 for <cluster-devel@redhat.com>; Tue,  2 May 2023 10:21:56 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-Yuw9qa43Ng24W8vhNhhoHg-3; Tue, 02 May 2023 06:21:50 -0400
X-MC-Unique: Yuw9qa43Ng24W8vhNhhoHg-3
X-IronPort-AV: E=Sophos;i="5.99,243,1677513600"; d="scan'208";a="229597970"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 May 2023 18:21:50 +0800
IronPort-SDR: vEgAWBH71tS9IOtyZvVrvVyP5nUFKsEo4oy+fHQDs7oTifdvO8iWghKuW3r/VQtDleawAYQlbA
 G+M50GmZ+tS58QvraEaig3eRdewSHLbCFPrHDTHY78zy4bs+qN6H3Kk25Fo1cRQ75m5Kxt9QK2
 0hID2JRF+LyNexvzA/RC72ThOc078dg23Y2sin2BBewoMLcNMNFPGBRRpp/GEg0Owu1E0OUr3g
 SuW1db2KYSm6VUT/jtnXBhBohX9ORi9Y3GY4/Sq75JKVV/XKjXRlvC8GMSBsciuLCI/9XIWZjz
 3hw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 02:31:37 -0700
IronPort-SDR: h/+Uzz4d3DSZxkslqyyemyuLPtMI7jhBm8cQQC8WAsiGwmug14lleOQVx+xkHcNGsmIX7lpU55
 87VMP+4tfW26aWu+a5oN3DVTq3PFVs2iF9WR+8oTmTwDIaFXmRGIznTUpQ4aZU0a4rymtj3WZj
 kk/AGz0dRlK1ZycoHqrgPH8iVANoXrBCJuUG9lP22ljDr/8WOx6RnsE9CFJXzzQSnh3bYujqEQ
 6hczuVykrgqMnIl3wnx+DJrdhTydW+7Qj1cYcXsZMgrNIFeXRvMoDlU7CYgbRhYHjf2G0hJiZj
 X44=
WDCIronportException: Internal
Received: from myd008205.ad.shared (HELO localhost.localdomain)
 ([10.225.1.100])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 May 2023 03:21:46 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: "axboe @ kernel . dk" <axboe@kernel.dk>
Date: Tue,  2 May 2023 12:19:30 +0200
Message-Id: <20230502101934.24901-17-johannes.thumshirn@wdc.com>
In-Reply-To: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
References: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v5 16/20] dm-crypt: check if adding pages to
 clone bio fails
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
Cc: linux-block@vger.kernel.org, damien.lemoal@wdc.com, kch@nvidia.com,
 shaggy@kernel.org, song@kernel.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, snitzer@kernel.org,
 jfs-discussion@lists.sourceforge.net, willy@infradead.org, ming.lei@redhat.com,
 cluster-devel@redhat.com, linux-mm@kvack.org, dm-devel@redhat.com,
 hare@suse.de, linux-fsdevel@vger.kernel.org, linux-raid@vger.kernel.org,
 hch@lst.de
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Check if adding pages to clone bio fails and if it does retry with
reclaim. This mirrors the behaviour of page allocation in
crypt_alloc_buffer().

This way we can mark bio_add_pages as __must_check.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/md/dm-crypt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 8b47b913ee83..b234dc089cee 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1693,7 +1693,14 @@ static struct bio *crypt_alloc_buffer(struct dm_crypt_io *io, unsigned int size)
 
 		len = (remaining_size > PAGE_SIZE) ? PAGE_SIZE : remaining_size;
 
-		bio_add_page(clone, page, len, 0);
+		if (!bio_add_page(clone, page, len, 0)) {
+			mempool_free(page, &cc->page_pool);
+			crypt_free_buffer_pages(cc, clone);
+			bio_put(clone);
+			gfp_mask |= __GFP_DIRECT_RECLAIM;
+			goto retry;
+
+		}
 
 		remaining_size -= len;
 	}
-- 
2.40.0

