Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFCA5A79C8
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 11:10:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661937020;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b5TTD9DA0+uqP76nZLQk6+EeRhr+La/1vz4aECUW7nE=;
	b=dN8fq5POQJkJD2UmCsbRGt3WgtybY+CW5BbBWbTCZehcga/+v896xDfLI+NaY3fNyu/CwD
	jCAtBOeybAjLcZzT2LXgI2kHiklSbStcwiM7yV4k1fjt9d33Keck4UgIgfy85IEbV9VZlE
	v2g2eZoqtVltIzv/YKU9TwwMkAJnvvw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-QHIAmkbkNnOKaGrJilFyXw-1; Wed, 31 Aug 2022 05:10:15 -0400
X-MC-Unique: QHIAmkbkNnOKaGrJilFyXw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D24101818347;
	Wed, 31 Aug 2022 09:10:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B6A6492C3B;
	Wed, 31 Aug 2022 09:10:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1D0261946A53;
	Wed, 31 Aug 2022 09:10:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 87A131946A42 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 07:28:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 77E5C40B40C7; Wed, 31 Aug 2022 07:28:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7447740CF8EE
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:28:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B34585A589
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:28:48 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
 [45.249.212.187]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-8Sl26GV4NCW2adooz_sLKQ-1; Wed, 31 Aug 2022 03:28:46 -0400
X-MC-Unique: 8Sl26GV4NCW2adooz_sLKQ-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MHZxh0HnnznTvm;
 Wed, 31 Aug 2022 15:07:36 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 15:10:01 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>
Date: Wed, 31 Aug 2022 15:20:58 +0800
Message-ID: <20220831072111.3569680-2-yi.zhang@huawei.com>
In-Reply-To: <20220831072111.3569680-1-yi.zhang@huawei.com>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Wed, 31 Aug 2022 09:10:11 +0000
Subject: [Cluster-devel] [PATCH 01/14] fs/buffer: remove __breadahead_gfp()
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
Cc: axboe@kernel.dk, tytso@mit.edu, yi.zhang@huawei.com,
 chengzhihao1@huawei.com, mark@fasheh.com,
 almaz.alexandrovich@paragon-software.com, viro@zeniv.linux.org.uk,
 yukuai3@huawei.com, jack@suse.cz, akpm@linux-foundation.org, dushistov@mail.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

No one use __breadahead_gfp() and sb_breadahead_unmovable() any more,
remove them.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/buffer.c                 | 11 -----------
 include/linux/buffer_head.h |  8 --------
 2 files changed, 19 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 55e762a58eb6..a0b70b3239f3 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -1348,17 +1348,6 @@ void __breadahead(struct block_device *bdev, sector_=
t block, unsigned size)
 }
 EXPORT_SYMBOL(__breadahead);
=20
-void __breadahead_gfp(struct block_device *bdev, sector_t block, unsigned =
size,
-=09=09      gfp_t gfp)
-{
-=09struct buffer_head *bh =3D __getblk_gfp(bdev, block, size, gfp);
-=09if (likely(bh)) {
-=09=09ll_rw_block(REQ_OP_READ | REQ_RAHEAD, 1, &bh);
-=09=09brelse(bh);
-=09}
-}
-EXPORT_SYMBOL(__breadahead_gfp);
-
 /**
  *  __bread_gfp() - reads a specified block and returns the bh
  *  @bdev: the block_device to read from
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index 089c9ade4325..c3863c417b00 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -214,8 +214,6 @@ struct buffer_head *__getblk_gfp(struct block_device *b=
dev, sector_t block,
 void __brelse(struct buffer_head *);
 void __bforget(struct buffer_head *);
 void __breadahead(struct block_device *, sector_t block, unsigned int size=
);
-void __breadahead_gfp(struct block_device *, sector_t block, unsigned int =
size,
-=09=09  gfp_t gfp);
 struct buffer_head *__bread_gfp(struct block_device *,
 =09=09=09=09sector_t block, unsigned size, gfp_t gfp);
 void invalidate_bh_lrus(void);
@@ -340,12 +338,6 @@ sb_breadahead(struct super_block *sb, sector_t block)
 =09__breadahead(sb->s_bdev, block, sb->s_blocksize);
 }
=20
-static inline void
-sb_breadahead_unmovable(struct super_block *sb, sector_t block)
-{
-=09__breadahead_gfp(sb->s_bdev, block, sb->s_blocksize, 0);
-}
-
 static inline struct buffer_head *
 sb_getblk(struct super_block *sb, sector_t block)
 {
--=20
2.31.1

