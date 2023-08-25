Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9776678C091
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298477;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ImXE3nuuGzrb553UzMTumWVCMGKZEPEKzg+VhiR6GCg=;
	b=D9KKcHQe2lN5dLuISml0kAlSWha9flmM+kYL3paHvt/RBkagNNggyHsmSRoFwUJ9Tb41gV
	xbmK49iLZjrRgLhCcln4TXxxg7Gzn+JybTc9FcTw5SVcjSxlMePkcY73IdJH7cLmeVp6RC
	eSzF3AApDjfLzWWoXgeLzRB0Wx06iFw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-VGMGlGZYMw-FnnSUxQ5JKw-1; Tue, 29 Aug 2023 04:41:13 -0400
X-MC-Unique: VGMGlGZYMw-FnnSUxQ5JKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C35D823DF7;
	Tue, 29 Aug 2023 08:41:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F327D2026D68;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CA3F91946A4A;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D932F19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 13:59:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C353F492C3A; Fri, 25 Aug 2023 13:59:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC2D0492C14
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 13:59:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 881A38D40A0
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 13:59:55 +0000 (UTC)
Received: from out-252.mta1.migadu.com (out-252.mta1.migadu.com
 [95.215.58.252]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-aq4OHda3M6SSFzrAXmVNHg-1; Fri, 25 Aug 2023 09:59:53 -0400
X-MC-Unique: aq4OHda3M6SSFzrAXmVNHg-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:12 +0800
Message-Id: <20230825135431.1317785-11-hao.xu@linux.dev>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 10/29] vfs: add S_NOWAIT for nowait time
 update
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Hao Xu <howeyxu@tencent.com>

Add a new time flag S_NOWAIT to support nowait time update. Deliver it
to specific filesystem and error out -EAGAIN when it would block.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/inode.c         | 9 +++++----
 fs/xfs/xfs_iops.c  | 8 +++++++-
 include/linux/fs.h | 1 +
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index e83b836f2d09..eb3db34a3e6e 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1966,12 +1966,13 @@ int touch_atime(const struct path *path, bool nowai=
t)
 =09struct vfsmount *mnt =3D path->mnt;
 =09struct inode *inode =3D d_inode(path->dentry);
 =09struct timespec64 now;
+=09int ret =3D 0;
=20
 =09if (!atime_needs_update(path, inode))
-=09=09return 0;
+=09=09return ret;
=20
 =09if (!sb_start_write_trylock(inode->i_sb))
-=09=09return 0;
+=09=09return ret;
=20
 =09if (__mnt_want_write(mnt) !=3D 0)
 =09=09goto skip_update;
@@ -1985,11 +1986,11 @@ int touch_atime(const struct path *path, bool nowai=
t)
 =09 * of the fs read only, e.g. subvolumes in Btrfs.
 =09 */
 =09now =3D current_time(inode);
-=09inode_update_time(inode, &now, S_ATIME);
+=09ret =3D inode_update_time(inode, &now, S_ATIME | (nowait ? S_NOWAIT : 0=
));
 =09__mnt_drop_write(mnt);
 skip_update:
 =09sb_end_write(inode->i_sb);
-=09return 0;
+=09return ret;
 }
 EXPORT_SYMBOL(touch_atime);
=20
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 24718adb3c16..bf1d4c31f009 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1053,7 +1053,13 @@ xfs_vn_update_time(
 =09if (error)
 =09=09return error;
=20
-=09xfs_ilock(ip, XFS_ILOCK_EXCL);
+=09if (flags & S_NOWAIT) {
+=09=09if (!xfs_ilock_nowait(ip, XFS_ILOCK_EXCL))
+=09=09=09return -EAGAIN;
+=09} else {
+=09=09xfs_ilock(ip, XFS_ILOCK_EXCL);
+=09}
+
 =09if (flags & S_CTIME)
 =09=09inode->i_ctime =3D *now;
 =09if (flags & S_MTIME)
diff --git a/include/linux/fs.h b/include/linux/fs.h
index ed60b3d70d1e..f8c267ee5cb7 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2198,6 +2198,7 @@ enum file_time_flags {
 =09S_MTIME =3D 2,
 =09S_CTIME =3D 4,
 =09S_VERSION =3D 8,
+=09S_NOWAIT =3D 16,
 };
=20
 extern bool atime_needs_update(const struct path *, struct inode *);
--=20
2.25.1

