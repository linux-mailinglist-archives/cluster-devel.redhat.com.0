Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A045A79CB
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 11:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661937018;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3FovtKI9ekOMHeF9vmn0YKAsN2Wmfg1X3BTL55YwVkI=;
	b=CdNS17Wl4dzRiPNMngI5SNLZ7OkpULA9BMexRklQuDoNBI0KgNrPkrWWU/2cOoAzjg12lo
	tiBhOaIyvZSkRI0wh4burivogE0wvozS33q34wiKv8MT65kUSeUNAhKw1XdiQ1+m1Khnku
	fM9SJHEBX5muSOJ1A/E4CBPcBUGe+w8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-Z9EdRFeCOgu5E5GwQKT_Qg-1; Wed, 31 Aug 2022 05:10:15 -0400
X-MC-Unique: Z9EdRFeCOgu5E5GwQKT_Qg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D18A41C01B33;
	Wed, 31 Aug 2022 09:10:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4773A20296A2;
	Wed, 31 Aug 2022 09:10:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5FED91946A74;
	Wed, 31 Aug 2022 09:10:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7A3881946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 07:28:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6A4E0112131E; Wed, 31 Aug 2022 07:28:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6658E1121314
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:28:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A2FF805AF5
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:28:48 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
 [45.249.212.187]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-yBipECvmM2WkInmTGVujGQ-1; Wed, 31 Aug 2022 03:28:46 -0400
X-MC-Unique: yBipECvmM2WkInmTGVujGQ-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MHZxk6Dx8znTvT;
 Wed, 31 Aug 2022 15:07:38 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 15:10:04 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>
Date: Wed, 31 Aug 2022 15:21:01 +0800
Message-ID: <20220831072111.3569680-5-yi.zhang@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mailman-Approved-At: Wed, 31 Aug 2022 09:10:11 +0000
Subject: [Cluster-devel] [PATCH 04/14] gfs2: replace ll_rw_block()
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
guarantee that always submitting read IO if the buffer has been locked,
so stop using it. We also switch to new bh_readahead() helper for the
readahead path.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/gfs2/meta_io.c | 6 ++----
 fs/gfs2/quota.c   | 4 +---
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 7e70e0ba5a6c..07e882aa7ebd 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -525,8 +525,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl,=
 u64 dblock, u32 extlen)
=20
 =09if (buffer_uptodate(first_bh))
 =09=09goto out;
-=09if (!buffer_locked(first_bh))
-=09=09ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &first_bh);
+=09bh_read_nowait(first_bh, REQ_META | REQ_PRIO);
=20
 =09dblock++;
 =09extlen--;
@@ -535,8 +534,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl,=
 u64 dblock, u32 extlen)
 =09=09bh =3D gfs2_getbuf(gl, dblock, CREATE);
=20
 =09=09if (!buffer_uptodate(bh) && !buffer_locked(bh))
-=09=09=09ll_rw_block(REQ_OP_READ | REQ_RAHEAD | REQ_META |
-=09=09=09=09    REQ_PRIO, 1, &bh);
+=09=09=09bh_readahead(bh, REQ_RAHEAD | REQ_META | REQ_PRIO);
 =09=09brelse(bh);
 =09=09dblock++;
 =09=09extlen--;
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index f201eaf59d0d..0c2ef4226aba 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -746,9 +746,7 @@ static int gfs2_write_buf_to_page(struct gfs2_inode *ip=
, unsigned long index,
 =09=09if (PageUptodate(page))
 =09=09=09set_buffer_uptodate(bh);
 =09=09if (!buffer_uptodate(bh)) {
-=09=09=09ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &bh);
-=09=09=09wait_on_buffer(bh);
-=09=09=09if (!buffer_uptodate(bh))
+=09=09=09if (bh_read(bh, REQ_META | REQ_PRIO))
 =09=09=09=09goto unlock_out;
 =09=09}
 =09=09if (gfs2_is_jdata(ip))
--=20
2.31.1

