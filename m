Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B78D45A9884
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Sep 2022 15:25:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662038719;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Zee4KZUu1KrILRDO5P1A/ey3C0B3n0zLJL8wsHhjVkA=;
	b=GqYnGJRxHJSJ7cJnNslQuNZGdfYC+HcEEp0EkiXFrSb+VLg1RgYZw0LhVc/9kgH78v6+is
	oKXocpVplUhMLlW5gD4slIf8H/eaHjADWb/I1dCEivBIpk6dhxuyU4bUMcmHi4CqbWS/Mo
	dXxCRfn3o5ZbG7/zKYN7Qy4AJ+ILLww=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-poDnmNPVMIWgRxQjmGlfDA-1; Thu, 01 Sep 2022 09:25:18 -0400
X-MC-Unique: poDnmNPVMIWgRxQjmGlfDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFA231C04B58;
	Thu,  1 Sep 2022 13:25:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A26A42026D64;
	Thu,  1 Sep 2022 13:25:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 46717194B973;
	Thu,  1 Sep 2022 13:25:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B3C5F1946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 13:24:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A69442166B2A; Thu,  1 Sep 2022 13:24:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A32182166B26
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 13:24:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87B973804519
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 13:24:07 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
 [45.249.212.187]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-1_LW5zx5PAOkBiKHNihLZQ-1; Thu, 01 Sep 2022 09:24:03 -0400
X-MC-Unique: 1_LW5zx5PAOkBiKHNihLZQ-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MJMBf4dwJznTsB;
 Thu,  1 Sep 2022 21:21:30 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 1 Sep
 2022 21:23:57 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>, <jack@suse.cz>
Date: Thu, 1 Sep 2022 21:34:52 +0800
Message-ID: <20220901133505.2510834-2-yi.zhang@huawei.com>
In-Reply-To: <20220901133505.2510834-1-yi.zhang@huawei.com>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Cluster-devel] [PATCH v2 01/14] fs/buffer: remove
 __breadahead_gfp()
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
Cc: axboe@kernel.dk, tytso@mit.edu, yi.zhang@huawei.com, mark@fasheh.com,
 almaz.alexandrovich@paragon-software.com, viro@zeniv.linux.org.uk,
 yukuai3@huawei.com, dushistov@mail.ru, akpm@linux-foundation.org,
 chengzhihao1@huawei.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

No one use __breadahead_gfp() and sb_breadahead_unmovable() any more,
remove them.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
Reviewed-by: Jan Kara <jack@suse.cz>
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

