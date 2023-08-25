Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0303C78C09A
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298479;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bddo2q/2kO0t3RMWU9d+lI1hAam82791c9ozYf9CkDU=;
	b=guU7G23NlrYS25skxuG2EiIYFoiJXovlicr6ntH3rgS9b3ACmB61rBARZIBuUXZ+vGfUfr
	WiFdt2uYd1HnArsA8XMO8GR6bQAo7aeAV3jMbUqJs7imNwCMEBwlTWm0VONspprObeEkze
	eazmJrKy368HFhbpb0s6JI8YjtlDJfc=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-EQMkZsgvPl-JYyWZmP246g-1; Tue, 29 Aug 2023 04:41:14 -0400
X-MC-Unique: EQMkZsgvPl-JYyWZmP246g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD5E71C05EBF;
	Tue, 29 Aug 2023 08:41:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B28EA63F6C;
	Tue, 29 Aug 2023 08:41:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7D3E019466DF;
	Tue, 29 Aug 2023 08:41:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3253819465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:02:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D33716B59C; Fri, 25 Aug 2023 14:02:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBE106B2B2
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:02:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB9028D40BB
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:02:46 +0000 (UTC)
Received: from out-249.mta1.migadu.com (out-249.mta1.migadu.com
 [95.215.58.249]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-UIGr3J31Pu29X20B4USE7Q-1; Fri, 25 Aug 2023 10:02:41 -0400
X-MC-Unique: UIGr3J31Pu29X20B4USE7Q-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:19 +0800
Message-Id: <20230825135431.1317785-18-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 17/29] xfs: make xfs_trans_ijoin() error out
 -EAGAIN
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Hao Xu <howeyxu@tencent.com>

Change return value of xfs_trans_ijoin() to error out -EAGAIN.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/libxfs/xfs_trans_inode.c | 13 +++++++++----
 fs/xfs/xfs_iops.c               |  4 +++-
 fs/xfs/xfs_trans.h              |  2 +-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inod=
e.c
index e7a8f63c8975..7bda62bad90a 100644
--- a/fs/xfs/libxfs/xfs_trans_inode.c
+++ b/fs/xfs/libxfs/xfs_trans_inode.c
@@ -23,7 +23,7 @@
  * The inode must be locked, and it cannot be associated with any transact=
ion.
  * If lock_flags is non-zero the inode will be unlocked on transaction com=
mit.
  */
-void
+int
 xfs_trans_ijoin(
 =09struct xfs_trans=09*tp,
 =09struct xfs_inode=09*ip,
@@ -32,9 +32,12 @@ xfs_trans_ijoin(
 =09struct xfs_inode_log_item *iip;
=20
 =09ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
-=09if (ip->i_itemp =3D=3D NULL)
-=09=09xfs_inode_item_init(ip, ip->i_mount,
-=09=09=09=09    tp->t_flags & XFS_TRANS_NOWAIT);
+=09if (ip->i_itemp =3D=3D NULL) {
+=09=09int ret =3D xfs_inode_item_init(ip, ip->i_mount,
+=09=09=09=09=09      tp->t_flags & XFS_TRANS_NOWAIT);
+=09=09if (ret =3D=3D -EAGAIN)
+=09=09=09return ret;
+=09}
 =09iip =3D ip->i_itemp;
=20
 =09ASSERT(iip->ili_lock_flags =3D=3D 0);
@@ -44,6 +47,8 @@ xfs_trans_ijoin(
 =09/* Reset the per-tx dirty context and add the item to the tx. */
 =09iip->ili_dirty_flags =3D 0;
 =09xfs_trans_add_item(tp, &iip->ili_item);
+
+=09return 0;
 }
=20
 /*
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 47b4fd5f8f5c..034a8fea1f8e 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1075,7 +1075,9 @@ xfs_vn_update_time(
 =09if (flags & S_ATIME)
 =09=09inode->i_atime =3D *now;
=20
-=09xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
+=09error =3D xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
+=09if (error)
+=09=09goto out;
 =09xfs_trans_log_inode(tp, ip, log_flags);
 =09error =3D xfs_trans_commit(tp);
=20
diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
index 6e3646d524ce..f2c05884c4b6 100644
--- a/fs/xfs/xfs_trans.h
+++ b/fs/xfs/xfs_trans.h
@@ -226,7 +226,7 @@ bool=09=09xfs_trans_ordered_buf(xfs_trans_t *, struct x=
fs_buf *);
 void=09=09xfs_trans_dquot_buf(xfs_trans_t *, struct xfs_buf *, uint);
 void=09=09xfs_trans_inode_alloc_buf(xfs_trans_t *, struct xfs_buf *);
 void=09=09xfs_trans_ichgtime(struct xfs_trans *, struct xfs_inode *, int);
-void=09=09xfs_trans_ijoin(struct xfs_trans *, struct xfs_inode *, uint);
+int=09=09xfs_trans_ijoin(struct xfs_trans *, struct xfs_inode *, uint);
 void=09=09xfs_trans_log_buf(struct xfs_trans *, struct xfs_buf *, uint,
 =09=09=09=09  uint);
 void=09=09xfs_trans_dirty_buf(struct xfs_trans *, struct xfs_buf *);
--=20
2.25.1

