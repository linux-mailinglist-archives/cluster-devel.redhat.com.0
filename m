Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 423CC5A9881
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Sep 2022 15:24:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662038676;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UiCRaL9PjWXEN3AqEUb2tu2GKRx16EGxbqfRcjlA6t4=;
	b=e9Mu0qJ5CsOdAVOGj1ANQvZZWc4ih94zroI4L4xik100TFmRkaMduP1UTZcBuZhYDJOPi2
	UflPqUc72V3kneIaVZC42VZCMLZ3mwULwrhjFf+7WGuf1gnU1hJpgYpTdapEx+nIT++KEt
	kPNWWqjFHhp3ASSziSB7tJvVidPfX5A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-nbf5gdofOiCJBsiNalfksA-1; Thu, 01 Sep 2022 09:24:25 -0400
X-MC-Unique: nbf5gdofOiCJBsiNalfksA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7B9C1C04B53;
	Thu,  1 Sep 2022 13:24:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4871A40C141D;
	Thu,  1 Sep 2022 13:24:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0A4411942685;
	Thu,  1 Sep 2022 13:24:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 34AD91946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 13:24:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 285521415137; Thu,  1 Sep 2022 13:24:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24C511415125
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 13:24:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D9621C00AC3
 for <cluster-devel@redhat.com>; Thu,  1 Sep 2022 13:24:11 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com
 [45.249.212.188]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-WirEukhgPTWXDvWgP5ex6Q-1; Thu, 01 Sep 2022 09:24:07 -0400
X-MC-Unique: WirEukhgPTWXDvWgP5ex6Q-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MJM8S3QJqzYd5S;
 Thu,  1 Sep 2022 21:19:36 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 1 Sep
 2022 21:24:00 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>, <jack@suse.cz>
Date: Thu, 1 Sep 2022 21:34:55 +0800
Message-ID: <20220901133505.2510834-5-yi.zhang@huawei.com>
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
Subject: [Cluster-devel] [PATCH v2 04/14] gfs2: replace ll_rw_block()
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
 fs/gfs2/meta_io.c | 7 ++-----
 fs/gfs2/quota.c   | 8 ++------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 7e70e0ba5a6c..6ed728aae9a5 100644
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
@@ -534,9 +533,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl,=
 u64 dblock, u32 extlen)
 =09while (extlen) {
 =09=09bh =3D gfs2_getbuf(gl, dblock, CREATE);
=20
-=09=09if (!buffer_uptodate(bh) && !buffer_locked(bh))
-=09=09=09ll_rw_block(REQ_OP_READ | REQ_RAHEAD | REQ_META |
-=09=09=09=09    REQ_PRIO, 1, &bh);
+=09=09bh_readahead(bh, REQ_RAHEAD | REQ_META | REQ_PRIO);
 =09=09brelse(bh);
 =09=09dblock++;
 =09=09extlen--;
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index f201eaf59d0d..1ed17226d9ed 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -745,12 +745,8 @@ static int gfs2_write_buf_to_page(struct gfs2_inode *i=
p, unsigned long index,
 =09=09}
 =09=09if (PageUptodate(page))
 =09=09=09set_buffer_uptodate(bh);
-=09=09if (!buffer_uptodate(bh)) {
-=09=09=09ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &bh);
-=09=09=09wait_on_buffer(bh);
-=09=09=09if (!buffer_uptodate(bh))
-=09=09=09=09goto unlock_out;
-=09=09}
+=09=09if (bh_read(bh, REQ_META | REQ_PRIO) < 0)
+=09=09=09goto unlock_out;
 =09=09if (gfs2_is_jdata(ip))
 =09=09=09gfs2_trans_add_data(ip->i_gl, bh);
 =09=09else
--=20
2.31.1

