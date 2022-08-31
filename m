Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E42D5A79C6
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 11:10:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661937020;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HjuJ5JKNCHpsFHTN/PUBlKe8mV5neHEZ6roJ1E8Sxfs=;
	b=Km/SqaFqjs1itjkM198VRqaVC+tMKdz9bPzP7vaxmtEu40ke/YynbL0qhOGLpTFUrVKJJf
	kmemD1ap/Cqb3Q7h7eIs8nKUYKXj7On0NCxyP8tBxJkQintQOgWeTGu/+oD8DvI2njWAnw
	JDjcQMwgMkUUMMUYxpuh2AEUfWwyTSM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-m_khql6lPcSXkeimqA9D1g-1; Wed, 31 Aug 2022 05:10:17 -0400
X-MC-Unique: m_khql6lPcSXkeimqA9D1g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7153811E76;
	Wed, 31 Aug 2022 09:10:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABE84492C3B;
	Wed, 31 Aug 2022 09:10:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8AAEA1946A56;
	Wed, 31 Aug 2022 09:10:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5544D1946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 07:29:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C16D2026D64; Wed, 31 Aug 2022 07:29:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 288AB2026D4C
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:29:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EB661C05195
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:29:31 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com
 [45.249.212.189]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-rRoOt3k4OAWRN_6td_yn1w-1; Wed, 31 Aug 2022 03:29:19 -0400
X-MC-Unique: rRoOt3k4OAWRN_6td_yn1w-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MHZyf0Pg5zHnYm;
 Wed, 31 Aug 2022 15:08:26 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 15:10:12 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>
Date: Wed, 31 Aug 2022 15:21:09 +0800
Message-ID: <20220831072111.3569680-13-yi.zhang@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mailman-Approved-At: Wed, 31 Aug 2022 09:10:11 +0000
Subject: [Cluster-devel] [PATCH 12/14] fs/buffer: remove ll_rw_block() helper
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Now that all ll_rw_block() users has been replaced to new safe helpers,
we just remove it here.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/buffer.c                 | 63 +++----------------------------------
 include/linux/buffer_head.h |  1 -
 2 files changed, 4 insertions(+), 60 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index e14adc638bfe..d1d09e2dacc2 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -152,7 +152,7 @@ static void __end_buffer_read_notouch(struct buffer_hea=
d *bh, int uptodate)
=20
 /*
  * Default synchronous end-of-IO handler..  Just mark it up-to-date and
- * unlock the buffer. This is what ll_rw_block uses too.
+ * unlock the buffer.
  */
 void end_buffer_read_sync(struct buffer_head *bh, int uptodate)
 {
@@ -491,8 +491,8 @@ int inode_has_buffers(struct inode *inode)
  * all already-submitted IO to complete, but does not queue any new
  * writes to the disk.
  *
- * To do O_SYNC writes, just queue the buffer writes with ll_rw_block as
- * you dirty the buffers, and then use osync_inode_buffers to wait for
+ * To do O_SYNC writes, just queue the buffer writes with write_dirty_buff=
er
+ * as you dirty the buffers, and then use osync_inode_buffers to wait for
  * completion.  Any other dirty buffers which are not yet queued for
  * write will not be flushed to disk by the osync.
  */
@@ -1807,7 +1807,7 @@ int __block_write_full_page(struct inode *inode, stru=
ct page *page,
 =09=09/*
 =09=09 * The page was marked dirty, but the buffers were
 =09=09 * clean.  Someone wrote them back by hand with
-=09=09 * ll_rw_block/submit_bh.  A rare case.
+=09=09 * write_dirty_buffer/submit_bh.  A rare case.
 =09=09 */
 =09=09end_page_writeback(page);
=20
@@ -2714,61 +2714,6 @@ int submit_bh(blk_opf_t opf, struct buffer_head *bh)
 }
 EXPORT_SYMBOL(submit_bh);
=20
-/**
- * ll_rw_block: low-level access to block devices (DEPRECATED)
- * @opf: block layer request operation and flags.
- * @nr: number of &struct buffer_heads in the array
- * @bhs: array of pointers to &struct buffer_head
- *
- * ll_rw_block() takes an array of pointers to &struct buffer_heads, and
- * requests an I/O operation on them, either a %REQ_OP_READ or a %REQ_OP_W=
RITE.
- * @opf contains flags modifying the detailed I/O behavior, most notably
- * %REQ_RAHEAD.
- *
- * This function drops any buffer that it cannot get a lock on (with the
- * BH_Lock state bit), any buffer that appears to be clean when doing a wr=
ite
- * request, and any buffer that appears to be up-to-date when doing read
- * request.  Further it marks as clean buffers that are processed for
- * writing (the buffer cache won't assume that they are actually clean
- * until the buffer gets unlocked).
- *
- * ll_rw_block sets b_end_io to simple completion handler that marks
- * the buffer up-to-date (if appropriate), unlocks the buffer and wakes
- * any waiters.=20
- *
- * All of the buffers must be for the same device, and must also be a
- * multiple of the current approved size for the device.
- */
-void ll_rw_block(const blk_opf_t opf, int nr, struct buffer_head *bhs[])
-{
-=09const enum req_op op =3D opf & REQ_OP_MASK;
-=09int i;
-
-=09for (i =3D 0; i < nr; i++) {
-=09=09struct buffer_head *bh =3D bhs[i];
-
-=09=09if (!trylock_buffer(bh))
-=09=09=09continue;
-=09=09if (op =3D=3D REQ_OP_WRITE) {
-=09=09=09if (test_clear_buffer_dirty(bh)) {
-=09=09=09=09bh->b_end_io =3D end_buffer_write_sync;
-=09=09=09=09get_bh(bh);
-=09=09=09=09submit_bh(opf, bh);
-=09=09=09=09continue;
-=09=09=09}
-=09=09} else {
-=09=09=09if (!buffer_uptodate(bh)) {
-=09=09=09=09bh->b_end_io =3D end_buffer_read_sync;
-=09=09=09=09get_bh(bh);
-=09=09=09=09submit_bh(opf, bh);
-=09=09=09=09continue;
-=09=09=09}
-=09=09}
-=09=09unlock_buffer(bh);
-=09}
-}
-EXPORT_SYMBOL(ll_rw_block);
-
 void write_dirty_buffer(struct buffer_head *bh, blk_opf_t op_flags)
 {
 =09lock_buffer(bh);
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index 8a01c07c0418..1c93ff8c8f51 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -223,7 +223,6 @@ struct buffer_head *alloc_buffer_head(gfp_t gfp_flags);
 void free_buffer_head(struct buffer_head * bh);
 void unlock_buffer(struct buffer_head *bh);
 void __lock_buffer(struct buffer_head *bh);
-void ll_rw_block(blk_opf_t, int, struct buffer_head * bh[]);
 int sync_dirty_buffer(struct buffer_head *bh);
 int __sync_dirty_buffer(struct buffer_head *bh, blk_opf_t op_flags);
 void write_dirty_buffer(struct buffer_head *bh, blk_opf_t op_flags);
--=20
2.31.1

