Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CFA31EEC22
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Nov 2019 22:54:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572904465;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2uVK3IckmIbWS98ibXuSI7FH0ZGFht6L33LlhlXhfQ0=;
	b=hmioy7ya8rE27wPkyfkLZtOv/q/lDoip2SVpHLQbY+RahMuei89STvuv6XgDMj3xMM6w3Y
	SCBxe2cPcZU2PSrrMhCJ8F5qr/fITlbzAdVMiezTRm5KFS+3WbI2UHw2LEj1e/EV1B9WxE
	OsaurvaqTMwKAClqx2B2rbwSnLwR0m0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-9no9rXI3P4G4gIbXIXUriQ-1; Mon, 04 Nov 2019 16:54:23 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DB5B107ACC2;
	Mon,  4 Nov 2019 21:54:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5608E608AC;
	Mon,  4 Nov 2019 21:54:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 413E918089C8;
	Mon,  4 Nov 2019 21:54:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA4Ls8wI013375 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 4 Nov 2019 16:54:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F27345D6D0; Mon,  4 Nov 2019 21:54:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB6FC5D6C8
	for <cluster-devel@redhat.com>; Mon,  4 Nov 2019 21:54:05 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4332307D84B
	for <cluster-devel@redhat.com>; Mon,  4 Nov 2019 21:54:02 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id k13so1085712pgh.3
	for <cluster-devel@redhat.com>; Mon, 04 Nov 2019 13:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fVe6jHlYQhLX8bRvD2NO1N9P5/RoJrzl3x6s3iEtt1U=;
	b=nf/Wa1/tBVhWsJSNHfkuK3+SLFvEulW9jE0KmFqx1h67dJEt8UkHXFEcHLhFmFFBXW
	OQYqbFl76GGbQWiQG3ytzwidoiFMq8XVV5O3CuL2n4D4yzVZaG9jMxKD2xjzSdwvUK2f
	YkQjn2nY70Kk7FFEzw3mv9DY193+NScj88lytTzWSs5hghYmr9OY3J9U4mEn4l6EBaaa
	LHos25ZSRjQwUwlzIBcJHllctdpJnJXIpLcWHe+QuC8NyhIhAPkw+9rEnDxl61IRIHRI
	dFlh37Gd7cooPVPe6pEes6o1u3r/amhZW2uOpa/9Kztw43r+NIsDraGSRc0UySh5CJCo
	Yk6w==
X-Gm-Message-State: APjAAAUIxWfByfR53biP0eHOrYiP3S1h9mvpGk0o1eMqwr1ECF2GDImz
	GgxlGUi1YXafBTUDhGP7gj6eYA==
X-Google-Smtp-Source: APXvYqzr/xHAuQrLXs93PwogVMR7PYu1ReyXA8g9ljIidTBLDwRU9TdWovu1k/xI57RkdsCBGRmfsw==
X-Received: by 2002:a62:6481:: with SMTP id
	y123mr32322817pfb.181.1572904441818; 
	Mon, 04 Nov 2019 13:54:01 -0800 (PST)
Received: from nebulus.mtv.corp.google.com
	([2620:15c:211:200:5404:91ba:59dc:9400])
	by smtp.gmail.com with ESMTPSA id
	e198sm19231350pfh.83.2019.11.04.13.53.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 13:54:01 -0800 (PST)
From: Mark Salyzyn <salyzyn@android.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  4 Nov 2019 13:52:46 -0800
Message-Id: <20191104215253.141818-2-salyzyn@android.com>
In-Reply-To: <20191104215253.141818-1-salyzyn@android.com>
References: <20191104215253.141818-1-salyzyn@android.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 04 Nov 2019 21:54:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 04 Nov 2019 21:54:03 +0000 (UTC) for IP:'209.85.215.193'
	DOMAIN:'mail-pg1-f193.google.com'
	HELO:'mail-pg1-f193.google.com' FROM:'salyzyn@android.com' RCPT:''
X-RedHat-Spam-Score: -0.121  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.215.193 mail-pg1-f193.google.com 209.85.215.193
	mail-pg1-f193.google.com <salyzyn@android.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
	jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
	linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Artem Bityutskiy <dedekind1@gmail.com>, linux-unionfs@vger.kernel.org,
	David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Eric Paris <eparis@parisplace.org>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	netdev@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
	linux-afs@lists.infradead.org,
	Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
	Sage Weil <sage@redhat.com>, "Darrick J . Wong" <darrick.wong@oracle.com>,
	Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
	Eric Biggers <ebiggers@google.com>, Hugh Dickins <hughd@google.com>,
	James Morris <jmorris@namei.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	cluster-devel@redhat.com, selinux@vger.kernel.org,
	linux-integrity@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Stephen Smalley <sds@tycho.nsa.gov>, linux-mm@kvack.org,
	Mark Salyzyn <salyzyn@google.com>,
	Serge Hallyn <serge@hallyn.com>, ecryptfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@gmail.com>,
	Chao Yu <chao@kernel.org>, linux-erofs@lists.ozlabs.org,
	Josef Bacik <josef@toxicpanda.com>, reiserfs-devel@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-mtd@lists.infradead.org,
	Phillip Lougher <phillip@squashfs.org.uk>, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	devel@lists.orangefs.org, Gao Xiang <xiang@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Paul Moore <paul@paul-moore.com>, linux-nfs@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mathieu Malaterre <malat@debian.org>, kernel-team@android.com,
	Jonathan Corbet <corbet@lwn.net>, Jeff Layton <jlayton@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mark Salyzyn <salyzyn@android.com>, Steve French <sfrench@samba.org>,
	linux-security-module@vger.kernel.org,
	ocfs2-devel@oss.oracle.com, Jan Kara <jack@suse.com>,
	Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [Cluster-devel] [PATCH v15 1/4] Add flags option to get xattr
	method paired to __vfs_getxattr
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 9no9rXI3P4G4gIbXIXUriQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Mark Salyzyn <salyzyn@google.com>

Add a flag option to get xattr method that could have a bit flag of
XATTR_NOSECURITY passed to it.  XATTR_NOSECURITY is generally then
set in the __vfs_getxattr path when called by security
infrastructure.

This handles the case of a union filesystem driver that is being
requested by the security layer to report back the xattr data.

For the use case where access is to be blocked by the security layer.

The path then could be security(dentry) ->
__vfs_getxattr(dentry...XATTR_NOSECURITY) ->
handler->get(dentry...XATTR_NOSECURITY) ->
__vfs_getxattr(lower_dentry...XATTR_NOSECURITY) ->
lower_handler->get(lower_dentry...XATTR_NOSECURITY)
which would report back through the chain data and success as
expected, the logging security layer at the top would have the
data to determine the access permissions and report back the target
context that was blocked.

Without the get handler flag, the path on a union filesystem would be
the errant security(dentry) -> __vfs_getxattr(dentry) ->
handler->get(dentry) -> vfs_getxattr(lower_dentry) -> nested ->
security(lower_dentry, log off) -> lower_handler->get(lower_dentry)
which would report back through the chain no data, and -EACCES.

For selinux for both cases, this would translate to a correctly
determined blocked access. In the first case with this change a correct avc
log would be reported, in the second legacy case an incorrect avc log
would be reported against an uninitialized u:object_r:unlabeled:s0
context making the logs cosmetically useless for audit2allow.

This patch series is inert and is the wide-spread addition of the
flags option for xattr functions, and a replacement of __vfs_getxattr
with __vfs_getxattr(...XATTR_NOSECURITY).

Signed-off-by: Mark Salyzyn <salyzyn@android.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Acked-by: Jan Kara <jack@suse.cz>
Acked-by: Jeff Layton <jlayton@kernel.org>
Acked-by: David Sterba <dsterba@suse.com>
Acked-by: Darrick J. Wong <darrick.wong@oracle.com>
Acked-by: Mike Marshall <hubcap@omnibond.com>
Cc: Stephen Smalley <sds@tycho.nsa.gov>
Cc: linux-kernel@vger.kernel.org
Cc: kernel-team@android.com
Cc: linux-security-module@vger.kernel.org

v15
- revert back to v4 as struct xattr_gs_args was not acceptable by the
  wider audience. Incorporate any relevant fixes on the way.

v14 (new series):
- Reincorporate back into the bugfix series for overlayfs

v8:
- Documentation reported 'struct xattr_gs_flags' rather than
'struct xattr_gs_flags *args' as argument to get and set methods.

v7:
- missed spots in fs/9p/acl.c, fs/afs/xattr.c, fs/ecryptfs/crypto.c,
fs/ubifs/xattr.c, fs/xfs/libxfs/xfs_attr.c,
security/integrity/evm/evm_main.c and security/smack/smack_lsm.c.

v6:
- kernfs missed a spot

v5:
- introduce struct xattr_gs_args for get and set methods,
__vfs_getxattr and __vfs_setxattr functions.
- cover a missing spot in ext2.
- switch from snprintf to scnprintf for correctness.

v4:
- ifdef __KERNEL__ around XATTR_NOSECURITY to
keep it colocated in uapi headers.

v3:
- poor aim on ubifs not ubifs_xattr_get, but static xattr_get

v2:
- Missed a spot: ubifs, erofs and afs.

v1:
- Removed from an overlayfs patch set, and made independent.
  Expect this to be the basis of some security improvements.
---
 Documentation/filesystems/locking.rst |  2 +-
 fs/9p/acl.c                           |  3 ++-
 fs/9p/xattr.c                         |  3 ++-
 fs/afs/xattr.c                        | 26 ++++++++++---------
 fs/btrfs/xattr.c                      |  3 ++-
 fs/ceph/xattr.c                       |  3 ++-
 fs/cifs/xattr.c                       |  2 +-
 fs/ecryptfs/inode.c                   |  6 +++--
 fs/ecryptfs/mmap.c                    |  2 +-
 fs/erofs/xattr.c                      |  3 ++-
 fs/ext2/xattr_security.c              |  2 +-
 fs/ext2/xattr_trusted.c               |  2 +-
 fs/ext2/xattr_user.c                  |  2 +-
 fs/ext4/xattr_security.c              |  2 +-
 fs/ext4/xattr_trusted.c               |  2 +-
 fs/ext4/xattr_user.c                  |  2 +-
 fs/f2fs/xattr.c                       |  4 +--
 fs/fuse/xattr.c                       |  4 +--
 fs/gfs2/xattr.c                       |  3 ++-
 fs/hfs/attr.c                         |  2 +-
 fs/hfsplus/xattr.c                    |  3 ++-
 fs/hfsplus/xattr_security.c           |  3 ++-
 fs/hfsplus/xattr_trusted.c            |  3 ++-
 fs/hfsplus/xattr_user.c               |  3 ++-
 fs/jffs2/security.c                   |  3 ++-
 fs/jffs2/xattr_trusted.c              |  3 ++-
 fs/jffs2/xattr_user.c                 |  3 ++-
 fs/jfs/xattr.c                        |  5 ++--
 fs/kernfs/inode.c                     |  3 ++-
 fs/nfs/nfs4proc.c                     |  6 +++--
 fs/ocfs2/xattr.c                      |  9 ++++---
 fs/orangefs/xattr.c                   |  3 ++-
 fs/overlayfs/super.c                  |  8 +++---
 fs/posix_acl.c                        |  2 +-
 fs/reiserfs/xattr_security.c          |  3 ++-
 fs/reiserfs/xattr_trusted.c           |  3 ++-
 fs/reiserfs/xattr_user.c              |  3 ++-
 fs/squashfs/xattr.c                   |  2 +-
 fs/ubifs/xattr.c                      |  3 ++-
 fs/xattr.c                            | 36 +++++++++++++--------------
 fs/xfs/xfs_xattr.c                    |  3 ++-
 include/linux/xattr.h                 |  9 ++++---
 include/uapi/linux/xattr.h            |  7 ++++--
 mm/shmem.c                            |  3 ++-
 net/socket.c                          |  3 ++-
 security/commoncap.c                  |  6 +++--
 security/integrity/evm/evm_main.c     |  3 ++-
 security/selinux/hooks.c              | 11 +++++---
 security/smack/smack_lsm.c            |  5 ++--
 49 files changed, 140 insertions(+), 95 deletions(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesyst=
ems/locking.rst
index fc3a0704553c..d4798204a5ee 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -125,7 +125,7 @@ prototypes::
 =09bool (*list)(struct dentry *dentry);
 =09int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
 =09=09   struct inode *inode, const char *name, void *buffer,
-=09=09   size_t size);
+=09=09   size_t size, int flags);
 =09int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
 =09=09   struct inode *inode, const char *name, const void *buffer,
 =09=09   size_t size, int flags);
diff --git a/fs/9p/acl.c b/fs/9p/acl.c
index 6261719f6f2a..cb14e8b312bc 100644
--- a/fs/9p/acl.c
+++ b/fs/9p/acl.c
@@ -214,7 +214,8 @@ int v9fs_acl_mode(struct inode *dir, umode_t *modep,
=20
 static int v9fs_xattr_get_acl(const struct xattr_handler *handler,
 =09=09=09      struct dentry *dentry, struct inode *inode,
-=09=09=09      const char *name, void *buffer, size_t size)
+=09=09=09      const char *name, void *buffer, size_t size,
+=09=09=09      int flags)
 {
 =09struct v9fs_session_info *v9ses;
 =09struct posix_acl *acl;
diff --git a/fs/9p/xattr.c b/fs/9p/xattr.c
index ac8ff8ca4c11..5cfa772452fd 100644
--- a/fs/9p/xattr.c
+++ b/fs/9p/xattr.c
@@ -139,7 +139,8 @@ ssize_t v9fs_listxattr(struct dentry *dentry, char *buf=
fer, size_t buffer_size)
=20
 static int v9fs_xattr_handler_get(const struct xattr_handler *handler,
 =09=09=09=09  struct dentry *dentry, struct inode *inode,
-=09=09=09=09  const char *name, void *buffer, size_t size)
+=09=09=09=09  const char *name, void *buffer, size_t size,
+=09=09=09=09  int flags)
 {
 =09const char *full_name =3D xattr_full_name(handler, name);
=20
diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index 5552d034090a..e3a33d742e7f 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -40,7 +40,7 @@ ssize_t afs_listxattr(struct dentry *dentry, char *buffer=
, size_t size)
 static int afs_xattr_get_acl(const struct xattr_handler *handler,
 =09=09=09     struct dentry *dentry,
 =09=09=09     struct inode *inode, const char *name,
-=09=09=09     void *buffer, size_t size)
+=09=09=09     void *buffer, size_t size, int flags)
 {
 =09struct afs_fs_cursor fc;
 =09struct afs_status_cb *scb;
@@ -163,7 +163,7 @@ static const struct xattr_handler afs_xattr_afs_acl_han=
dler =3D {
 static int afs_xattr_get_yfs(const struct xattr_handler *handler,
 =09=09=09     struct dentry *dentry,
 =09=09=09     struct inode *inode, const char *name,
-=09=09=09     void *buffer, size_t size)
+=09=09=09     void *buffer, size_t size, int flags)
 {
 =09struct afs_fs_cursor fc;
 =09struct afs_status_cb *scb;
@@ -228,11 +228,11 @@ static int afs_xattr_get_yfs(const struct xattr_handl=
er *handler,
 =09=09break;
 =09case 1:
 =09=09data =3D buf;
-=09=09dsize =3D snprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
+=09=09dsize =3D scnprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
 =09=09break;
 =09case 2:
 =09=09data =3D buf;
-=09=09dsize =3D snprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
+=09=09dsize =3D scnprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
 =09=09break;
 =09case 3:
 =09=09data =3D yacl->vol_acl->data;
@@ -334,7 +334,7 @@ static const struct xattr_handler afs_xattr_yfs_handler=
 =3D {
 static int afs_xattr_get_cell(const struct xattr_handler *handler,
 =09=09=09      struct dentry *dentry,
 =09=09=09      struct inode *inode, const char *name,
-=09=09=09      void *buffer, size_t size)
+=09=09=09      void *buffer, size_t size, int flags)
 {
 =09struct afs_vnode *vnode =3D AFS_FS_I(inode);
 =09struct afs_cell *cell =3D vnode->volume->cell;
@@ -361,7 +361,7 @@ static const struct xattr_handler afs_xattr_afs_cell_ha=
ndler =3D {
 static int afs_xattr_get_fid(const struct xattr_handler *handler,
 =09=09=09     struct dentry *dentry,
 =09=09=09     struct inode *inode, const char *name,
-=09=09=09     void *buffer, size_t size)
+=09=09=09     void *buffer, size_t size, int flags)
 {
 =09struct afs_vnode *vnode =3D AFS_FS_I(inode);
 =09char text[16 + 1 + 24 + 1 + 8 + 1];
@@ -370,13 +370,15 @@ static int afs_xattr_get_fid(const struct xattr_handl=
er *handler,
 =09/* The volume ID is 64-bit, the vnode ID is 96-bit and the
 =09 * uniquifier is 32-bit.
 =09 */
-=09len =3D sprintf(text, "%llx:", vnode->fid.vid);
+=09len =3D scnprintf(text, sizeof(text), "%llx:", vnode->fid.vid);
 =09if (vnode->fid.vnode_hi)
-=09=09len +=3D sprintf(text + len, "%x%016llx",
-=09=09=09       vnode->fid.vnode_hi, vnode->fid.vnode);
+=09=09len +=3D scnprintf(text + len, sizeof(text) - len, "%x%016llx",
+=09=09=09=09vnode->fid.vnode_hi, vnode->fid.vnode);
 =09else
-=09=09len +=3D sprintf(text + len, "%llx", vnode->fid.vnode);
-=09len +=3D sprintf(text + len, ":%x", vnode->fid.unique);
+=09=09len +=3D scnprintf(text + len, sizeof(text) - len, "%llx",
+=09=09=09=09 vnode->fid.vnode);
+=09len +=3D scnprintf(text + len, sizeof(text) - len, ":%x",
+=09=09=09 vnode->fid.unique);
=20
 =09if (size =3D=3D 0)
 =09=09return len;
@@ -397,7 +399,7 @@ static const struct xattr_handler afs_xattr_afs_fid_han=
dler =3D {
 static int afs_xattr_get_volume(const struct xattr_handler *handler,
 =09=09=09      struct dentry *dentry,
 =09=09=09      struct inode *inode, const char *name,
-=09=09=09      void *buffer, size_t size)
+=09=09=09      void *buffer, size_t size, int flags)
 {
 =09struct afs_vnode *vnode =3D AFS_FS_I(inode);
 =09const char *volname =3D vnode->volume->name;
diff --git a/fs/btrfs/xattr.c b/fs/btrfs/xattr.c
index 95d9aebff2c4..1e522e145344 100644
--- a/fs/btrfs/xattr.c
+++ b/fs/btrfs/xattr.c
@@ -353,7 +353,8 @@ ssize_t btrfs_listxattr(struct dentry *dentry, char *bu=
ffer, size_t size)
=20
 static int btrfs_xattr_handler_get(const struct xattr_handler *handler,
 =09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *name, void *buffer, size_t size)
+=09=09=09=09   const char *name, void *buffer, size_t size,
+=09=09=09=09   int flags)
 {
 =09name =3D xattr_full_name(handler, name);
 =09return btrfs_getxattr(inode, name, buffer, size);
diff --git a/fs/ceph/xattr.c b/fs/ceph/xattr.c
index cb18ee637cb7..a789f1e802b7 100644
--- a/fs/ceph/xattr.c
+++ b/fs/ceph/xattr.c
@@ -1153,7 +1153,8 @@ int __ceph_setxattr(struct inode *inode, const char *=
name,
=20
 static int ceph_get_xattr_handler(const struct xattr_handler *handler,
 =09=09=09=09  struct dentry *dentry, struct inode *inode,
-=09=09=09=09  const char *name, void *value, size_t size)
+=09=09=09=09  const char *name, void *value, size_t size,
+=09=09=09=09  int flags)
 {
 =09if (!ceph_is_valid_xattr(name))
 =09=09return -EOPNOTSUPP;
diff --git a/fs/cifs/xattr.c b/fs/cifs/xattr.c
index db4ba8f6077e..e44e562c46fb 100644
--- a/fs/cifs/xattr.c
+++ b/fs/cifs/xattr.c
@@ -199,7 +199,7 @@ static int cifs_creation_time_get(struct dentry *dentry=
, struct inode *inode,
=20
 static int cifs_xattr_get(const struct xattr_handler *handler,
 =09=09=09  struct dentry *dentry, struct inode *inode,
-=09=09=09  const char *name, void *value, size_t size)
+=09=09=09  const char *name, void *value, size_t size, int flags)
 {
 =09ssize_t rc =3D -EOPNOTSUPP;
 =09unsigned int xid;
diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 18426f4855f1..c710c7533729 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -1018,7 +1018,8 @@ ecryptfs_getxattr_lower(struct dentry *lower_dentry, =
struct inode *lower_inode,
 =09=09goto out;
 =09}
 =09inode_lock(lower_inode);
-=09rc =3D __vfs_getxattr(lower_dentry, lower_inode, name, value, size);
+=09rc =3D __vfs_getxattr(lower_dentry, lower_inode, name, value, size,
+=09=09=09    XATTR_NOSECURITY);
 =09inode_unlock(lower_inode);
 out:
 =09return rc;
@@ -1103,7 +1104,8 @@ const struct inode_operations ecryptfs_main_iops =3D =
{
=20
 static int ecryptfs_xattr_get(const struct xattr_handler *handler,
 =09=09=09      struct dentry *dentry, struct inode *inode,
-=09=09=09      const char *name, void *buffer, size_t size)
+=09=09=09      const char *name, void *buffer, size_t size,
+=09=09=09      int flags)
 {
 =09return ecryptfs_getxattr(dentry, inode, name, buffer, size);
 }
diff --git a/fs/ecryptfs/mmap.c b/fs/ecryptfs/mmap.c
index cffa0c1ec829..2362be3e3b4d 100644
--- a/fs/ecryptfs/mmap.c
+++ b/fs/ecryptfs/mmap.c
@@ -422,7 +422,7 @@ static int ecryptfs_write_inode_size_to_xattr(struct in=
ode *ecryptfs_inode)
 =09}
 =09inode_lock(lower_inode);
 =09size =3D __vfs_getxattr(lower_dentry, lower_inode, ECRYPTFS_XATTR_NAME,
-=09=09=09      xattr_virt, PAGE_SIZE);
+=09=09=09      xattr_virt, PAGE_SIZE, XATTR_NOSECURITY);
 =09if (size < 0)
 =09=09size =3D 8;
 =09put_unaligned_be64(i_size_read(ecryptfs_inode), xattr_virt);
diff --git a/fs/erofs/xattr.c b/fs/erofs/xattr.c
index a13a78725c57..144b1713ebab 100644
--- a/fs/erofs/xattr.c
+++ b/fs/erofs/xattr.c
@@ -463,7 +463,8 @@ int erofs_getxattr(struct inode *inode, int index,
=20
 static int erofs_xattr_generic_get(const struct xattr_handler *handler,
 =09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *name, void *buffer, size_t size)
+=09=09=09=09   const char *name, void *buffer, size_t size,
+=09=09=09=09   int flags)
 {
 =09struct erofs_sb_info *const sbi =3D EROFS_I_SB(inode);
=20
diff --git a/fs/ext2/xattr_security.c b/fs/ext2/xattr_security.c
index 9a682e440acb..d5f6eb0b487b 100644
--- a/fs/ext2/xattr_security.c
+++ b/fs/ext2/xattr_security.c
@@ -11,7 +11,7 @@
 static int
 ext2_xattr_security_get(const struct xattr_handler *handler,
 =09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09const char *name, void *buffer, size_t size)
+=09=09=09const char *name, void *buffer, size_t size, int flags)
 {
 =09return ext2_xattr_get(inode, EXT2_XATTR_INDEX_SECURITY, name,
 =09=09=09      buffer, size);
diff --git a/fs/ext2/xattr_trusted.c b/fs/ext2/xattr_trusted.c
index 49add1107850..8d313664f0fa 100644
--- a/fs/ext2/xattr_trusted.c
+++ b/fs/ext2/xattr_trusted.c
@@ -18,7 +18,7 @@ ext2_xattr_trusted_list(struct dentry *dentry)
 static int
 ext2_xattr_trusted_get(const struct xattr_handler *handler,
 =09=09       struct dentry *unused, struct inode *inode,
-=09=09       const char *name, void *buffer, size_t size)
+=09=09       const char *name, void *buffer, size_t size, int flags)
 {
 =09return ext2_xattr_get(inode, EXT2_XATTR_INDEX_TRUSTED, name,
 =09=09=09      buffer, size);
diff --git a/fs/ext2/xattr_user.c b/fs/ext2/xattr_user.c
index c243a3b4d69d..712b7c95cc64 100644
--- a/fs/ext2/xattr_user.c
+++ b/fs/ext2/xattr_user.c
@@ -20,7 +20,7 @@ ext2_xattr_user_list(struct dentry *dentry)
 static int
 ext2_xattr_user_get(const struct xattr_handler *handler,
 =09=09    struct dentry *unused, struct inode *inode,
-=09=09    const char *name, void *buffer, size_t size)
+=09=09    const char *name, void *buffer, size_t size, int flags)
 {
 =09if (!test_opt(inode->i_sb, XATTR_USER))
 =09=09return -EOPNOTSUPP;
diff --git a/fs/ext4/xattr_security.c b/fs/ext4/xattr_security.c
index 197a9d8a15ef..50fb71393fb6 100644
--- a/fs/ext4/xattr_security.c
+++ b/fs/ext4/xattr_security.c
@@ -15,7 +15,7 @@
 static int
 ext4_xattr_security_get(const struct xattr_handler *handler,
 =09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09const char *name, void *buffer, size_t size)
+=09=09=09const char *name, void *buffer, size_t size, int flags)
 {
 =09return ext4_xattr_get(inode, EXT4_XATTR_INDEX_SECURITY,
 =09=09=09      name, buffer, size);
diff --git a/fs/ext4/xattr_trusted.c b/fs/ext4/xattr_trusted.c
index e9389e5d75c3..64bd8f86c1f1 100644
--- a/fs/ext4/xattr_trusted.c
+++ b/fs/ext4/xattr_trusted.c
@@ -22,7 +22,7 @@ ext4_xattr_trusted_list(struct dentry *dentry)
 static int
 ext4_xattr_trusted_get(const struct xattr_handler *handler,
 =09=09       struct dentry *unused, struct inode *inode,
-=09=09       const char *name, void *buffer, size_t size)
+=09=09       const char *name, void *buffer, size_t size, int flags)
 {
 =09return ext4_xattr_get(inode, EXT4_XATTR_INDEX_TRUSTED,
 =09=09=09      name, buffer, size);
diff --git a/fs/ext4/xattr_user.c b/fs/ext4/xattr_user.c
index d4546184b34b..b7301373820e 100644
--- a/fs/ext4/xattr_user.c
+++ b/fs/ext4/xattr_user.c
@@ -21,7 +21,7 @@ ext4_xattr_user_list(struct dentry *dentry)
 static int
 ext4_xattr_user_get(const struct xattr_handler *handler,
 =09=09    struct dentry *unused, struct inode *inode,
-=09=09    const char *name, void *buffer, size_t size)
+=09=09    const char *name, void *buffer, size_t size, int flags)
 {
 =09if (!test_opt(inode->i_sb, XATTR_USER))
 =09=09return -EOPNOTSUPP;
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 181900af2576..95cfcf1589df 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -25,7 +25,7 @@
=20
 static int f2fs_xattr_generic_get(const struct xattr_handler *handler,
 =09=09struct dentry *unused, struct inode *inode,
-=09=09const char *name, void *buffer, size_t size)
+=09=09const char *name, void *buffer, size_t size, int flags)
 {
 =09struct f2fs_sb_info *sbi =3D F2FS_SB(inode->i_sb);
=20
@@ -80,7 +80,7 @@ static bool f2fs_xattr_trusted_list(struct dentry *dentry=
)
=20
 static int f2fs_xattr_advise_get(const struct xattr_handler *handler,
 =09=09struct dentry *unused, struct inode *inode,
-=09=09const char *name, void *buffer, size_t size)
+=09=09const char *name, void *buffer, size_t size, int flags)
 {
 =09if (buffer)
 =09=09*((char *)buffer) =3D F2FS_I(inode)->i_advise;
diff --git a/fs/fuse/xattr.c b/fs/fuse/xattr.c
index 20d052e08b3b..414718a51c25 100644
--- a/fs/fuse/xattr.c
+++ b/fs/fuse/xattr.c
@@ -176,7 +176,7 @@ int fuse_removexattr(struct inode *inode, const char *n=
ame)
=20
 static int fuse_xattr_get(const struct xattr_handler *handler,
 =09=09=09 struct dentry *dentry, struct inode *inode,
-=09=09=09 const char *name, void *value, size_t size)
+=09=09=09 const char *name, void *value, size_t size, int flags)
 {
 =09return fuse_getxattr(inode, name, value, size);
 }
@@ -199,7 +199,7 @@ static bool no_xattr_list(struct dentry *dentry)
=20
 static int no_xattr_get(const struct xattr_handler *handler,
 =09=09=09struct dentry *dentry, struct inode *inode,
-=09=09=09const char *name, void *value, size_t size)
+=09=09=09const char *name, void *value, size_t size, int flags)
 {
 =09return -EOPNOTSUPP;
 }
diff --git a/fs/gfs2/xattr.c b/fs/gfs2/xattr.c
index bbe593d16bea..a9db067a99c1 100644
--- a/fs/gfs2/xattr.c
+++ b/fs/gfs2/xattr.c
@@ -588,7 +588,8 @@ static int __gfs2_xattr_get(struct inode *inode, const =
char *name,
=20
 static int gfs2_xattr_get(const struct xattr_handler *handler,
 =09=09=09  struct dentry *unused, struct inode *inode,
-=09=09=09  const char *name, void *buffer, size_t size)
+=09=09=09  const char *name, void *buffer, size_t size,
+=09=09=09  int flags)
 {
 =09struct gfs2_inode *ip =3D GFS2_I(inode);
 =09struct gfs2_holder gh;
diff --git a/fs/hfs/attr.c b/fs/hfs/attr.c
index 74fa62643136..08222a9c5d31 100644
--- a/fs/hfs/attr.c
+++ b/fs/hfs/attr.c
@@ -115,7 +115,7 @@ static ssize_t __hfs_getxattr(struct inode *inode, enum=
 hfs_xattr_type type,
=20
 static int hfs_xattr_get(const struct xattr_handler *handler,
 =09=09=09 struct dentry *unused, struct inode *inode,
-=09=09=09 const char *name, void *value, size_t size)
+=09=09=09 const char *name, void *value, size_t size, int flags)
 {
 =09return __hfs_getxattr(inode, handler->flags, value, size);
 }
diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
index bb0b27d88e50..381c2aaedbc8 100644
--- a/fs/hfsplus/xattr.c
+++ b/fs/hfsplus/xattr.c
@@ -839,7 +839,8 @@ static int hfsplus_removexattr(struct inode *inode, con=
st char *name)
=20
 static int hfsplus_osx_getxattr(const struct xattr_handler *handler,
 =09=09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09=09const char *name, void *buffer, size_t size)
+=09=09=09=09const char *name, void *buffer, size_t size,
+=09=09=09=09int flags)
 {
 =09/*
 =09 * Don't allow retrieving properly prefixed attributes
diff --git a/fs/hfsplus/xattr_security.c b/fs/hfsplus/xattr_security.c
index cfbe6a3bfb1e..43e28b3a716d 100644
--- a/fs/hfsplus/xattr_security.c
+++ b/fs/hfsplus/xattr_security.c
@@ -15,7 +15,8 @@
=20
 static int hfsplus_security_getxattr(const struct xattr_handler *handler,
 =09=09=09=09     struct dentry *unused, struct inode *inode,
-=09=09=09=09     const char *name, void *buffer, size_t size)
+=09=09=09=09     const char *name, void *buffer,
+=09=09=09=09     size_t size, int flags)
 {
 =09return hfsplus_getxattr(inode, name, buffer, size,
 =09=09=09=09XATTR_SECURITY_PREFIX,
diff --git a/fs/hfsplus/xattr_trusted.c b/fs/hfsplus/xattr_trusted.c
index fbad91e1dada..54d926314f8c 100644
--- a/fs/hfsplus/xattr_trusted.c
+++ b/fs/hfsplus/xattr_trusted.c
@@ -14,7 +14,8 @@
=20
 static int hfsplus_trusted_getxattr(const struct xattr_handler *handler,
 =09=09=09=09    struct dentry *unused, struct inode *inode,
-=09=09=09=09    const char *name, void *buffer, size_t size)
+=09=09=09=09    const char *name, void *buffer,
+=09=09=09=09    size_t size, int flags)
 {
 =09return hfsplus_getxattr(inode, name, buffer, size,
 =09=09=09=09XATTR_TRUSTED_PREFIX,
diff --git a/fs/hfsplus/xattr_user.c b/fs/hfsplus/xattr_user.c
index 74d19faf255e..4d2b1ffff887 100644
--- a/fs/hfsplus/xattr_user.c
+++ b/fs/hfsplus/xattr_user.c
@@ -14,7 +14,8 @@
=20
 static int hfsplus_user_getxattr(const struct xattr_handler *handler,
 =09=09=09=09 struct dentry *unused, struct inode *inode,
-=09=09=09=09 const char *name, void *buffer, size_t size)
+=09=09=09=09 const char *name, void *buffer, size_t size,
+=09=09=09=09 int flags)
 {
=20
 =09return hfsplus_getxattr(inode, name, buffer, size,
diff --git a/fs/jffs2/security.c b/fs/jffs2/security.c
index c2332e30f218..e6f42fe435af 100644
--- a/fs/jffs2/security.c
+++ b/fs/jffs2/security.c
@@ -50,7 +50,8 @@ int jffs2_init_security(struct inode *inode, struct inode=
 *dir,
 /* ---- XATTR Handler for "security.*" ----------------- */
 static int jffs2_security_getxattr(const struct xattr_handler *handler,
 =09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *name, void *buffer, size_t size)
+=09=09=09=09   const char *name, void *buffer, size_t size,
+=09=09=09=09   int flags)
 {
 =09return do_jffs2_getxattr(inode, JFFS2_XPREFIX_SECURITY,
 =09=09=09=09 name, buffer, size);
diff --git a/fs/jffs2/xattr_trusted.c b/fs/jffs2/xattr_trusted.c
index 5d6030826c52..9dccaae549f5 100644
--- a/fs/jffs2/xattr_trusted.c
+++ b/fs/jffs2/xattr_trusted.c
@@ -18,7 +18,8 @@
=20
 static int jffs2_trusted_getxattr(const struct xattr_handler *handler,
 =09=09=09=09  struct dentry *unused, struct inode *inode,
-=09=09=09=09  const char *name, void *buffer, size_t size)
+=09=09=09=09  const char *name, void *buffer, size_t size,
+=09=09=09=09  int flags)
 {
 =09return do_jffs2_getxattr(inode, JFFS2_XPREFIX_TRUSTED,
 =09=09=09=09 name, buffer, size);
diff --git a/fs/jffs2/xattr_user.c b/fs/jffs2/xattr_user.c
index 9d027b4abcf9..c0983a3e810b 100644
--- a/fs/jffs2/xattr_user.c
+++ b/fs/jffs2/xattr_user.c
@@ -18,7 +18,8 @@
=20
 static int jffs2_user_getxattr(const struct xattr_handler *handler,
 =09=09=09       struct dentry *unused, struct inode *inode,
-=09=09=09       const char *name, void *buffer, size_t size)
+=09=09=09       const char *name, void *buffer, size_t size,
+=09=09=09       int flags)
 {
 =09return do_jffs2_getxattr(inode, JFFS2_XPREFIX_USER,
 =09=09=09=09 name, buffer, size);
diff --git a/fs/jfs/xattr.c b/fs/jfs/xattr.c
index db41e7803163..5c79a35bf62f 100644
--- a/fs/jfs/xattr.c
+++ b/fs/jfs/xattr.c
@@ -925,7 +925,7 @@ static int __jfs_xattr_set(struct inode *inode, const c=
har *name,
=20
 static int jfs_xattr_get(const struct xattr_handler *handler,
 =09=09=09 struct dentry *unused, struct inode *inode,
-=09=09=09 const char *name, void *value, size_t size)
+=09=09=09 const char *name, void *value, size_t size, int flags)
 {
 =09name =3D xattr_full_name(handler, name);
 =09return __jfs_getxattr(inode, name, value, size);
@@ -942,7 +942,8 @@ static int jfs_xattr_set(const struct xattr_handler *ha=
ndler,
=20
 static int jfs_xattr_get_os2(const struct xattr_handler *handler,
 =09=09=09     struct dentry *unused, struct inode *inode,
-=09=09=09     const char *name, void *value, size_t size)
+=09=09=09     const char *name, void *value, size_t size,
+=09=09=09     int flags)
 {
 =09if (is_known_namespace(name))
 =09=09return -EOPNOTSUPP;
diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index f3eaa8869f42..22357c69a82b 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -308,7 +308,8 @@ int kernfs_xattr_set(struct kernfs_node *kn, const char=
 *name,
=20
 static int kernfs_vfs_xattr_get(const struct xattr_handler *handler,
 =09=09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09=09const char *suffix, void *value, size_t size)
+=09=09=09=09const char *suffix, void *value, size_t size,
+=09=09=09=09int flags)
 {
 =09const char *name =3D xattr_full_name(handler, suffix);
 =09struct kernfs_node *kn =3D inode->i_private;
diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index caacf5e7f5e1..f77ddd31b57a 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -7283,7 +7283,8 @@ static int nfs4_xattr_set_nfs4_acl(const struct xattr=
_handler *handler,
=20
 static int nfs4_xattr_get_nfs4_acl(const struct xattr_handler *handler,
 =09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *key, void *buf, size_t buflen)
+=09=09=09=09   const char *key, void *buf, size_t buflen,
+=09=09=09=09   int flags)
 {
 =09return nfs4_proc_get_acl(inode, buf, buflen);
 }
@@ -7308,7 +7309,8 @@ static int nfs4_xattr_set_nfs4_label(const struct xat=
tr_handler *handler,
=20
 static int nfs4_xattr_get_nfs4_label(const struct xattr_handler *handler,
 =09=09=09=09     struct dentry *unused, struct inode *inode,
-=09=09=09=09     const char *key, void *buf, size_t buflen)
+=09=09=09=09     const char *key, void *buf, size_t buflen,
+=09=09=09=09     int flags)
 {
 =09if (security_ismaclabel(key))
 =09=09return nfs4_get_security_label(inode, buf, buflen);
diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
index d8507972ee13..85df32e0f851 100644
--- a/fs/ocfs2/xattr.c
+++ b/fs/ocfs2/xattr.c
@@ -7232,7 +7232,8 @@ int ocfs2_init_security_and_acl(struct inode *dir,
  */
 static int ocfs2_xattr_security_get(const struct xattr_handler *handler,
 =09=09=09=09    struct dentry *unused, struct inode *inode,
-=09=09=09=09    const char *name, void *buffer, size_t size)
+=09=09=09=09    const char *name, void *buffer, size_t size,
+=09=09=09=09    int flags)
 {
 =09return ocfs2_xattr_get(inode, OCFS2_XATTR_INDEX_SECURITY,
 =09=09=09       name, buffer, size);
@@ -7304,7 +7305,8 @@ const struct xattr_handler ocfs2_xattr_security_handl=
er =3D {
  */
 static int ocfs2_xattr_trusted_get(const struct xattr_handler *handler,
 =09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *name, void *buffer, size_t size)
+=09=09=09=09   const char *name, void *buffer, size_t size,
+=09=09=09=09   int flags)
 {
 =09return ocfs2_xattr_get(inode, OCFS2_XATTR_INDEX_TRUSTED,
 =09=09=09       name, buffer, size);
@@ -7330,7 +7332,8 @@ const struct xattr_handler ocfs2_xattr_trusted_handle=
r =3D {
  */
 static int ocfs2_xattr_user_get(const struct xattr_handler *handler,
 =09=09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09=09const char *name, void *buffer, size_t size)
+=09=09=09=09const char *name, void *buffer, size_t size,
+=09=09=09=09int flags)
 {
 =09struct ocfs2_super *osb =3D OCFS2_SB(inode->i_sb);
=20
diff --git a/fs/orangefs/xattr.c b/fs/orangefs/xattr.c
index bdc285aea360..ef4180bff7bb 100644
--- a/fs/orangefs/xattr.c
+++ b/fs/orangefs/xattr.c
@@ -541,7 +541,8 @@ static int orangefs_xattr_get_default(const struct xatt=
r_handler *handler,
 =09=09=09=09      struct inode *inode,
 =09=09=09=09      const char *name,
 =09=09=09=09      void *buffer,
-=09=09=09=09      size_t size)
+=09=09=09=09      size_t size,
+=09=09=09=09      int flags)
 {
 =09return orangefs_inode_getxattr(inode, name, buffer, size);
=20
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index afbcb116a7f1..57f5f948ae0a 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -855,7 +855,7 @@ static unsigned int ovl_split_lowerdirs(char *str)
 static int __maybe_unused
 ovl_posix_acl_xattr_get(const struct xattr_handler *handler,
 =09=09=09struct dentry *dentry, struct inode *inode,
-=09=09=09const char *name, void *buffer, size_t size)
+=09=09=09const char *name, void *buffer, size_t size, int flags)
 {
 =09return ovl_xattr_get(dentry, inode, handler->name, buffer, size);
 }
@@ -920,7 +920,8 @@ ovl_posix_acl_xattr_set(const struct xattr_handler *han=
dler,
=20
 static int ovl_own_xattr_get(const struct xattr_handler *handler,
 =09=09=09     struct dentry *dentry, struct inode *inode,
-=09=09=09     const char *name, void *buffer, size_t size)
+=09=09=09     const char *name, void *buffer, size_t size,
+=09=09=09     int flags)
 {
 =09return -EOPNOTSUPP;
 }
@@ -935,7 +936,8 @@ static int ovl_own_xattr_set(const struct xattr_handler=
 *handler,
=20
 static int ovl_other_xattr_get(const struct xattr_handler *handler,
 =09=09=09       struct dentry *dentry, struct inode *inode,
-=09=09=09       const char *name, void *buffer, size_t size)
+=09=09=09       const char *name, void *buffer, size_t size,
+=09=09=09       int flags)
 {
 =09return ovl_xattr_get(dentry, inode, name, buffer, size);
 }
diff --git a/fs/posix_acl.c b/fs/posix_acl.c
index 84ad1c90d535..cd55621e570b 100644
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -832,7 +832,7 @@ EXPORT_SYMBOL (posix_acl_to_xattr);
 static int
 posix_acl_xattr_get(const struct xattr_handler *handler,
 =09=09    struct dentry *unused, struct inode *inode,
-=09=09    const char *name, void *value, size_t size)
+=09=09    const char *name, void *value, size_t size, int flags)
 {
 =09struct posix_acl *acl;
 =09int error;
diff --git a/fs/reiserfs/xattr_security.c b/fs/reiserfs/xattr_security.c
index 20be9a0e5870..eedfa07a4fd0 100644
--- a/fs/reiserfs/xattr_security.c
+++ b/fs/reiserfs/xattr_security.c
@@ -11,7 +11,8 @@
=20
 static int
 security_get(const struct xattr_handler *handler, struct dentry *unused,
-=09     struct inode *inode, const char *name, void *buffer, size_t size)
+=09     struct inode *inode, const char *name, void *buffer, size_t size,
+=09     int flags)
 {
 =09if (IS_PRIVATE(inode))
 =09=09return -EPERM;
diff --git a/fs/reiserfs/xattr_trusted.c b/fs/reiserfs/xattr_trusted.c
index 5ed48da3d02b..2d11d98605dd 100644
--- a/fs/reiserfs/xattr_trusted.c
+++ b/fs/reiserfs/xattr_trusted.c
@@ -10,7 +10,8 @@
=20
 static int
 trusted_get(const struct xattr_handler *handler, struct dentry *unused,
-=09    struct inode *inode, const char *name, void *buffer, size_t size)
+=09    struct inode *inode, const char *name, void *buffer, size_t size,
+=09    int flags)
 {
 =09if (!capable(CAP_SYS_ADMIN) || IS_PRIVATE(inode))
 =09=09return -EPERM;
diff --git a/fs/reiserfs/xattr_user.c b/fs/reiserfs/xattr_user.c
index a573ca45bacc..2a59d85c69c9 100644
--- a/fs/reiserfs/xattr_user.c
+++ b/fs/reiserfs/xattr_user.c
@@ -9,7 +9,8 @@
=20
 static int
 user_get(const struct xattr_handler *handler, struct dentry *unused,
-=09 struct inode *inode, const char *name, void *buffer, size_t size)
+=09 struct inode *inode, const char *name, void *buffer, size_t size,
+=09 int flags)
 {
 =09if (!reiserfs_xattrs_user(inode->i_sb))
 =09=09return -EOPNOTSUPP;
diff --git a/fs/squashfs/xattr.c b/fs/squashfs/xattr.c
index e1e3f3dd5a06..d8d58c990652 100644
--- a/fs/squashfs/xattr.c
+++ b/fs/squashfs/xattr.c
@@ -204,7 +204,7 @@ static int squashfs_xattr_handler_get(const struct xatt=
r_handler *handler,
 =09=09=09=09      struct dentry *unused,
 =09=09=09=09      struct inode *inode,
 =09=09=09=09      const char *name,
-=09=09=09=09      void *buffer, size_t size)
+=09=09=09=09      void *buffer, size_t size, int flags)
 {
 =09return squashfs_xattr_get(inode, handler->flags, name,
 =09=09buffer, size);
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 9aefbb60074f..26e1a74f178e 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -669,7 +669,8 @@ int ubifs_init_security(struct inode *dentry, struct in=
ode *inode,
=20
 static int xattr_get(const struct xattr_handler *handler,
 =09=09=09   struct dentry *dentry, struct inode *inode,
-=09=09=09   const char *name, void *buffer, size_t size)
+=09=09=09   const char *name, void *buffer, size_t size,
+=09=09=09   int flags)
 {
 =09dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", name,
 =09=09inode->i_ino, dentry, size);
diff --git a/fs/xattr.c b/fs/xattr.c
index 90dd78f0eb27..71f887518d6f 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -281,7 +281,7 @@ vfs_getxattr_alloc(struct dentry *dentry, const char *n=
ame, char **xattr_value,
 =09=09return PTR_ERR(handler);
 =09if (!handler->get)
 =09=09return -EOPNOTSUPP;
-=09error =3D handler->get(handler, dentry, inode, name, NULL, 0);
+=09error =3D handler->get(handler, dentry, inode, name, NULL, 0, 0);
 =09if (error < 0)
 =09=09return error;
=20
@@ -292,32 +292,20 @@ vfs_getxattr_alloc(struct dentry *dentry, const char =
*name, char **xattr_value,
 =09=09memset(value, 0, error + 1);
 =09}
=20
-=09error =3D handler->get(handler, dentry, inode, name, value, error);
+=09error =3D handler->get(handler, dentry, inode, name, value, error, 0);
 =09*xattr_value =3D value;
 =09return error;
 }
=20
 ssize_t
 __vfs_getxattr(struct dentry *dentry, struct inode *inode, const char *nam=
e,
-=09       void *value, size_t size)
+=09       void *value, size_t size, int flags)
 {
 =09const struct xattr_handler *handler;
-
-=09handler =3D xattr_resolve_name(inode, &name);
-=09if (IS_ERR(handler))
-=09=09return PTR_ERR(handler);
-=09if (!handler->get)
-=09=09return -EOPNOTSUPP;
-=09return handler->get(handler, dentry, inode, name, value, size);
-}
-EXPORT_SYMBOL(__vfs_getxattr);
-
-ssize_t
-vfs_getxattr(struct dentry *dentry, const char *name, void *value, size_t =
size)
-{
-=09struct inode *inode =3D dentry->d_inode;
 =09int error;
=20
+=09if (flags & XATTR_NOSECURITY)
+=09=09goto nolsm;
 =09error =3D xattr_permission(inode, name, MAY_READ);
 =09if (error)
 =09=09return error;
@@ -339,7 +327,19 @@ vfs_getxattr(struct dentry *dentry, const char *name, =
void *value, size_t size)
 =09=09return ret;
 =09}
 nolsm:
-=09return __vfs_getxattr(dentry, inode, name, value, size);
+=09handler =3D xattr_resolve_name(inode, &name);
+=09if (IS_ERR(handler))
+=09=09return PTR_ERR(handler);
+=09if (!handler->get)
+=09=09return -EOPNOTSUPP;
+=09return handler->get(handler, dentry, inode, name, value, size, flags);
+}
+EXPORT_SYMBOL(__vfs_getxattr);
+
+ssize_t
+vfs_getxattr(struct dentry *dentry, const char *name, void *value, size_t =
size)
+{
+=09return __vfs_getxattr(dentry, dentry->d_inode, name, value, size, 0);
 }
 EXPORT_SYMBOL_GPL(vfs_getxattr);
=20
diff --git a/fs/xfs/xfs_xattr.c b/fs/xfs/xfs_xattr.c
index cb895b1df5e4..9d2030e02a37 100644
--- a/fs/xfs/xfs_xattr.c
+++ b/fs/xfs/xfs_xattr.c
@@ -18,7 +18,8 @@
=20
 static int
 xfs_xattr_get(const struct xattr_handler *handler, struct dentry *unused,
-=09=09struct inode *inode, const char *name, void *value, size_t size)
+=09=09struct inode *inode, const char *name, void *value, size_t size,
+=09=09int flags)
 {
 =09int xflags =3D handler->flags;
 =09struct xfs_inode *ip =3D XFS_I(inode);
diff --git a/include/linux/xattr.h b/include/linux/xattr.h
index 6dad031be3c2..4df9dcdc48c5 100644
--- a/include/linux/xattr.h
+++ b/include/linux/xattr.h
@@ -30,10 +30,10 @@ struct xattr_handler {
 =09const char *prefix;
 =09int flags;      /* fs private flags */
 =09bool (*list)(struct dentry *dentry);
-=09int (*get)(const struct xattr_handler *, struct dentry *dentry,
+=09int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
 =09=09   struct inode *inode, const char *name, void *buffer,
-=09=09   size_t size);
-=09int (*set)(const struct xattr_handler *, struct dentry *dentry,
+=09=09   size_t size, int flags);
+=09int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
 =09=09   struct inode *inode, const char *name, const void *buffer,
 =09=09   size_t size, int flags);
 };
@@ -46,7 +46,8 @@ struct xattr {
 =09size_t value_len;
 };
=20
-ssize_t __vfs_getxattr(struct dentry *, struct inode *, const char *, void=
 *, size_t);
+ssize_t __vfs_getxattr(struct dentry *dentry, struct inode *inode,
+=09=09       const char *name, void *buffer, size_t size, int flags);
 ssize_t vfs_getxattr(struct dentry *, const char *, void *, size_t);
 ssize_t vfs_listxattr(struct dentry *d, char *list, size_t size);
 int __vfs_setxattr(struct dentry *, struct inode *, const char *, const vo=
id *, size_t, int);
diff --git a/include/uapi/linux/xattr.h b/include/uapi/linux/xattr.h
index c1395b5bd432..1eba02616274 100644
--- a/include/uapi/linux/xattr.h
+++ b/include/uapi/linux/xattr.h
@@ -17,8 +17,11 @@
 #if __UAPI_DEF_XATTR
 #define __USE_KERNEL_XATTR_DEFS
=20
-#define XATTR_CREATE=090x1=09/* set value, fail if attr already exists */
-#define XATTR_REPLACE=090x2=09/* set value, fail if attr does not exist */
+#define XATTR_CREATE=09 0x1=09/* set value, fail if attr already exists */
+#define XATTR_REPLACE=09 0x2=09/* set value, fail if attr does not exist *=
/
+#ifdef __KERNEL__ /* following is kernel internal, colocated for maintenan=
ce */
+#define XATTR_NOSECURITY 0x4=09/* get value, do not involve security check=
 */
+#endif
 #endif
=20
 /* Namespaces */
diff --git a/mm/shmem.c b/mm/shmem.c
index 220be9fa2c41..641570ee1c10 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3221,7 +3221,8 @@ static int shmem_initxattrs(struct inode *inode,
=20
 static int shmem_xattr_handler_get(const struct xattr_handler *handler,
 =09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *name, void *buffer, size_t size)
+=09=09=09=09   const char *name, void *buffer, size_t size,
+=09=09=09=09   int flags)
 {
 =09struct shmem_inode_info *info =3D SHMEM_I(inode);
=20
diff --git a/net/socket.c b/net/socket.c
index 6a9ab7a8b1d2..6b0fea92dd02 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -300,7 +300,8 @@ static const struct dentry_operations sockfs_dentry_ope=
rations =3D {
=20
 static int sockfs_xattr_get(const struct xattr_handler *handler,
 =09=09=09    struct dentry *dentry, struct inode *inode,
-=09=09=09    const char *suffix, void *value, size_t size)
+=09=09=09    const char *suffix, void *value, size_t size,
+=09=09=09    int flags)
 {
 =09if (value) {
 =09=09if (dentry->d_name.len + 1 > size)
diff --git a/security/commoncap.c b/security/commoncap.c
index f4ee0ae106b2..378a2f66a73d 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -297,7 +297,8 @@ int cap_inode_need_killpriv(struct dentry *dentry)
 =09struct inode *inode =3D d_backing_inode(dentry);
 =09int error;
=20
-=09error =3D __vfs_getxattr(dentry, inode, XATTR_NAME_CAPS, NULL, 0);
+=09error =3D __vfs_getxattr(dentry, inode, XATTR_NAME_CAPS, NULL, 0,
+=09=09=09       XATTR_NOSECURITY);
 =09return error > 0;
 }
=20
@@ -586,7 +587,8 @@ int get_vfs_caps_from_disk(const struct dentry *dentry,=
 struct cpu_vfs_cap_data
=20
 =09fs_ns =3D inode->i_sb->s_user_ns;
 =09size =3D __vfs_getxattr((struct dentry *)dentry, inode,
-=09=09=09      XATTR_NAME_CAPS, &data, XATTR_CAPS_SZ);
+=09=09=09      XATTR_NAME_CAPS, &data, XATTR_CAPS_SZ,
+=09=09=09      XATTR_NOSECURITY);
 =09if (size =3D=3D -ENODATA || size =3D=3D -EOPNOTSUPP)
 =09=09/* no data, that's ok */
 =09=09return -ENODATA;
diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/evm=
_main.c
index f9a81b187fae..921c8f2afcaf 100644
--- a/security/integrity/evm/evm_main.c
+++ b/security/integrity/evm/evm_main.c
@@ -100,7 +100,8 @@ static int evm_find_protected_xattrs(struct dentry *den=
try)
 =09=09return -EOPNOTSUPP;
=20
 =09list_for_each_entry_rcu(xattr, &evm_config_xattrnames, list) {
-=09=09error =3D __vfs_getxattr(dentry, inode, xattr->name, NULL, 0);
+=09=09error =3D __vfs_getxattr(dentry, inode, xattr->name, NULL, 0,
+=09=09=09=09       XATTR_NOSECURITY);
 =09=09if (error < 0) {
 =09=09=09if (error =3D=3D -ENODATA)
 =09=09=09=09continue;
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 9625b99e677f..60cd34d25878 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -554,7 +554,8 @@ static int sb_finish_set_opts(struct super_block *sb)
 =09=09=09goto out;
 =09=09}
=20
-=09=09rc =3D __vfs_getxattr(root, root_inode, XATTR_NAME_SELINUX, NULL, 0)=
;
+=09=09rc =3D __vfs_getxattr(root, root_inode, XATTR_NAME_SELINUX, NULL,
+=09=09=09=09    0, XATTR_NOSECURITY);
 =09=09if (rc < 0 && rc !=3D -ENODATA) {
 =09=09=09if (rc =3D=3D -EOPNOTSUPP)
 =09=09=09=09pr_warn("SELinux: (dev %s, type "
@@ -1380,12 +1381,14 @@ static int inode_doinit_use_xattr(struct inode *ino=
de, struct dentry *dentry,
 =09=09return -ENOMEM;
=20
 =09context[len] =3D '\0';
-=09rc =3D __vfs_getxattr(dentry, inode, XATTR_NAME_SELINUX, context, len);
+=09rc =3D __vfs_getxattr(dentry, inode, XATTR_NAME_SELINUX, context, len,
+=09=09=09    XATTR_NOSECURITY);
 =09if (rc =3D=3D -ERANGE) {
 =09=09kfree(context);
=20
 =09=09/* Need a larger buffer.  Query for the right size. */
-=09=09rc =3D __vfs_getxattr(dentry, inode, XATTR_NAME_SELINUX, NULL, 0);
+=09=09rc =3D __vfs_getxattr(dentry, inode, XATTR_NAME_SELINUX, NULL, 0,
+=09=09=09=09    XATTR_NOSECURITY);
 =09=09if (rc < 0)
 =09=09=09return rc;
=20
@@ -1396,7 +1399,7 @@ static int inode_doinit_use_xattr(struct inode *inode=
, struct dentry *dentry,
=20
 =09=09context[len] =3D '\0';
 =09=09rc =3D __vfs_getxattr(dentry, inode, XATTR_NAME_SELINUX,
-=09=09=09=09    context, len);
+=09=09=09=09    context, len, XATTR_NOSECURITY);
 =09}
 =09if (rc < 0) {
 =09=09kfree(context);
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index abeb09c30633..73009d3d902a 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -292,7 +292,8 @@ static struct smack_known *smk_fetch(const char *name, =
struct inode *ip,
 =09if (buffer =3D=3D NULL)
 =09=09return ERR_PTR(-ENOMEM);
=20
-=09rc =3D __vfs_getxattr(dp, ip, name, buffer, SMK_LONGLABEL);
+=09rc =3D __vfs_getxattr(dp, ip, name, buffer, SMK_LONGLABEL,
+=09=09=09    XATTR_NOSECURITY);
 =09if (rc < 0)
 =09=09skp =3D ERR_PTR(rc);
 =09else if (rc =3D=3D 0)
@@ -3440,7 +3441,7 @@ static void smack_d_instantiate(struct dentry *opt_de=
ntry, struct inode *inode)
 =09=09=09} else {
 =09=09=09=09rc =3D __vfs_getxattr(dp, inode,
 =09=09=09=09=09XATTR_NAME_SMACKTRANSMUTE, trattr,
-=09=09=09=09=09TRANS_TRUE_SIZE);
+=09=09=09=09=09TRANS_TRUE_SIZE, XATTR_NOSECURITY);
 =09=09=09=09if (rc >=3D 0 && strncmp(trattr, TRANS_TRUE,
 =09=09=09=09=09=09       TRANS_TRUE_SIZE) !=3D 0)
 =09=09=09=09=09rc =3D -EINVAL;
--=20
2.24.0.rc1.363.gb1bccd3e3d-goog

