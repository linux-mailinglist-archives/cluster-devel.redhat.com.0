Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD115A79CC
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 11:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661937019;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dNK3tnerHfZLzFBlAZA9pBLH1OxTFlg6rZG/cJaJeUY=;
	b=g0kuXqeLTU9wFVW8pC6zaf4rRReljGvQXY/yGiG+CDh2r0UQHLl9KIF3z1u/Bhlrw3F0WO
	E1/3BJ6nPZ3c8J+WXNvzv4aAGxRNjCLZ3NWjP0ubq0DcVvL4p0tE3GoMfoC68xfYD6ogNQ
	cFlFECDWywqp+AudBGRDXYkzJUBN/z4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-1Xoja7YZM12vcqAZ4SQ8fA-1; Wed, 31 Aug 2022 05:10:16 -0400
X-MC-Unique: 1Xoja7YZM12vcqAZ4SQ8fA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94B62185A7BA;
	Wed, 31 Aug 2022 09:10:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88D9F492C3B;
	Wed, 31 Aug 2022 09:10:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7BF981946A40;
	Wed, 31 Aug 2022 09:10:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 001441946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 07:34:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B5F7B141511A; Wed, 31 Aug 2022 07:34:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B24F51415117
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:34:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99DBD3801140
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:34:22 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com
 [45.249.212.189]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-Ygsu24bINjaBxeWwpUXLIg-1; Wed, 31 Aug 2022 03:34:20 -0400
X-MC-Unique: Ygsu24bINjaBxeWwpUXLIg-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MHZyb1BlmzHnXc;
 Wed, 31 Aug 2022 15:08:23 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 15:10:09 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>
Date: Wed, 31 Aug 2022 15:21:06 +0800
Message-ID: <20220831072111.3569680-10-yi.zhang@huawei.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mailman-Approved-At: Wed, 31 Aug 2022 09:10:11 +0000
Subject: [Cluster-devel] [PATCH 09/14] reiserfs: replace ll_rw_block()
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
index 94addfcefede..699b1b8d5b73 100644
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
+=09bh_read_batch(log_blocks, get_desc_trans_len(desc));
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
+=09bh_readahead_batch(&bhlist[1], j - 1, 0);
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
index c88cd2ce0665..8b1db82b6949 100644
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
+=09if (bh_read(SB_BUFFER_WITH_SB(s), 0)) {
 =09=09reiserfs_warning(s, "reiserfs-2504", "error reading the super");
 =09=09return 1;
 =09}
--=20
2.31.1

