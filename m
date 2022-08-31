Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F06B5A79C3
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 11:10:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661937019;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gF6TolQTCf8jcBEDkJxk+TevlB4haiipE8V0OMNFvQ4=;
	b=exZKYD4zid/qtDH37RNkmy9jx27aGRr4T6F36Bhp330bl4g4qpqqmOD/nh1PXUFv3Y54kk
	T7fJ0d6SiGWvZ/ja5l8wCbtmfEI+wU2Qo6iFoYzjxMBRiNrt5qF5W+m9D5NUzT+vY/jaff
	j0oXtIgH7gTaSr1VgtC5okbyMGVemmA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-lP8bV_aTNEqqW_L0vfhVHA-1; Wed, 31 Aug 2022 05:10:16 -0400
X-MC-Unique: lP8bV_aTNEqqW_L0vfhVHA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0E813810790;
	Wed, 31 Aug 2022 09:10:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F62AC15BC3;
	Wed, 31 Aug 2022 09:10:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2C2641946A59;
	Wed, 31 Aug 2022 09:10:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D65DA1946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 07:29:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AC5532166B2A; Wed, 31 Aug 2022 07:29:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8AE12166B26
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:29:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C4A685A585
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:29:23 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com
 [45.249.212.188]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-PVGlmpX8NYu9p-HGiEEdRg-1; Wed, 31 Aug 2022 03:29:21 -0400
X-MC-Unique: PVGlmpX8NYu9p-HGiEEdRg-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MHZvc3L8HzYcnn;
 Wed, 31 Aug 2022 15:05:48 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 15:10:11 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>
Date: Wed, 31 Aug 2022 15:21:08 +0800
Message-ID: <20220831072111.3569680-12-yi.zhang@huawei.com>
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
Subject: [Cluster-devel] [PATCH 11/14] ufs: replace ll_rw_block()
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

ll_rw_block() is not safe for the sync read path because it cannot
guarantee that submitting read IO if the buffer has been locked. We
could get false positive EIO after wait_on_buffer() if the buffer has
been locked by others. So stop using ll_rw_block() in ufs.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/ufs/balloc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/ufs/balloc.c b/fs/ufs/balloc.c
index bd810d8239f2..bbc2159eece4 100644
--- a/fs/ufs/balloc.c
+++ b/fs/ufs/balloc.c
@@ -296,9 +296,7 @@ static void ufs_change_blocknr(struct inode *inode, sec=
tor_t beg,
 =09=09=09if (!buffer_mapped(bh))
 =09=09=09=09=09map_bh(bh, inode->i_sb, oldb + pos);
 =09=09=09if (!buffer_uptodate(bh)) {
-=09=09=09=09ll_rw_block(REQ_OP_READ, 1, &bh);
-=09=09=09=09wait_on_buffer(bh);
-=09=09=09=09if (!buffer_uptodate(bh)) {
+=09=09=09=09if (bh_read(bh, 0)) {
 =09=09=09=09=09ufs_error(inode->i_sb, __func__,
 =09=09=09=09=09=09  "read of block failed\n");
 =09=09=09=09=09break;
--=20
2.31.1

