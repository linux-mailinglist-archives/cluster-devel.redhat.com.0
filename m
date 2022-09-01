Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2A85A9887
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Sep 2022 15:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662038742;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ehvbqx7DcyCVokGvFhW3lwAccm0KpOqDuQKWURqnvYk=;
	b=NA/bUVyv9fZ4UoygwNF2QYP8yY24SQD9dQKBrF2YSJqe6RcXZTCGu1Z+7J68WeLPsVmwqV
	iRAewkHWBkMHCwbIRgbA/D7NQGA43o5F7nYL+qqk8+8YOcE5+CWO9FFBKKLUjnb3lMA6R/
	Ij9WfZHSh2Gsuo1fN67hOTKaS+VHlFg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-9CTaK_iCP_Wq0mh0ATgMDg-1; Thu, 01 Sep 2022 09:25:38 -0400
X-MC-Unique: 9CTaK_iCP_Wq0mh0ATgMDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 838661C04B4F;
	Thu,  1 Sep 2022 13:25:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7694E2166B2A;
	Thu,  1 Sep 2022 13:25:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5C9C21942685;
	Thu,  1 Sep 2022 13:25:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E40CF1946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 13:24:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CB30E1415137; Thu,  1 Sep 2022 13:24:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C75B41415125
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 13:24:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0CD01818CB7
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 13:24:16 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com
 [45.249.212.255]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-RBWVoZ_jNA2hBUIdGQz-VA-1; Thu, 01 Sep 2022 09:24:14 -0400
X-MC-Unique: RBWVoZ_jNA2hBUIdGQz-VA-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MJM9S2QXMz1N7cR;
 Thu,  1 Sep 2022 21:20:28 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 1 Sep
 2022 21:24:08 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>, <jack@suse.cz>
Date: Thu, 1 Sep 2022 21:35:03 +0800
Message-ID: <20220901133505.2510834-13-yi.zhang@huawei.com>
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
Subject: [Cluster-devel] [PATCH v2 12/14] fs/buffer: remove ll_rw_block()
 helper
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Now that all ll_rw_block() users has been replaced to new safe helpers,
we just remove it here.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/buffer.c                 | 63 +++----------------------------------
 include/linux/buffer_head.h |  1 -
 2 files changed, 4 insertions(+), 60 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index aec568b3ae52..2cccc7586b99 100644
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
@@ -1806,7 +1806,7 @@ int __block_write_full_page(struct inode *inode, stru=
ct page *page,
 =09=09/*
 =09=09 * The page was marked dirty, but the buffers were
 =09=09 * clean.  Someone wrote them back by hand with
-=09=09 * ll_rw_block/submit_bh.  A rare case.
+=09=09 * write_dirty_buffer/submit_bh.  A rare case.
 =09=09 */
 =09=09end_page_writeback(page);
=20
@@ -2713,61 +2713,6 @@ int submit_bh(blk_opf_t opf, struct buffer_head *bh)
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
index 6d09785bed9f..b415d8bc2a09 100644
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

