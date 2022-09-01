Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF1B5A9885
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Sep 2022 15:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662038721;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oL5m0hFD4C7bTcmhUg73tXGlZowavCqGZzITSKvf7Ek=;
	b=JFLdE/n/ZnBQuE8jXtx4O7FXTyuuOgRAaQRHiWeUTGBoPXTfX9xl6UILraaU72aNI2uOKq
	/++enu+nSFvJFKc4kIgwX3N5RnTU2HX0XS7D+VsuVBo2jY29fmQhWQxZEjVeSVq4Iq79KR
	wc7Bi9Iqz979obX8+dn+dUCNu8v05cM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-O6DrBZ64OYWVfeL5zOd1rQ-1; Thu, 01 Sep 2022 09:25:18 -0400
X-MC-Unique: O6DrBZ64OYWVfeL5zOd1rQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A1FF3C10230;
	Thu,  1 Sep 2022 13:25:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F7E4C15BB3;
	Thu,  1 Sep 2022 13:25:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 108921942685;
	Thu,  1 Sep 2022 13:25:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D5BB81946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 13:24:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C68981415137; Thu,  1 Sep 2022 13:24:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C23CF1415125
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 13:24:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA4C9811E9B
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 13:24:07 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
 [45.249.212.187]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-ALRFu38xPaKcqz1eBGTKWw-1; Thu, 01 Sep 2022 09:24:03 -0400
X-MC-Unique: ALRFu38xPaKcqz1eBGTKWw-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MJM9G2ZkzzkWrW;
 Thu,  1 Sep 2022 21:20:18 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 1 Sep
 2022 21:23:58 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>, <jack@suse.cz>
Date: Thu, 1 Sep 2022 21:34:53 +0800
Message-ID: <20220901133505.2510834-3-yi.zhang@huawei.com>
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
Subject: [Cluster-devel] [PATCH v2 02/14] fs/buffer: add some new buffer
 read helpers
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Current ll_rw_block() helper is fragile because it assumes that locked
buffer means it's under IO which is submitted by some other who holds
the lock, it skip buffer if it failed to get the lock, so it's only
safe on the readahead path. Unfortunately, now that most filesystems
still use this helper mistakenly on the sync metadata read path. There
is no guarantee that the one who holds the buffer lock always submit IO
(e.g. buffer_migrate_folio_norefs() after commit 88dbcbb3a484 ("blkdev:
avoid migration stalls for blkdev pages"), it could lead to false
positive -EIO when submitting reading IO.

This patch add some friendly buffer read helpers to prepare replacing
ll_rw_block() and similar calls. We can only call bh_readahead_[]
helpers for the readahead paths.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/buffer.c                 | 65 +++++++++++++++++++++++++++++++++++++
 include/linux/buffer_head.h | 38 ++++++++++++++++++++++
 2 files changed, 103 insertions(+)

diff --git a/fs/buffer.c b/fs/buffer.c
index a0b70b3239f3..a6bc769e665d 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -3017,6 +3017,71 @@ int bh_uptodate_or_lock(struct buffer_head *bh)
 }
 EXPORT_SYMBOL(bh_uptodate_or_lock);
=20
+/**
+ * __bh_read - Submit read for a locked buffer
+ * @bh: struct buffer_head
+ * @op_flags: appending REQ_OP_* flags besides REQ_OP_READ
+ * @wait: wait until reading finish
+ *
+ * Returns zero on success or don't wait, and -EIO on error.
+ */
+int __bh_read(struct buffer_head *bh, blk_opf_t op_flags, bool wait)
+{
+=09int ret =3D 0;
+
+=09BUG_ON(!buffer_locked(bh));
+
+=09get_bh(bh);
+=09bh->b_end_io =3D end_buffer_read_sync;
+=09submit_bh(REQ_OP_READ | op_flags, bh);
+=09if (wait) {
+=09=09wait_on_buffer(bh);
+=09=09if (!buffer_uptodate(bh))
+=09=09=09ret =3D -EIO;
+=09}
+=09return ret;
+}
+EXPORT_SYMBOL(__bh_read);
+
+/**
+ * __bh_read_batch - Submit read for a batch of unlocked buffers
+ * @nr: entry number of the buffer batch
+ * @bhs: a batch of struct buffer_head
+ * @op_flags: appending REQ_OP_* flags besides REQ_OP_READ
+ * @force_lock: force to get a lock on the buffer if set, otherwise drops =
any
+ *              buffer that cannot lock.
+ *
+ * Returns zero on success or don't wait, and -EIO on error.
+ */
+void __bh_read_batch(int nr, struct buffer_head *bhs[],
+=09=09     blk_opf_t op_flags, bool force_lock)
+{
+=09int i;
+
+=09for (i =3D 0; i < nr; i++) {
+=09=09struct buffer_head *bh =3D bhs[i];
+
+=09=09if (buffer_uptodate(bh))
+=09=09=09continue;
+
+=09=09if (force_lock)
+=09=09=09lock_buffer(bh);
+=09=09else
+=09=09=09if (!trylock_buffer(bh))
+=09=09=09=09continue;
+
+=09=09if (buffer_uptodate(bh)) {
+=09=09=09unlock_buffer(bh);
+=09=09=09continue;
+=09=09}
+
+=09=09bh->b_end_io =3D end_buffer_read_sync;
+=09=09get_bh(bh);
+=09=09submit_bh(REQ_OP_READ | op_flags, bh);
+=09}
+}
+EXPORT_SYMBOL(__bh_read_batch);
+
 /**
  * bh_submit_read - Submit a locked buffer for reading
  * @bh: struct buffer_head
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index c3863c417b00..6d09785bed9f 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -232,6 +232,9 @@ void write_boundary_block(struct block_device *bdev,
 =09=09=09sector_t bblock, unsigned blocksize);
 int bh_uptodate_or_lock(struct buffer_head *bh);
 int bh_submit_read(struct buffer_head *bh);
+int __bh_read(struct buffer_head *bh, blk_opf_t op_flags, bool wait);
+void __bh_read_batch(int nr, struct buffer_head *bhs[],
+=09=09     blk_opf_t op_flags, bool force_lock);
=20
 extern int buffer_heads_over_limit;
=20
@@ -399,6 +402,41 @@ static inline struct buffer_head *__getblk(struct bloc=
k_device *bdev,
 =09return __getblk_gfp(bdev, block, size, __GFP_MOVABLE);
 }
=20
+static inline void bh_readahead(struct buffer_head *bh, blk_opf_t op_flags=
)
+{
+=09if (!buffer_uptodate(bh) && trylock_buffer(bh)) {
+=09=09if (!buffer_uptodate(bh))
+=09=09=09__bh_read(bh, op_flags, false);
+=09=09else
+=09=09=09unlock_buffer(bh);
+=09}
+}
+
+static inline void bh_read_nowait(struct buffer_head *bh, blk_opf_t op_fla=
gs)
+{
+=09if (!bh_uptodate_or_lock(bh))
+=09=09__bh_read(bh, op_flags, false);
+}
+
+/* Returns 1 if buffer uptodated, 0 on success, and -EIO on error. */
+static inline int bh_read(struct buffer_head *bh, blk_opf_t op_flags)
+{
+=09if (bh_uptodate_or_lock(bh))
+=09=09return 1;
+=09return __bh_read(bh, op_flags, true);
+}
+
+static inline void bh_read_batch(int nr, struct buffer_head *bhs[])
+{
+=09__bh_read_batch(nr, bhs, 0, true);
+}
+
+static inline void bh_readahead_batch(int nr, struct buffer_head *bhs[],
+=09=09=09=09      blk_opf_t op_flags)
+{
+=09__bh_read_batch(nr, bhs, op_flags, false);
+}
+
 /**
  *  __bread() - reads a specified block and returns the bh
  *  @bdev: the block_device to read from
--=20
2.31.1

