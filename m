Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A686F4155
	for <lists+cluster-devel@lfdr.de>; Tue,  2 May 2023 12:22:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683022941;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BZzdN+FDD5A67JW581mjFgSFJVxAoXGUIweV/eGO6o8=;
	b=OnvBRHX6qbbeZY5NyYBEfhepVOIVRbdDbs60wYOLv9NKXXXIAMjC89ndXbMhvUFPCeco1x
	4REStUjZ/+i43P9inzo5tfJPpCDfF7kj5B21HO6/cU3JdIAZJUXs4jmpXP5LV0ABxSZpss
	Fn+lvCdE0FmMlHW8K/poABOYUFxxr+k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-9FetqBKONhmztE5I-OEemg-1; Tue, 02 May 2023 06:22:16 -0400
X-MC-Unique: 9FetqBKONhmztE5I-OEemg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32C36185A7A4;
	Tue,  2 May 2023 10:22:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 280BE40C2009;
	Tue,  2 May 2023 10:22:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 16E521946597;
	Tue,  2 May 2023 10:22:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 35209194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue,  2 May 2023 10:22:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0CD0F1402C08; Tue,  2 May 2023 10:22:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 051731410F24
 for <cluster-devel@redhat.com>; Tue,  2 May 2023 10:22:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB33C3814949
 for <cluster-devel@redhat.com>; Tue,  2 May 2023 10:22:12 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-sPcx6ScFOp2G-ZsOEbFF-w-2; Tue, 02 May 2023 06:22:09 -0400
X-MC-Unique: sPcx6ScFOp2G-ZsOEbFF-w-2
X-IronPort-AV: E=Sophos;i="5.99,243,1677513600"; d="scan'208";a="234672963"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 May 2023 18:22:08 +0800
IronPort-SDR: IEmuOteAiZWLSTFgoFCONBIgrQvZ4vjnhBs+a9kpUe6tGSMYy3IvBeWgFXM9xa5GhEr1I1tNC4
 FgtVLaUAkVXXnyjqcwGYtO7twj7eG6z4TFuYWPpomw2BEJ5vbFeRCu47ZZUr03OdG9+404t1rK
 dUAuGf0sG50l/jXHLS4yYy5N/9pFBD4ujOwae8SlnNTQ4st1OivRqO2n4EglgSXUZn+OghoAhe
 mv7mGIoS/WVRJXTCvk1Mb5p0IiQB8zvuVoBdiTVVvxLtCOzN/hxOPmub4eGsPXRLXVwf5qv+7L
 eEQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 02:31:55 -0700
IronPort-SDR: Vcxt7Z41NExxCvUESz1tELNOOoVAmCt8KMe9S2wfxXY5MtctxeNwByBgzDDJWsrhCsj1BHWV0Q
 ZGiNQRrLC1GqKKuIRpNOC2Vb5K9nW2DMjlmAKUuOtSKbHa7NR7aAFqUudcN/yAoLh311Vt4cBL
 y00A/34+CNpVnLGm46O2cceVC9lFxIP0NOPuIkoffYDZmLB2WN+NgV+aYC3+VTf4qWL5CbSVPK
 XjePJIBx125icTf/AqdLDhEFFImtpkj2dXIQOUMatT77zeeqXyuVF+60VJakWBDYsxQwY/CpIf
 OkY=
WDCIronportException: Internal
Received: from myd008205.ad.shared (HELO localhost.localdomain)
 ([10.225.1.100])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 May 2023 03:22:04 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: "axboe @ kernel . dk" <axboe@kernel.dk>
Date: Tue,  2 May 2023 12:19:34 +0200
Message-Id: <20230502101934.24901-21-johannes.thumshirn@wdc.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v5 20/20] block: mark bio_add_folio as
 __must_check
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
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, snitzer@kernel.org,
 jfs-discussion@lists.sourceforge.net, willy@infradead.org, ming.lei@redhat.com,
 cluster-devel@redhat.com, linux-mm@kvack.org, dm-devel@redhat.com,
 hare@suse.de, linux-fsdevel@vger.kernel.org, linux-raid@vger.kernel.org,
 hch@lst.de
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Now that all callers of bio_add_folio() check the return value, mark it as
__must_check.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 include/linux/bio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bio.h b/include/linux/bio.h
index 4232a17e6b10..fef9f3085a02 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -466,7 +466,7 @@ void bio_reset(struct bio *bio, struct block_device *bdev, blk_opf_t opf);
 void bio_chain(struct bio *, struct bio *);
 
 int __must_check bio_add_page(struct bio *, struct page *, unsigned len, unsigned off);
-bool bio_add_folio(struct bio *, struct folio *, size_t len, size_t off);
+bool __must_check bio_add_folio(struct bio *, struct folio *, size_t len, size_t off);
 extern int bio_add_pc_page(struct request_queue *, struct bio *, struct page *,
 			   unsigned int, unsigned int);
 int bio_add_zone_append_page(struct bio *bio, struct page *page,
-- 
2.40.0

