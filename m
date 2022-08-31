Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D085A79C1
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 11:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661937018;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sZGiAe4EtXaAHs69y8GwiCPu//pvJ+CuJuw6FjcTyHA=;
	b=TkvtXzG8RFOd/a5MN3Siqg6YInUyUL14JjXjsbPEFTYnkWnhjus5gR2ZoV0YFKlfe23WbP
	isLLgyaWbV2PEEryBp7/21qS2lVjoJV9SfnWg/5teDiu+fU0d8epkoJ4UMf+3/rPDQ7kbR
	hAxElG/xSg6EGfVPrpd1fnZ4GOxIseI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-we8chXmGMeiDAQFvu2sCPQ-1; Wed, 31 Aug 2022 05:10:15 -0400
X-MC-Unique: we8chXmGMeiDAQFvu2sCPQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C530296A604;
	Wed, 31 Aug 2022 09:10:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B6EB140357BA;
	Wed, 31 Aug 2022 09:10:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6693C1946A76;
	Wed, 31 Aug 2022 09:10:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 88B141946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 07:29:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7C7FB2166B26; Wed, 31 Aug 2022 07:29:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78AD32166B2A
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:29:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 628B63C0D867
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:29:31 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com
 [45.249.212.188]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-GE59S-hUO6CKs2u9kjDm0A-1; Wed, 31 Aug 2022 03:29:27 -0400
X-MC-Unique: GE59S-hUO6CKs2u9kjDm0A-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MHZwb6y9SzlWfp;
 Wed, 31 Aug 2022 15:06:39 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 15:10:03 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>
Date: Wed, 31 Aug 2022 15:21:00 +0800
Message-ID: <20220831072111.3569680-4-yi.zhang@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mailman-Approved-At: Wed, 31 Aug 2022 09:10:11 +0000
Subject: [Cluster-devel] [PATCH 03/14] fs/buffer: replace ll_rw_block()
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
 fs/buffer.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index a663191903ed..e14adc638bfe 100644
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
@@ -1342,7 +1342,8 @@ void __breadahead(struct block_device *bdev, sector_t=
 block, unsigned size)
 {
 =09struct buffer_head *bh =3D __getblk(bdev, block, size);
 =09if (likely(bh)) {
-=09=09ll_rw_block(REQ_OP_READ | REQ_RAHEAD, 1, &bh);
+=09=09if (trylock_buffer(bh))
+=09=09=09__bh_read(bh, REQ_RAHEAD, false);
 =09=09brelse(bh);
 =09}
 }
@@ -2022,7 +2023,7 @@ int __block_write_begin_int(struct folio *folio, loff=
_t pos, unsigned len,
 =09=09if (!buffer_uptodate(bh) && !buffer_delay(bh) &&
 =09=09    !buffer_unwritten(bh) &&
 =09=09     (block_start < from || block_end > to)) {
-=09=09=09ll_rw_block(REQ_OP_READ, 1, &bh);
+=09=09=09bh_read_nowait(bh, 0);
 =09=09=09*wait_bh++=3Dbh;
 =09=09}
 =09}
@@ -2582,11 +2583,9 @@ int block_truncate_page(struct address_space *mappin=
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
+=09=09if (err)
 =09=09=09goto unlock;
 =09}
=20
--=20
2.31.1

