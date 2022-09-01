Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E79EF5A9890
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Sep 2022 15:29:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662038941;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7/A6wgJPe7M7McpsVqDRMjI+d3Ra5NPiavglHWvVGsU=;
	b=HuTTYF/0/Vv4NEa9ffMcre/EV+xXPX+qJTcSumS1okytZvesb1WkvyC3QkMNkNTiGdVJgM
	xNJvhgonIX4Ay+ZEZ4LgcRBhoBlyUg9wpAPXaUBtMx4JeEPrlaze7onpfbdOtNXQbic3zT
	or7zr+EVetlyu/xATmiAVulI+Ep1MKo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-RrpMWn07NzaMcaUeBJYvpg-1; Thu, 01 Sep 2022 09:28:58 -0400
X-MC-Unique: RrpMWn07NzaMcaUeBJYvpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57671382ECD0;
	Thu,  1 Sep 2022 13:28:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4AE972166B2A;
	Thu,  1 Sep 2022 13:28:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 359DF194B945;
	Thu,  1 Sep 2022 13:28:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 83FBE1946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 13:24:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 690A62026D64; Thu,  1 Sep 2022 13:24:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6593B2026D4C
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 13:24:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BE143C10231
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 13:24:12 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com
 [45.249.212.188]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-YsaYRtEeOGiQV2UO01Ijog-1; Thu, 01 Sep 2022 09:24:10 -0400
X-MC-Unique: YsaYRtEeOGiQV2UO01Ijog-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MJM9g5tNTzlWhS;
 Thu,  1 Sep 2022 21:20:39 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 1 Sep
 2022 21:24:05 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>, <jack@suse.cz>
Date: Thu, 1 Sep 2022 21:35:00 +0800
Message-ID: <20220901133505.2510834-10-yi.zhang@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH v2 09/14] reiserfs: replace ll_rw_block()
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

ll_rw_block() is not safe for the sync read/write path because it cannot
guarantee that submitting read/write IO if the buffer has been locked.
We could get false positive EIO after wait_on_buffer() in read path if
the buffer has been locked by others. So stop using ll_rw_block() in
reiserfs. We also switch to new bh_readahead_batch() helper for the
buffer array readahead path.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/reiserfs/journal.c | 11 ++++++-----
 fs/reiserfs/stree.c   |  4 ++--
 fs/reiserfs/super.c   |  4 +---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 94addfcefede..9f62da7471c9 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -868,7 +868,7 @@ static int write_ordered_buffers(spinlock_t * lock,
 =09=09 */
 =09=09if (buffer_dirty(bh) && unlikely(bh->b_page->mapping =3D=3D NULL)) {
 =09=09=09spin_unlock(lock);
-=09=09=09ll_rw_block(REQ_OP_WRITE, 1, &bh);
+=09=09=09write_dirty_buffer(bh, 0);
 =09=09=09spin_lock(lock);
 =09=09}
 =09=09put_bh(bh);
@@ -1054,7 +1054,7 @@ static int flush_commit_list(struct super_block *s,
 =09=09if (tbh) {
 =09=09=09if (buffer_dirty(tbh)) {
 =09=09            depth =3D reiserfs_write_unlock_nested(s);
-=09=09=09    ll_rw_block(REQ_OP_WRITE, 1, &tbh);
+=09=09=09    write_dirty_buffer(tbh, 0);
 =09=09=09    reiserfs_write_lock_nested(s, depth);
 =09=09=09}
 =09=09=09put_bh(tbh) ;
@@ -2240,7 +2240,7 @@ static int journal_read_transaction(struct super_bloc=
k *sb,
 =09=09}
 =09}
 =09/* read in the log blocks, memcpy to the corresponding real block */
-=09ll_rw_block(REQ_OP_READ, get_desc_trans_len(desc), log_blocks);
+=09bh_read_batch(get_desc_trans_len(desc), log_blocks);
 =09for (i =3D 0; i < get_desc_trans_len(desc); i++) {
=20
 =09=09wait_on_buffer(log_blocks[i]);
@@ -2342,10 +2342,11 @@ static struct buffer_head *reiserfs_breada(struct b=
lock_device *dev,
 =09=09} else
 =09=09=09bhlist[j++] =3D bh;
 =09}
-=09ll_rw_block(REQ_OP_READ, j, bhlist);
+=09bh =3D bhlist[0];
+=09bh_read_nowait(bh, 0);
+=09bh_readahead_batch(j - 1, &bhlist[1], 0);
 =09for (i =3D 1; i < j; i++)
 =09=09brelse(bhlist[i]);
-=09bh =3D bhlist[0];
 =09wait_on_buffer(bh);
 =09if (buffer_uptodate(bh))
 =09=09return bh;
diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 9a293609a022..84c12a1947b2 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -579,7 +579,7 @@ static int search_by_key_reada(struct super_block *s,
 =09=09if (!buffer_uptodate(bh[j])) {
 =09=09=09if (depth =3D=3D -1)
 =09=09=09=09depth =3D reiserfs_write_unlock_nested(s);
-=09=09=09ll_rw_block(REQ_OP_READ | REQ_RAHEAD, 1, bh + j);
+=09=09=09bh_readahead(bh[j], REQ_RAHEAD);
 =09=09}
 =09=09brelse(bh[j]);
 =09}
@@ -685,7 +685,7 @@ int search_by_key(struct super_block *sb, const struct =
cpu_key *key,
 =09=09=09if (!buffer_uptodate(bh) && depth =3D=3D -1)
 =09=09=09=09depth =3D reiserfs_write_unlock_nested(sb);
=20
-=09=09=09ll_rw_block(REQ_OP_READ, 1, &bh);
+=09=09=09bh_read_nowait(bh, 0);
 =09=09=09wait_on_buffer(bh);
=20
 =09=09=09if (depth !=3D -1)
diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index c88cd2ce0665..a5ffec0c7517 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1702,9 +1702,7 @@ static int read_super_block(struct super_block *s, in=
t offset)
 /* after journal replay, reread all bitmap and super blocks */
 static int reread_meta_blocks(struct super_block *s)
 {
-=09ll_rw_block(REQ_OP_READ, 1, &SB_BUFFER_WITH_SB(s));
-=09wait_on_buffer(SB_BUFFER_WITH_SB(s));
-=09if (!buffer_uptodate(SB_BUFFER_WITH_SB(s))) {
+=09if (bh_read(SB_BUFFER_WITH_SB(s), 0) < 0) {
 =09=09reiserfs_warning(s, "reiserfs-2504", "error reading the super");
 =09=09return 1;
 =09}
--=20
2.31.1

