Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FC05A79C0
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 11:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661937018;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GY0LohtBvo+ya7O6j21PTvSEofSSpZ30UQNtQZdvirY=;
	b=C9Wu+ETlIL+EhaevBcsACfChEf0e3nfrAQMtNKA7fcQioGd9Y2TIS0Xr3Vx+jhaaMUZvG+
	3y/a5Vm6ydII1SCoPuK9RuPm0udpX3VklWEvEZGK7CpUUXnkJPyoSh8mnhtp2Kbd5su7th
	C0aNmUIPNvDeZsYTx4TsQuovWc378HM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-8JbEj1KLPqGXu2Nc4ruiDA-1; Wed, 31 Aug 2022 05:10:15 -0400
X-MC-Unique: 8JbEj1KLPqGXu2Nc4ruiDA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3165823F09;
	Wed, 31 Aug 2022 09:10:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D8AC492CA2;
	Wed, 31 Aug 2022 09:10:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 373841946A5D;
	Wed, 31 Aug 2022 09:10:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A7EC41946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 07:29:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7EE44141511A; Wed, 31 Aug 2022 07:29:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AD361415117
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:29:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C618185A7BA
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:29:30 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com
 [45.249.212.188]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-qNS6gT_mNV6ScgNBhtRg1g-1; Wed, 31 Aug 2022 03:29:28 -0400
X-MC-Unique: qNS6gT_mNV6ScgNBhtRg1g-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MHZwp4ZXNzlWfP;
 Wed, 31 Aug 2022 15:06:50 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 15:10:14 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>
Date: Wed, 31 Aug 2022 15:21:11 +0800
Message-ID: <20220831072111.3569680-15-yi.zhang@huawei.com>
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
Subject: [Cluster-devel] [PATCH 14/14] fs/buffer: remove bh_submit_read()
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

bh_submit_read() has no user anymore, just remove it.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/buffer.c                 | 25 -------------------------
 include/linux/buffer_head.h |  1 -
 2 files changed, 26 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index d1d09e2dacc2..fa7c2dbcef4c 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -3029,31 +3029,6 @@ void __bh_read_batch(struct buffer_head *bhs[],
 }
 EXPORT_SYMBOL(__bh_read_batch);
=20
-/**
- * bh_submit_read - Submit a locked buffer for reading
- * @bh: struct buffer_head
- *
- * Returns zero on success and -EIO on error.
- */
-int bh_submit_read(struct buffer_head *bh)
-{
-=09BUG_ON(!buffer_locked(bh));
-
-=09if (buffer_uptodate(bh)) {
-=09=09unlock_buffer(bh);
-=09=09return 0;
-=09}
-
-=09get_bh(bh);
-=09bh->b_end_io =3D end_buffer_read_sync;
-=09submit_bh(REQ_OP_READ, bh);
-=09wait_on_buffer(bh);
-=09if (buffer_uptodate(bh))
-=09=09return 0;
-=09return -EIO;
-}
-EXPORT_SYMBOL(bh_submit_read);
-
 void __init buffer_init(void)
 {
 =09unsigned long nrpages;
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index 1c93ff8c8f51..576f3609ac4e 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -230,7 +230,6 @@ int submit_bh(blk_opf_t, struct buffer_head *);
 void write_boundary_block(struct block_device *bdev,
 =09=09=09sector_t bblock, unsigned blocksize);
 int bh_uptodate_or_lock(struct buffer_head *bh);
-int bh_submit_read(struct buffer_head *bh);
 int __bh_read(struct buffer_head *bh, blk_opf_t op_flags, bool wait);
 void __bh_read_batch(struct buffer_head *bhs[],
 =09=09     int nr, blk_opf_t op_flags, bool force_lock);
--=20
2.31.1

