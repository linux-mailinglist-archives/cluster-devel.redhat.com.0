Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFA5752DFD
	for <lists+cluster-devel@lfdr.de>; Fri, 14 Jul 2023 01:32:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689291141;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B/0oagySbS3Ifk2UJ6Hmx4LuRWkoKIToXNE7lkONKcc=;
	b=EsqTW/qbRzgIiW8quvtIa9aK+tBsCdt4EyMquaNxO2iKKe/QrL+SriqVlsTjNC/XmHHfkK
	MW2zRhpdRXZn8hzg9WYd+km3fvF274VMRc+pAEtNt5E+vkfklQrNYQ43XWeJS/z5i0+sWl
	abJeNJc1WjKRWnLvxBCZPH5GNusOETk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-YoWSxEW6OtOmA1UjoCfs0A-1; Thu, 13 Jul 2023 19:32:13 -0400
X-MC-Unique: YoWSxEW6OtOmA1UjoCfs0A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5314E185A793;
	Thu, 13 Jul 2023 23:32:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46186492B01;
	Thu, 13 Jul 2023 23:32:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 045D619465A2;
	Thu, 13 Jul 2023 23:32:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BF5B51946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 23:01:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AEA36492B03; Thu, 13 Jul 2023 23:01:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3E91492B01
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 23:01:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68B6D87322F
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 23:01:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-VDJ2YOgENX2r2MZdIwcitw-1; Thu, 13 Jul 2023 19:01:23 -0400
X-MC-Unique: VDJ2YOgENX2r2MZdIwcitw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D8C461AD2;
 Thu, 13 Jul 2023 23:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB019C433B6;
 Thu, 13 Jul 2023 23:01:15 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 13 Jul 2023 19:00:51 -0400
MIME-Version: 1.0
Message-Id: <20230713-mgctime-v5-2-9eb795d2ae37@kernel.org>
References: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
In-Reply-To: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
To: Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, 
 coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg <lsahlber@redhat.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=12090; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Dy0ObexSdjvGFnE5GNrBxiftdRymvhQ5lbJx72BKffY=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBksIIuQ6/aMqdFkrW889tZd28XDGD/NKP3ZyaCk
 jSGPEQm+rOJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZLCCLgAKCRAADmhBGVaC
 Fa3EEACPAYF/UdPqY2NWkaVzk8H/NAcHUW/hPvIS9vjNZruwFmXFj/LYyMvcp0tofMwLRgMcCAE
 Vph+wO/c807cLy5llDvTlTm0TjzPef3az0VN3Q8Gzb/2Nnh81yJnaQqOzRwFI1Dobw4ieNMzoU6
 4toolNwW0tdDD7IU/urQP+4n7wFZT9iHmcto7q5Ef6rFla5COdzyRUSOPKFltzFKgjBiF2ZUbi1
 9rPgV9imtCZWp7fH8mkRIVmoRaIrx24GtSlBnp/pBU+0KzjVNXDvvnegezzxutC4fSPJuW2h5pZ
 PiakxgsAa14RATd/5YXrIc+yNNZfeC0pRUmGgHOGL10njpjBp7Vo0nCcxoKc1I2kDO9N0tnniRi
 QyijUzdhFi4tOGbKQFjGi7GTuQekgkvLj3T2CiHuUcXH4phso83iPzj97egR0thkirGb6Cvv/CY
 uy76MlvwYeCIYaBQkk7dZtQOpLjIjI239VoHsf8OgmrImV9FVxAoJ4yB0PhSCnXl1crVKzEUphQ
 eemlORwSpndKSNmSnOacohNIRXM4Mqzq1NZM/oJVsRkcHkTc2M6q3C/agLX+m3kKOnc5xOjo8Cm
 Oq7V4ramHqhM83+/svEq1p6QVyO5KLsFUjSv20Q208e+yhCjvDrQ7s4NNP/Yqb8o/hZn8Clw7W2
 cnsnAuyIF+Bo72A==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH v5 2/8] fs: add infrastructure for
 multigrain timestamps
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
Cc: Jeff Layton <jlayton@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The VFS always uses coarse-grained timestamps when updating the ctime
and mtime after a change. This has the benefit of allowing filesystems
to optimize away a lot metadata updates, down to around 1 per jiffy,
even when a file is under heavy writes.

Unfortunately, this has always been an issue when we're exporting via
NFSv3, which relies on timestamps to validate caches. A lot of changes
can happen in a jiffy, so timestamps aren't sufficient to help the
client decide to invalidate the cache. Even with NFSv4, a lot of
exported filesystems don't properly support a change attribute and are
subject to the same problems with timestamp granularity. Other
applications have similar issues with timestamps (e.g backup
applications).

If we were to always use fine-grained timestamps, that would improve the
situation, but that becomes rather expensive, as the underlying
filesystem would have to log a lot more metadata updates.

What we need is a way to only use fine-grained timestamps when they are
being actively queried.

POSIX generally mandates that when the the mtime changes, the ctime must
also change. The kernel always stores normalized ctime values, so only
the first 30 bits of the tv_nsec field are ever used.

Use the 31st bit of the ctime tv_nsec field to indicate that something
has queried the inode for the mtime or ctime. When this flag is set,
on the next mtime or ctime update, the kernel will fetch a fine-grained
timestamp instead of the usual coarse-grained one.

Filesytems can opt into this behavior by setting the FS_MGTIME flag in
the fstype. Filesystems that don't set this flag will continue to use
coarse-grained timestamps.

Later patches will convert individual filesystems to use the new
infrastructure.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/inode.c         | 98 ++++++++++++++++++++++++++++++++++++++----------------
 fs/stat.c          | 41 +++++++++++++++++++++--
 include/linux/fs.h | 45 +++++++++++++++++++++++--
 3 files changed, 151 insertions(+), 33 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index d4ab92233062..369621e7faf5 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1919,6 +1919,21 @@ int inode_update_time(struct inode *inode, struct timespec64 *time, int flags)
 }
 EXPORT_SYMBOL(inode_update_time);
 
+/**
+ * current_coarse_time - Return FS time
+ * @inode: inode.
+ *
+ * Return the current coarse-grained time truncated to the time
+ * granularity supported by the fs.
+ */
+static struct timespec64 current_coarse_time(struct inode *inode)
+{
+	struct timespec64 now;
+
+	ktime_get_coarse_real_ts64(&now);
+	return timestamp_truncate(now, inode);
+}
+
 /**
  *	atime_needs_update	-	update the access time
  *	@path: the &struct path to update
@@ -1952,7 +1967,7 @@ bool atime_needs_update(const struct path *path, struct inode *inode)
 	if ((mnt->mnt_flags & MNT_NODIRATIME) && S_ISDIR(inode->i_mode))
 		return false;
 
-	now = current_time(inode);
+	now = current_coarse_time(inode);
 
 	if (!relatime_need_update(mnt, inode, now))
 		return false;
@@ -1986,7 +2001,7 @@ void touch_atime(const struct path *path)
 	 * We may also fail on filesystems that have the ability to make parts
 	 * of the fs read only, e.g. subvolumes in Btrfs.
 	 */
-	now = current_time(inode);
+	now = current_coarse_time(inode);
 	inode_update_time(inode, &now, S_ATIME);
 	__mnt_drop_write(mnt);
 skip_update:
@@ -2072,6 +2087,56 @@ int file_remove_privs(struct file *file)
 }
 EXPORT_SYMBOL(file_remove_privs);
 
+/**
+ * current_mgtime - Return FS time (possibly fine-grained)
+ * @inode: inode.
+ *
+ * Return the current time truncated to the time granularity supported by
+ * the fs, as suitable for a ctime/mtime change. If the ctime is flagged
+ * as having been QUERIED, get a fine-grained timestamp.
+ */
+static struct timespec64 current_mgtime(struct inode *inode)
+{
+	struct timespec64 now;
+	atomic_long_t *pnsec = (atomic_long_t *)&inode->__i_ctime.tv_nsec;
+	long nsec = atomic_long_read(pnsec);
+
+	if (nsec & I_CTIME_QUERIED) {
+		ktime_get_real_ts64(&now);
+	} else {
+		struct timespec64 ctime;
+
+		ktime_get_coarse_real_ts64(&now);
+
+		/*
+		 * If we've recently fetched a fine-grained timestamp
+		 * then the coarse-grained one may still be earlier than the
+		 * existing one. Just keep the existing ctime if so.
+		 */
+		ctime = inode_get_ctime(inode);
+		if (timespec64_compare(&ctime, &now) > 0)
+			now = ctime;
+	}
+
+	return timestamp_truncate(now, inode);
+}
+
+/**
+ * current_time - Return timestamp suitable for ctime update
+ * @inode: inode to eventually be updated
+ *
+ * Return the current time, which is usually coarse-grained but may be fine
+ * grained if the filesystem uses multigrain timestamps and the existing
+ * ctime was queried since the last update.
+ */
+struct timespec64 current_time(struct inode *inode)
+{
+	if (is_mgtime(inode))
+		return current_mgtime(inode);
+	return current_coarse_time(inode);
+}
+EXPORT_SYMBOL(current_time);
+
 static int inode_needs_update_time(struct inode *inode, struct timespec64 *now)
 {
 	int sync_it = 0;
@@ -2480,37 +2545,12 @@ struct timespec64 timestamp_truncate(struct timespec64 t, struct inode *inode)
 }
 EXPORT_SYMBOL(timestamp_truncate);
 
-/**
- * current_time - Return FS time
- * @inode: inode.
- *
- * Return the current time truncated to the time granularity supported by
- * the fs.
- *
- * Note that inode and inode->sb cannot be NULL.
- * Otherwise, the function warns and returns time without truncation.
- */
-struct timespec64 current_time(struct inode *inode)
-{
-	struct timespec64 now;
-
-	ktime_get_coarse_real_ts64(&now);
-
-	if (unlikely(!inode->i_sb)) {
-		WARN(1, "current_time() called with uninitialized super_block in the inode");
-		return now;
-	}
-
-	return timestamp_truncate(now, inode);
-}
-EXPORT_SYMBOL(current_time);
-
 /**
  * inode_set_ctime_current - set the ctime to current_time
  * @inode: inode
  *
- * Set the inode->i_ctime to the current value for the inode. Returns
- * the current value that was assigned to i_ctime.
+ * Set the inode->__i_ctime to the current value for the inode. Returns
+ * the current value that was assigned to __i_ctime.
  */
 struct timespec64 inode_set_ctime_current(struct inode *inode)
 {
diff --git a/fs/stat.c b/fs/stat.c
index 062f311b5386..51effd1c2bc2 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -26,6 +26,37 @@
 #include "internal.h"
 #include "mount.h"
 
+/**
+ * fill_mg_cmtime - Fill in the mtime and ctime and flag ctime as QUERIED
+ * @request_mask: STATX_* values requested
+ * @inode: inode from which to grab the c/mtime
+ * @stat: where to store the resulting values
+ *
+ * Given @inode, grab the ctime and mtime out if it and store the result
+ * in @stat. When fetching the value, flag it as queried so the next write
+ * will use a fine-grained timestamp.
+ */
+void fill_mg_cmtime(u32 request_mask, struct inode *inode, struct kstat *stat)
+{
+	atomic_long_t *pnsec = (atomic_long_t *)&inode->__i_ctime.tv_nsec;
+
+	/* If neither time was requested, then don't report them */
+	if (!(request_mask & (STATX_CTIME|STATX_MTIME))) {
+		stat->result_mask &= ~(STATX_CTIME|STATX_MTIME);
+		return;
+	}
+
+	stat->mtime = inode->i_mtime;
+	stat->ctime.tv_sec = inode->__i_ctime.tv_sec;
+	/*
+	 * Atomically set the QUERIED flag and fetch the new value with
+	 * the flag masked off.
+	 */
+	stat->ctime.tv_nsec = atomic_long_fetch_or(I_CTIME_QUERIED, pnsec) &
+					~I_CTIME_QUERIED;
+}
+EXPORT_SYMBOL(fill_mg_cmtime);
+
 /**
  * generic_fillattr - Fill in the basic attributes from the inode struct
  * @idmap:	idmap of the mount the inode was found from
@@ -58,8 +89,14 @@ void generic_fillattr(struct mnt_idmap *idmap, u32 request_mask,
 	stat->rdev = inode->i_rdev;
 	stat->size = i_size_read(inode);
 	stat->atime = inode->i_atime;
-	stat->mtime = inode->i_mtime;
-	stat->ctime = inode_get_ctime(inode);
+
+	if (is_mgtime(inode)) {
+		fill_mg_cmtime(request_mask, inode, stat);
+	} else {
+		stat->mtime = inode->i_mtime;
+		stat->ctime = inode_get_ctime(inode);
+	}
+
 	stat->blksize = i_blocksize(inode);
 	stat->blocks = inode->i_blocks;
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 42d1434cc427..a0bdbefbf293 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1477,15 +1477,43 @@ static inline bool fsuidgid_has_mapping(struct super_block *sb,
 struct timespec64 current_time(struct inode *inode);
 struct timespec64 inode_set_ctime_current(struct inode *inode);
 
+/*
+ * Multigrain timestamps
+ *
+ * Conditionally use fine-grained ctime and mtime timestamps when there
+ * are users actively observing them via getattr. The primary use-case
+ * for this is NFS clients that use the ctime to distinguish between
+ * different states of the file, and that are often fooled by multiple
+ * operations that occur in the same coarse-grained timer tick.
+ *
+ * The kernel always keeps normalized struct timespec64 values in the ctime,
+ * which means that only the first 30 bits of the value are used. Use the
+ * 31st bit of the ctime's tv_nsec field as a flag to indicate that the value
+ * has been queried since it was last updated.
+ */
+#define I_CTIME_QUERIED		(1L<<30)
+
 /**
  * inode_get_ctime - fetch the current ctime from the inode
  * @inode: inode from which to fetch ctime
  *
- * Grab the current ctime from the inode and return it.
+ * Grab the current ctime tv_nsec field from the inode, mask off the
+ * I_CTIME_QUERIED flag and return it. This is mostly intended for use by
+ * internal consumers of the ctime that aren't concerned with ensuring a
+ * fine-grained update on the next change (e.g. when preparing to store
+ * the value in the backing store for later retrieval).
+ *
+ * This is safe to call regardless of whether the underlying filesystem
+ * is using multigrain timestamps.
  */
 static inline struct timespec64 inode_get_ctime(const struct inode *inode)
 {
-	return inode->__i_ctime;
+	struct timespec64 ctime;
+
+	ctime.tv_sec = inode->__i_ctime.tv_sec;
+	ctime.tv_nsec = inode->__i_ctime.tv_nsec & ~I_CTIME_QUERIED;
+
+	return ctime;
 }
 
 /**
@@ -2261,6 +2289,7 @@ struct file_system_type {
 #define FS_USERNS_MOUNT		8	/* Can be mounted by userns root */
 #define FS_DISALLOW_NOTIFY_PERM	16	/* Disable fanotify permission events */
 #define FS_ALLOW_IDMAP         32      /* FS has been updated to handle vfs idmappings. */
+#define FS_MGTIME		64	/* FS uses multigrain timestamps */
 #define FS_RENAME_DOES_D_MOVE	32768	/* FS will handle d_move() during rename() internally. */
 	int (*init_fs_context)(struct fs_context *);
 	const struct fs_parameter_spec *parameters;
@@ -2284,6 +2313,17 @@ struct file_system_type {
 
 #define MODULE_ALIAS_FS(NAME) MODULE_ALIAS("fs-" NAME)
 
+/**
+ * is_mgtime: is this inode using multigrain timestamps
+ * @inode: inode to test for multigrain timestamps
+ *
+ * Return true if the inode uses multigrain timestamps, false otherwise.
+ */
+static inline bool is_mgtime(const struct inode *inode)
+{
+	return inode->i_sb->s_type->fs_flags & FS_MGTIME;
+}
+
 extern struct dentry *mount_bdev(struct file_system_type *fs_type,
 	int flags, const char *dev_name, void *data,
 	int (*fill_super)(struct super_block *, void *, int));
@@ -2919,6 +2959,7 @@ extern void page_put_link(void *);
 extern int page_symlink(struct inode *inode, const char *symname, int len);
 extern const struct inode_operations page_symlink_inode_operations;
 extern void kfree_link(void *);
+void fill_mg_cmtime(u32 request_mask, struct inode *inode, struct kstat *stat);
 void generic_fillattr(struct mnt_idmap *, u32, struct inode *, struct kstat *);
 void generic_fill_statx_attr(struct inode *inode, struct kstat *stat);
 extern int vfs_getattr_nosec(const struct path *, struct kstat *, u32, unsigned int);

-- 
2.41.0

