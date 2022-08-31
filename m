Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 919225A79BF
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 11:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661937018;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QZtPcJgvWfVvjxgiHlmMXc9bIDolzqi/4EWDDg8b8wc=;
	b=BM3e/s8NJNjwo4ohvnZSMoBB8rAu+2TiaOsWO6rWXdxdEC9YDE+v1HUSPOnw3YjSO1RDGt
	PbFJg8ENz3tw4OScHTATBQSsVI61O9+T29MRGjQ4D/WMpphk8LnUC+mmqbg4+hFxtptfVj
	BmqCm7jeO5IgoKj9mK++YLUfO25r7KM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-V0P6j53WMh2yM_0ivVI8SA-1; Wed, 31 Aug 2022 05:10:15 -0400
X-MC-Unique: V0P6j53WMh2yM_0ivVI8SA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D21498039A0;
	Wed, 31 Aug 2022 09:10:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67D281121314;
	Wed, 31 Aug 2022 09:10:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 30FD31946A4B;
	Wed, 31 Aug 2022 09:10:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 270151946A40 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 07:29:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 16F9C492CA2; Wed, 31 Aug 2022 07:29:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 133A8492C3B
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:29:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF2DE3C0D860
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:29:21 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com
 [45.249.212.189]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-xIr5c6gDMc6Pu_764RRh_Q-1; Wed, 31 Aug 2022 03:29:20 -0400
X-MC-Unique: xIr5c6gDMc6Pu_764RRh_Q-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MHZyZ1dDqzHnZL;
 Wed, 31 Aug 2022 15:08:22 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 15:10:08 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>
Date: Wed, 31 Aug 2022 15:21:05 +0800
Message-ID: <20220831072111.3569680-9-yi.zhang@huawei.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Wed, 31 Aug 2022 09:10:11 +0000
Subject: [Cluster-devel] [PATCH 08/14] ocfs2: replace ll_rw_block()
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

ll_rw_block() is not safe for the sync read path because it cannot
guarantee that submitting read IO if the buffer has been locked. We
could get false positive EIO after wait_on_buffer() if the buffer has
been locked by others. So stop using ll_rw_block() in ocfs2.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/ocfs2/aops.c  | 2 +-
 fs/ocfs2/super.c | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index af4157f61927..1d65f6ef00ca 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -636,7 +636,7 @@ int ocfs2_map_page_blocks(struct page *page, u64 *p_blk=
no,
 =09=09=09   !buffer_new(bh) &&
 =09=09=09   ocfs2_should_read_blk(inode, page, block_start) &&
 =09=09=09   (block_start < from || block_end > to)) {
-=09=09=09ll_rw_block(REQ_OP_READ, 1, &bh);
+=09=09=09bh_read_nowait(bh, 0);
 =09=09=09*wait_bh++=3Dbh;
 =09=09}
=20
diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
index e2cc9eec287c..4050f35bbd0c 100644
--- a/fs/ocfs2/super.c
+++ b/fs/ocfs2/super.c
@@ -1763,10 +1763,7 @@ static int ocfs2_get_sector(struct super_block *sb,
 =09lock_buffer(*bh);
 =09if (!buffer_dirty(*bh))
 =09=09clear_buffer_uptodate(*bh);
-=09unlock_buffer(*bh);
-=09ll_rw_block(REQ_OP_READ, 1, bh);
-=09wait_on_buffer(*bh);
-=09if (!buffer_uptodate(*bh)) {
+=09if (bh_read_locked(*bh, 0)) {
 =09=09mlog_errno(-EIO);
 =09=09brelse(*bh);
 =09=09*bh =3D NULL;
--=20
2.31.1

