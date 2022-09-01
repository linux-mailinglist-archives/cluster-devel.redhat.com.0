Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FECD5A9883
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Sep 2022 15:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662038707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KhgbaL5crNi/E4nYaP+fn6HyaRGCZCiBaKofpPXOBpk=;
	b=c1noYWWl7YBsOGwbRbdzIGOMp6WmB3OOYfd29c+dFyMAeia7skOoY5jPxoMDW2MgRRbQJY
	AhAsXQjSMN6Pw0u1BQfCon1W0VAaeLoKzKQrDD969oMEdExR+U5Cz0HT/zWq8/zmu4/Gv+
	tiQKNYt31ZFHPZX/xouLnMTh3Upo6vQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-JcGAKVuZNJO7DYqJ5ivfjQ-1; Thu, 01 Sep 2022 09:24:58 -0400
X-MC-Unique: JcGAKVuZNJO7DYqJ5ivfjQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E72D293249B;
	Thu,  1 Sep 2022 13:24:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31E78400EAB6;
	Thu,  1 Sep 2022 13:24:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EA98C1942685;
	Thu,  1 Sep 2022 13:24:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AAA1F1946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 13:24:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 903491415137; Thu,  1 Sep 2022 13:24:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C1DE1415125
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 13:24:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73DF88037AE
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 13:24:11 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com
 [45.249.212.188]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-6MxUuDCJM0uVFqJV7TxaOA-1; Thu, 01 Sep 2022 09:24:07 -0400
X-MC-Unique: 6MxUuDCJM0uVFqJV7TxaOA-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MJM8V2lB1zYd5V;
 Thu,  1 Sep 2022 21:19:38 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 1 Sep
 2022 21:24:02 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>, <jack@suse.cz>
Date: Thu, 1 Sep 2022 21:34:57 +0800
Message-ID: <20220901133505.2510834-7-yi.zhang@huawei.com>
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
Subject: [Cluster-devel] [PATCH v2 06/14] jbd2: replace ll_rw_block()
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

ll_rw_block() is not safe for the sync read path because it cannot
guarantee that submitting read IO if the buffer has been locked. We
could get false positive EIO after wait_on_buffer() if the buffer has
been locked by others. So stop using ll_rw_block() in
journal_get_superblock(). We also switch to new bh_readahead_batch()
for the buffer array readahead path.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/jbd2/journal.c  | 15 ++++++---------
 fs/jbd2/recovery.c | 16 ++++++++++------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/fs/jbd2/journal.c b/fs/jbd2/journal.c
index 6350d3857c89..140b070471c0 100644
--- a/fs/jbd2/journal.c
+++ b/fs/jbd2/journal.c
@@ -1893,19 +1893,16 @@ static int journal_get_superblock(journal_t *journa=
l)
 {
 =09struct buffer_head *bh;
 =09journal_superblock_t *sb;
-=09int err =3D -EIO;
+=09int err;
=20
 =09bh =3D journal->j_sb_buffer;
=20
 =09J_ASSERT(bh !=3D NULL);
-=09if (!buffer_uptodate(bh)) {
-=09=09ll_rw_block(REQ_OP_READ, 1, &bh);
-=09=09wait_on_buffer(bh);
-=09=09if (!buffer_uptodate(bh)) {
-=09=09=09printk(KERN_ERR
-=09=09=09=09"JBD2: IO error reading journal superblock\n");
-=09=09=09goto out;
-=09=09}
+=09err =3D bh_read(bh, 0);
+=09if (err < 0) {
+=09=09printk(KERN_ERR
+=09=09=09"JBD2: IO error reading journal superblock\n");
+=09=09goto out;
 =09}
=20
 =09if (buffer_verified(bh))
diff --git a/fs/jbd2/recovery.c b/fs/jbd2/recovery.c
index f548479615c6..1f878c315b03 100644
--- a/fs/jbd2/recovery.c
+++ b/fs/jbd2/recovery.c
@@ -100,7 +100,7 @@ static int do_readahead(journal_t *journal, unsigned in=
t start)
 =09=09if (!buffer_uptodate(bh) && !buffer_locked(bh)) {
 =09=09=09bufs[nbufs++] =3D bh;
 =09=09=09if (nbufs =3D=3D MAXBUF) {
-=09=09=09=09ll_rw_block(REQ_OP_READ, nbufs, bufs);
+=09=09=09=09bh_readahead_batch(nbufs, bufs, 0);
 =09=09=09=09journal_brelse_array(bufs, nbufs);
 =09=09=09=09nbufs =3D 0;
 =09=09=09}
@@ -109,7 +109,7 @@ static int do_readahead(journal_t *journal, unsigned in=
t start)
 =09}
=20
 =09if (nbufs)
-=09=09ll_rw_block(REQ_OP_READ, nbufs, bufs);
+=09=09bh_readahead_batch(nbufs, bufs, 0);
 =09err =3D 0;
=20
 failed:
@@ -152,9 +152,14 @@ static int jread(struct buffer_head **bhp, journal_t *=
journal,
 =09=09return -ENOMEM;
=20
 =09if (!buffer_uptodate(bh)) {
-=09=09/* If this is a brand new buffer, start readahead.
-                   Otherwise, we assume we are already reading it.  */
-=09=09if (!buffer_req(bh))
+=09=09/*
+=09=09 * If this is a brand new buffer, start readahead.
+=09=09 * Otherwise, we assume we are already reading it.
+=09=09 */
+=09=09bool need_readahead =3D !buffer_req(bh);
+
+=09=09bh_read_nowait(bh, 0);
+=09=09if (need_readahead)
 =09=09=09do_readahead(journal, offset);
 =09=09wait_on_buffer(bh);
 =09}
@@ -687,7 +692,6 @@ static int do_one_pass(journal_t *journal,
 =09=09=09=09=09mark_buffer_dirty(nbh);
 =09=09=09=09=09BUFFER_TRACE(nbh, "marking uptodate");
 =09=09=09=09=09++info->nr_replays;
-=09=09=09=09=09/* ll_rw_block(WRITE, 1, &nbh); */
 =09=09=09=09=09unlock_buffer(nbh);
 =09=09=09=09=09brelse(obh);
 =09=09=09=09=09brelse(nbh);
--=20
2.31.1

