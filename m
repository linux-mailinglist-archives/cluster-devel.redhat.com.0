Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F2D65F5CB
	for <lists+cluster-devel@lfdr.de>; Thu,  5 Jan 2023 22:30:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672954242;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w5aDD7ut4S8s4TS7wuVUys41sP597aUJOPpYeecDjdo=;
	b=LZUdNvsi5kocGO3K5QJ8/667MXkl6Pz4CMveLdyUrfFQsr4Y1dFNaWr/EoZ066kIRlot2I
	A08cZoKcrRTPnosDGnOvbLCgSWP9KVoPXISTK/jeodukf+536X1FgrP4C5K5iCtT87LWN9
	He51NKB5oRwWvgInJplJfs/kuHi6W6w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-v1ky356kNMeMBcYCWutZyA-1; Thu, 05 Jan 2023 16:30:36 -0500
X-MC-Unique: v1ky356kNMeMBcYCWutZyA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7EE4811E6E;
	Thu,  5 Jan 2023 21:30:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97B411121314;
	Thu,  5 Jan 2023 21:30:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3F00D194658D;
	Thu,  5 Jan 2023 21:30:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0A0401946586 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  5 Jan 2023 21:30:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E81572026D68; Thu,  5 Jan 2023 21:30:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFDD22026D4B
 for <cluster-devel@redhat.com>; Thu,  5 Jan 2023 21:30:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B99E918ABF82
 for <cluster-devel@redhat.com>; Thu,  5 Jan 2023 21:30:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-JWWpAbH5Pm-M33OECLsvZA-1; Thu, 05 Jan 2023 16:30:10 -0500
X-MC-Unique: JWWpAbH5Pm-M33OECLsvZA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1829061C14;
 Thu,  5 Jan 2023 21:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DC7C433D2;
 Thu,  5 Jan 2023 21:19:39 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
 Eric Van Hensbergen <ericvh@gmail.com>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Steve French <sfrench@samba.org>,
 Paulo Alcantara <pc@cjr.nz>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Christine Caulfield <ccaulfie@redhat.com>,
 David Teigland <teigland@redhat.com>, Chuck Lever <chuck.lever@oracle.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna@kernel.org>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>,
 "Darrick J. Wong" <djwong@kernel.org>
Date: Thu,  5 Jan 2023 16:19:29 -0500
Message-Id: <20230105211937.1572384-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH v2] filelock: move file locking definitions
 to separate header file
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
Cc: linux-cifs@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 linux-xfs@vger.kernel.org, devel@lists.orangefs.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com,
 ocfs2-devel@oss.oracle.com, Steve French <stfrench@microsoft.com>,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The file locking definitions have lived in fs.h since the dawn of time,
but they are only used by a small subset of the source files that
include it.

Move the file locking definitions to a new header file, and add the
appropriate #include directives to the source files that need them. By
doing this we trim down fs.h a bit and limit the amount of rebuilding
that has to be done when we make changes to the file locking APIs.

Reviewed-by: Xiubo Li <xiubli@redhat.com>
Reviewed-by: Christian Brauner (Microsoft) <brauner@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: David Howells <dhowells@redhat.com>
Acked-by: Chuck Lever <chuck.lever@oracle.com>
Acked-by: Joseph Qi <joseph.qi@linux.alibaba.com>
Acked-by: Steve French <stfrench@microsoft.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 arch/arm/kernel/sys_oabi-compat.c |   1 +
 fs/9p/vfs_file.c                  |   1 +
 fs/afs/internal.h                 |   1 +
 fs/attr.c                         |   1 +
 fs/ceph/locks.c                   |   1 +
 fs/cifs/cifsfs.c                  |   1 +
 fs/cifs/cifsglob.h                |   1 +
 fs/cifs/cifssmb.c                 |   1 +
 fs/cifs/file.c                    |   1 +
 fs/cifs/smb2file.c                |   1 +
 fs/dlm/plock.c                    |   1 +
 fs/fcntl.c                        |   1 +
 fs/file_table.c                   |   1 +
 fs/fuse/file.c                    |   1 +
 fs/gfs2/file.c                    |   1 +
 fs/inode.c                        |   1 +
 fs/ksmbd/smb2pdu.c                |   1 +
 fs/ksmbd/vfs.c                    |   1 +
 fs/ksmbd/vfs_cache.c              |   1 +
 fs/lockd/clntproc.c               |   1 +
 fs/lockd/netns.h                  |   1 +
 fs/locks.c                        |   1 +
 fs/namei.c                        |   1 +
 fs/nfs/file.c                     |   1 +
 fs/nfs/nfs4_fs.h                  |   1 +
 fs/nfs/pagelist.c                 |   1 +
 fs/nfs/write.c                    |   1 +
 fs/nfs_common/grace.c             |   1 +
 fs/nfsd/netns.h                   |   1 +
 fs/ocfs2/locks.c                  |   1 +
 fs/ocfs2/stack_user.c             |   1 +
 fs/open.c                         |   1 +
 fs/orangefs/file.c                |   1 +
 fs/posix_acl.c                    |   1 +
 fs/proc/fd.c                      |   1 +
 fs/utimes.c                       |   1 +
 fs/xattr.c                        |   1 +
 fs/xfs/xfs_linux.h                |   1 +
 include/linux/filelock.h          | 438 ++++++++++++++++++++++++++++++
 include/linux/fs.h                | 426 -----------------------------
 include/linux/lockd/xdr.h         |   1 +
 41 files changed, 477 insertions(+), 426 deletions(-)
 create mode 100644 include/linux/filelock.h

v2:
- drop pointless externs from the new filelock.h
- move include into xfs_linux.h instead of xfs_buf.h
- have filelock.h #include fs.h. Any file including filelock.h will
  almost certainly need fs.h anyway.

I've left some of Al's comments unaddressed for now, as I'd like to keep
this move mostly mechanical, and no go changing function prototypes
until the dust settles.

I'll plan to drop this into linux-next within the next few days, with an
eye toward merging this for v6.3.

diff --git a/arch/arm/kernel/sys_oabi-compat.c b/arch/arm/kernel/sys_oabi-c=
ompat.c
index 68112c172025..006163195d67 100644
--- a/arch/arm/kernel/sys_oabi-compat.c
+++ b/arch/arm/kernel/sys_oabi-compat.c
@@ -73,6 +73,7 @@
 #include <linux/syscalls.h>
 #include <linux/errno.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/cred.h>
 #include <linux/fcntl.h>
 #include <linux/eventpoll.h>
diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
index b740017634ef..b6ba22975781 100644
--- a/fs/9p/vfs_file.c
+++ b/fs/9p/vfs_file.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/errno.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/sched.h>
 #include <linux/file.h>
 #include <linux/stat.h>
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index fd8567b98e2b..2d6d7dae225a 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/ktime.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/pagemap.h>
 #include <linux/rxrpc.h>
 #include <linux/key.h>
diff --git a/fs/attr.c b/fs/attr.c
index b45f30e516fa..f3eb8e57b451 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -14,6 +14,7 @@
 #include <linux/capability.h>
 #include <linux/fsnotify.h>
 #include <linux/fcntl.h>
+#include <linux/filelock.h>
 #include <linux/security.h>
 #include <linux/evm.h>
 #include <linux/ima.h>
diff --git a/fs/ceph/locks.c b/fs/ceph/locks.c
index f3b461c708a8..476f25bba263 100644
--- a/fs/ceph/locks.c
+++ b/fs/ceph/locks.c
@@ -7,6 +7,7 @@
=20
 #include "super.h"
 #include "mds_client.h"
+#include <linux/filelock.h>
 #include <linux/ceph/pagelist.h>
=20
 static u64 lock_secret;
diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
index 10e00c624922..f052f190b2e8 100644
--- a/fs/cifs/cifsfs.c
+++ b/fs/cifs/cifsfs.c
@@ -12,6 +12,7 @@
=20
 #include <linux/module.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/mount.h>
 #include <linux/slab.h>
 #include <linux/init.h>
diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
index cfdd5bf701a1..cd8171a1c9a0 100644
--- a/fs/cifs/cifsglob.h
+++ b/fs/cifs/cifsglob.h
@@ -26,6 +26,7 @@
 #include <uapi/linux/cifs/cifs_mount.h>
 #include "../smbfs_common/smb2pdu.h"
 #include "smb2pdu.h"
+#include <linux/filelock.h>
=20
 #define SMB_PATH_MAX 260
 #define CIFS_PORT 445
diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
index 23f10e0d6e7e..60dd4e37030a 100644
--- a/fs/cifs/cifssmb.c
+++ b/fs/cifs/cifssmb.c
@@ -15,6 +15,7 @@
  /* want to reuse a stale file handle and only the caller knows the file i=
nfo */
=20
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/kernel.h>
 #include <linux/vfs.h>
 #include <linux/slab.h>
diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index 22dfc1f8b4f1..1d9cc59d8259 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -9,6 +9,7 @@
  *
  */
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/backing-dev.h>
 #include <linux/stat.h>
 #include <linux/fcntl.h>
diff --git a/fs/cifs/smb2file.c b/fs/cifs/smb2file.c
index ba6cc50af390..9f1dd04b555a 100644
--- a/fs/cifs/smb2file.c
+++ b/fs/cifs/smb2file.c
@@ -7,6 +7,7 @@
  *
  */
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/stat.h>
 #include <linux/slab.h>
 #include <linux/pagemap.h>
diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 737f185aad8d..ed4357e62f35 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -4,6 +4,7 @@
  */
=20
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/miscdevice.h>
 #include <linux/poll.h>
 #include <linux/dlm.h>
diff --git a/fs/fcntl.c b/fs/fcntl.c
index 146c9ab0cd4b..7852e946fdf4 100644
--- a/fs/fcntl.c
+++ b/fs/fcntl.c
@@ -10,6 +10,7 @@
 #include <linux/mm.h>
 #include <linux/sched/task.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/file.h>
 #include <linux/fdtable.h>
 #include <linux/capability.h>
diff --git a/fs/file_table.c b/fs/file_table.c
index dd88701e54a9..372653b92617 100644
--- a/fs/file_table.c
+++ b/fs/file_table.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/security.h>
 #include <linux/cred.h>
 #include <linux/eventpoll.h>
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 875314ee6f59..1458412f2492 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -18,6 +18,7 @@
 #include <linux/falloc.h>
 #include <linux/uio.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
=20
 static int fuse_send_open(struct fuse_mount *fm, u64 nodeid,
 =09=09=09  unsigned int open_flags, int opcode,
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index eea5be4fbf0e..e8e20a716004 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -15,6 +15,7 @@
 #include <linux/mm.h>
 #include <linux/mount.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/gfs2_ondisk.h>
 #include <linux/falloc.h>
 #include <linux/swap.h>
diff --git a/fs/inode.c b/fs/inode.c
index f453eb58fd03..d02dd8f1e967 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -5,6 +5,7 @@
  */
 #include <linux/export.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/mm.h>
 #include <linux/backing-dev.h>
 #include <linux/hash.h>
diff --git a/fs/ksmbd/smb2pdu.c b/fs/ksmbd/smb2pdu.c
index 14d7f3599c63..000a6648f122 100644
--- a/fs/ksmbd/smb2pdu.c
+++ b/fs/ksmbd/smb2pdu.c
@@ -12,6 +12,7 @@
 #include <linux/ethtool.h>
 #include <linux/falloc.h>
 #include <linux/mount.h>
+#include <linux/filelock.h>
=20
 #include "glob.h"
 #include "smbfsctl.h"
diff --git a/fs/ksmbd/vfs.c b/fs/ksmbd/vfs.c
index ff0e7a4fcd4d..5851934dc85b 100644
--- a/fs/ksmbd/vfs.c
+++ b/fs/ksmbd/vfs.c
@@ -6,6 +6,7 @@
=20
 #include <linux/kernel.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/uaccess.h>
 #include <linux/backing-dev.h>
 #include <linux/writeback.h>
diff --git a/fs/ksmbd/vfs_cache.c b/fs/ksmbd/vfs_cache.c
index da9163b00350..552c3882a8f4 100644
--- a/fs/ksmbd/vfs_cache.c
+++ b/fs/ksmbd/vfs_cache.c
@@ -5,6 +5,7 @@
  */
=20
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
=20
diff --git a/fs/lockd/clntproc.c b/fs/lockd/clntproc.c
index 99fffc9cb958..e875a3571c41 100644
--- a/fs/lockd/clntproc.c
+++ b/fs/lockd/clntproc.c
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/errno.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/nfs_fs.h>
 #include <linux/utsname.h>
 #include <linux/freezer.h>
diff --git a/fs/lockd/netns.h b/fs/lockd/netns.h
index 5bec78c8e431..17432c445fe6 100644
--- a/fs/lockd/netns.h
+++ b/fs/lockd/netns.h
@@ -3,6 +3,7 @@
 #define __LOCKD_NETNS_H__
=20
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <net/netns/generic.h>
=20
 struct lockd_net {
diff --git a/fs/locks.c b/fs/locks.c
index 8f01bee17715..a5cc90c958c9 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -52,6 +52,7 @@
 #include <linux/capability.h>
 #include <linux/file.h>
 #include <linux/fdtable.h>
+#include <linux/filelock.h>
 #include <linux/fs.h>
 #include <linux/init.h>
 #include <linux/security.h>
diff --git a/fs/namei.c b/fs/namei.c
index 309ae6fc8c99..60a9d3ac941f 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -20,6 +20,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/namei.h>
 #include <linux/pagemap.h>
 #include <linux/sched/mm.h>
diff --git a/fs/nfs/file.c b/fs/nfs/file.c
index d8ec889a4b3f..b0f3c9339e70 100644
--- a/fs/nfs/file.c
+++ b/fs/nfs/file.c
@@ -31,6 +31,7 @@
 #include <linux/swap.h>
=20
 #include <linux/uaccess.h>
+#include <linux/filelock.h>
=20
 #include "delegation.h"
 #include "internal.h"
diff --git a/fs/nfs/nfs4_fs.h b/fs/nfs/nfs4_fs.h
index 5edd1704f735..4c9f8bd866ab 100644
--- a/fs/nfs/nfs4_fs.h
+++ b/fs/nfs/nfs4_fs.h
@@ -23,6 +23,7 @@
 #define NFS4_MAX_LOOP_ON_RECOVER (10)
=20
 #include <linux/seqlock.h>
+#include <linux/filelock.h>
=20
 struct idmap;
=20
diff --git a/fs/nfs/pagelist.c b/fs/nfs/pagelist.c
index 16be6dae524f..779bfc37233c 100644
--- a/fs/nfs/pagelist.c
+++ b/fs/nfs/pagelist.c
@@ -21,6 +21,7 @@
 #include <linux/nfs_page.h>
 #include <linux/nfs_mount.h>
 #include <linux/export.h>
+#include <linux/filelock.h>
=20
 #include "internal.h"
 #include "pnfs.h"
diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index 80c240e50952..1a80d548253a 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -25,6 +25,7 @@
 #include <linux/freezer.h>
 #include <linux/wait.h>
 #include <linux/iversion.h>
+#include <linux/filelock.h>
=20
 #include <linux/uaccess.h>
 #include <linux/sched/mm.h>
diff --git a/fs/nfs_common/grace.c b/fs/nfs_common/grace.c
index 0a9b72685f98..1479583fbb62 100644
--- a/fs/nfs_common/grace.c
+++ b/fs/nfs_common/grace.c
@@ -9,6 +9,7 @@
 #include <net/net_namespace.h>
 #include <net/netns/generic.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
=20
 static unsigned int grace_net_id;
 static DEFINE_SPINLOCK(grace_lock);
diff --git a/fs/nfsd/netns.h b/fs/nfsd/netns.h
index 8c854ba3285b..bc139401927d 100644
--- a/fs/nfsd/netns.h
+++ b/fs/nfsd/netns.h
@@ -10,6 +10,7 @@
=20
 #include <net/net_namespace.h>
 #include <net/netns/generic.h>
+#include <linux/filelock.h>
 #include <linux/percpu_counter.h>
 #include <linux/siphash.h>
=20
diff --git a/fs/ocfs2/locks.c b/fs/ocfs2/locks.c
index 73a3854b2afb..f37174e79fad 100644
--- a/fs/ocfs2/locks.c
+++ b/fs/ocfs2/locks.c
@@ -8,6 +8,7 @@
  */
=20
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/fcntl.h>
=20
 #include <cluster/masklog.h>
diff --git a/fs/ocfs2/stack_user.c b/fs/ocfs2/stack_user.c
index 64e6ddcfe329..05d4414d0c33 100644
--- a/fs/ocfs2/stack_user.c
+++ b/fs/ocfs2/stack_user.c
@@ -9,6 +9,7 @@
=20
 #include <linux/module.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
diff --git a/fs/open.c b/fs/open.c
index 82c1a28b3308..9b1c08298a07 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -33,6 +33,7 @@
 #include <linux/dnotify.h>
 #include <linux/compat.h>
 #include <linux/mnt_idmapping.h>
+#include <linux/filelock.h>
=20
 #include "internal.h"
=20
diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
index 167fa43b24f9..4ecb91a9bbeb 100644
--- a/fs/orangefs/file.c
+++ b/fs/orangefs/file.c
@@ -14,6 +14,7 @@
 #include "orangefs-kernel.h"
 #include "orangefs-bufmap.h"
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/pagemap.h>
=20
 static int flush_racache(struct inode *inode)
diff --git a/fs/posix_acl.c b/fs/posix_acl.c
index d7bc81fc0840..d2271431f344 100644
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -28,6 +28,7 @@
 #include <linux/security.h>
 #include <linux/evm.h>
 #include <linux/fsnotify.h>
+#include <linux/filelock.h>
=20
 #include "internal.h"
=20
diff --git a/fs/proc/fd.c b/fs/proc/fd.c
index fc46d6fe080c..53e4919ef860 100644
--- a/fs/proc/fd.c
+++ b/fs/proc/fd.c
@@ -12,6 +12,7 @@
 #include <linux/file.h>
 #include <linux/seq_file.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
=20
 #include <linux/proc_fs.h>
=20
diff --git a/fs/utimes.c b/fs/utimes.c
index 39f356017635..00499e4ba955 100644
--- a/fs/utimes.c
+++ b/fs/utimes.c
@@ -7,6 +7,7 @@
 #include <linux/uaccess.h>
 #include <linux/compat.h>
 #include <asm/unistd.h>
+#include <linux/filelock.h>
=20
 static bool nsec_valid(long nsec)
 {
diff --git a/fs/xattr.c b/fs/xattr.c
index adab9a70b536..3fead374901b 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -9,6 +9,7 @@
   Copyright (c) 2004 Red Hat, Inc., James Morris <jmorris@redhat.com>
  */
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/slab.h>
 #include <linux/file.h>
 #include <linux/xattr.h>
diff --git a/fs/xfs/xfs_linux.h b/fs/xfs/xfs_linux.h
index f9878021e7d0..e88f18f85e4b 100644
--- a/fs/xfs/xfs_linux.h
+++ b/fs/xfs/xfs_linux.h
@@ -34,6 +34,7 @@ typedef __u32=09=09=09xfs_nlink_t;
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/file.h>
+#include <linux/filelock.h>
 #include <linux/swap.h>
 #include <linux/errno.h>
 #include <linux/sched/signal.h>
diff --git a/include/linux/filelock.h b/include/linux/filelock.h
new file mode 100644
index 000000000000..deee04385127
--- /dev/null
+++ b/include/linux/filelock.h
@@ -0,0 +1,438 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_FILELOCK_H
+#define _LINUX_FILELOCK_H
+
+#include <linux/fs.h>
+
+#define FL_POSIX=091
+#define FL_FLOCK=092
+#define FL_DELEG=094=09/* NFSv4 delegation */
+#define FL_ACCESS=098=09/* not trying to lock, just looking */
+#define FL_EXISTS=0916=09/* when unlocking, test for existence */
+#define FL_LEASE=0932=09/* lease held on this file */
+#define FL_CLOSE=0964=09/* unlock on close */
+#define FL_SLEEP=09128=09/* A blocking lock */
+#define FL_DOWNGRADE_PENDING=09256 /* Lease is being downgraded */
+#define FL_UNLOCK_PENDING=09512 /* Lease is being broken */
+#define FL_OFDLCK=091024=09/* lock is "owned" by struct file */
+#define FL_LAYOUT=092048=09/* outstanding pNFS layout */
+#define FL_RECLAIM=094096=09/* reclaiming from a reboot server */
+
+#define FL_CLOSE_POSIX (FL_POSIX | FL_CLOSE)
+
+/*
+ * Special return value from posix_lock_file() and vfs_lock_file() for
+ * asynchronous locking.
+ */
+#define FILE_LOCK_DEFERRED 1
+
+struct file_lock;
+
+struct file_lock_operations {
+=09void (*fl_copy_lock)(struct file_lock *, struct file_lock *);
+=09void (*fl_release_private)(struct file_lock *);
+};
+
+struct lock_manager_operations {
+=09void *lm_mod_owner;
+=09fl_owner_t (*lm_get_owner)(fl_owner_t);
+=09void (*lm_put_owner)(fl_owner_t);
+=09void (*lm_notify)(struct file_lock *);=09/* unblock callback */
+=09int (*lm_grant)(struct file_lock *, int);
+=09bool (*lm_break)(struct file_lock *);
+=09int (*lm_change)(struct file_lock *, int, struct list_head *);
+=09void (*lm_setup)(struct file_lock *, void **);
+=09bool (*lm_breaker_owns_lease)(struct file_lock *);
+=09bool (*lm_lock_expirable)(struct file_lock *cfl);
+=09void (*lm_expire_lock)(void);
+};
+
+struct lock_manager {
+=09struct list_head list;
+=09/*
+=09 * NFSv4 and up also want opens blocked during the grace period;
+=09 * NLM doesn't care:
+=09 */
+=09bool block_opens;
+};
+
+struct net;
+void locks_start_grace(struct net *, struct lock_manager *);
+void locks_end_grace(struct lock_manager *);
+bool locks_in_grace(struct net *);
+bool opens_in_grace(struct net *);
+
+/*
+ * struct file_lock has a union that some filesystems use to track
+ * their own private info. The NFS side of things is defined here:
+ */
+#include <linux/nfs_fs_i.h>
+
+/*
+ * struct file_lock represents a generic "file lock". It's used to represe=
nt
+ * POSIX byte range locks, BSD (flock) locks, and leases. It's important t=
o
+ * note that the same struct is used to represent both a request for a loc=
k and
+ * the lock itself, but the same object is never used for both.
+ *
+ * FIXME: should we create a separate "struct lock_request" to help distin=
guish
+ * these two uses?
+ *
+ * The varous i_flctx lists are ordered by:
+ *
+ * 1) lock owner
+ * 2) lock range start
+ * 3) lock range end
+ *
+ * Obviously, the last two criteria only matter for POSIX locks.
+ */
+struct file_lock {
+=09struct file_lock *fl_blocker;=09/* The lock, that is blocking us */
+=09struct list_head fl_list;=09/* link into file_lock_context */
+=09struct hlist_node fl_link;=09/* node in global lists */
+=09struct list_head fl_blocked_requests;=09/* list of requests with
+=09=09=09=09=09=09 * ->fl_blocker pointing here
+=09=09=09=09=09=09 */
+=09struct list_head fl_blocked_member;=09/* node in
+=09=09=09=09=09=09 * ->fl_blocker->fl_blocked_requests
+=09=09=09=09=09=09 */
+=09fl_owner_t fl_owner;
+=09unsigned int fl_flags;
+=09unsigned char fl_type;
+=09unsigned int fl_pid;
+=09int fl_link_cpu;=09=09/* what cpu's list is this on? */
+=09wait_queue_head_t fl_wait;
+=09struct file *fl_file;
+=09loff_t fl_start;
+=09loff_t fl_end;
+
+=09struct fasync_struct *=09fl_fasync; /* for lease break notifications */
+=09/* for lease breaks: */
+=09unsigned long fl_break_time;
+=09unsigned long fl_downgrade_time;
+
+=09const struct file_lock_operations *fl_ops;=09/* Callbacks for filesyste=
ms */
+=09const struct lock_manager_operations *fl_lmops;=09/* Callbacks for lock=
managers */
+=09union {
+=09=09struct nfs_lock_info=09nfs_fl;
+=09=09struct nfs4_lock_info=09nfs4_fl;
+=09=09struct {
+=09=09=09struct list_head link;=09/* link in AFS vnode's pending_locks lis=
t */
+=09=09=09int state;=09=09/* state of grant or error if -ve */
+=09=09=09unsigned int=09debug_id;
+=09=09} afs;
+=09} fl_u;
+} __randomize_layout;
+
+struct file_lock_context {
+=09spinlock_t=09=09flc_lock;
+=09struct list_head=09flc_flock;
+=09struct list_head=09flc_posix;
+=09struct list_head=09flc_lease;
+};
+
+#define locks_inode(f) file_inode(f)
+
+#ifdef CONFIG_FILE_LOCKING
+int fcntl_getlk(struct file *, unsigned int, struct flock *);
+int fcntl_setlk(unsigned int, struct file *, unsigned int,
+=09=09=09struct flock *);
+
+#if BITS_PER_LONG =3D=3D 32
+int fcntl_getlk64(struct file *, unsigned int, struct flock64 *);
+int fcntl_setlk64(unsigned int, struct file *, unsigned int,
+=09=09=09struct flock64 *);
+#endif
+
+int fcntl_setlease(unsigned int fd, struct file *filp, long arg);
+int fcntl_getlease(struct file *filp);
+
+/* fs/locks.c */
+void locks_free_lock_context(struct inode *inode);
+void locks_free_lock(struct file_lock *fl);
+void locks_init_lock(struct file_lock *);
+struct file_lock * locks_alloc_lock(void);
+void locks_copy_lock(struct file_lock *, struct file_lock *);
+void locks_copy_conflock(struct file_lock *, struct file_lock *);
+void locks_remove_posix(struct file *, fl_owner_t);
+void locks_remove_file(struct file *);
+void locks_release_private(struct file_lock *);
+void posix_test_lock(struct file *, struct file_lock *);
+int posix_lock_file(struct file *, struct file_lock *, struct file_lock *)=
;
+int locks_delete_block(struct file_lock *);
+int vfs_test_lock(struct file *, struct file_lock *);
+int vfs_lock_file(struct file *, unsigned int, struct file_lock *, struct =
file_lock *);
+int vfs_cancel_lock(struct file *filp, struct file_lock *fl);
+bool vfs_inode_has_locks(struct inode *inode);
+int locks_lock_inode_wait(struct inode *inode, struct file_lock *fl);
+int __break_lease(struct inode *inode, unsigned int flags, unsigned int ty=
pe);
+void lease_get_mtime(struct inode *, struct timespec64 *time);
+int generic_setlease(struct file *, long, struct file_lock **, void **priv=
);
+int vfs_setlease(struct file *, long, struct file_lock **, void **);
+int lease_modify(struct file_lock *, int, struct list_head *);
+
+struct notifier_block;
+int lease_register_notifier(struct notifier_block *);
+void lease_unregister_notifier(struct notifier_block *);
+
+struct files_struct;
+void show_fd_locks(struct seq_file *f,
+=09=09=09 struct file *filp, struct files_struct *files);
+bool locks_owner_has_blockers(struct file_lock_context *flctx,
+=09=09=09fl_owner_t owner);
+
+static inline struct file_lock_context *
+locks_inode_context(const struct inode *inode)
+{
+=09return smp_load_acquire(&inode->i_flctx);
+}
+
+#else /* !CONFIG_FILE_LOCKING */
+static inline int fcntl_getlk(struct file *file, unsigned int cmd,
+=09=09=09      struct flock __user *user)
+{
+=09return -EINVAL;
+}
+
+static inline int fcntl_setlk(unsigned int fd, struct file *file,
+=09=09=09      unsigned int cmd, struct flock __user *user)
+{
+=09return -EACCES;
+}
+
+#if BITS_PER_LONG =3D=3D 32
+static inline int fcntl_getlk64(struct file *file, unsigned int cmd,
+=09=09=09=09struct flock64 *user)
+{
+=09return -EINVAL;
+}
+
+static inline int fcntl_setlk64(unsigned int fd, struct file *file,
+=09=09=09=09unsigned int cmd, struct flock64 *user)
+{
+=09return -EACCES;
+}
+#endif
+static inline int fcntl_setlease(unsigned int fd, struct file *filp, long =
arg)
+{
+=09return -EINVAL;
+}
+
+static inline int fcntl_getlease(struct file *filp)
+{
+=09return F_UNLCK;
+}
+
+static inline void
+locks_free_lock_context(struct inode *inode)
+{
+}
+
+static inline void locks_init_lock(struct file_lock *fl)
+{
+=09return;
+}
+
+static inline void locks_copy_conflock(struct file_lock *new, struct file_=
lock *fl)
+{
+=09return;
+}
+
+static inline void locks_copy_lock(struct file_lock *new, struct file_lock=
 *fl)
+{
+=09return;
+}
+
+static inline void locks_remove_posix(struct file *filp, fl_owner_t owner)
+{
+=09return;
+}
+
+static inline void locks_remove_file(struct file *filp)
+{
+=09return;
+}
+
+static inline void posix_test_lock(struct file *filp, struct file_lock *fl=
)
+{
+=09return;
+}
+
+static inline int posix_lock_file(struct file *filp, struct file_lock *fl,
+=09=09=09=09  struct file_lock *conflock)
+{
+=09return -ENOLCK;
+}
+
+static inline int locks_delete_block(struct file_lock *waiter)
+{
+=09return -ENOENT;
+}
+
+static inline int vfs_test_lock(struct file *filp, struct file_lock *fl)
+{
+=09return 0;
+}
+
+static inline int vfs_lock_file(struct file *filp, unsigned int cmd,
+=09=09=09=09struct file_lock *fl, struct file_lock *conf)
+{
+=09return -ENOLCK;
+}
+
+static inline int vfs_cancel_lock(struct file *filp, struct file_lock *fl)
+{
+=09return 0;
+}
+
+static inline bool vfs_inode_has_locks(struct inode *inode)
+{
+=09return false;
+}
+
+static inline int locks_lock_inode_wait(struct inode *inode, struct file_l=
ock *fl)
+{
+=09return -ENOLCK;
+}
+
+static inline int __break_lease(struct inode *inode, unsigned int mode, un=
signed int type)
+{
+=09return 0;
+}
+
+static inline void lease_get_mtime(struct inode *inode,
+=09=09=09=09   struct timespec64 *time)
+{
+=09return;
+}
+
+static inline int generic_setlease(struct file *filp, long arg,
+=09=09=09=09    struct file_lock **flp, void **priv)
+{
+=09return -EINVAL;
+}
+
+static inline int vfs_setlease(struct file *filp, long arg,
+=09=09=09       struct file_lock **lease, void **priv)
+{
+=09return -EINVAL;
+}
+
+static inline int lease_modify(struct file_lock *fl, int arg,
+=09=09=09       struct list_head *dispose)
+{
+=09return -EINVAL;
+}
+
+struct files_struct;
+static inline void show_fd_locks(struct seq_file *f,
+=09=09=09struct file *filp, struct files_struct *files) {}
+static inline bool locks_owner_has_blockers(struct file_lock_context *flct=
x,
+=09=09=09fl_owner_t owner)
+{
+=09return false;
+}
+
+static inline struct file_lock_context *
+locks_inode_context(const struct inode *inode)
+{
+=09return NULL;
+}
+
+#endif /* !CONFIG_FILE_LOCKING */
+
+static inline int locks_lock_file_wait(struct file *filp, struct file_lock=
 *fl)
+{
+=09return locks_lock_inode_wait(locks_inode(filp), fl);
+}
+
+#ifdef CONFIG_FILE_LOCKING
+static inline int break_lease(struct inode *inode, unsigned int mode)
+{
+=09/*
+=09 * Since this check is lockless, we must ensure that any refcounts
+=09 * taken are done before checking i_flctx->flc_lease. Otherwise, we
+=09 * could end up racing with tasks trying to set a new lease on this
+=09 * file.
+=09 */
+=09smp_mb();
+=09if (inode->i_flctx && !list_empty_careful(&inode->i_flctx->flc_lease))
+=09=09return __break_lease(inode, mode, FL_LEASE);
+=09return 0;
+}
+
+static inline int break_deleg(struct inode *inode, unsigned int mode)
+{
+=09/*
+=09 * Since this check is lockless, we must ensure that any refcounts
+=09 * taken are done before checking i_flctx->flc_lease. Otherwise, we
+=09 * could end up racing with tasks trying to set a new lease on this
+=09 * file.
+=09 */
+=09smp_mb();
+=09if (inode->i_flctx && !list_empty_careful(&inode->i_flctx->flc_lease))
+=09=09return __break_lease(inode, mode, FL_DELEG);
+=09return 0;
+}
+
+static inline int try_break_deleg(struct inode *inode, struct inode **dele=
gated_inode)
+{
+=09int ret;
+
+=09ret =3D break_deleg(inode, O_WRONLY|O_NONBLOCK);
+=09if (ret =3D=3D -EWOULDBLOCK && delegated_inode) {
+=09=09*delegated_inode =3D inode;
+=09=09ihold(inode);
+=09}
+=09return ret;
+}
+
+static inline int break_deleg_wait(struct inode **delegated_inode)
+{
+=09int ret;
+
+=09ret =3D break_deleg(*delegated_inode, O_WRONLY);
+=09iput(*delegated_inode);
+=09*delegated_inode =3D NULL;
+=09return ret;
+}
+
+static inline int break_layout(struct inode *inode, bool wait)
+{
+=09smp_mb();
+=09if (inode->i_flctx && !list_empty_careful(&inode->i_flctx->flc_lease))
+=09=09return __break_lease(inode,
+=09=09=09=09wait ? O_WRONLY : O_WRONLY | O_NONBLOCK,
+=09=09=09=09FL_LAYOUT);
+=09return 0;
+}
+
+#else /* !CONFIG_FILE_LOCKING */
+static inline int break_lease(struct inode *inode, unsigned int mode)
+{
+=09return 0;
+}
+
+static inline int break_deleg(struct inode *inode, unsigned int mode)
+{
+=09return 0;
+}
+
+static inline int try_break_deleg(struct inode *inode, struct inode **dele=
gated_inode)
+{
+=09return 0;
+}
+
+static inline int break_deleg_wait(struct inode **delegated_inode)
+{
+=09BUG();
+=09return 0;
+}
+
+static inline int break_layout(struct inode *inode, bool wait)
+{
+=09return 0;
+}
+
+#endif /* CONFIG_FILE_LOCKING */
+
+#endif /* _LINUX_FILELOCK_H */
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 066555ad1bf8..006278d84d2f 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1003,132 +1003,11 @@ static inline struct file *get_file(struct file *f=
)
 #define MAX_LFS_FILESIZE =09((loff_t)LLONG_MAX)
 #endif
=20
-#define FL_POSIX=091
-#define FL_FLOCK=092
-#define FL_DELEG=094=09/* NFSv4 delegation */
-#define FL_ACCESS=098=09/* not trying to lock, just looking */
-#define FL_EXISTS=0916=09/* when unlocking, test for existence */
-#define FL_LEASE=0932=09/* lease held on this file */
-#define FL_CLOSE=0964=09/* unlock on close */
-#define FL_SLEEP=09128=09/* A blocking lock */
-#define FL_DOWNGRADE_PENDING=09256 /* Lease is being downgraded */
-#define FL_UNLOCK_PENDING=09512 /* Lease is being broken */
-#define FL_OFDLCK=091024=09/* lock is "owned" by struct file */
-#define FL_LAYOUT=092048=09/* outstanding pNFS layout */
-#define FL_RECLAIM=094096=09/* reclaiming from a reboot server */
-
-#define FL_CLOSE_POSIX (FL_POSIX | FL_CLOSE)
-
-/*
- * Special return value from posix_lock_file() and vfs_lock_file() for
- * asynchronous locking.
- */
-#define FILE_LOCK_DEFERRED 1
-
 /* legacy typedef, should eventually be removed */
 typedef void *fl_owner_t;
=20
 struct file_lock;
=20
-struct file_lock_operations {
-=09void (*fl_copy_lock)(struct file_lock *, struct file_lock *);
-=09void (*fl_release_private)(struct file_lock *);
-};
-
-struct lock_manager_operations {
-=09void *lm_mod_owner;
-=09fl_owner_t (*lm_get_owner)(fl_owner_t);
-=09void (*lm_put_owner)(fl_owner_t);
-=09void (*lm_notify)(struct file_lock *);=09/* unblock callback */
-=09int (*lm_grant)(struct file_lock *, int);
-=09bool (*lm_break)(struct file_lock *);
-=09int (*lm_change)(struct file_lock *, int, struct list_head *);
-=09void (*lm_setup)(struct file_lock *, void **);
-=09bool (*lm_breaker_owns_lease)(struct file_lock *);
-=09bool (*lm_lock_expirable)(struct file_lock *cfl);
-=09void (*lm_expire_lock)(void);
-};
-
-struct lock_manager {
-=09struct list_head list;
-=09/*
-=09 * NFSv4 and up also want opens blocked during the grace period;
-=09 * NLM doesn't care:
-=09 */
-=09bool block_opens;
-};
-
-struct net;
-void locks_start_grace(struct net *, struct lock_manager *);
-void locks_end_grace(struct lock_manager *);
-bool locks_in_grace(struct net *);
-bool opens_in_grace(struct net *);
-
-/* that will die - we need it for nfs_lock_info */
-#include <linux/nfs_fs_i.h>
-
-/*
- * struct file_lock represents a generic "file lock". It's used to represe=
nt
- * POSIX byte range locks, BSD (flock) locks, and leases. It's important t=
o
- * note that the same struct is used to represent both a request for a loc=
k and
- * the lock itself, but the same object is never used for both.
- *
- * FIXME: should we create a separate "struct lock_request" to help distin=
guish
- * these two uses?
- *
- * The varous i_flctx lists are ordered by:
- *
- * 1) lock owner
- * 2) lock range start
- * 3) lock range end
- *
- * Obviously, the last two criteria only matter for POSIX locks.
- */
-struct file_lock {
-=09struct file_lock *fl_blocker;=09/* The lock, that is blocking us */
-=09struct list_head fl_list;=09/* link into file_lock_context */
-=09struct hlist_node fl_link;=09/* node in global lists */
-=09struct list_head fl_blocked_requests;=09/* list of requests with
-=09=09=09=09=09=09 * ->fl_blocker pointing here
-=09=09=09=09=09=09 */
-=09struct list_head fl_blocked_member;=09/* node in
-=09=09=09=09=09=09 * ->fl_blocker->fl_blocked_requests
-=09=09=09=09=09=09 */
-=09fl_owner_t fl_owner;
-=09unsigned int fl_flags;
-=09unsigned char fl_type;
-=09unsigned int fl_pid;
-=09int fl_link_cpu;=09=09/* what cpu's list is this on? */
-=09wait_queue_head_t fl_wait;
-=09struct file *fl_file;
-=09loff_t fl_start;
-=09loff_t fl_end;
-
-=09struct fasync_struct *=09fl_fasync; /* for lease break notifications */
-=09/* for lease breaks: */
-=09unsigned long fl_break_time;
-=09unsigned long fl_downgrade_time;
-
-=09const struct file_lock_operations *fl_ops;=09/* Callbacks for filesyste=
ms */
-=09const struct lock_manager_operations *fl_lmops;=09/* Callbacks for lock=
managers */
-=09union {
-=09=09struct nfs_lock_info=09nfs_fl;
-=09=09struct nfs4_lock_info=09nfs4_fl;
-=09=09struct {
-=09=09=09struct list_head link;=09/* link in AFS vnode's pending_locks lis=
t */
-=09=09=09int state;=09=09/* state of grant or error if -ve */
-=09=09=09unsigned int=09debug_id;
-=09=09} afs;
-=09} fl_u;
-} __randomize_layout;
-
-struct file_lock_context {
-=09spinlock_t=09=09flc_lock;
-=09struct list_head=09flc_flock;
-=09struct list_head=09flc_posix;
-=09struct list_head=09flc_lease;
-};
-
 /* The following constant reflects the upper bound of the file/locking spa=
ce */
 #ifndef OFFSET_MAX
 #define OFFSET_MAX=09type_max(loff_t)
@@ -1137,216 +1016,6 @@ struct file_lock_context {
=20
 extern void send_sigio(struct fown_struct *fown, int fd, int band);
=20
-#define locks_inode(f) file_inode(f)
-
-#ifdef CONFIG_FILE_LOCKING
-extern int fcntl_getlk(struct file *, unsigned int, struct flock *);
-extern int fcntl_setlk(unsigned int, struct file *, unsigned int,
-=09=09=09struct flock *);
-
-#if BITS_PER_LONG =3D=3D 32
-extern int fcntl_getlk64(struct file *, unsigned int, struct flock64 *);
-extern int fcntl_setlk64(unsigned int, struct file *, unsigned int,
-=09=09=09struct flock64 *);
-#endif
-
-extern int fcntl_setlease(unsigned int fd, struct file *filp, long arg);
-extern int fcntl_getlease(struct file *filp);
-
-/* fs/locks.c */
-void locks_free_lock_context(struct inode *inode);
-void locks_free_lock(struct file_lock *fl);
-extern void locks_init_lock(struct file_lock *);
-extern struct file_lock * locks_alloc_lock(void);
-extern void locks_copy_lock(struct file_lock *, struct file_lock *);
-extern void locks_copy_conflock(struct file_lock *, struct file_lock *);
-extern void locks_remove_posix(struct file *, fl_owner_t);
-extern void locks_remove_file(struct file *);
-extern void locks_release_private(struct file_lock *);
-extern void posix_test_lock(struct file *, struct file_lock *);
-extern int posix_lock_file(struct file *, struct file_lock *, struct file_=
lock *);
-extern int locks_delete_block(struct file_lock *);
-extern int vfs_test_lock(struct file *, struct file_lock *);
-extern int vfs_lock_file(struct file *, unsigned int, struct file_lock *, =
struct file_lock *);
-extern int vfs_cancel_lock(struct file *filp, struct file_lock *fl);
-bool vfs_inode_has_locks(struct inode *inode);
-extern int locks_lock_inode_wait(struct inode *inode, struct file_lock *fl=
);
-extern int __break_lease(struct inode *inode, unsigned int flags, unsigned=
 int type);
-extern void lease_get_mtime(struct inode *, struct timespec64 *time);
-extern int generic_setlease(struct file *, long, struct file_lock **, void=
 **priv);
-extern int vfs_setlease(struct file *, long, struct file_lock **, void **)=
;
-extern int lease_modify(struct file_lock *, int, struct list_head *);
-
-struct notifier_block;
-extern int lease_register_notifier(struct notifier_block *);
-extern void lease_unregister_notifier(struct notifier_block *);
-
-struct files_struct;
-extern void show_fd_locks(struct seq_file *f,
-=09=09=09 struct file *filp, struct files_struct *files);
-extern bool locks_owner_has_blockers(struct file_lock_context *flctx,
-=09=09=09fl_owner_t owner);
-
-static inline struct file_lock_context *
-locks_inode_context(const struct inode *inode)
-{
-=09return smp_load_acquire(&inode->i_flctx);
-}
-
-#else /* !CONFIG_FILE_LOCKING */
-static inline int fcntl_getlk(struct file *file, unsigned int cmd,
-=09=09=09      struct flock __user *user)
-{
-=09return -EINVAL;
-}
-
-static inline int fcntl_setlk(unsigned int fd, struct file *file,
-=09=09=09      unsigned int cmd, struct flock __user *user)
-{
-=09return -EACCES;
-}
-
-#if BITS_PER_LONG =3D=3D 32
-static inline int fcntl_getlk64(struct file *file, unsigned int cmd,
-=09=09=09=09struct flock64 *user)
-{
-=09return -EINVAL;
-}
-
-static inline int fcntl_setlk64(unsigned int fd, struct file *file,
-=09=09=09=09unsigned int cmd, struct flock64 *user)
-{
-=09return -EACCES;
-}
-#endif
-static inline int fcntl_setlease(unsigned int fd, struct file *filp, long =
arg)
-{
-=09return -EINVAL;
-}
-
-static inline int fcntl_getlease(struct file *filp)
-{
-=09return F_UNLCK;
-}
-
-static inline void
-locks_free_lock_context(struct inode *inode)
-{
-}
-
-static inline void locks_init_lock(struct file_lock *fl)
-{
-=09return;
-}
-
-static inline void locks_copy_conflock(struct file_lock *new, struct file_=
lock *fl)
-{
-=09return;
-}
-
-static inline void locks_copy_lock(struct file_lock *new, struct file_lock=
 *fl)
-{
-=09return;
-}
-
-static inline void locks_remove_posix(struct file *filp, fl_owner_t owner)
-{
-=09return;
-}
-
-static inline void locks_remove_file(struct file *filp)
-{
-=09return;
-}
-
-static inline void posix_test_lock(struct file *filp, struct file_lock *fl=
)
-{
-=09return;
-}
-
-static inline int posix_lock_file(struct file *filp, struct file_lock *fl,
-=09=09=09=09  struct file_lock *conflock)
-{
-=09return -ENOLCK;
-}
-
-static inline int locks_delete_block(struct file_lock *waiter)
-{
-=09return -ENOENT;
-}
-
-static inline int vfs_test_lock(struct file *filp, struct file_lock *fl)
-{
-=09return 0;
-}
-
-static inline int vfs_lock_file(struct file *filp, unsigned int cmd,
-=09=09=09=09struct file_lock *fl, struct file_lock *conf)
-{
-=09return -ENOLCK;
-}
-
-static inline int vfs_cancel_lock(struct file *filp, struct file_lock *fl)
-{
-=09return 0;
-}
-
-static inline bool vfs_inode_has_locks(struct inode *inode)
-{
-=09return false;
-}
-
-static inline int locks_lock_inode_wait(struct inode *inode, struct file_l=
ock *fl)
-{
-=09return -ENOLCK;
-}
-
-static inline int __break_lease(struct inode *inode, unsigned int mode, un=
signed int type)
-{
-=09return 0;
-}
-
-static inline void lease_get_mtime(struct inode *inode,
-=09=09=09=09   struct timespec64 *time)
-{
-=09return;
-}
-
-static inline int generic_setlease(struct file *filp, long arg,
-=09=09=09=09    struct file_lock **flp, void **priv)
-{
-=09return -EINVAL;
-}
-
-static inline int vfs_setlease(struct file *filp, long arg,
-=09=09=09       struct file_lock **lease, void **priv)
-{
-=09return -EINVAL;
-}
-
-static inline int lease_modify(struct file_lock *fl, int arg,
-=09=09=09       struct list_head *dispose)
-{
-=09return -EINVAL;
-}
-
-struct files_struct;
-static inline void show_fd_locks(struct seq_file *f,
-=09=09=09struct file *filp, struct files_struct *files) {}
-static inline bool locks_owner_has_blockers(struct file_lock_context *flct=
x,
-=09=09=09fl_owner_t owner)
-{
-=09return false;
-}
-
-static inline struct file_lock_context *
-locks_inode_context(const struct inode *inode)
-{
-=09return NULL;
-}
-
-#endif /* !CONFIG_FILE_LOCKING */
-
 static inline struct inode *file_inode(const struct file *f)
 {
 =09return f->f_inode;
@@ -1357,11 +1026,6 @@ static inline struct dentry *file_dentry(const struc=
t file *file)
 =09return d_real(file->f_path.dentry, file_inode(file));
 }
=20
-static inline int locks_lock_file_wait(struct file *filp, struct file_lock=
 *fl)
-{
-=09return locks_lock_inode_wait(locks_inode(filp), fl);
-}
-
 struct fasync_struct {
 =09rwlock_t=09=09fa_lock;
 =09int=09=09=09magic;
@@ -2621,96 +2285,6 @@ extern struct kobject *fs_kobj;
=20
 #define MAX_RW_COUNT (INT_MAX & PAGE_MASK)
=20
-#ifdef CONFIG_FILE_LOCKING
-static inline int break_lease(struct inode *inode, unsigned int mode)
-{
-=09/*
-=09 * Since this check is lockless, we must ensure that any refcounts
-=09 * taken are done before checking i_flctx->flc_lease. Otherwise, we
-=09 * could end up racing with tasks trying to set a new lease on this
-=09 * file.
-=09 */
-=09smp_mb();
-=09if (inode->i_flctx && !list_empty_careful(&inode->i_flctx->flc_lease))
-=09=09return __break_lease(inode, mode, FL_LEASE);
-=09return 0;
-}
-
-static inline int break_deleg(struct inode *inode, unsigned int mode)
-{
-=09/*
-=09 * Since this check is lockless, we must ensure that any refcounts
-=09 * taken are done before checking i_flctx->flc_lease. Otherwise, we
-=09 * could end up racing with tasks trying to set a new lease on this
-=09 * file.
-=09 */
-=09smp_mb();
-=09if (inode->i_flctx && !list_empty_careful(&inode->i_flctx->flc_lease))
-=09=09return __break_lease(inode, mode, FL_DELEG);
-=09return 0;
-}
-
-static inline int try_break_deleg(struct inode *inode, struct inode **dele=
gated_inode)
-{
-=09int ret;
-
-=09ret =3D break_deleg(inode, O_WRONLY|O_NONBLOCK);
-=09if (ret =3D=3D -EWOULDBLOCK && delegated_inode) {
-=09=09*delegated_inode =3D inode;
-=09=09ihold(inode);
-=09}
-=09return ret;
-}
-
-static inline int break_deleg_wait(struct inode **delegated_inode)
-{
-=09int ret;
-
-=09ret =3D break_deleg(*delegated_inode, O_WRONLY);
-=09iput(*delegated_inode);
-=09*delegated_inode =3D NULL;
-=09return ret;
-}
-
-static inline int break_layout(struct inode *inode, bool wait)
-{
-=09smp_mb();
-=09if (inode->i_flctx && !list_empty_careful(&inode->i_flctx->flc_lease))
-=09=09return __break_lease(inode,
-=09=09=09=09wait ? O_WRONLY : O_WRONLY | O_NONBLOCK,
-=09=09=09=09FL_LAYOUT);
-=09return 0;
-}
-
-#else /* !CONFIG_FILE_LOCKING */
-static inline int break_lease(struct inode *inode, unsigned int mode)
-{
-=09return 0;
-}
-
-static inline int break_deleg(struct inode *inode, unsigned int mode)
-{
-=09return 0;
-}
-
-static inline int try_break_deleg(struct inode *inode, struct inode **dele=
gated_inode)
-{
-=09return 0;
-}
-
-static inline int break_deleg_wait(struct inode **delegated_inode)
-{
-=09BUG();
-=09return 0;
-}
-
-static inline int break_layout(struct inode *inode, bool wait)
-{
-=09return 0;
-}
-
-#endif /* CONFIG_FILE_LOCKING */
-
 /* fs/open.c */
 struct audit_names;
 struct filename {
diff --git a/include/linux/lockd/xdr.h b/include/linux/lockd/xdr.h
index 67e4a2c5500b..b60fbcd8cdfa 100644
--- a/include/linux/lockd/xdr.h
+++ b/include/linux/lockd/xdr.h
@@ -11,6 +11,7 @@
 #define LOCKD_XDR_H
=20
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/nfs.h>
 #include <linux/sunrpc/xdr.h>
=20
--=20
2.39.0

