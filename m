Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F5D5A9886
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Sep 2022 15:25:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662038722;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rpwMqnFM+3nthhy0mmlbmN67rkCB2t1nfATUswgH4Io=;
	b=BGvBROOz42iZ/bBf7TRPfEqNb2J9SDLiQBRCgg9tytI/OulznobYOTxq30uh3UziHGhXRi
	bOoyLa0NerssmpueWvp4a71XPi6p0X068Hoym2EnvTHSIPEyfic1MeINeoFet3ORbxC2of
	FC+TzRt689krAzvZYfjJFkH+EelqCWk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-kxWeWF9BOgqR558m0dOKWQ-1; Thu, 01 Sep 2022 09:25:18 -0400
X-MC-Unique: kxWeWF9BOgqR558m0dOKWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DAAE811E80;
	Thu,  1 Sep 2022 13:25:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 823C21121314;
	Thu,  1 Sep 2022 13:25:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 36926194B940;
	Thu,  1 Sep 2022 13:25:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9112F1946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 13:24:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7357F1415137; Thu,  1 Sep 2022 13:24:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FC211415125
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 13:24:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54C1C8039B5
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 13:24:07 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com
 [45.249.212.188]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-WJl2t6bcPc6PyK_lrGWZHw-1; Thu, 01 Sep 2022 09:24:05 -0400
X-MC-Unique: WJl2t6bcPc6PyK_lrGWZHw-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MJM9Z0SyCzlWYC;
 Thu,  1 Sep 2022 21:20:34 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 1 Sep
 2022 21:23:59 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>, <jack@suse.cz>
Date: Thu, 1 Sep 2022 21:34:54 +0800
Message-ID: <20220901133505.2510834-4-yi.zhang@huawei.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v2 03/14] fs/buffer: replace ll_rw_block()
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

ll_rw_block() is not safe for the sync IO path because it skip buffers
which has been locked by others, it could lead to false positive EIO
when submitting read IO. So stop using ll_rw_block(), switch to use new
helpers which could guarantee buffer locked and submit IO if needed.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/buffer.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index a6bc769e665d..aec568b3ae52 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -562,7 +562,7 @@ void write_boundary_block(struct block_device *bdev,
 =09struct buffer_head *bh =3D __find_get_block(bdev, bblock + 1, blocksize=
);
 =09if (bh) {
 =09=09if (buffer_dirty(bh))
-=09=09=09ll_rw_block(REQ_OP_WRITE, 1, &bh);
+=09=09=09write_dirty_buffer(bh, 0);
 =09=09put_bh(bh);
 =09}
 }
@@ -1342,7 +1342,7 @@ void __breadahead(struct block_device *bdev, sector_t=
 block, unsigned size)
 {
 =09struct buffer_head *bh =3D __getblk(bdev, block, size);
 =09if (likely(bh)) {
-=09=09ll_rw_block(REQ_OP_READ | REQ_RAHEAD, 1, &bh);
+=09=09bh_readahead(bh, REQ_RAHEAD);
 =09=09brelse(bh);
 =09}
 }
@@ -2022,7 +2022,7 @@ int __block_write_begin_int(struct folio *folio, loff=
_t pos, unsigned len,
 =09=09if (!buffer_uptodate(bh) && !buffer_delay(bh) &&
 =09=09    !buffer_unwritten(bh) &&
 =09=09     (block_start < from || block_end > to)) {
-=09=09=09ll_rw_block(REQ_OP_READ, 1, &bh);
+=09=09=09bh_read_nowait(bh, 0);
 =09=09=09*wait_bh++=3Dbh;
 =09=09}
 =09}
@@ -2582,11 +2582,9 @@ int block_truncate_page(struct address_space *mappin=
g,
 =09=09set_buffer_uptodate(bh);
=20
 =09if (!buffer_uptodate(bh) && !buffer_delay(bh) && !buffer_unwritten(bh))=
 {
-=09=09err =3D -EIO;
-=09=09ll_rw_block(REQ_OP_READ, 1, &bh);
-=09=09wait_on_buffer(bh);
+=09=09err =3D bh_read(bh, 0);
 =09=09/* Uhhuh. Read error. Complain and punt. */
-=09=09if (!buffer_uptodate(bh))
+=09=09if (err < 0)
 =09=09=09goto unlock;
 =09}
=20
--=20
2.31.1

