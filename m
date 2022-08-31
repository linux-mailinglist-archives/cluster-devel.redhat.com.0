Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D825A79C4
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 11:10:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661937019;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4jjazXQV5aOVjZYd8uTcGnWtQX0SedUoTT0xLo4xhyE=;
	b=SxEPspviAujKVC7hLMuZAaTX+yxFXAg9rMuVztZEqV2fDKumRpaBqQOz2dBVHDeyTsgJst
	Hc98JYN/Wf9sTuF1VAByeC4YpSA7NuPE2bvAmNuZoPbS9aWCkhyUee3KX/IYekPn3gAKxo
	ykXiCVD5QkI+gcE0Hnkp9CC6tD9LL/o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-mk9ZNt0cOL-5mqRBPQAomg-1; Wed, 31 Aug 2022 05:10:16 -0400
X-MC-Unique: mk9ZNt0cOL-5mqRBPQAomg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F28428039B0;
	Wed, 31 Aug 2022 09:10:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E735A2026D64;
	Wed, 31 Aug 2022 09:10:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6DA141946A56;
	Wed, 31 Aug 2022 09:10:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BCD0F1946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 07:30:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9FD634C819; Wed, 31 Aug 2022 07:30:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B801945D0
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:30:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79C21811E76
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:30:01 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com
 [45.249.212.255]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-0-oNu-FPM8qvVePMJSZBjw-1; Wed, 31 Aug 2022 03:29:59 -0400
X-MC-Unique: 0-oNu-FPM8qvVePMJSZBjw-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MHZwN44tbz1N7gY;
 Wed, 31 Aug 2022 15:06:28 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 15:10:06 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>
Date: Wed, 31 Aug 2022 15:21:03 +0800
Message-ID: <20220831072111.3569680-7-yi.zhang@huawei.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mailman-Approved-At: Wed, 31 Aug 2022 09:10:11 +0000
Subject: [Cluster-devel] [PATCH 06/14] jbd2: replace ll_rw_block()
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
 fs/jbd2/journal.c  |  7 +++----
 fs/jbd2/recovery.c | 16 ++++++++++------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/fs/jbd2/journal.c b/fs/jbd2/journal.c
index 6350d3857c89..5a903aae6aad 100644
--- a/fs/jbd2/journal.c
+++ b/fs/jbd2/journal.c
@@ -1893,15 +1893,14 @@ static int journal_get_superblock(journal_t *journa=
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
 =09if (!buffer_uptodate(bh)) {
-=09=09ll_rw_block(REQ_OP_READ, 1, &bh);
-=09=09wait_on_buffer(bh);
-=09=09if (!buffer_uptodate(bh)) {
+=09=09err =3D bh_read(bh, 0);
+=09=09if (err) {
 =09=09=09printk(KERN_ERR
 =09=09=09=09"JBD2: IO error reading journal superblock\n");
 =09=09=09goto out;
diff --git a/fs/jbd2/recovery.c b/fs/jbd2/recovery.c
index f548479615c6..ee56a30b71cf 100644
--- a/fs/jbd2/recovery.c
+++ b/fs/jbd2/recovery.c
@@ -100,7 +100,7 @@ static int do_readahead(journal_t *journal, unsigned in=
t start)
 =09=09if (!buffer_uptodate(bh) && !buffer_locked(bh)) {
 =09=09=09bufs[nbufs++] =3D bh;
 =09=09=09if (nbufs =3D=3D MAXBUF) {
-=09=09=09=09ll_rw_block(REQ_OP_READ, nbufs, bufs);
+=09=09=09=09bh_readahead_batch(bufs, nbufs, 0);
 =09=09=09=09journal_brelse_array(bufs, nbufs);
 =09=09=09=09nbufs =3D 0;
 =09=09=09}
@@ -109,7 +109,7 @@ static int do_readahead(journal_t *journal, unsigned in=
t start)
 =09}
=20
 =09if (nbufs)
-=09=09ll_rw_block(REQ_OP_READ, nbufs, bufs);
+=09=09bh_readahead_batch(bufs, nbufs, 0);
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

