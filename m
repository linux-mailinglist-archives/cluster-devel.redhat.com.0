Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAE35A79C2
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Aug 2022 11:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661937019;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KKKFX41ioIZOKIYmmlVJVK9IF8Tn70kfHS3dCzXqQR8=;
	b=Eq5/Y1rbXC+1kaCHsku9lYAkPf+uvAMLErvTeklVq7uIyQDtmV0Bj+iWe19VcIKG4BUzy8
	F9c8OV8tYq9V1OhE8ax1Q7ho7jXpWDhZkaVIEVOwbHjpaCAWBt5Nn9YfPh5HX82XB2UAtn
	kFyn0vrXXAJWXXe9CzmNLpHjEdZhBcE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-Bl0_7L3zOyK2Eu3v6aw0WA-1; Wed, 31 Aug 2022 05:10:16 -0400
X-MC-Unique: Bl0_7L3zOyK2Eu3v6aw0WA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1007296A602;
	Wed, 31 Aug 2022 09:10:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0452D2166B2B;
	Wed, 31 Aug 2022 09:10:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 57F421946A6D;
	Wed, 31 Aug 2022 09:10:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 021B31946A42 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 07:29:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CD06540334F; Wed, 31 Aug 2022 07:29:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C97CD40334C
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:29:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B219C29DD9B6
 for <cluster-devel@redhat.com>; Wed, 31 Aug 2022 07:29:26 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com
 [45.249.212.188]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-l3hM0EKwOmmvGWSoiQs-JQ-1; Wed, 31 Aug 2022 03:29:21 -0400
X-MC-Unique: l3hM0EKwOmmvGWSoiQs-JQ-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MHZvP637NzYcy3;
 Wed, 31 Aug 2022 15:05:37 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 15:10:00 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
 <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
 <reiserfs-devel@vger.kernel.org>
Date: Wed, 31 Aug 2022 15:20:57 +0800
Message-ID: <20220831072111.3569680-1-yi.zhang@huawei.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mailman-Approved-At: Wed, 31 Aug 2022 09:10:11 +0000
Subject: [Cluster-devel] [PATCH 00/14] buffer: remove ll_rw_block()
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

ll_rw_block() will skip locked buffer before submitting IO, it assumes
that locked buffer means it is under IO. This assumption is not always
true because we cannot guarantee every buffer lock path would submit
IO. After commit 88dbcbb3a484 ("blkdev: avoid migration stalls for
blkdev pages"), buffer_migrate_folio_norefs() becomes one exceptional
case, and there may be others. So ll_rw_block() is not safe on the sync
read path, we could get false positive EIO return value when filesystem
reading metadata. It seems that it could be only used on the readahead
path.

Unfortunately, many filesystem misuse the ll_rw_block() on the sync read
path. This patch set just remove ll_rw_block() and add new friendly
helpers, which could prevent false positive EIO on the read metadata
path. Thanks for the suggestion from Jan, the original discussion is at
[1].

 patch 1: remove unused helpers in fs/buffer.c
 patch 2: add new bh_read_[*] helpers
 patch 3-11: remove all ll_rw_block() calls in filesystems
 patch 12-14: do some leftover cleanups.

Thanks,
Yi.

[1]. https://lore.kernel.org/linux-mm/20220825080146.2021641-1-chengzhihao1=
@huawei.com/

Zhang Yi (14):
  fs/buffer: remove __breadahead_gfp()
  fs/buffer: add some new buffer read helpers
  fs/buffer: replace ll_rw_block()
  gfs2: replace ll_rw_block()
  isofs: replace ll_rw_block()
  jbd2: replace ll_rw_block()
  ntfs3: replace ll_rw_block()
  ocfs2: replace ll_rw_block()
  reiserfs: replace ll_rw_block()
  udf: replace ll_rw_block()
  ufs: replace ll_rw_block()
  fs/buffer: remove ll_rw_block() helper
  ext2: replace bh_submit_read() helper with bh_read_locked()
  fs/buffer: remove bh_submit_read() helper

 fs/buffer.c                 | 150 +++++++++++++++---------------------
 fs/ext2/balloc.c            |   2 +-
 fs/gfs2/meta_io.c           |   6 +-
 fs/gfs2/quota.c             |   4 +-
 fs/isofs/compress.c         |   2 +-
 fs/jbd2/journal.c           |   7 +-
 fs/jbd2/recovery.c          |  16 ++--
 fs/ntfs3/inode.c            |   7 +-
 fs/ocfs2/aops.c             |   2 +-
 fs/ocfs2/super.c            |   5 +-
 fs/reiserfs/journal.c       |  11 +--
 fs/reiserfs/stree.c         |   4 +-
 fs/reiserfs/super.c         |   4 +-
 fs/udf/dir.c                |   2 +-
 fs/udf/directory.c          |   2 +-
 fs/udf/inode.c              |   5 +-
 fs/ufs/balloc.c             |   4 +-
 include/linux/buffer_head.h |  47 ++++++++---
 18 files changed, 135 insertions(+), 145 deletions(-)

--=20
2.31.1

