Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A220EE0D80
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Oct 2019 22:46:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571777196;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m7M7qdnRKPd0aelp0a4sXH+or6SEJN68jzeJz19otZc=;
	b=c5gZT30nOfCJro5KjlylV5IGxiHw4gJlDYlPEzNDja3yjsJH75MIEjM/K09Vo8/0JcVIT2
	NTA/y5aLJLHt6HOSN/Oafer/bFNzTHiMDnJk1njyr5JScW8PjtEg1JnGt8Qc+QBVxPJ66g
	+qQa/5ZAqaFQbvP1DaIYNxsQS0ayLM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-ArIJQ4QOOLeYVEFxbIx5LQ-1; Tue, 22 Oct 2019 16:46:34 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEFF9107AD31;
	Tue, 22 Oct 2019 20:46:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D11CC5DE5B;
	Tue, 22 Oct 2019 20:46:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 86FF7180085A;
	Tue, 22 Oct 2019 20:46:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9MKk9Ji023532 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 22 Oct 2019 16:46:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0363E5D6B2; Tue, 22 Oct 2019 20:46:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE82A5D6A9
	for <cluster-devel@redhat.com>; Tue, 22 Oct 2019 20:46:06 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C41043086246
	for <cluster-devel@redhat.com>; Tue, 22 Oct 2019 20:46:01 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id c184so1860250pfb.0
	for <cluster-devel@redhat.com>; Tue, 22 Oct 2019 13:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eXo8nXlEjoZWF936YQHUZ6Ehv+4KwomTE27VMvfvCqU=;
	b=UodRjH57anEjpi1z9lFenOZyf3wLS7LXIQQWFETu0UZeKZc5mW3e+oRGJgQcWIDqgB
	5GFvapvGh/ny6nkUZZIKta5P76EoX7OA+8RHS0HIud4O3UuBeqDV/kNX+l5ForthL4ep
	kGWKt9YxJeK9LnoW7vr3t4PftAGAiOAmbQydifQKaj9btJSvMsYEnlPrSFN/F7ht8lw3
	P9edFcQkbz8+bk/Sz2NKvxSlJpMBwZcfjSlwGhO13BJnERe1mGzHc2MGPquX52tmT4hA
	q0LQkXhWzT7MQeSK8PGfCI9kuYOlTbsiUPaxQh2335R3YmPsmeRHiD46q7XuIUthcwoL
	vueQ==
X-Gm-Message-State: APjAAAW4ZyWhoAEirtLm9SwP69d1OI3iLdEu1Z17c9asQF7s/F9PxPjd
	4QbLFgTNpYGXlmL3yR0go24HDA==
X-Google-Smtp-Source: APXvYqwnnKKAt6+c+nFVeF74NGT0cV8S1dMPeGwxmnayyU8E0UU0LE6HSPtXiUYKSqqYCHkFeD9yAw==
X-Received: by 2002:a63:29c1:: with SMTP id p184mr5733305pgp.174.1571777160301;
	Tue, 22 Oct 2019 13:46:00 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
	([2620:15c:211:200:5404:91ba:59dc:9400])
	by smtp.gmail.com with ESMTPSA id
	l184sm19810903pfl.76.2019.10.22.13.45.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Oct 2019 13:45:59 -0700 (PDT)
From: Mark Salyzyn <salyzyn@android.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 22 Oct 2019 13:44:46 -0700
Message-Id: <20191022204453.97058-2-salyzyn@android.com>
In-Reply-To: <20191022204453.97058-1-salyzyn@android.com>
References: <20191022204453.97058-1-salyzyn@android.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 22 Oct 2019 20:46:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Tue, 22 Oct 2019 20:46:02 +0000 (UTC) for IP:'209.85.210.193'
	DOMAIN:'mail-pf1-f193.google.com'
	HELO:'mail-pf1-f193.google.com' FROM:'salyzyn@android.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.193 mail-pf1-f193.google.com 209.85.210.193
	mail-pf1-f193.google.com <salyzyn@android.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Hugh Dickins <hughd@google.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Mike Marshall <hubcap@omnibond.com>,
	James Morris <jmorris@namei.org>, devel@lists.orangefs.org,
	Eric Van Hensbergen <ericvh@gmail.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Mathieu Malaterre <malat@debian.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Kleikamp <shaggy@kernel.org>, linux-doc@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>, linux-cifs@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Eric Sandeen <sandeen@sandeen.net>, kernel-team@android.com,
	Chao Yu <chao@kernel.org>, selinux@vger.kernel.org,
	Brian Foster <bfoster@redhat.com>,
	reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net,
	linux-integrity@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>,
	Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
	linux-afs@lists.infradead.org, Miklos Szeredi <miklos@szeredi.hu>,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
	Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org,
	Gao Xiang <xiang@kernel.org>, linux-nfs@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	samba-technical@lists.samba.org, linux-xfs@vger.kernel.org,
	Tejun Heo <tj@kernel.org>, linux-erofs@lists.ozlabs.org,
	"David S. Miller" <davem@davemloft.net>,
	ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net,
	Jan Kara <jack@suse.cz>, Eric Biggers <ebiggers@google.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Mark Salyzyn <salyzyn@android.com>, Sage Weil <sage@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Mark Fasheh <mark@fasheh.com>, cluster-devel@redhat.com,
	Steve French <sfrench@samba.org>, v9fs-developer@lists.sourceforge.net,
	Bharath Vedartham <linux.bhar@gmail.com>,
	Jann Horn <jannh@google.com>, ecryptfs@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, netdev@vger.kernel.org,
	linux-unionfs@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
	linux-security-module@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>,
	David Woodhouse <dwmw2@infradead.org>, linux-btrfs@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [Cluster-devel] [PATCH v14 1/5] Add flags option to get xattr
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ArIJQ4QOOLeYVEFxbIx5LQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Replace arguments for get and set xattr methods, and __vfs_getxattr
and __vfs_setaxtr functions with a reference to the following now
common argument structure:

struct xattr_gs_args {
=09struct dentry *dentry;
=09struct inode *inode;
=09const char *name;
=09union {
=09=09void *buffer;
=09=09const void *value;
=09};
=09size_t size;
=09int flags;
};

Which in effect adds a flags option to the get method and
__vfs_getxattr function.

Add a flag option to get xattr method that has bit flag of
XATTR_NOSECURITY passed to it.  XATTR_NOSECURITY is generally then
set in the __vfs_getxattr path when called by security
infrastructure.

This handles the case of a union filesystem driver that is being
requested by the security layer to report back the xattr data.

For the use case where access is to be blocked by the security layer.

The path then could be security(dentry) ->
__vfs_getxattr({dentry...XATTR_NOSECURITY}) ->
handler->get({dentry...XATTR_NOSECURITY}) ->
__vfs_getxattr({lower_dentry...XATTR_NOSECURITY}) ->
lower_handler->get({lower_dentry...XATTR_NOSECURITY})
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
with __vfs_getxattr({...XATTR_NOSECURITY}).

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

---
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
 Documentation/filesystems/locking.rst |  10 +--
 fs/9p/acl.c                           |  51 ++++++------
 fs/9p/xattr.c                         |  19 ++---
 fs/afs/xattr.c                        | 112 ++++++++++++--------------
 fs/btrfs/xattr.c                      |  36 ++++-----
 fs/ceph/xattr.c                       |  17 ++--
 fs/cifs/xattr.c                       |  72 +++++++++--------
 fs/ecryptfs/crypto.c                  |  20 +++--
 fs/ecryptfs/inode.c                   |  36 +++++----
 fs/ecryptfs/mmap.c                    |  39 ++++-----
 fs/erofs/xattr.c                      |   8 +-
 fs/ext2/xattr_security.c              |  16 ++--
 fs/ext2/xattr_trusted.c               |  15 ++--
 fs/ext2/xattr_user.c                  |  19 ++---
 fs/ext4/xattr_security.c              |  15 ++--
 fs/ext4/xattr_trusted.c               |  15 ++--
 fs/ext4/xattr_user.c                  |  19 ++---
 fs/f2fs/xattr.c                       |  42 +++++-----
 fs/fuse/xattr.c                       |  23 +++---
 fs/gfs2/xattr.c                       |  18 ++---
 fs/hfs/attr.c                         |  15 ++--
 fs/hfsplus/xattr.c                    |  17 ++--
 fs/hfsplus/xattr_security.c           |  13 ++-
 fs/hfsplus/xattr_trusted.c            |  13 ++-
 fs/hfsplus/xattr_user.c               |  13 ++-
 fs/jffs2/security.c                   |  16 ++--
 fs/jffs2/xattr_trusted.c              |  16 ++--
 fs/jffs2/xattr_user.c                 |  16 ++--
 fs/jfs/xattr.c                        |  33 ++++----
 fs/kernfs/inode.c                     |  23 +++---
 fs/nfs/nfs4proc.c                     |  28 +++----
 fs/ocfs2/xattr.c                      |  52 ++++++------
 fs/orangefs/xattr.c                   |  19 ++---
 fs/overlayfs/inode.c                  |  43 +++++-----
 fs/overlayfs/overlayfs.h              |   6 +-
 fs/overlayfs/super.c                  |  53 ++++++------
 fs/posix_acl.c                        |  23 +++---
 fs/reiserfs/xattr.c                   |   2 +-
 fs/reiserfs/xattr_security.c          |  22 +++--
 fs/reiserfs/xattr_trusted.c           |  22 +++--
 fs/reiserfs/xattr_user.c              |  22 +++--
 fs/squashfs/xattr.c                   |  10 +--
 fs/ubifs/xattr.c                      |  33 ++++----
 fs/xattr.c                            | 112 ++++++++++++++++----------
 fs/xfs/libxfs/xfs_attr.c              |   4 +-
 fs/xfs/libxfs/xfs_attr.h              |   2 +-
 fs/xfs/xfs_xattr.c                    |  35 ++++----
 include/linux/xattr.h                 |  26 ++++--
 include/uapi/linux/xattr.h            |   7 +-
 mm/shmem.c                            |  21 +++--
 net/socket.c                          |  16 ++--
 security/commoncap.c                  |  29 ++++---
 security/integrity/evm/evm_main.c     |  13 ++-
 security/selinux/hooks.c              |  28 +++++--
 security/smack/smack_lsm.c            |  38 ++++++---
 55 files changed, 722 insertions(+), 721 deletions(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesyst=
ems/locking.rst
index fc3a0704553c..2feade0940c8 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -123,12 +123,10 @@ xattr_handler operations
 prototypes::
=20
 =09bool (*list)(struct dentry *dentry);
-=09int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
-=09=09   struct inode *inode, const char *name, void *buffer,
-=09=09   size_t size);
-=09int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
-=09=09   struct inode *inode, const char *name, const void *buffer,
-=09=09   size_t size, int flags);
+=09int (*get)(const struct xattr_handler *handler,
+=09=09   struct xattr_gs_flags *args);
+=09int (*set)(const struct xattr_handler *handler,
+=09=09   struct xattr_gs_flags *args);
=20
 locking rules:
 =09all may block
diff --git a/fs/9p/acl.c b/fs/9p/acl.c
index 6261719f6f2a..2f5184de75c4 100644
--- a/fs/9p/acl.c
+++ b/fs/9p/acl.c
@@ -213,60 +213,61 @@ int v9fs_acl_mode(struct inode *dir, umode_t *modep,
 }
=20
 static int v9fs_xattr_get_acl(const struct xattr_handler *handler,
-=09=09=09      struct dentry *dentry, struct inode *inode,
-=09=09=09      const char *name, void *buffer, size_t size)
+=09=09=09      struct xattr_gs_args *args)
 {
 =09struct v9fs_session_info *v9ses;
 =09struct posix_acl *acl;
 =09int error;
=20
-=09v9ses =3D v9fs_dentry2v9ses(dentry);
+=09v9ses =3D v9fs_dentry2v9ses(args->dentry);
 =09/*
 =09 * We allow set/get/list of acl when access=3Dclient is not specified
 =09 */
 =09if ((v9ses->flags & V9FS_ACCESS_MASK) !=3D V9FS_ACCESS_CLIENT)
-=09=09return v9fs_xattr_get(dentry, handler->name, buffer, size);
+=09=09return v9fs_xattr_get(args->dentry, handler->name,
+=09=09=09=09      args->buffer, args->size);
=20
-=09acl =3D v9fs_get_cached_acl(inode, handler->flags);
+=09acl =3D v9fs_get_cached_acl(args->inode, handler->flags);
 =09if (IS_ERR(acl))
 =09=09return PTR_ERR(acl);
 =09if (acl =3D=3D NULL)
 =09=09return -ENODATA;
-=09error =3D posix_acl_to_xattr(&init_user_ns, acl, buffer, size);
+=09error =3D posix_acl_to_xattr(&init_user_ns, acl,
+=09=09=09=09   args->buffer, args->size);
 =09posix_acl_release(acl);
=20
 =09return error;
 }
=20
 static int v9fs_xattr_set_acl(const struct xattr_handler *handler,
-=09=09=09      struct dentry *dentry, struct inode *inode,
-=09=09=09      const char *name, const void *value,
-=09=09=09      size_t size, int flags)
+=09=09=09      struct xattr_gs_args *args)
 {
 =09int retval;
 =09struct posix_acl *acl;
 =09struct v9fs_session_info *v9ses;
=20
-=09v9ses =3D v9fs_dentry2v9ses(dentry);
+=09v9ses =3D v9fs_dentry2v9ses(args->dentry);
 =09/*
 =09 * set the attribute on the remote. Without even looking at the
 =09 * xattr value. We leave it to the server to validate
 =09 */
 =09if ((v9ses->flags & V9FS_ACCESS_MASK) !=3D V9FS_ACCESS_CLIENT)
-=09=09return v9fs_xattr_set(dentry, handler->name, value, size,
-=09=09=09=09      flags);
+=09=09return v9fs_xattr_set(args->dentry, handler->name,
+=09=09=09=09      args->value, args->size, args->flags);
=20
-=09if (S_ISLNK(inode->i_mode))
+=09if (S_ISLNK(args->inode->i_mode))
 =09=09return -EOPNOTSUPP;
-=09if (!inode_owner_or_capable(inode))
+=09if (!inode_owner_or_capable(args->inode))
 =09=09return -EPERM;
-=09if (value) {
+=09if (args->value) {
 =09=09/* update the cached acl value */
-=09=09acl =3D posix_acl_from_xattr(&init_user_ns, value, size);
+=09=09acl =3D posix_acl_from_xattr(&init_user_ns,
+=09=09=09=09=09   args->value, args->size);
 =09=09if (IS_ERR(acl))
 =09=09=09return PTR_ERR(acl);
 =09=09else if (acl) {
-=09=09=09retval =3D posix_acl_valid(inode->i_sb->s_user_ns, acl);
+=09=09=09retval =3D posix_acl_valid(args->inode->i_sb->s_user_ns,
+=09=09=09=09=09=09 acl);
 =09=09=09if (retval)
 =09=09=09=09goto err_out;
 =09=09}
@@ -279,7 +280,8 @@ static int v9fs_xattr_set_acl(const struct xattr_handle=
r *handler,
 =09=09=09struct iattr iattr =3D { 0 };
 =09=09=09struct posix_acl *old_acl =3D acl;
=20
-=09=09=09retval =3D posix_acl_update_mode(inode, &iattr.ia_mode, &acl);
+=09=09=09retval =3D posix_acl_update_mode(args->inode,
+=09=09=09=09=09=09       &iattr.ia_mode, &acl);
 =09=09=09if (retval)
 =09=09=09=09goto err_out;
 =09=09=09if (!acl) {
@@ -289,19 +291,19 @@ static int v9fs_xattr_set_acl(const struct xattr_hand=
ler *handler,
 =09=09=09=09 * update ACL.
 =09=09=09=09 */
 =09=09=09=09posix_acl_release(old_acl);
-=09=09=09=09value =3D NULL;
-=09=09=09=09size =3D 0;
+=09=09=09=09args->value =3D NULL;
+=09=09=09=09args->size =3D 0;
 =09=09=09}
 =09=09=09iattr.ia_valid =3D ATTR_MODE;
 =09=09=09/* FIXME should we update ctime ?
 =09=09=09 * What is the following setxattr update the
 =09=09=09 * mode ?
 =09=09=09 */
-=09=09=09v9fs_vfs_setattr_dotl(dentry, &iattr);
+=09=09=09v9fs_vfs_setattr_dotl(args->dentry, &iattr);
 =09=09}
 =09=09break;
 =09case ACL_TYPE_DEFAULT:
-=09=09if (!S_ISDIR(inode->i_mode)) {
+=09=09if (!S_ISDIR(args->inode->i_mode)) {
 =09=09=09retval =3D acl ? -EINVAL : 0;
 =09=09=09goto err_out;
 =09=09}
@@ -309,9 +311,10 @@ static int v9fs_xattr_set_acl(const struct xattr_handl=
er *handler,
 =09default:
 =09=09BUG();
 =09}
-=09retval =3D v9fs_xattr_set(dentry, handler->name, value, size, flags);
+=09retval =3D v9fs_xattr_set(args->dentry, handler->name,
+=09=09=09=09args->value, args->size, args->flags);
 =09if (!retval)
-=09=09set_cached_acl(inode, handler->flags, acl);
+=09=09set_cached_acl(args->inode, handler->flags, acl);
 err_out:
 =09posix_acl_release(acl);
 =09return retval;
diff --git a/fs/9p/xattr.c b/fs/9p/xattr.c
index ac8ff8ca4c11..36d4c309be08 100644
--- a/fs/9p/xattr.c
+++ b/fs/9p/xattr.c
@@ -138,22 +138,19 @@ ssize_t v9fs_listxattr(struct dentry *dentry, char *b=
uffer, size_t buffer_size)
 }
=20
 static int v9fs_xattr_handler_get(const struct xattr_handler *handler,
-=09=09=09=09  struct dentry *dentry, struct inode *inode,
-=09=09=09=09  const char *name, void *buffer, size_t size)
+=09=09=09=09  struct xattr_gs_args *args)
 {
-=09const char *full_name =3D xattr_full_name(handler, name);
-
-=09return v9fs_xattr_get(dentry, full_name, buffer, size);
+=09return v9fs_xattr_get(args->dentry,
+=09=09=09      xattr_full_name(handler, args->name),
+=09=09=09      args->buffer, args->size);
 }
=20
 static int v9fs_xattr_handler_set(const struct xattr_handler *handler,
-=09=09=09=09  struct dentry *dentry, struct inode *inode,
-=09=09=09=09  const char *name, const void *value,
-=09=09=09=09  size_t size, int flags)
+=09=09=09=09  struct xattr_gs_args *args)
 {
-=09const char *full_name =3D xattr_full_name(handler, name);
-
-=09return v9fs_xattr_set(dentry, full_name, value, size, flags);
+=09return v9fs_xattr_set(args->dentry,
+=09=09=09      xattr_full_name(handler, args->name),
+=09=09=09      args->value, args->size, args->flags);
 }
=20
 static struct xattr_handler v9fs_xattr_user_handler =3D {
diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index 5552d034090a..787ae107642d 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -38,13 +38,11 @@ ssize_t afs_listxattr(struct dentry *dentry, char *buff=
er, size_t size)
  * Get a file's ACL.
  */
 static int afs_xattr_get_acl(const struct xattr_handler *handler,
-=09=09=09     struct dentry *dentry,
-=09=09=09     struct inode *inode, const char *name,
-=09=09=09     void *buffer, size_t size)
+=09=09=09     struct xattr_gs_args *args)
 {
 =09struct afs_fs_cursor fc;
 =09struct afs_status_cb *scb;
-=09struct afs_vnode *vnode =3D AFS_FS_I(inode);
+=09struct afs_vnode *vnode =3D AFS_FS_I(args->inode);
 =09struct afs_acl *acl =3D NULL;
 =09struct key *key;
 =09int ret =3D -ENOMEM;
@@ -76,9 +74,9 @@ static int afs_xattr_get_acl(const struct xattr_handler *=
handler,
=20
 =09if (ret =3D=3D 0) {
 =09=09ret =3D acl->size;
-=09=09if (size > 0) {
-=09=09=09if (acl->size <=3D size)
-=09=09=09=09memcpy(buffer, acl->data, acl->size);
+=09=09if (args->size > 0) {
+=09=09=09if (acl->size <=3D args->size)
+=09=09=09=09memcpy(args->buffer, acl->data, acl->size);
 =09=09=09else
 =09=09=09=09ret =3D -ERANGE;
 =09=09}
@@ -96,25 +94,23 @@ static int afs_xattr_get_acl(const struct xattr_handler=
 *handler,
  * Set a file's AFS3 ACL.
  */
 static int afs_xattr_set_acl(const struct xattr_handler *handler,
-                             struct dentry *dentry,
-                             struct inode *inode, const char *name,
-                             const void *buffer, size_t size, int flags)
+=09=09=09     struct xattr_gs_args *args)
 {
 =09struct afs_fs_cursor fc;
 =09struct afs_status_cb *scb;
-=09struct afs_vnode *vnode =3D AFS_FS_I(inode);
+=09struct afs_vnode *vnode =3D AFS_FS_I(args->inode);
 =09struct afs_acl *acl =3D NULL;
 =09struct key *key;
 =09int ret =3D -ENOMEM;
=20
-=09if (flags =3D=3D XATTR_CREATE)
+=09if (args->flags =3D=3D XATTR_CREATE)
 =09=09return -EINVAL;
=20
 =09scb =3D kzalloc(sizeof(struct afs_status_cb), GFP_NOFS);
 =09if (!scb)
 =09=09goto error;
=20
-=09acl =3D kmalloc(sizeof(*acl) + size, GFP_KERNEL);
+=09acl =3D kmalloc(sizeof(*acl) + args->size, GFP_KERNEL);
 =09if (!acl)
 =09=09goto error_scb;
=20
@@ -124,8 +120,8 @@ static int afs_xattr_set_acl(const struct xattr_handler=
 *handler,
 =09=09goto error_acl;
 =09}
=20
-=09acl->size =3D size;
-=09memcpy(acl->data, buffer, size);
+=09acl->size =3D args->size;
+=09memcpy(acl->data, args->value, args->size);
=20
 =09ret =3D -ERESTARTSYS;
 =09if (afs_begin_vnode_operation(&fc, vnode, key, true)) {
@@ -161,25 +157,23 @@ static const struct xattr_handler afs_xattr_afs_acl_h=
andler =3D {
  * Get a file's YFS ACL.
  */
 static int afs_xattr_get_yfs(const struct xattr_handler *handler,
-=09=09=09     struct dentry *dentry,
-=09=09=09     struct inode *inode, const char *name,
-=09=09=09     void *buffer, size_t size)
+=09=09=09     struct xattr_gs_args *args)
 {
 =09struct afs_fs_cursor fc;
 =09struct afs_status_cb *scb;
-=09struct afs_vnode *vnode =3D AFS_FS_I(inode);
+=09struct afs_vnode *vnode =3D AFS_FS_I(args->inode);
 =09struct yfs_acl *yacl =3D NULL;
 =09struct key *key;
 =09char buf[16], *data;
 =09int which =3D 0, dsize, ret =3D -ENOMEM;
=20
-=09if (strcmp(name, "acl") =3D=3D 0)
+=09if (strcmp(args->name, "acl") =3D=3D 0)
 =09=09which =3D 0;
-=09else if (strcmp(name, "acl_inherited") =3D=3D 0)
+=09else if (strcmp(args->name, "acl_inherited") =3D=3D 0)
 =09=09which =3D 1;
-=09else if (strcmp(name, "acl_num_cleaned") =3D=3D 0)
+=09else if (strcmp(args->name, "acl_num_cleaned") =3D=3D 0)
 =09=09which =3D 2;
-=09else if (strcmp(name, "vol_acl") =3D=3D 0)
+=09else if (strcmp(args->name, "vol_acl") =3D=3D 0)
 =09=09which =3D 3;
 =09else
 =09=09return -EOPNOTSUPP;
@@ -228,11 +222,11 @@ static int afs_xattr_get_yfs(const struct xattr_handl=
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
@@ -244,12 +238,12 @@ static int afs_xattr_get_yfs(const struct xattr_handl=
er *handler,
 =09}
=20
 =09ret =3D dsize;
-=09if (size > 0) {
-=09=09if (dsize > size) {
+=09if (args->size > 0) {
+=09=09if (dsize > args->size) {
 =09=09=09ret =3D -ERANGE;
 =09=09=09goto error_key;
 =09=09}
-=09=09memcpy(buffer, data, dsize);
+=09=09memcpy(args->buffer, data, dsize);
 =09}
=20
 error_key:
@@ -266,31 +260,29 @@ static int afs_xattr_get_yfs(const struct xattr_handl=
er *handler,
  * Set a file's YFS ACL.
  */
 static int afs_xattr_set_yfs(const struct xattr_handler *handler,
-                             struct dentry *dentry,
-                             struct inode *inode, const char *name,
-                             const void *buffer, size_t size, int flags)
+=09=09=09     struct xattr_gs_args *args)
 {
 =09struct afs_fs_cursor fc;
 =09struct afs_status_cb *scb;
-=09struct afs_vnode *vnode =3D AFS_FS_I(inode);
+=09struct afs_vnode *vnode =3D AFS_FS_I(args->inode);
 =09struct afs_acl *acl =3D NULL;
 =09struct key *key;
 =09int ret =3D -ENOMEM;
=20
-=09if (flags =3D=3D XATTR_CREATE ||
-=09    strcmp(name, "acl") !=3D 0)
+=09if (args->flags =3D=3D XATTR_CREATE ||
+=09    strcmp(args->name, "acl") !=3D 0)
 =09=09return -EINVAL;
=20
 =09scb =3D kzalloc(sizeof(struct afs_status_cb), GFP_NOFS);
 =09if (!scb)
 =09=09goto error;
=20
-=09acl =3D kmalloc(sizeof(*acl) + size, GFP_KERNEL);
+=09acl =3D kmalloc(sizeof(*acl) + args->size, GFP_KERNEL);
 =09if (!acl)
 =09=09goto error_scb;
=20
-=09acl->size =3D size;
-=09memcpy(acl->data, buffer, size);
+=09acl->size =3D args->size;
+=09memcpy(acl->data, args->value, args->size);
=20
 =09key =3D afs_request_key(vnode->volume->cell);
 =09if (IS_ERR(key)) {
@@ -332,20 +324,18 @@ static const struct xattr_handler afs_xattr_yfs_handl=
er =3D {
  * Get the name of the cell on which a file resides.
  */
 static int afs_xattr_get_cell(const struct xattr_handler *handler,
-=09=09=09      struct dentry *dentry,
-=09=09=09      struct inode *inode, const char *name,
-=09=09=09      void *buffer, size_t size)
+=09=09=09      struct xattr_gs_args *args)
 {
-=09struct afs_vnode *vnode =3D AFS_FS_I(inode);
+=09struct afs_vnode *vnode =3D AFS_FS_I(args->inode);
 =09struct afs_cell *cell =3D vnode->volume->cell;
 =09size_t namelen;
=20
 =09namelen =3D cell->name_len;
-=09if (size =3D=3D 0)
+=09if (args->size =3D=3D 0)
 =09=09return namelen;
-=09if (namelen > size)
+=09if (namelen > args->size)
 =09=09return -ERANGE;
-=09memcpy(buffer, cell->name, namelen);
+=09memcpy(args->buffer, cell->name, namelen);
 =09return namelen;
 }
=20
@@ -359,30 +349,30 @@ static const struct xattr_handler afs_xattr_afs_cell_=
handler =3D {
  * hex numbers separated by colons.
  */
 static int afs_xattr_get_fid(const struct xattr_handler *handler,
-=09=09=09     struct dentry *dentry,
-=09=09=09     struct inode *inode, const char *name,
-=09=09=09     void *buffer, size_t size)
+=09=09=09     struct xattr_gs_args *args)
 {
-=09struct afs_vnode *vnode =3D AFS_FS_I(inode);
+=09struct afs_vnode *vnode =3D AFS_FS_I(args->inode);
 =09char text[16 + 1 + 24 + 1 + 8 + 1];
 =09size_t len;
=20
 =09/* The volume ID is 64-bit, the vnode ID is 96-bit and the
 =09 * uniquifier is 32-bit.
 =09 */
-=09len =3D sprintf(text, "%llx:", vnode->fid.vid);
+=09len =3D scnprintf(text, sizeof(text), "%llx:", vnode->fid.vid);
 =09if (vnode->fid.vnode_hi)
-=09=09len +=3D sprintf(text + len, "%x%016llx",
+=09=09len +=3D scnprintf(text + len, sizeof(text) - len, "%x%016llx",
 =09=09=09       vnode->fid.vnode_hi, vnode->fid.vnode);
 =09else
-=09=09len +=3D sprintf(text + len, "%llx", vnode->fid.vnode);
-=09len +=3D sprintf(text + len, ":%x", vnode->fid.unique);
+=09=09len +=3D scnprintf(text + len, sizeof(text) - len, "%llx",
+=09=09=09=09 vnode->fid.vnode);
+=09len +=3D scnprintf(text + len, sizeof(text) - len, ":%x",
+=09=09=09 vnode->fid.unique);
=20
-=09if (size =3D=3D 0)
+=09if (args->size =3D=3D 0)
 =09=09return len;
-=09if (len > size)
+=09if (len > args->size)
 =09=09return -ERANGE;
-=09memcpy(buffer, text, len);
+=09memcpy(args->buffer, text, len);
 =09return len;
 }
=20
@@ -395,20 +385,18 @@ static const struct xattr_handler afs_xattr_afs_fid_h=
andler =3D {
  * Get the name of the volume on which a file resides.
  */
 static int afs_xattr_get_volume(const struct xattr_handler *handler,
-=09=09=09      struct dentry *dentry,
-=09=09=09      struct inode *inode, const char *name,
-=09=09=09      void *buffer, size_t size)
+=09=09=09      struct xattr_gs_args *args)
 {
-=09struct afs_vnode *vnode =3D AFS_FS_I(inode);
+=09struct afs_vnode *vnode =3D AFS_FS_I(args->inode);
 =09const char *volname =3D vnode->volume->name;
 =09size_t namelen;
=20
 =09namelen =3D strlen(volname);
-=09if (size =3D=3D 0)
+=09if (args->size =3D=3D 0)
 =09=09return namelen;
-=09if (namelen > size)
+=09if (namelen > args->size)
 =09=09return -ERANGE;
-=09memcpy(buffer, volname, namelen);
+=09memcpy(args->buffer, volname, namelen);
 =09return namelen;
 }
=20
diff --git a/fs/btrfs/xattr.c b/fs/btrfs/xattr.c
index 95d9aebff2c4..e47a0e461bd2 100644
--- a/fs/btrfs/xattr.c
+++ b/fs/btrfs/xattr.c
@@ -352,33 +352,30 @@ ssize_t btrfs_listxattr(struct dentry *dentry, char *=
buffer, size_t size)
 }
=20
 static int btrfs_xattr_handler_get(const struct xattr_handler *handler,
-=09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *name, void *buffer, size_t size)
+=09=09=09=09   struct xattr_gs_args *args)
 {
-=09name =3D xattr_full_name(handler, name);
-=09return btrfs_getxattr(inode, name, buffer, size);
+=09return btrfs_getxattr(args->inode,
+=09=09=09      xattr_full_name(handler, args->name),
+=09=09=09      args->buffer, args->size);
 }
=20
 static int btrfs_xattr_handler_set(const struct xattr_handler *handler,
-=09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *name, const void *buffer,
-=09=09=09=09   size_t size, int flags)
+=09=09=09=09   struct xattr_gs_args *args)
 {
-=09name =3D xattr_full_name(handler, name);
-=09return btrfs_setxattr_trans(inode, name, buffer, size, flags);
+=09return btrfs_setxattr_trans(args->inode,
+=09=09=09=09    xattr_full_name(handler, args->name),
+=09=09=09=09    args->value, args->size, args->flags);
 }
=20
 static int btrfs_xattr_handler_set_prop(const struct xattr_handler *handle=
r,
-=09=09=09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09=09=09const char *name, const void *value,
-=09=09=09=09=09size_t size, int flags)
+=09=09=09=09=09struct xattr_gs_args *args)
 {
 =09int ret;
 =09struct btrfs_trans_handle *trans;
-=09struct btrfs_root *root =3D BTRFS_I(inode)->root;
+=09struct btrfs_root *root =3D BTRFS_I(args->inode)->root;
=20
-=09name =3D xattr_full_name(handler, name);
-=09ret =3D btrfs_validate_prop(name, value, size);
+=09ret =3D btrfs_validate_prop(xattr_full_name(handler, args->name),
+=09=09=09=09  args->value, args->size);
 =09if (ret)
 =09=09return ret;
=20
@@ -386,11 +383,12 @@ static int btrfs_xattr_handler_set_prop(const struct =
xattr_handler *handler,
 =09if (IS_ERR(trans))
 =09=09return PTR_ERR(trans);
=20
-=09ret =3D btrfs_set_prop(trans, inode, name, value, size, flags);
+=09ret =3D btrfs_set_prop(trans, args->inode, args->name,
+=09=09=09     args->value, args->size, args->flags);
 =09if (!ret) {
-=09=09inode_inc_iversion(inode);
-=09=09inode->i_ctime =3D current_time(inode);
-=09=09ret =3D btrfs_update_inode(trans, root, inode);
+=09=09inode_inc_iversion(args->inode);
+=09=09args->inode->i_ctime =3D current_time(args->inode);
+=09=09ret =3D btrfs_update_inode(trans, root, args->inode);
 =09=09BUG_ON(ret);
 =09}
=20
diff --git a/fs/ceph/xattr.c b/fs/ceph/xattr.c
index cb18ee637cb7..c87691a0495e 100644
--- a/fs/ceph/xattr.c
+++ b/fs/ceph/xattr.c
@@ -1152,22 +1152,21 @@ int __ceph_setxattr(struct inode *inode, const char=
 *name,
 }
=20
 static int ceph_get_xattr_handler(const struct xattr_handler *handler,
-=09=09=09=09  struct dentry *dentry, struct inode *inode,
-=09=09=09=09  const char *name, void *value, size_t size)
+=09=09=09=09  struct xattr_gs_args *args)
 {
-=09if (!ceph_is_valid_xattr(name))
+=09if (!ceph_is_valid_xattr(args->name))
 =09=09return -EOPNOTSUPP;
-=09return __ceph_getxattr(inode, name, value, size);
+=09return __ceph_getxattr(args->inode, args->name,
+=09=09=09       args->buffer, args->size);
 }
=20
 static int ceph_set_xattr_handler(const struct xattr_handler *handler,
-=09=09=09=09  struct dentry *unused, struct inode *inode,
-=09=09=09=09  const char *name, const void *value,
-=09=09=09=09  size_t size, int flags)
+=09=09=09=09  struct xattr_gs_args *args)
 {
-=09if (!ceph_is_valid_xattr(name))
+=09if (!ceph_is_valid_xattr(args->name))
 =09=09return -EOPNOTSUPP;
-=09return __ceph_setxattr(inode, name, value, size, flags);
+=09return __ceph_setxattr(args->inode, args->name,
+=09=09=09       args->value, args->size, args->flags);
 }
=20
 static const struct xattr_handler ceph_other_xattr_handler =3D {
diff --git a/fs/cifs/xattr.c b/fs/cifs/xattr.c
index db4ba8f6077e..808af9f3e7c5 100644
--- a/fs/cifs/xattr.c
+++ b/fs/cifs/xattr.c
@@ -48,13 +48,11 @@
 enum { XATTR_USER, XATTR_CIFS_ACL, XATTR_ACL_ACCESS, XATTR_ACL_DEFAULT };
=20
 static int cifs_xattr_set(const struct xattr_handler *handler,
-=09=09=09  struct dentry *dentry, struct inode *inode,
-=09=09=09  const char *name, const void *value,
-=09=09=09  size_t size, int flags)
+=09=09=09  struct xattr_gs_args *args)
 {
 =09int rc =3D -EOPNOTSUPP;
 =09unsigned int xid;
-=09struct super_block *sb =3D dentry->d_sb;
+=09struct super_block *sb =3D args->dentry->d_sb;
 =09struct cifs_sb_info *cifs_sb =3D CIFS_SB(sb);
 =09struct tcon_link *tlink;
 =09struct cifs_tcon *pTcon;
@@ -67,7 +65,7 @@ static int cifs_xattr_set(const struct xattr_handler *han=
dler,
=20
 =09xid =3D get_xid();
=20
-=09full_path =3D build_path_from_dentry(dentry);
+=09full_path =3D build_path_from_dentry(args->dentry);
 =09if (full_path =3D=3D NULL) {
 =09=09rc =3D -ENOMEM;
 =09=09goto out;
@@ -78,7 +76,7 @@ static int cifs_xattr_set(const struct xattr_handler *han=
dler,
 =09/* if proc/fs/cifs/streamstoxattr is set then
 =09=09search server for EAs or streams to
 =09=09returns as xattrs */
-=09if (size > MAX_EA_VALUE_SIZE) {
+=09if (args->size > MAX_EA_VALUE_SIZE) {
 =09=09cifs_dbg(FYI, "size of EA value too large\n");
 =09=09rc =3D -EOPNOTSUPP;
 =09=09goto out;
@@ -91,29 +89,30 @@ static int cifs_xattr_set(const struct xattr_handler *h=
andler,
=20
 =09=09if (pTcon->ses->server->ops->set_EA)
 =09=09=09rc =3D pTcon->ses->server->ops->set_EA(xid, pTcon,
-=09=09=09=09full_path, name, value, (__u16)size,
+=09=09=09=09full_path, args->name,
+=09=09=09=09args->value, (__u16)args->size,
 =09=09=09=09cifs_sb->local_nls, cifs_sb);
 =09=09break;
=20
 =09case XATTR_CIFS_ACL: {
 =09=09struct cifs_ntsd *pacl;
=20
-=09=09if (!value)
+=09=09if (!args->value)
 =09=09=09goto out;
-=09=09pacl =3D kmalloc(size, GFP_KERNEL);
+=09=09pacl =3D kmalloc(args->size, GFP_KERNEL);
 =09=09if (!pacl) {
 =09=09=09rc =3D -ENOMEM;
 =09=09} else {
-=09=09=09memcpy(pacl, value, size);
-=09=09=09if (value &&
+=09=09=09memcpy(pacl, args->value, args->size);
+=09=09=09if (args->value &&
 =09=09=09    pTcon->ses->server->ops->set_acl)
 =09=09=09=09rc =3D pTcon->ses->server->ops->set_acl(pacl,
-=09=09=09=09=09=09size, inode,
+=09=09=09=09=09=09args->size, args->inode,
 =09=09=09=09=09=09full_path, CIFS_ACL_DACL);
 =09=09=09else
 =09=09=09=09rc =3D -EOPNOTSUPP;
 =09=09=09if (rc =3D=3D 0) /* force revalidate of the inode */
-=09=09=09=09CIFS_I(inode)->time =3D 0;
+=09=09=09=09CIFS_I(args->inode)->time =3D 0;
 =09=09=09kfree(pacl);
 =09=09}
 =09=09break;
@@ -121,11 +120,11 @@ static int cifs_xattr_set(const struct xattr_handler =
*handler,
=20
 =09case XATTR_ACL_ACCESS:
 #ifdef CONFIG_CIFS_POSIX
-=09=09if (!value)
+=09=09if (!args->value)
 =09=09=09goto out;
 =09=09if (sb->s_flags & SB_POSIXACL)
 =09=09=09rc =3D CIFSSMBSetPosixACL(xid, pTcon, full_path,
-=09=09=09=09value, (const int)size,
+=09=09=09=09args->value, (const int)args->size,
 =09=09=09=09ACL_TYPE_ACCESS, cifs_sb->local_nls,
 =09=09=09=09cifs_remap(cifs_sb));
 #endif  /* CONFIG_CIFS_POSIX */
@@ -133,11 +132,11 @@ static int cifs_xattr_set(const struct xattr_handler =
*handler,
=20
 =09case XATTR_ACL_DEFAULT:
 #ifdef CONFIG_CIFS_POSIX
-=09=09if (!value)
+=09=09if (!args->value)
 =09=09=09goto out;
 =09=09if (sb->s_flags & SB_POSIXACL)
 =09=09=09rc =3D CIFSSMBSetPosixACL(xid, pTcon, full_path,
-=09=09=09=09value, (const int)size,
+=09=09=09=09args->value, (const int)args->size,
 =09=09=09=09ACL_TYPE_DEFAULT, cifs_sb->local_nls,
 =09=09=09=09cifs_remap(cifs_sb));
 #endif  /* CONFIG_CIFS_POSIX */
@@ -198,12 +197,11 @@ static int cifs_creation_time_get(struct dentry *dent=
ry, struct inode *inode,
=20
=20
 static int cifs_xattr_get(const struct xattr_handler *handler,
-=09=09=09  struct dentry *dentry, struct inode *inode,
-=09=09=09  const char *name, void *value, size_t size)
+=09=09=09  struct xattr_gs_args *args)
 {
 =09ssize_t rc =3D -EOPNOTSUPP;
 =09unsigned int xid;
-=09struct super_block *sb =3D dentry->d_sb;
+=09struct super_block *sb =3D args->dentry->d_sb;
 =09struct cifs_sb_info *cifs_sb =3D CIFS_SB(sb);
 =09struct tcon_link *tlink;
 =09struct cifs_tcon *pTcon;
@@ -216,7 +214,7 @@ static int cifs_xattr_get(const struct xattr_handler *h=
andler,
=20
 =09xid =3D get_xid();
=20
-=09full_path =3D build_path_from_dentry(dentry);
+=09full_path =3D build_path_from_dentry(args->dentry);
 =09if (full_path =3D=3D NULL) {
 =09=09rc =3D -ENOMEM;
 =09=09goto out;
@@ -225,14 +223,17 @@ static int cifs_xattr_get(const struct xattr_handler =
*handler,
 =09/* return alt name if available as pseudo attr */
 =09switch (handler->flags) {
 =09case XATTR_USER:
-=09=09cifs_dbg(FYI, "%s:querying user xattr %s\n", __func__, name);
-=09=09if ((strcmp(name, CIFS_XATTR_ATTRIB) =3D=3D 0) ||
-=09=09    (strcmp(name, SMB3_XATTR_ATTRIB) =3D=3D 0)) {
-=09=09=09rc =3D cifs_attrib_get(dentry, inode, value, size);
+=09=09cifs_dbg(FYI, "%s:querying user xattr %s\n", __func__,
+=09=09=09 args->name);
+=09=09if ((strcmp(args->name, CIFS_XATTR_ATTRIB) =3D=3D 0) ||
+=09=09    (strcmp(args->name, SMB3_XATTR_ATTRIB) =3D=3D 0)) {
+=09=09=09rc =3D cifs_attrib_get(args->dentry, args->inode,
+=09=09=09=09=09     args->buffer, args->size);
 =09=09=09break;
-=09=09} else if ((strcmp(name, CIFS_XATTR_CREATETIME) =3D=3D 0) ||
-=09=09    (strcmp(name, SMB3_XATTR_CREATETIME) =3D=3D 0)) {
-=09=09=09rc =3D cifs_creation_time_get(dentry, inode, value, size);
+=09=09} else if ((strcmp(args->name, CIFS_XATTR_CREATETIME) =3D=3D 0) ||
+=09=09    (strcmp(args->name, SMB3_XATTR_CREATETIME) =3D=3D 0)) {
+=09=09=09rc =3D cifs_creation_time_get(args->dentry, args->inode,
+=09=09=09=09=09=09    args->buffer, args->size);
 =09=09=09break;
 =09=09}
=20
@@ -241,7 +242,8 @@ static int cifs_xattr_get(const struct xattr_handler *h=
andler,
=20
 =09=09if (pTcon->ses->server->ops->query_all_EAs)
 =09=09=09rc =3D pTcon->ses->server->ops->query_all_EAs(xid, pTcon,
-=09=09=09=09full_path, name, value, size, cifs_sb);
+=09=09=09=09full_path, args->name,
+=09=09=09=09args->buffer, args->size, cifs_sb);
 =09=09break;
=20
 =09case XATTR_CIFS_ACL: {
@@ -252,17 +254,17 @@ static int cifs_xattr_get(const struct xattr_handler =
*handler,
 =09=09=09goto out; /* rc already EOPNOTSUPP */
=20
 =09=09pacl =3D pTcon->ses->server->ops->get_acl(cifs_sb,
-=09=09=09=09inode, full_path, &acllen);
+=09=09=09=09args->inode, full_path, &acllen);
 =09=09if (IS_ERR(pacl)) {
 =09=09=09rc =3D PTR_ERR(pacl);
 =09=09=09cifs_dbg(VFS, "%s: error %zd getting sec desc\n",
 =09=09=09=09 __func__, rc);
 =09=09} else {
-=09=09=09if (value) {
-=09=09=09=09if (acllen > size)
+=09=09=09if (args->buffer) {
+=09=09=09=09if (acllen > args->size)
 =09=09=09=09=09acllen =3D -ERANGE;
 =09=09=09=09else
-=09=09=09=09=09memcpy(value, pacl, acllen);
+=09=09=09=09=09memcpy(args->buffer, pacl, acllen);
 =09=09=09}
 =09=09=09rc =3D acllen;
 =09=09=09kfree(pacl);
@@ -274,7 +276,7 @@ static int cifs_xattr_get(const struct xattr_handler *h=
andler,
 #ifdef CONFIG_CIFS_POSIX
 =09=09if (sb->s_flags & SB_POSIXACL)
 =09=09=09rc =3D CIFSSMBGetPosixACL(xid, pTcon, full_path,
-=09=09=09=09value, size, ACL_TYPE_ACCESS,
+=09=09=09=09args->buffer, args->size, ACL_TYPE_ACCESS,
 =09=09=09=09cifs_sb->local_nls,
 =09=09=09=09cifs_remap(cifs_sb));
 #endif  /* CONFIG_CIFS_POSIX */
@@ -284,7 +286,7 @@ static int cifs_xattr_get(const struct xattr_handler *h=
andler,
 #ifdef CONFIG_CIFS_POSIX
 =09=09if (sb->s_flags & SB_POSIXACL)
 =09=09=09rc =3D CIFSSMBGetPosixACL(xid, pTcon, full_path,
-=09=09=09=09value, size, ACL_TYPE_DEFAULT,
+=09=09=09=09args->buffer, args->size, ACL_TYPE_DEFAULT,
 =09=09=09=09cifs_sb->local_nls,
 =09=09=09=09cifs_remap(cifs_sb));
 #endif  /* CONFIG_CIFS_POSIX */
diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index f91db24bbf3b..5fbda6491920 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -1114,20 +1114,24 @@ ecryptfs_write_metadata_to_xattr(struct dentry *ecr=
yptfs_dentry,
 =09=09=09=09 char *page_virt, size_t size)
 {
 =09int rc;
-=09struct dentry *lower_dentry =3D ecryptfs_dentry_to_lower(ecryptfs_dentr=
y);
-=09struct inode *lower_inode =3D d_inode(lower_dentry);
+=09struct xattr_gs_args lower =3D {};
=20
-=09if (!(lower_inode->i_opflags & IOP_XATTR)) {
+=09lower.dentry =3D ecryptfs_dentry_to_lower(ecryptfs_dentry);
+=09lower.inode =3D d_inode(lower.dentry);
+
+=09if (!(lower.inode->i_opflags & IOP_XATTR)) {
 =09=09rc =3D -EOPNOTSUPP;
 =09=09goto out;
 =09}
=20
-=09inode_lock(lower_inode);
-=09rc =3D __vfs_setxattr(lower_dentry, lower_inode, ECRYPTFS_XATTR_NAME,
-=09=09=09    page_virt, size, 0);
+=09lower.name =3D ECRYPTFS_XATTR_NAME;
+=09lower.value =3D page_virt;
+=09lower.size =3D size;
+=09inode_lock(lower.inode);
+=09rc =3D __vfs_setxattr(&lower);
 =09if (!rc && ecryptfs_inode)
-=09=09fsstack_copy_attr_all(ecryptfs_inode, lower_inode);
-=09inode_unlock(lower_inode);
+=09=09fsstack_copy_attr_all(ecryptfs_inode, lower.inode);
+=09inode_unlock(lower.inode);
 out:
 =09return rc;
 }
diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 18426f4855f1..fc4435847a45 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -1009,16 +1009,24 @@ ecryptfs_setxattr(struct dentry *dentry, struct ino=
de *inode,
=20
 ssize_t
 ecryptfs_getxattr_lower(struct dentry *lower_dentry, struct inode *lower_i=
node,
-=09=09=09const char *name, void *value, size_t size)
+=09=09=09const char *name, void *buffer, size_t size)
 {
 =09int rc;
+=09struct xattr_gs_args args;
=20
 =09if (!(lower_inode->i_opflags & IOP_XATTR)) {
 =09=09rc =3D -EOPNOTSUPP;
 =09=09goto out;
 =09}
+=09memset(&args, 0, sizeof(args));
+=09args.dentry =3D lower_dentry;
+=09args.inode =3D lower_inode;
+=09args.name =3D name;
+=09args.buffer =3D buffer;
+=09args.size =3D size;
+=09args.flags =3D XATTR_NOSECURITY;
 =09inode_lock(lower_inode);
-=09rc =3D __vfs_getxattr(lower_dentry, lower_inode, name, value, size);
+=09rc =3D __vfs_getxattr(&args);
 =09inode_unlock(lower_inode);
 out:
 =09return rc;
@@ -1102,23 +1110,23 @@ const struct inode_operations ecryptfs_main_iops =
=3D {
 };
=20
 static int ecryptfs_xattr_get(const struct xattr_handler *handler,
-=09=09=09      struct dentry *dentry, struct inode *inode,
-=09=09=09      const char *name, void *buffer, size_t size)
+=09=09=09      struct xattr_gs_args *args)
 {
-=09return ecryptfs_getxattr(dentry, inode, name, buffer, size);
+=09return ecryptfs_getxattr(args->dentry, args->inode, args->name,
+=09=09=09=09 args->buffer, args->size);
 }
=20
 static int ecryptfs_xattr_set(const struct xattr_handler *handler,
-=09=09=09      struct dentry *dentry, struct inode *inode,
-=09=09=09      const char *name, const void *value, size_t size,
-=09=09=09      int flags)
+=09=09=09      struct xattr_gs_args *args)
 {
-=09if (value)
-=09=09return ecryptfs_setxattr(dentry, inode, name, value, size, flags);
-=09else {
-=09=09BUG_ON(flags !=3D XATTR_REPLACE);
-=09=09return ecryptfs_removexattr(dentry, inode, name);
-=09}
+=09if (args->value)
+=09=09return ecryptfs_setxattr(args->dentry, args->inode, args->name,
+=09=09=09=09=09 args->value, args->size, args->flags);
+=09else if (args->flags !=3D XATTR_REPLACE)
+=09=09return -EINVAL;
+=09else
+=09=09return ecryptfs_removexattr(args->dentry, args->inode,
+=09=09=09=09=09    args->name);
 }
=20
 static const struct xattr_handler ecryptfs_xattr_handler =3D {
diff --git a/fs/ecryptfs/mmap.c b/fs/ecryptfs/mmap.c
index cffa0c1ec829..90dc0354ec5e 100644
--- a/fs/ecryptfs/mmap.c
+++ b/fs/ecryptfs/mmap.c
@@ -402,37 +402,40 @@ struct kmem_cache *ecryptfs_xattr_cache;
=20
 static int ecryptfs_write_inode_size_to_xattr(struct inode *ecryptfs_inode=
)
 {
-=09ssize_t size;
-=09void *xattr_virt;
-=09struct dentry *lower_dentry =3D
-=09=09ecryptfs_inode_to_private(ecryptfs_inode)->lower_file->f_path.dentry=
;
-=09struct inode *lower_inode =3D d_inode(lower_dentry);
+=09struct xattr_gs_args args;
 =09int rc;
=20
-=09if (!(lower_inode->i_opflags & IOP_XATTR)) {
+=09memset(&args, 0, sizeof(args));
+=09args.dentry =3D ecryptfs_inode_to_private(ecryptfs_inode)->
+=09=09lower_file->f_path.dentry;
+=09args.inode =3D d_inode(args.dentry);
+=09if (!(args.inode->i_opflags & IOP_XATTR)) {
 =09=09printk(KERN_WARNING
 =09=09       "No support for setting xattr in lower filesystem\n");
 =09=09rc =3D -ENOSYS;
 =09=09goto out;
 =09}
-=09xattr_virt =3D kmem_cache_alloc(ecryptfs_xattr_cache, GFP_KERNEL);
-=09if (!xattr_virt) {
+=09args.buffer =3D kmem_cache_alloc(ecryptfs_xattr_cache, GFP_KERNEL);
+=09if (!args.buffer) {
 =09=09rc =3D -ENOMEM;
 =09=09goto out;
 =09}
-=09inode_lock(lower_inode);
-=09size =3D __vfs_getxattr(lower_dentry, lower_inode, ECRYPTFS_XATTR_NAME,
-=09=09=09      xattr_virt, PAGE_SIZE);
-=09if (size < 0)
-=09=09size =3D 8;
-=09put_unaligned_be64(i_size_read(ecryptfs_inode), xattr_virt);
-=09rc =3D __vfs_setxattr(lower_dentry, lower_inode, ECRYPTFS_XATTR_NAME,
-=09=09=09    xattr_virt, size, 0);
-=09inode_unlock(lower_inode);
+=09args.name =3D ECRYPTFS_XATTR_NAME;
+=09args.size =3D PAGE_SIZE;
+=09args.flags =3D XATTR_NOSECURITY;
+=09inode_lock(args.inode);
+=09args.size =3D __vfs_getxattr(&args);
+=09if (args.size < 0)
+=09=09args.size =3D 8;
+=09put_unaligned_be64(i_size_read(ecryptfs_inode), args.buffer);
+=09args.flags =3D 0;
+=09args.value =3D args.buffer;
+=09rc =3D __vfs_setxattr(&args);
+=09inode_unlock(args.inode);
 =09if (rc)
 =09=09printk(KERN_ERR "Error whilst attempting to write inode size "
 =09=09       "to lower file xattr; rc =3D [%d]\n", rc);
-=09kmem_cache_free(ecryptfs_xattr_cache, xattr_virt);
+=09kmem_cache_free(ecryptfs_xattr_cache, args.buffer);
 out:
 =09return rc;
 }
diff --git a/fs/erofs/xattr.c b/fs/erofs/xattr.c
index a13a78725c57..c4d003733e42 100644
--- a/fs/erofs/xattr.c
+++ b/fs/erofs/xattr.c
@@ -462,10 +462,9 @@ int erofs_getxattr(struct inode *inode, int index,
 }
=20
 static int erofs_xattr_generic_get(const struct xattr_handler *handler,
-=09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *name, void *buffer, size_t size)
+=09=09=09=09   struct xattr_gs_args *args)
 {
-=09struct erofs_sb_info *const sbi =3D EROFS_I_SB(inode);
+=09struct erofs_sb_info *const sbi =3D EROFS_I_SB(args->inode);
=20
 =09switch (handler->flags) {
 =09case EROFS_XATTR_INDEX_USER:
@@ -482,7 +481,8 @@ static int erofs_xattr_generic_get(const struct xattr_h=
andler *handler,
 =09=09return -EINVAL;
 =09}
=20
-=09return erofs_getxattr(inode, handler->flags, name, buffer, size);
+=09return erofs_getxattr(args->inode, handler->flags, args->name,
+=09=09=09      args->buffer, args->size);
 }
=20
 const struct xattr_handler erofs_xattr_user_handler =3D {
diff --git a/fs/ext2/xattr_security.c b/fs/ext2/xattr_security.c
index 9a682e440acb..d651d4a7c9ca 100644
--- a/fs/ext2/xattr_security.c
+++ b/fs/ext2/xattr_security.c
@@ -10,21 +10,19 @@
=20
 static int
 ext2_xattr_security_get(const struct xattr_handler *handler,
-=09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09const char *name, void *buffer, size_t size)
+=09=09=09struct xattr_gs_args *args)
 {
-=09return ext2_xattr_get(inode, EXT2_XATTR_INDEX_SECURITY, name,
-=09=09=09      buffer, size);
+=09return ext2_xattr_get(args->inode, EXT2_XATTR_INDEX_SECURITY,
+=09=09=09      args->name, args->buffer, args->size);
 }
=20
 static int
 ext2_xattr_security_set(const struct xattr_handler *handler,
-=09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09const char *name, const void *value,
-=09=09=09size_t size, int flags)
+=09=09=09struct xattr_gs_args *args)
 {
-=09return ext2_xattr_set(inode, EXT2_XATTR_INDEX_SECURITY, name,
-=09=09=09      value, size, flags);
+=09return ext2_xattr_set(args->inode, EXT2_XATTR_INDEX_SECURITY,
+=09=09=09      args->name, args->value, args->size,
+=09=09=09      args->flags);
 }
=20
 static int ext2_initxattrs(struct inode *inode, const struct xattr *xattr_=
array,
diff --git a/fs/ext2/xattr_trusted.c b/fs/ext2/xattr_trusted.c
index 49add1107850..41390dd0386a 100644
--- a/fs/ext2/xattr_trusted.c
+++ b/fs/ext2/xattr_trusted.c
@@ -17,21 +17,18 @@ ext2_xattr_trusted_list(struct dentry *dentry)
=20
 static int
 ext2_xattr_trusted_get(const struct xattr_handler *handler,
-=09=09       struct dentry *unused, struct inode *inode,
-=09=09       const char *name, void *buffer, size_t size)
+=09=09       struct xattr_gs_args *args)
 {
-=09return ext2_xattr_get(inode, EXT2_XATTR_INDEX_TRUSTED, name,
-=09=09=09      buffer, size);
+=09return ext2_xattr_get(args->inode, EXT2_XATTR_INDEX_TRUSTED, args->name=
,
+=09=09=09      args->buffer, args->size);
 }
=20
 static int
 ext2_xattr_trusted_set(const struct xattr_handler *handler,
-=09=09       struct dentry *unused, struct inode *inode,
-=09=09       const char *name, const void *value,
-=09=09       size_t size, int flags)
+=09=09       struct xattr_gs_args *args)
 {
-=09return ext2_xattr_set(inode, EXT2_XATTR_INDEX_TRUSTED, name,
-=09=09=09      value, size, flags);
+=09return ext2_xattr_set(args->inode, EXT2_XATTR_INDEX_TRUSTED, args->name=
,
+=09=09=09      args->value, args->size, args->flags);
 }
=20
 const struct xattr_handler ext2_xattr_trusted_handler =3D {
diff --git a/fs/ext2/xattr_user.c b/fs/ext2/xattr_user.c
index c243a3b4d69d..1ef881890dde 100644
--- a/fs/ext2/xattr_user.c
+++ b/fs/ext2/xattr_user.c
@@ -19,26 +19,23 @@ ext2_xattr_user_list(struct dentry *dentry)
=20
 static int
 ext2_xattr_user_get(const struct xattr_handler *handler,
-=09=09    struct dentry *unused, struct inode *inode,
-=09=09    const char *name, void *buffer, size_t size)
+=09=09    struct xattr_gs_args *args)
 {
-=09if (!test_opt(inode->i_sb, XATTR_USER))
+=09if (!test_opt(args->inode->i_sb, XATTR_USER))
 =09=09return -EOPNOTSUPP;
-=09return ext2_xattr_get(inode, EXT2_XATTR_INDEX_USER,
-=09=09=09      name, buffer, size);
+=09return ext2_xattr_get(args->inode, EXT2_XATTR_INDEX_USER, args->name,
+=09=09=09      args->buffer, args->size);
 }
=20
 static int
 ext2_xattr_user_set(const struct xattr_handler *handler,
-=09=09    struct dentry *unused, struct inode *inode,
-=09=09    const char *name, const void *value,
-=09=09    size_t size, int flags)
+=09=09    struct xattr_gs_args *args)
 {
-=09if (!test_opt(inode->i_sb, XATTR_USER))
+=09if (!test_opt(args->inode->i_sb, XATTR_USER))
 =09=09return -EOPNOTSUPP;
=20
-=09return ext2_xattr_set(inode, EXT2_XATTR_INDEX_USER,
-=09=09=09      name, value, size, flags);
+=09return ext2_xattr_set(args->inode, EXT2_XATTR_INDEX_USER, args->name,
+=09=09=09      args->value, args->size, args->flags);
 }
=20
 const struct xattr_handler ext2_xattr_user_handler =3D {
diff --git a/fs/ext4/xattr_security.c b/fs/ext4/xattr_security.c
index 197a9d8a15ef..71ed703e01fe 100644
--- a/fs/ext4/xattr_security.c
+++ b/fs/ext4/xattr_security.c
@@ -14,21 +14,18 @@
=20
 static int
 ext4_xattr_security_get(const struct xattr_handler *handler,
-=09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09const char *name, void *buffer, size_t size)
+=09=09=09struct xattr_gs_args *args)
 {
-=09return ext4_xattr_get(inode, EXT4_XATTR_INDEX_SECURITY,
-=09=09=09      name, buffer, size);
+=09return ext4_xattr_get(args->inode, EXT4_XATTR_INDEX_SECURITY,
+=09=09=09      args->name, args->buffer, args->size);
 }
=20
 static int
 ext4_xattr_security_set(const struct xattr_handler *handler,
-=09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09const char *name, const void *value,
-=09=09=09size_t size, int flags)
+=09=09=09struct xattr_gs_args *args)
 {
-=09return ext4_xattr_set(inode, EXT4_XATTR_INDEX_SECURITY,
-=09=09=09      name, value, size, flags);
+=09return ext4_xattr_set(args->inode, EXT4_XATTR_INDEX_SECURITY,
+=09=09=09      args->name, args->value, args->size, args->flags);
 }
=20
 static int
diff --git a/fs/ext4/xattr_trusted.c b/fs/ext4/xattr_trusted.c
index e9389e5d75c3..ed347a978102 100644
--- a/fs/ext4/xattr_trusted.c
+++ b/fs/ext4/xattr_trusted.c
@@ -21,21 +21,18 @@ ext4_xattr_trusted_list(struct dentry *dentry)
=20
 static int
 ext4_xattr_trusted_get(const struct xattr_handler *handler,
-=09=09       struct dentry *unused, struct inode *inode,
-=09=09       const char *name, void *buffer, size_t size)
+=09=09       struct xattr_gs_args *args)
 {
-=09return ext4_xattr_get(inode, EXT4_XATTR_INDEX_TRUSTED,
-=09=09=09      name, buffer, size);
+=09return ext4_xattr_get(args->inode, EXT4_XATTR_INDEX_TRUSTED,
+=09=09=09      args->name, args->buffer, args->size);
 }
=20
 static int
 ext4_xattr_trusted_set(const struct xattr_handler *handler,
-=09=09       struct dentry *unused, struct inode *inode,
-=09=09       const char *name, const void *value,
-=09=09       size_t size, int flags)
+=09=09       struct xattr_gs_args *args)
 {
-=09return ext4_xattr_set(inode, EXT4_XATTR_INDEX_TRUSTED,
-=09=09=09      name, value, size, flags);
+=09return ext4_xattr_set(args->inode, EXT4_XATTR_INDEX_TRUSTED,
+=09=09=09      args->name, args->value, args->size, args->flags);
 }
=20
 const struct xattr_handler ext4_xattr_trusted_handler =3D {
diff --git a/fs/ext4/xattr_user.c b/fs/ext4/xattr_user.c
index d4546184b34b..86e9f5a9284d 100644
--- a/fs/ext4/xattr_user.c
+++ b/fs/ext4/xattr_user.c
@@ -20,25 +20,22 @@ ext4_xattr_user_list(struct dentry *dentry)
=20
 static int
 ext4_xattr_user_get(const struct xattr_handler *handler,
-=09=09    struct dentry *unused, struct inode *inode,
-=09=09    const char *name, void *buffer, size_t size)
+=09=09    struct xattr_gs_args *args)
 {
-=09if (!test_opt(inode->i_sb, XATTR_USER))
+=09if (!test_opt(args->inode->i_sb, XATTR_USER))
 =09=09return -EOPNOTSUPP;
-=09return ext4_xattr_get(inode, EXT4_XATTR_INDEX_USER,
-=09=09=09      name, buffer, size);
+=09return ext4_xattr_get(args->inode, EXT4_XATTR_INDEX_USER,
+=09=09=09      args->name, args->buffer, args->size);
 }
=20
 static int
 ext4_xattr_user_set(const struct xattr_handler *handler,
-=09=09    struct dentry *unused, struct inode *inode,
-=09=09    const char *name, const void *value,
-=09=09    size_t size, int flags)
+=09=09    struct xattr_gs_args *args)
 {
-=09if (!test_opt(inode->i_sb, XATTR_USER))
+=09if (!test_opt(args->inode->i_sb, XATTR_USER))
 =09=09return -EOPNOTSUPP;
-=09return ext4_xattr_set(inode, EXT4_XATTR_INDEX_USER,
-=09=09=09      name, value, size, flags);
+=09return ext4_xattr_set(args->inode, EXT4_XATTR_INDEX_USER,
+=09=09=09      args->name, args->value, args->size, args->flags);
 }
=20
 const struct xattr_handler ext4_xattr_user_handler =3D {
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 181900af2576..d39c39183bdc 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -24,10 +24,9 @@
 #include "segment.h"
=20
 static int f2fs_xattr_generic_get(const struct xattr_handler *handler,
-=09=09struct dentry *unused, struct inode *inode,
-=09=09const char *name, void *buffer, size_t size)
+=09=09=09=09  struct xattr_gs_args *args)
 {
-=09struct f2fs_sb_info *sbi =3D F2FS_SB(inode->i_sb);
+=09struct f2fs_sb_info *sbi =3D F2FS_SB(args->inode->i_sb);
=20
 =09switch (handler->flags) {
 =09case F2FS_XATTR_INDEX_USER:
@@ -40,16 +39,14 @@ static int f2fs_xattr_generic_get(const struct xattr_ha=
ndler *handler,
 =09default:
 =09=09return -EINVAL;
 =09}
-=09return f2fs_getxattr(inode, handler->flags, name,
-=09=09=09     buffer, size, NULL);
+=09return f2fs_getxattr(args->inode, handler->flags, args->name,
+=09=09=09     args->buffer, args->size, NULL);
 }
=20
 static int f2fs_xattr_generic_set(const struct xattr_handler *handler,
-=09=09struct dentry *unused, struct inode *inode,
-=09=09const char *name, const void *value,
-=09=09size_t size, int flags)
+=09=09=09=09  struct xattr_gs_args *args)
 {
-=09struct f2fs_sb_info *sbi =3D F2FS_SB(inode->i_sb);
+=09struct f2fs_sb_info *sbi =3D F2FS_SB(args->inode->i_sb);
=20
 =09switch (handler->flags) {
 =09case F2FS_XATTR_INDEX_USER:
@@ -62,8 +59,8 @@ static int f2fs_xattr_generic_set(const struct xattr_hand=
ler *handler,
 =09default:
 =09=09return -EINVAL;
 =09}
-=09return f2fs_setxattr(inode, handler->flags, name,
-=09=09=09=09=09value, size, NULL, flags);
+=09return f2fs_setxattr(args->inode, handler->flags, args->name,
+=09=09=09     args->value, args->size, NULL, args->flags);
 }
=20
 static bool f2fs_xattr_user_list(struct dentry *dentry)
@@ -79,36 +76,33 @@ static bool f2fs_xattr_trusted_list(struct dentry *dent=
ry)
 }
=20
 static int f2fs_xattr_advise_get(const struct xattr_handler *handler,
-=09=09struct dentry *unused, struct inode *inode,
-=09=09const char *name, void *buffer, size_t size)
+=09=09=09=09 struct xattr_gs_args *args)
 {
-=09if (buffer)
-=09=09*((char *)buffer) =3D F2FS_I(inode)->i_advise;
+=09if (args->buffer)
+=09=09*((char *)args->buffer) =3D F2FS_I(args->inode)->i_advise;
 =09return sizeof(char);
 }
=20
 static int f2fs_xattr_advise_set(const struct xattr_handler *handler,
-=09=09struct dentry *unused, struct inode *inode,
-=09=09const char *name, const void *value,
-=09=09size_t size, int flags)
+=09=09=09=09 struct xattr_gs_args *args)
 {
-=09unsigned char old_advise =3D F2FS_I(inode)->i_advise;
+=09unsigned char old_advise =3D F2FS_I(args->inode)->i_advise;
 =09unsigned char new_advise;
=20
-=09if (!inode_owner_or_capable(inode))
+=09if (!inode_owner_or_capable(args->inode))
 =09=09return -EPERM;
-=09if (value =3D=3D NULL)
+=09if (args->value =3D=3D NULL)
 =09=09return -EINVAL;
=20
-=09new_advise =3D *(char *)value;
+=09new_advise =3D *(char *)args->value;
 =09if (new_advise & ~FADVISE_MODIFIABLE_BITS)
 =09=09return -EINVAL;
=20
 =09new_advise =3D new_advise & FADVISE_MODIFIABLE_BITS;
 =09new_advise |=3D old_advise & ~FADVISE_MODIFIABLE_BITS;
=20
-=09F2FS_I(inode)->i_advise =3D new_advise;
-=09f2fs_mark_inode_dirty_sync(inode, true);
+=09F2FS_I(args->inode)->i_advise =3D new_advise;
+=09f2fs_mark_inode_dirty_sync(args->inode, true);
 =09return 0;
 }
=20
diff --git a/fs/fuse/xattr.c b/fs/fuse/xattr.c
index 20d052e08b3b..4062ad429041 100644
--- a/fs/fuse/xattr.c
+++ b/fs/fuse/xattr.c
@@ -175,21 +175,19 @@ int fuse_removexattr(struct inode *inode, const char =
*name)
 }
=20
 static int fuse_xattr_get(const struct xattr_handler *handler,
-=09=09=09 struct dentry *dentry, struct inode *inode,
-=09=09=09 const char *name, void *value, size_t size)
+=09=09=09  struct xattr_gs_args *args)
 {
-=09return fuse_getxattr(inode, name, value, size);
+=09return fuse_getxattr(args->inode, args->name, args->buffer, args->size)=
;
 }
=20
 static int fuse_xattr_set(const struct xattr_handler *handler,
-=09=09=09  struct dentry *dentry, struct inode *inode,
-=09=09=09  const char *name, const void *value, size_t size,
-=09=09=09  int flags)
+=09=09=09  struct xattr_gs_args *args)
 {
-=09if (!value)
-=09=09return fuse_removexattr(inode, name);
+=09if (!args->value)
+=09=09return fuse_removexattr(args->inode, args->name);
=20
-=09return fuse_setxattr(inode, name, value, size, flags);
+=09return fuse_setxattr(args->inode, args->name,
+=09=09=09     args->value, args->size, args->flags);
 }
=20
 static bool no_xattr_list(struct dentry *dentry)
@@ -198,16 +196,13 @@ static bool no_xattr_list(struct dentry *dentry)
 }
=20
 static int no_xattr_get(const struct xattr_handler *handler,
-=09=09=09struct dentry *dentry, struct inode *inode,
-=09=09=09const char *name, void *value, size_t size)
+=09=09=09struct xattr_gs_args *args)
 {
 =09return -EOPNOTSUPP;
 }
=20
 static int no_xattr_set(const struct xattr_handler *handler,
-=09=09=09struct dentry *dentry, struct inode *nodee,
-=09=09=09const char *name, const void *value,
-=09=09=09size_t size, int flags)
+=09=09=09struct xattr_gs_args *args)
 {
 =09return -EOPNOTSUPP;
 }
diff --git a/fs/gfs2/xattr.c b/fs/gfs2/xattr.c
index bbe593d16bea..bf8e1bd17a29 100644
--- a/fs/gfs2/xattr.c
+++ b/fs/gfs2/xattr.c
@@ -587,10 +587,9 @@ static int __gfs2_xattr_get(struct inode *inode, const=
 char *name,
 }
=20
 static int gfs2_xattr_get(const struct xattr_handler *handler,
-=09=09=09  struct dentry *unused, struct inode *inode,
-=09=09=09  const char *name, void *buffer, size_t size)
+=09=09=09  struct xattr_gs_args *args)
 {
-=09struct gfs2_inode *ip =3D GFS2_I(inode);
+=09struct gfs2_inode *ip =3D GFS2_I(args->inode);
 =09struct gfs2_holder gh;
 =09int ret;
=20
@@ -603,7 +602,8 @@ static int gfs2_xattr_get(const struct xattr_handler *h=
andler,
 =09} else {
 =09=09gfs2_holder_mark_uninitialized(&gh);
 =09}
-=09ret =3D __gfs2_xattr_get(inode, name, buffer, size, handler->flags);
+=09ret =3D __gfs2_xattr_get(args->inode, args->name,
+=09=09=09       args->buffer, args->size, handler->flags);
 =09if (gfs2_holder_initialized(&gh))
 =09=09gfs2_glock_dq_uninit(&gh);
 =09return ret;
@@ -1214,11 +1214,9 @@ int __gfs2_xattr_set(struct inode *inode, const char=
 *name,
 }
=20
 static int gfs2_xattr_set(const struct xattr_handler *handler,
-=09=09=09  struct dentry *unused, struct inode *inode,
-=09=09=09  const char *name, const void *value,
-=09=09=09  size_t size, int flags)
+=09=09=09  struct xattr_gs_args *args)
 {
-=09struct gfs2_inode *ip =3D GFS2_I(inode);
+=09struct gfs2_inode *ip =3D GFS2_I(args->inode);
 =09struct gfs2_holder gh;
 =09int ret;
=20
@@ -1237,7 +1235,9 @@ static int gfs2_xattr_set(const struct xattr_handler =
*handler,
 =09=09=09return -EIO;
 =09=09gfs2_holder_mark_uninitialized(&gh);
 =09}
-=09ret =3D __gfs2_xattr_set(inode, name, value, size, flags, handler->flag=
s);
+=09ret =3D __gfs2_xattr_set(args->inode, args->name,
+=09=09=09       args->value, args->size,
+=09=09=09       args->flags, handler->flags);
 =09if (gfs2_holder_initialized(&gh))
 =09=09gfs2_glock_dq_uninit(&gh);
 =09return ret;
diff --git a/fs/hfs/attr.c b/fs/hfs/attr.c
index 74fa62643136..b3355368dc58 100644
--- a/fs/hfs/attr.c
+++ b/fs/hfs/attr.c
@@ -114,21 +114,20 @@ static ssize_t __hfs_getxattr(struct inode *inode, en=
um hfs_xattr_type type,
 }
=20
 static int hfs_xattr_get(const struct xattr_handler *handler,
-=09=09=09 struct dentry *unused, struct inode *inode,
-=09=09=09 const char *name, void *value, size_t size)
+=09=09=09 struct xattr_gs_args *args)
 {
-=09return __hfs_getxattr(inode, handler->flags, value, size);
+=09return __hfs_getxattr(args->inode, handler->flags,
+=09=09=09      args->buffer, args->size);
 }
=20
 static int hfs_xattr_set(const struct xattr_handler *handler,
-=09=09=09 struct dentry *unused, struct inode *inode,
-=09=09=09 const char *name, const void *value, size_t size,
-=09=09=09 int flags)
+=09=09=09 struct xattr_gs_args *args)
 {
-=09if (!value)
+=09if (!args->value)
 =09=09return -EOPNOTSUPP;
=20
-=09return __hfs_setxattr(inode, handler->flags, value, size, flags);
+=09return __hfs_setxattr(args->inode, handler->flags,
+=09=09=09      args->value, args->size, args->flags);
 }
=20
 static const struct xattr_handler hfs_creator_handler =3D {
diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
index bb0b27d88e50..b6cc7f18bce8 100644
--- a/fs/hfsplus/xattr.c
+++ b/fs/hfsplus/xattr.c
@@ -838,14 +838,13 @@ static int hfsplus_removexattr(struct inode *inode, c=
onst char *name)
 }
=20
 static int hfsplus_osx_getxattr(const struct xattr_handler *handler,
-=09=09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09=09const char *name, void *buffer, size_t size)
+=09=09=09=09struct xattr_gs_args *args)
 {
 =09/*
 =09 * Don't allow retrieving properly prefixed attributes
 =09 * by prepending them with "osx."
 =09 */
-=09if (is_known_namespace(name))
+=09if (is_known_namespace(args->name))
 =09=09return -EOPNOTSUPP;
=20
 =09/*
@@ -854,19 +853,18 @@ static int hfsplus_osx_getxattr(const struct xattr_ha=
ndler *handler,
 =09 * creates), so we pass the name through unmodified (after
 =09 * ensuring it doesn't conflict with another namespace).
 =09 */
-=09return __hfsplus_getxattr(inode, name, buffer, size);
+=09return __hfsplus_getxattr(args->inode, args->name,
+=09=09=09=09  args->buffer, args->size);
 }
=20
 static int hfsplus_osx_setxattr(const struct xattr_handler *handler,
-=09=09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09=09const char *name, const void *buffer,
-=09=09=09=09size_t size, int flags)
+=09=09=09=09struct xattr_gs_args *args)
 {
 =09/*
 =09 * Don't allow setting properly prefixed attributes
 =09 * by prepending them with "osx."
 =09 */
-=09if (is_known_namespace(name))
+=09if (is_known_namespace(args->name))
 =09=09return -EOPNOTSUPP;
=20
 =09/*
@@ -875,7 +873,8 @@ static int hfsplus_osx_setxattr(const struct xattr_hand=
ler *handler,
 =09 * creates), so we pass the name through unmodified (after
 =09 * ensuring it doesn't conflict with another namespace).
 =09 */
-=09return __hfsplus_setxattr(inode, name, buffer, size, flags);
+=09return __hfsplus_setxattr(args->inode, args->name,
+=09=09=09=09  args->value, args->size, args->flags);
 }
=20
 const struct xattr_handler hfsplus_xattr_osx_handler =3D {
diff --git a/fs/hfsplus/xattr_security.c b/fs/hfsplus/xattr_security.c
index cfbe6a3bfb1e..8a8185eca12e 100644
--- a/fs/hfsplus/xattr_security.c
+++ b/fs/hfsplus/xattr_security.c
@@ -14,20 +14,19 @@
 #include "xattr.h"
=20
 static int hfsplus_security_getxattr(const struct xattr_handler *handler,
-=09=09=09=09     struct dentry *unused, struct inode *inode,
-=09=09=09=09     const char *name, void *buffer, size_t size)
+=09=09=09=09     struct xattr_gs_args *args)
 {
-=09return hfsplus_getxattr(inode, name, buffer, size,
+=09return hfsplus_getxattr(args->inode, args->name,
+=09=09=09=09args->buffer, args->size,
 =09=09=09=09XATTR_SECURITY_PREFIX,
 =09=09=09=09XATTR_SECURITY_PREFIX_LEN);
 }
=20
 static int hfsplus_security_setxattr(const struct xattr_handler *handler,
-=09=09=09=09     struct dentry *unused, struct inode *inode,
-=09=09=09=09     const char *name, const void *buffer,
-=09=09=09=09     size_t size, int flags)
+=09=09=09=09     struct xattr_gs_args *args)
 {
-=09return hfsplus_setxattr(inode, name, buffer, size, flags,
+=09return hfsplus_setxattr(args->inode, args->name,
+=09=09=09=09args->value, args->size, args->flags,
 =09=09=09=09XATTR_SECURITY_PREFIX,
 =09=09=09=09XATTR_SECURITY_PREFIX_LEN);
 }
diff --git a/fs/hfsplus/xattr_trusted.c b/fs/hfsplus/xattr_trusted.c
index fbad91e1dada..a682a2e363e7 100644
--- a/fs/hfsplus/xattr_trusted.c
+++ b/fs/hfsplus/xattr_trusted.c
@@ -13,20 +13,19 @@
 #include "xattr.h"
=20
 static int hfsplus_trusted_getxattr(const struct xattr_handler *handler,
-=09=09=09=09    struct dentry *unused, struct inode *inode,
-=09=09=09=09    const char *name, void *buffer, size_t size)
+=09=09=09=09    struct xattr_gs_args *args)
 {
-=09return hfsplus_getxattr(inode, name, buffer, size,
+=09return hfsplus_getxattr(args->inode, args->name,
+=09=09=09=09args->buffer, args->size,
 =09=09=09=09XATTR_TRUSTED_PREFIX,
 =09=09=09=09XATTR_TRUSTED_PREFIX_LEN);
 }
=20
 static int hfsplus_trusted_setxattr(const struct xattr_handler *handler,
-=09=09=09=09    struct dentry *unused, struct inode *inode,
-=09=09=09=09    const char *name, const void *buffer,
-=09=09=09=09    size_t size, int flags)
+=09=09=09=09    struct xattr_gs_args *args)
 {
-=09return hfsplus_setxattr(inode, name, buffer, size, flags,
+=09return hfsplus_setxattr(args->inode, args->name,
+=09=09=09=09args->buffer, args->size, args->flags,
 =09=09=09=09XATTR_TRUSTED_PREFIX, XATTR_TRUSTED_PREFIX_LEN);
 }
=20
diff --git a/fs/hfsplus/xattr_user.c b/fs/hfsplus/xattr_user.c
index 74d19faf255e..9b58d7ec263d 100644
--- a/fs/hfsplus/xattr_user.c
+++ b/fs/hfsplus/xattr_user.c
@@ -13,20 +13,19 @@
 #include "xattr.h"
=20
 static int hfsplus_user_getxattr(const struct xattr_handler *handler,
-=09=09=09=09 struct dentry *unused, struct inode *inode,
-=09=09=09=09 const char *name, void *buffer, size_t size)
+=09=09=09=09 struct xattr_gs_args *args)
 {
=20
-=09return hfsplus_getxattr(inode, name, buffer, size,
+=09return hfsplus_getxattr(args->inode, args->name,
+=09=09=09=09args->buffer, args->size,
 =09=09=09=09XATTR_USER_PREFIX, XATTR_USER_PREFIX_LEN);
 }
=20
 static int hfsplus_user_setxattr(const struct xattr_handler *handler,
-=09=09=09=09 struct dentry *unused, struct inode *inode,
-=09=09=09=09 const char *name, const void *buffer,
-=09=09=09=09 size_t size, int flags)
+=09=09=09=09 struct xattr_gs_args *args)
 {
-=09return hfsplus_setxattr(inode, name, buffer, size, flags,
+=09return hfsplus_setxattr(args->inode, args->name,
+=09=09=09=09args->value, args->size, args->flags,
 =09=09=09=09XATTR_USER_PREFIX, XATTR_USER_PREFIX_LEN);
 }
=20
diff --git a/fs/jffs2/security.c b/fs/jffs2/security.c
index c2332e30f218..6aa552db3807 100644
--- a/fs/jffs2/security.c
+++ b/fs/jffs2/security.c
@@ -49,20 +49,18 @@ int jffs2_init_security(struct inode *inode, struct ino=
de *dir,
=20
 /* ---- XATTR Handler for "security.*" ----------------- */
 static int jffs2_security_getxattr(const struct xattr_handler *handler,
-=09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *name, void *buffer, size_t size)
+=09=09=09=09   struct xattr_gs_args *args)
 {
-=09return do_jffs2_getxattr(inode, JFFS2_XPREFIX_SECURITY,
-=09=09=09=09 name, buffer, size);
+=09return do_jffs2_getxattr(args->inode, JFFS2_XPREFIX_SECURITY,
+=09=09=09=09 args->name, args->buffer, args->size);
 }
=20
 static int jffs2_security_setxattr(const struct xattr_handler *handler,
-=09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *name, const void *buffer,
-=09=09=09=09   size_t size, int flags)
+=09=09=09=09   struct xattr_gs_args *args)
 {
-=09return do_jffs2_setxattr(inode, JFFS2_XPREFIX_SECURITY,
-=09=09=09=09 name, buffer, size, flags);
+=09return do_jffs2_setxattr(args->inode, JFFS2_XPREFIX_SECURITY,
+=09=09=09=09 args->name, args->value, args->size,
+=09=09=09=09 args->flags);
 }
=20
 const struct xattr_handler jffs2_security_xattr_handler =3D {
diff --git a/fs/jffs2/xattr_trusted.c b/fs/jffs2/xattr_trusted.c
index 5d6030826c52..5d235175d6fd 100644
--- a/fs/jffs2/xattr_trusted.c
+++ b/fs/jffs2/xattr_trusted.c
@@ -17,20 +17,18 @@
 #include "nodelist.h"
=20
 static int jffs2_trusted_getxattr(const struct xattr_handler *handler,
-=09=09=09=09  struct dentry *unused, struct inode *inode,
-=09=09=09=09  const char *name, void *buffer, size_t size)
+=09=09=09=09  struct xattr_gs_args *args)
 {
-=09return do_jffs2_getxattr(inode, JFFS2_XPREFIX_TRUSTED,
-=09=09=09=09 name, buffer, size);
+=09return do_jffs2_getxattr(args->inode, JFFS2_XPREFIX_TRUSTED,
+=09=09=09=09 args->name, args->buffer, args->size);
 }
=20
 static int jffs2_trusted_setxattr(const struct xattr_handler *handler,
-=09=09=09=09  struct dentry *unused, struct inode *inode,
-=09=09=09=09  const char *name, const void *buffer,
-=09=09=09=09  size_t size, int flags)
+=09=09=09=09  struct xattr_gs_args *args)
 {
-=09return do_jffs2_setxattr(inode, JFFS2_XPREFIX_TRUSTED,
-=09=09=09=09 name, buffer, size, flags);
+=09return do_jffs2_setxattr(args->inode, JFFS2_XPREFIX_TRUSTED,
+=09=09=09=09 args->name, args->value, args->size,
+=09=09=09=09 args->flags);
 }
=20
 static bool jffs2_trusted_listxattr(struct dentry *dentry)
diff --git a/fs/jffs2/xattr_user.c b/fs/jffs2/xattr_user.c
index 9d027b4abcf9..a35a0785e72b 100644
--- a/fs/jffs2/xattr_user.c
+++ b/fs/jffs2/xattr_user.c
@@ -17,20 +17,18 @@
 #include "nodelist.h"
=20
 static int jffs2_user_getxattr(const struct xattr_handler *handler,
-=09=09=09       struct dentry *unused, struct inode *inode,
-=09=09=09       const char *name, void *buffer, size_t size)
+=09=09=09       struct xattr_gs_args *args)
 {
-=09return do_jffs2_getxattr(inode, JFFS2_XPREFIX_USER,
-=09=09=09=09 name, buffer, size);
+=09return do_jffs2_getxattr(args->inode, JFFS2_XPREFIX_USER,
+=09=09=09=09 args->name, args->buffer, args->size);
 }
=20
 static int jffs2_user_setxattr(const struct xattr_handler *handler,
-=09=09=09       struct dentry *unused, struct inode *inode,
-=09=09=09       const char *name, const void *buffer,
-=09=09=09       size_t size, int flags)
+=09=09=09       struct xattr_gs_args *args)
 {
-=09return do_jffs2_setxattr(inode, JFFS2_XPREFIX_USER,
-=09=09=09=09 name, buffer, size, flags);
+=09return do_jffs2_setxattr(args->inode, JFFS2_XPREFIX_USER,
+=09=09=09=09 args->name, args->value, args->size,
+=09=09=09=09 args->flags);
 }
=20
 const struct xattr_handler jffs2_user_xattr_handler =3D {
diff --git a/fs/jfs/xattr.c b/fs/jfs/xattr.c
index db41e7803163..225fc440ff62 100644
--- a/fs/jfs/xattr.c
+++ b/fs/jfs/xattr.c
@@ -924,39 +924,36 @@ static int __jfs_xattr_set(struct inode *inode, const=
 char *name,
 }
=20
 static int jfs_xattr_get(const struct xattr_handler *handler,
-=09=09=09 struct dentry *unused, struct inode *inode,
-=09=09=09 const char *name, void *value, size_t size)
+=09=09=09 struct xattr_gs_args *args)
 {
-=09name =3D xattr_full_name(handler, name);
-=09return __jfs_getxattr(inode, name, value, size);
+=09return __jfs_getxattr(args->inode, xattr_full_name(handler, args->name)=
,
+=09=09=09      args->buffer, args->size);
 }
=20
 static int jfs_xattr_set(const struct xattr_handler *handler,
-=09=09=09 struct dentry *unused, struct inode *inode,
-=09=09=09 const char *name, const void *value,
-=09=09=09 size_t size, int flags)
+=09=09=09 struct xattr_gs_args *args)
 {
-=09name =3D xattr_full_name(handler, name);
-=09return __jfs_xattr_set(inode, name, value, size, flags);
+=09return __jfs_xattr_set(args->inode,
+=09=09=09       xattr_full_name(handler, args->name),
+=09=09=09       args->value, args->size, args->flags);
 }
=20
 static int jfs_xattr_get_os2(const struct xattr_handler *handler,
-=09=09=09     struct dentry *unused, struct inode *inode,
-=09=09=09     const char *name, void *value, size_t size)
+=09=09=09     struct xattr_gs_args *args)
 {
-=09if (is_known_namespace(name))
+=09if (is_known_namespace(args->name))
 =09=09return -EOPNOTSUPP;
-=09return __jfs_getxattr(inode, name, value, size);
+=09return __jfs_getxattr(args->inode, args->name,
+=09=09=09      args->buffer, args->size);
 }
=20
 static int jfs_xattr_set_os2(const struct xattr_handler *handler,
-=09=09=09     struct dentry *unused, struct inode *inode,
-=09=09=09     const char *name, const void *value,
-=09=09=09     size_t size, int flags)
+=09=09=09     struct xattr_gs_args *args)
 {
-=09if (is_known_namespace(name))
+=09if (is_known_namespace(args->name))
 =09=09return -EOPNOTSUPP;
-=09return __jfs_xattr_set(inode, name, value, size, flags);
+=09return __jfs_xattr_set(args->inode, args->name,
+=09=09=09       args->value, args->size, args->flags);
 }
=20
 static const struct xattr_handler jfs_user_xattr_handler =3D {
diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index f3eaa8869f42..8cb9e16a78cf 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -287,13 +287,13 @@ int kernfs_iop_permission(struct inode *inode, int ma=
sk)
 }
=20
 int kernfs_xattr_get(struct kernfs_node *kn, const char *name,
-=09=09     void *value, size_t size)
+=09=09     void *buffer, size_t size)
 {
 =09struct kernfs_iattrs *attrs =3D kernfs_iattrs_noalloc(kn);
 =09if (!attrs)
 =09=09return -ENODATA;
=20
-=09return simple_xattr_get(&attrs->xattrs, name, value, size);
+=09return simple_xattr_get(&attrs->xattrs, name, buffer, size);
 }
=20
 int kernfs_xattr_set(struct kernfs_node *kn, const char *name,
@@ -307,24 +307,21 @@ int kernfs_xattr_set(struct kernfs_node *kn, const ch=
ar *name,
 }
=20
 static int kernfs_vfs_xattr_get(const struct xattr_handler *handler,
-=09=09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09=09const char *suffix, void *value, size_t size)
+=09=09=09=09struct xattr_gs_args *args)
 {
-=09const char *name =3D xattr_full_name(handler, suffix);
-=09struct kernfs_node *kn =3D inode->i_private;
+=09struct kernfs_node *kn =3D args->inode->i_private;
=20
-=09return kernfs_xattr_get(kn, name, value, size);
+=09return kernfs_xattr_get(kn, xattr_full_name(handler, args->name),
+=09=09=09=09args->buffer, args->size);
 }
=20
 static int kernfs_vfs_xattr_set(const struct xattr_handler *handler,
-=09=09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09=09const char *suffix, const void *value,
-=09=09=09=09size_t size, int flags)
+=09=09=09=09struct xattr_gs_args *args)
 {
-=09const char *name =3D xattr_full_name(handler, suffix);
-=09struct kernfs_node *kn =3D inode->i_private;
+=09struct kernfs_node *kn =3D args->inode->i_private;
=20
-=09return kernfs_xattr_set(kn, name, value, size, flags);
+=09return kernfs_xattr_set(kn, xattr_full_name(handler, args->name),
+=09=09=09=09args->value, args->size, args->flags);
 }
=20
 static const struct xattr_handler kernfs_trusted_xattr_handler =3D {
diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index ab8ca20fd579..5d95fad29f43 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -7277,18 +7277,15 @@ nfs4_release_lockowner(struct nfs_server *server, s=
truct nfs4_lock_state *lsp)
 #define XATTR_NAME_NFSV4_ACL "system.nfs4_acl"
=20
 static int nfs4_xattr_set_nfs4_acl(const struct xattr_handler *handler,
-=09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *key, const void *buf,
-=09=09=09=09   size_t buflen, int flags)
+=09=09=09=09   struct xattr_gs_args *args)
 {
-=09return nfs4_proc_set_acl(inode, buf, buflen);
+=09return nfs4_proc_set_acl(args->inode, args->value, args->size);
 }
=20
 static int nfs4_xattr_get_nfs4_acl(const struct xattr_handler *handler,
-=09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *key, void *buf, size_t buflen)
+=09=09=09=09   struct xattr_gs_args *args)
 {
-=09return nfs4_proc_get_acl(inode, buf, buflen);
+=09return nfs4_proc_get_acl(args->inode, args->buffer, args->size);
 }
=20
 static bool nfs4_xattr_list_nfs4_acl(struct dentry *dentry)
@@ -7299,22 +7296,21 @@ static bool nfs4_xattr_list_nfs4_acl(struct dentry =
*dentry)
 #ifdef CONFIG_NFS_V4_SECURITY_LABEL
=20
 static int nfs4_xattr_set_nfs4_label(const struct xattr_handler *handler,
-=09=09=09=09     struct dentry *unused, struct inode *inode,
-=09=09=09=09     const char *key, const void *buf,
-=09=09=09=09     size_t buflen, int flags)
+=09=09=09=09     struct xattr_gs_args *args)
 {
-=09if (security_ismaclabel(key))
-=09=09return nfs4_set_security_label(inode, buf, buflen);
+=09if (security_ismaclabel(args->name))
+=09=09return nfs4_set_security_label(args->inode,
+=09=09=09=09=09       args->value, args->size);
=20
 =09return -EOPNOTSUPP;
 }
=20
 static int nfs4_xattr_get_nfs4_label(const struct xattr_handler *handler,
-=09=09=09=09     struct dentry *unused, struct inode *inode,
-=09=09=09=09     const char *key, void *buf, size_t buflen)
+=09=09=09=09     struct xattr_gs_args *args)
 {
-=09if (security_ismaclabel(key))
-=09=09return nfs4_get_security_label(inode, buf, buflen);
+=09if (security_ismaclabel(args->name))
+=09=09return nfs4_get_security_label(args->inode,
+=09=09=09=09=09       args->buffer, args->size);
 =09return -EOPNOTSUPP;
 }
=20
diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
index d8507972ee13..d76e9b042890 100644
--- a/fs/ocfs2/xattr.c
+++ b/fs/ocfs2/xattr.c
@@ -7231,20 +7231,18 @@ int ocfs2_init_security_and_acl(struct inode *dir,
  * 'security' attributes support
  */
 static int ocfs2_xattr_security_get(const struct xattr_handler *handler,
-=09=09=09=09    struct dentry *unused, struct inode *inode,
-=09=09=09=09    const char *name, void *buffer, size_t size)
+=09=09=09=09    struct xattr_gs_args *args)
 {
-=09return ocfs2_xattr_get(inode, OCFS2_XATTR_INDEX_SECURITY,
-=09=09=09       name, buffer, size);
+=09return ocfs2_xattr_get(args->inode, OCFS2_XATTR_INDEX_SECURITY,
+=09=09=09       args->name, args->buffer, args->size);
 }
=20
 static int ocfs2_xattr_security_set(const struct xattr_handler *handler,
-=09=09=09=09    struct dentry *unused, struct inode *inode,
-=09=09=09=09    const char *name, const void *value,
-=09=09=09=09    size_t size, int flags)
+=09=09=09=09    struct xattr_gs_args *args)
 {
-=09return ocfs2_xattr_set(inode, OCFS2_XATTR_INDEX_SECURITY,
-=09=09=09       name, value, size, flags);
+=09return ocfs2_xattr_set(args->inode, OCFS2_XATTR_INDEX_SECURITY,
+=09=09=09       args->name, args->value, args->size,
+=09=09=09       args->flags);
 }
=20
 static int ocfs2_initxattrs(struct inode *inode, const struct xattr *xattr=
_array,
@@ -7303,20 +7301,18 @@ const struct xattr_handler ocfs2_xattr_security_han=
dler =3D {
  * 'trusted' attributes support
  */
 static int ocfs2_xattr_trusted_get(const struct xattr_handler *handler,
-=09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *name, void *buffer, size_t size)
+=09=09=09=09   struct xattr_gs_args *args)
 {
-=09return ocfs2_xattr_get(inode, OCFS2_XATTR_INDEX_TRUSTED,
-=09=09=09       name, buffer, size);
+=09return ocfs2_xattr_get(args->inode, OCFS2_XATTR_INDEX_TRUSTED,
+=09=09=09       args->name, args->buffer, args->size);
 }
=20
 static int ocfs2_xattr_trusted_set(const struct xattr_handler *handler,
-=09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *name, const void *value,
-=09=09=09=09   size_t size, int flags)
+=09=09=09=09   struct xattr_gs_args *args)
 {
-=09return ocfs2_xattr_set(inode, OCFS2_XATTR_INDEX_TRUSTED,
-=09=09=09       name, value, size, flags);
+=09return ocfs2_xattr_set(args->inode, OCFS2_XATTR_INDEX_TRUSTED,
+=09=09=09       args->name, args->value, args->size,
+=09=09=09       args->flags);
 }
=20
 const struct xattr_handler ocfs2_xattr_trusted_handler =3D {
@@ -7329,29 +7325,27 @@ const struct xattr_handler ocfs2_xattr_trusted_hand=
ler =3D {
  * 'user' attributes support
  */
 static int ocfs2_xattr_user_get(const struct xattr_handler *handler,
-=09=09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09=09const char *name, void *buffer, size_t size)
+=09=09=09=09struct xattr_gs_args *args)
 {
-=09struct ocfs2_super *osb =3D OCFS2_SB(inode->i_sb);
+=09struct ocfs2_super *osb =3D OCFS2_SB(args->inode->i_sb);
=20
 =09if (osb->s_mount_opt & OCFS2_MOUNT_NOUSERXATTR)
 =09=09return -EOPNOTSUPP;
-=09return ocfs2_xattr_get(inode, OCFS2_XATTR_INDEX_USER, name,
-=09=09=09       buffer, size);
+=09return ocfs2_xattr_get(args->inode, OCFS2_XATTR_INDEX_USER, args->name,
+=09=09=09       args->buffer, args->size);
 }
=20
 static int ocfs2_xattr_user_set(const struct xattr_handler *handler,
-=09=09=09=09struct dentry *unused, struct inode *inode,
-=09=09=09=09const char *name, const void *value,
-=09=09=09=09size_t size, int flags)
+=09=09=09=09struct xattr_gs_args *args)
 {
-=09struct ocfs2_super *osb =3D OCFS2_SB(inode->i_sb);
+=09struct ocfs2_super *osb =3D OCFS2_SB(args->inode->i_sb);
=20
 =09if (osb->s_mount_opt & OCFS2_MOUNT_NOUSERXATTR)
 =09=09return -EOPNOTSUPP;
=20
-=09return ocfs2_xattr_set(inode, OCFS2_XATTR_INDEX_USER,
-=09=09=09       name, value, size, flags);
+=09return ocfs2_xattr_set(args->inode, OCFS2_XATTR_INDEX_USER,
+=09=09=09       args->name, args->value, args->size,
+=09=09=09       args->flags);
 }
=20
 const struct xattr_handler ocfs2_xattr_user_handler =3D {
diff --git a/fs/orangefs/xattr.c b/fs/orangefs/xattr.c
index bdc285aea360..d222922af141 100644
--- a/fs/orangefs/xattr.c
+++ b/fs/orangefs/xattr.c
@@ -526,24 +526,17 @@ ssize_t orangefs_listxattr(struct dentry *dentry, cha=
r *buffer, size_t size)
 }
=20
 static int orangefs_xattr_set_default(const struct xattr_handler *handler,
-=09=09=09=09      struct dentry *unused,
-=09=09=09=09      struct inode *inode,
-=09=09=09=09      const char *name,
-=09=09=09=09      const void *buffer,
-=09=09=09=09      size_t size,
-=09=09=09=09      int flags)
+=09=09=09=09      struct xattr_gs_args *args)
 {
-=09return orangefs_inode_setxattr(inode, name, buffer, size, flags);
+=09return orangefs_inode_setxattr(args->inode, args->name,
+=09=09=09=09       args->value, args->size, args->flags);
 }
=20
 static int orangefs_xattr_get_default(const struct xattr_handler *handler,
-=09=09=09=09      struct dentry *unused,
-=09=09=09=09      struct inode *inode,
-=09=09=09=09      const char *name,
-=09=09=09=09      void *buffer,
-=09=09=09=09      size_t size)
+=09=09=09=09      struct xattr_gs_args *args)
 {
-=09return orangefs_inode_getxattr(inode, name, buffer, size);
+=09return orangefs_inode_getxattr(args->inode, args->name,
+=09=09=09=09       args->buffer, args->size);
=20
 }
=20
diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
index bc14781886bf..5fb7608647a4 100644
--- a/fs/overlayfs/inode.c
+++ b/fs/overlayfs/inode.c
@@ -318,60 +318,61 @@ bool ovl_is_private_xattr(const char *name)
 =09=09       sizeof(OVL_XATTR_PREFIX) - 1) =3D=3D 0;
 }
=20
-int ovl_xattr_set(struct dentry *dentry, struct inode *inode, const char *=
name,
-=09=09  const void *value, size_t size, int flags)
+int ovl_xattr_set(struct xattr_gs_args *args)
 {
 =09int err;
-=09struct dentry *upperdentry =3D ovl_i_dentry_upper(inode);
-=09struct dentry *realdentry =3D upperdentry ?: ovl_dentry_lower(dentry);
+=09struct dentry *upperdentry =3D ovl_i_dentry_upper(args->inode);
+=09struct dentry *realdentry =3D
+=09=09upperdentry ?: ovl_dentry_lower(args->dentry);
 =09const struct cred *old_cred;
=20
-=09err =3D ovl_want_write(dentry);
+=09err =3D ovl_want_write(args->dentry);
 =09if (err)
 =09=09goto out;
=20
-=09if (!value && !upperdentry) {
-=09=09err =3D vfs_getxattr(realdentry, name, NULL, 0);
+=09if (!args->value && !upperdentry) {
+=09=09err =3D vfs_getxattr(realdentry, args->name, NULL, 0);
 =09=09if (err < 0)
 =09=09=09goto out_drop_write;
 =09}
=20
 =09if (!upperdentry) {
-=09=09err =3D ovl_copy_up(dentry);
+=09=09err =3D ovl_copy_up(args->dentry);
 =09=09if (err)
 =09=09=09goto out_drop_write;
=20
-=09=09realdentry =3D ovl_dentry_upper(dentry);
+=09=09realdentry =3D ovl_dentry_upper(args->dentry);
 =09}
=20
-=09old_cred =3D ovl_override_creds(dentry->d_sb);
-=09if (value)
-=09=09err =3D vfs_setxattr(realdentry, name, value, size, flags);
+=09old_cred =3D ovl_override_creds(args->dentry->d_sb);
+=09if (args->value)
+=09=09err =3D vfs_setxattr(realdentry, args->name,
+=09=09=09=09   args->value, args->size, args->flags);
 =09else {
-=09=09WARN_ON(flags !=3D XATTR_REPLACE);
-=09=09err =3D vfs_removexattr(realdentry, name);
+=09=09WARN_ON(args->flags !=3D XATTR_REPLACE);
+=09=09err =3D vfs_removexattr(realdentry, args->name);
 =09}
 =09revert_creds(old_cred);
=20
 =09/* copy c/mtime */
-=09ovl_copyattr(d_inode(realdentry), inode);
+=09ovl_copyattr(d_inode(realdentry), args->inode);
=20
 out_drop_write:
-=09ovl_drop_write(dentry);
+=09ovl_drop_write(args->dentry);
 out:
 =09return err;
 }
=20
-int ovl_xattr_get(struct dentry *dentry, struct inode *inode, const char *=
name,
-=09=09  void *value, size_t size)
+int ovl_xattr_get(struct xattr_gs_args *args)
 {
 =09ssize_t res;
 =09const struct cred *old_cred;
 =09struct dentry *realdentry =3D
-=09=09ovl_i_dentry_upper(inode) ?: ovl_dentry_lower(dentry);
+=09=09ovl_i_dentry_upper(args->inode) ?:
+=09=09ovl_dentry_lower(args->dentry);
=20
-=09old_cred =3D ovl_override_creds(dentry->d_sb);
-=09res =3D vfs_getxattr(realdentry, name, value, size);
+=09old_cred =3D ovl_override_creds(args->dentry->d_sb);
+=09res =3D vfs_getxattr(realdentry, args->name, args->buffer, args->size);
 =09revert_creds(old_cred);
 =09return res;
 }
diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 6934bcf030f0..c6a8ec049099 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -353,10 +353,8 @@ int ovl_setattr(struct dentry *dentry, struct iattr *a=
ttr);
 int ovl_getattr(const struct path *path, struct kstat *stat,
 =09=09u32 request_mask, unsigned int flags);
 int ovl_permission(struct inode *inode, int mask);
-int ovl_xattr_set(struct dentry *dentry, struct inode *inode, const char *=
name,
-=09=09  const void *value, size_t size, int flags);
-int ovl_xattr_get(struct dentry *dentry, struct inode *inode, const char *=
name,
-=09=09  void *value, size_t size);
+int ovl_xattr_set(struct xattr_gs_args *args);
+int ovl_xattr_get(struct xattr_gs_args *args);
 ssize_t ovl_listxattr(struct dentry *dentry, char *list, size_t size);
 struct posix_acl *ovl_get_acl(struct inode *inode, int type);
 int ovl_update_time(struct inode *inode, struct timespec64 *ts, int flags)=
;
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index afbcb116a7f1..973f9e0d7f7f 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -854,26 +854,24 @@ static unsigned int ovl_split_lowerdirs(char *str)
=20
 static int __maybe_unused
 ovl_posix_acl_xattr_get(const struct xattr_handler *handler,
-=09=09=09struct dentry *dentry, struct inode *inode,
-=09=09=09const char *name, void *buffer, size_t size)
+=09=09=09struct xattr_gs_args *args)
 {
-=09return ovl_xattr_get(dentry, inode, handler->name, buffer, size);
+=09return ovl_xattr_get(args);
 }
=20
 static int __maybe_unused
 ovl_posix_acl_xattr_set(const struct xattr_handler *handler,
-=09=09=09struct dentry *dentry, struct inode *inode,
-=09=09=09const char *name, const void *value,
-=09=09=09size_t size, int flags)
+=09=09=09struct xattr_gs_args *args)
 {
-=09struct dentry *workdir =3D ovl_workdir(dentry);
-=09struct inode *realinode =3D ovl_inode_real(inode);
+=09struct dentry *workdir =3D ovl_workdir(args->dentry);
+=09struct inode *realinode =3D ovl_inode_real(args->inode);
 =09struct posix_acl *acl =3D NULL;
 =09int err;
=20
 =09/* Check that everything is OK before copy-up */
-=09if (value) {
-=09=09acl =3D posix_acl_from_xattr(&init_user_ns, value, size);
+=09if (args->value) {
+=09=09acl =3D posix_acl_from_xattr(&init_user_ns,
+=09=09=09=09=09   args->value, args->size);
 =09=09if (IS_ERR(acl))
 =09=09=09return PTR_ERR(acl);
 =09}
@@ -882,12 +880,13 @@ ovl_posix_acl_xattr_set(const struct xattr_handler *h=
andler,
 =09=09goto out_acl_release;
 =09if (!realinode->i_op->set_acl)
 =09=09goto out_acl_release;
-=09if (handler->flags =3D=3D ACL_TYPE_DEFAULT && !S_ISDIR(inode->i_mode)) =
{
+=09if (handler->flags =3D=3D ACL_TYPE_DEFAULT &&
+=09    !S_ISDIR(args->inode->i_mode)) {
 =09=09err =3D acl ? -EACCES : 0;
 =09=09goto out_acl_release;
 =09}
 =09err =3D -EPERM;
-=09if (!inode_owner_or_capable(inode))
+=09if (!inode_owner_or_capable(args->inode))
 =09=09goto out_acl_release;
=20
 =09posix_acl_release(acl);
@@ -896,20 +895,20 @@ ovl_posix_acl_xattr_set(const struct xattr_handler *h=
andler,
 =09 * Check if sgid bit needs to be cleared (actual setacl operation will
 =09 * be done with mounter's capabilities and so that won't do it for us).
 =09 */
-=09if (unlikely(inode->i_mode & S_ISGID) &&
+=09if (unlikely(args->inode->i_mode & S_ISGID) &&
 =09    handler->flags =3D=3D ACL_TYPE_ACCESS &&
-=09    !in_group_p(inode->i_gid) &&
-=09    !capable_wrt_inode_uidgid(inode, CAP_FSETID)) {
+=09    !in_group_p(args->inode->i_gid) &&
+=09    !capable_wrt_inode_uidgid(args->inode, CAP_FSETID)) {
 =09=09struct iattr iattr =3D { .ia_valid =3D ATTR_KILL_SGID };
=20
-=09=09err =3D ovl_setattr(dentry, &iattr);
+=09=09err =3D ovl_setattr(args->dentry, &iattr);
 =09=09if (err)
 =09=09=09return err;
 =09}
=20
-=09err =3D ovl_xattr_set(dentry, inode, handler->name, value, size, flags)=
;
+=09err =3D ovl_xattr_set(args);
 =09if (!err)
-=09=09ovl_copyattr(ovl_inode_real(inode), inode);
+=09=09ovl_copyattr(ovl_inode_real(args->inode), args->inode);
=20
 =09return err;
=20
@@ -919,33 +918,27 @@ ovl_posix_acl_xattr_set(const struct xattr_handler *h=
andler,
 }
=20
 static int ovl_own_xattr_get(const struct xattr_handler *handler,
-=09=09=09     struct dentry *dentry, struct inode *inode,
-=09=09=09     const char *name, void *buffer, size_t size)
+=09=09=09     struct xattr_gs_args *args)
 {
 =09return -EOPNOTSUPP;
 }
=20
 static int ovl_own_xattr_set(const struct xattr_handler *handler,
-=09=09=09     struct dentry *dentry, struct inode *inode,
-=09=09=09     const char *name, const void *value,
-=09=09=09     size_t size, int flags)
+=09=09=09     struct xattr_gs_args *args)
 {
 =09return -EOPNOTSUPP;
 }
=20
 static int ovl_other_xattr_get(const struct xattr_handler *handler,
-=09=09=09       struct dentry *dentry, struct inode *inode,
-=09=09=09       const char *name, void *buffer, size_t size)
+=09=09=09       struct xattr_gs_args *args)
 {
-=09return ovl_xattr_get(dentry, inode, name, buffer, size);
+=09return ovl_xattr_get(args);
 }
=20
 static int ovl_other_xattr_set(const struct xattr_handler *handler,
-=09=09=09       struct dentry *dentry, struct inode *inode,
-=09=09=09       const char *name, const void *value,
-=09=09=09       size_t size, int flags)
+=09=09=09       struct xattr_gs_args *args)
 {
-=09return ovl_xattr_set(dentry, inode, name, value, size, flags);
+=09return ovl_xattr_set(args);
 }
=20
 static const struct xattr_handler __maybe_unused
diff --git a/fs/posix_acl.c b/fs/posix_acl.c
index 84ad1c90d535..8cc7310386fe 100644
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -831,24 +831,24 @@ EXPORT_SYMBOL (posix_acl_to_xattr);
=20
 static int
 posix_acl_xattr_get(const struct xattr_handler *handler,
-=09=09    struct dentry *unused, struct inode *inode,
-=09=09    const char *name, void *value, size_t size)
+=09=09    struct xattr_gs_args *args)
 {
 =09struct posix_acl *acl;
 =09int error;
=20
-=09if (!IS_POSIXACL(inode))
+=09if (!IS_POSIXACL(args->inode))
 =09=09return -EOPNOTSUPP;
-=09if (S_ISLNK(inode->i_mode))
+=09if (S_ISLNK(args->inode->i_mode))
 =09=09return -EOPNOTSUPP;
=20
-=09acl =3D get_acl(inode, handler->flags);
+=09acl =3D get_acl(args->inode, handler->flags);
 =09if (IS_ERR(acl))
 =09=09return PTR_ERR(acl);
 =09if (acl =3D=3D NULL)
 =09=09return -ENODATA;
=20
-=09error =3D posix_acl_to_xattr(&init_user_ns, acl, value, size);
+=09error =3D posix_acl_to_xattr(&init_user_ns, acl,
+=09=09=09=09   args->buffer, args->size);
 =09posix_acl_release(acl);
=20
 =09return error;
@@ -878,19 +878,18 @@ EXPORT_SYMBOL(set_posix_acl);
=20
 static int
 posix_acl_xattr_set(const struct xattr_handler *handler,
-=09=09    struct dentry *unused, struct inode *inode,
-=09=09    const char *name, const void *value,
-=09=09    size_t size, int flags)
+=09=09    struct xattr_gs_args *args)
 {
 =09struct posix_acl *acl =3D NULL;
 =09int ret;
=20
-=09if (value) {
-=09=09acl =3D posix_acl_from_xattr(&init_user_ns, value, size);
+=09if (args->value) {
+=09=09acl =3D posix_acl_from_xattr(&init_user_ns,
+=09=09=09=09=09   args->value, args->size);
 =09=09if (IS_ERR(acl))
 =09=09=09return PTR_ERR(acl);
 =09}
-=09ret =3D set_posix_acl(inode, handler->flags, acl);
+=09ret =3D set_posix_acl(args->inode, handler->flags, acl);
 =09posix_acl_release(acl);
 =09return ret;
 }
diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index b5b26d8a192c..b949a55b95bd 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -765,7 +765,7 @@ reiserfs_xattr_get(struct inode *inode, const char *nam=
e, void *buffer,
 /* This is the implementation for the xattr plugin infrastructure */
 static inline const struct xattr_handler *
 find_xattr_handler_prefix(const struct xattr_handler **handlers,
-=09=09=09   const char *name)
+=09=09=09  const char *name)
 {
 =09const struct xattr_handler *xah;
=20
diff --git a/fs/reiserfs/xattr_security.c b/fs/reiserfs/xattr_security.c
index 20be9a0e5870..6d436ef207d1 100644
--- a/fs/reiserfs/xattr_security.c
+++ b/fs/reiserfs/xattr_security.c
@@ -10,27 +10,25 @@
 #include <linux/uaccess.h>
=20
 static int
-security_get(const struct xattr_handler *handler, struct dentry *unused,
-=09     struct inode *inode, const char *name, void *buffer, size_t size)
+security_get(const struct xattr_handler *handler, struct xattr_gs_args *ar=
gs)
 {
-=09if (IS_PRIVATE(inode))
+=09if (IS_PRIVATE(args->inode))
 =09=09return -EPERM;
=20
-=09return reiserfs_xattr_get(inode, xattr_full_name(handler, name),
-=09=09=09=09  buffer, size);
+=09return reiserfs_xattr_get(args->inode,
+=09=09=09=09  xattr_full_name(handler, args->name),
+=09=09=09=09  args->buffer, args->size);
 }
=20
 static int
-security_set(const struct xattr_handler *handler, struct dentry *unused,
-=09     struct inode *inode, const char *name, const void *buffer,
-=09     size_t size, int flags)
+security_set(const struct xattr_handler *handler, struct xattr_gs_args *ar=
gs)
 {
-=09if (IS_PRIVATE(inode))
+=09if (IS_PRIVATE(args->inode))
 =09=09return -EPERM;
=20
-=09return reiserfs_xattr_set(inode,
-=09=09=09=09  xattr_full_name(handler, name),
-=09=09=09=09  buffer, size, flags);
+=09return reiserfs_xattr_set(args->inode,
+=09=09=09=09  xattr_full_name(handler, args->name),
+=09=09=09=09  args->value, args->size, args->flags);
 }
=20
 static bool security_list(struct dentry *dentry)
diff --git a/fs/reiserfs/xattr_trusted.c b/fs/reiserfs/xattr_trusted.c
index 5ed48da3d02b..46dfc6e2e150 100644
--- a/fs/reiserfs/xattr_trusted.c
+++ b/fs/reiserfs/xattr_trusted.c
@@ -9,27 +9,25 @@
 #include <linux/uaccess.h>
=20
 static int
-trusted_get(const struct xattr_handler *handler, struct dentry *unused,
-=09    struct inode *inode, const char *name, void *buffer, size_t size)
+trusted_get(const struct xattr_handler *handler, struct xattr_gs_args *arg=
s)
 {
-=09if (!capable(CAP_SYS_ADMIN) || IS_PRIVATE(inode))
+=09if (!capable(CAP_SYS_ADMIN) || IS_PRIVATE(args->inode))
 =09=09return -EPERM;
=20
-=09return reiserfs_xattr_get(inode, xattr_full_name(handler, name),
-=09=09=09=09  buffer, size);
+=09return reiserfs_xattr_get(args->inode,
+=09=09=09=09  xattr_full_name(handler, args->name),
+=09=09=09=09  args->buffer, args->size);
 }
=20
 static int
-trusted_set(const struct xattr_handler *handler, struct dentry *unused,
-=09    struct inode *inode, const char *name, const void *buffer,
-=09    size_t size, int flags)
+trusted_set(const struct xattr_handler *handler, struct xattr_gs_args *arg=
s)
 {
-=09if (!capable(CAP_SYS_ADMIN) || IS_PRIVATE(inode))
+=09if (!capable(CAP_SYS_ADMIN) || IS_PRIVATE(args->inode))
 =09=09return -EPERM;
=20
-=09return reiserfs_xattr_set(inode,
-=09=09=09=09  xattr_full_name(handler, name),
-=09=09=09=09  buffer, size, flags);
+=09return reiserfs_xattr_set(args->inode,
+=09=09=09=09  xattr_full_name(handler, args->name),
+=09=09=09=09  args->value, args->size, args->flags);
 }
=20
 static bool trusted_list(struct dentry *dentry)
diff --git a/fs/reiserfs/xattr_user.c b/fs/reiserfs/xattr_user.c
index a573ca45bacc..4a0bafe62d05 100644
--- a/fs/reiserfs/xattr_user.c
+++ b/fs/reiserfs/xattr_user.c
@@ -8,25 +8,23 @@
 #include <linux/uaccess.h>
=20
 static int
-user_get(const struct xattr_handler *handler, struct dentry *unused,
-=09 struct inode *inode, const char *name, void *buffer, size_t size)
+user_get(const struct xattr_handler *handler, struct xattr_gs_args *args)
 {
-=09if (!reiserfs_xattrs_user(inode->i_sb))
+=09if (!reiserfs_xattrs_user(args->inode->i_sb))
 =09=09return -EOPNOTSUPP;
-=09return reiserfs_xattr_get(inode, xattr_full_name(handler, name),
-=09=09=09=09  buffer, size);
+=09return reiserfs_xattr_get(args->inode,
+=09=09=09=09  xattr_full_name(handler, args->name),
+=09=09=09=09  args->buffer, args->size);
 }
=20
 static int
-user_set(const struct xattr_handler *handler, struct dentry *unused,
-=09 struct inode *inode, const char *name, const void *buffer,
-=09 size_t size, int flags)
+user_set(const struct xattr_handler *handler, struct xattr_gs_args *args)
 {
-=09if (!reiserfs_xattrs_user(inode->i_sb))
+=09if (!reiserfs_xattrs_user(args->inode->i_sb))
 =09=09return -EOPNOTSUPP;
-=09return reiserfs_xattr_set(inode,
-=09=09=09=09  xattr_full_name(handler, name),
-=09=09=09=09  buffer, size, flags);
+=09return reiserfs_xattr_set(args->inode,
+=09=09=09=09  xattr_full_name(handler, args->name),
+=09=09=09=09  args->value, args->size, args->flags);
 }
=20
 static bool user_list(struct dentry *dentry)
diff --git a/fs/squashfs/xattr.c b/fs/squashfs/xattr.c
index e1e3f3dd5a06..c6403f187ced 100644
--- a/fs/squashfs/xattr.c
+++ b/fs/squashfs/xattr.c
@@ -199,15 +199,11 @@ static int squashfs_xattr_get(struct inode *inode, in=
t name_index,
 =09return err;
 }
=20
-
 static int squashfs_xattr_handler_get(const struct xattr_handler *handler,
-=09=09=09=09      struct dentry *unused,
-=09=09=09=09      struct inode *inode,
-=09=09=09=09      const char *name,
-=09=09=09=09      void *buffer, size_t size)
+=09=09=09=09      struct xattr_gs_args *args)
 {
-=09return squashfs_xattr_get(inode, handler->flags, name,
-=09=09buffer, size);
+=09return squashfs_xattr_get(args->inode, handler->flags, args->name,
+=09=09=09=09  args->buffer, args->size);
 }
=20
 /*
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 9aefbb60074f..aec02d94f2d6 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -668,30 +668,29 @@ int ubifs_init_security(struct inode *dentry, struct =
inode *inode,
 #endif
=20
 static int xattr_get(const struct xattr_handler *handler,
-=09=09=09   struct dentry *dentry, struct inode *inode,
-=09=09=09   const char *name, void *buffer, size_t size)
+=09=09     struct xattr_gs_args *args)
 {
-=09dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", name,
-=09=09inode->i_ino, dentry, size);
+=09dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", args->name,
+=09=09args->inode->i_ino, args->dentry, args->size);
=20
-=09name =3D xattr_full_name(handler, name);
-=09return ubifs_xattr_get(inode, name, buffer, size);
+=09return ubifs_xattr_get(args->inode,
+=09=09=09       xattr_full_name(handler, args->name),
+=09=09=09       args->buffer, args->size);
 }
=20
 static int xattr_set(const struct xattr_handler *handler,
-=09=09=09   struct dentry *dentry, struct inode *inode,
-=09=09=09   const char *name, const void *value,
-=09=09=09   size_t size, int flags)
+=09=09     struct xattr_gs_args *args)
 {
 =09dbg_gen("xattr '%s', host ino %lu ('%pd'), size %zd",
-=09=09name, inode->i_ino, dentry, size);
-
-=09name =3D xattr_full_name(handler, name);
-
-=09if (value)
-=09=09return ubifs_xattr_set(inode, name, value, size, flags, true);
-=09else
-=09=09return ubifs_xattr_remove(inode, name);
+=09=09args->name, args->inode->i_ino, args->dentry, args->size);
+
+=09if (args->value)
+=09=09return ubifs_xattr_set(args->inode,
+=09=09=09=09       xattr_full_name(handler, args->name),
+=09=09=09=09       args->value, args->size,
+=09=09=09=09       args->flags, true);
+=09return ubifs_xattr_remove(args->inode,
+=09=09=09=09  xattr_full_name(handler, args->name));
 }
=20
 static const struct xattr_handler ubifs_user_xattr_handler =3D {
diff --git a/fs/xattr.c b/fs/xattr.c
index 90dd78f0eb27..dceb5afe79be 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -135,19 +135,18 @@ xattr_permission(struct inode *inode, const char *nam=
e, int mask)
 }
=20
 int
-__vfs_setxattr(struct dentry *dentry, struct inode *inode, const char *nam=
e,
-=09       const void *value, size_t size, int flags)
+__vfs_setxattr(struct xattr_gs_args *args)
 {
 =09const struct xattr_handler *handler;
=20
-=09handler =3D xattr_resolve_name(inode, &name);
+=09handler =3D xattr_resolve_name(args->inode, &args->name);
 =09if (IS_ERR(handler))
 =09=09return PTR_ERR(handler);
 =09if (!handler->set)
 =09=09return -EOPNOTSUPP;
-=09if (size =3D=3D 0)
-=09=09value =3D "";  /* empty EA, do not remove */
-=09return handler->set(handler, dentry, inode, name, value, size, flags);
+=09if (args->size =3D=3D 0)
+=09=09args->value =3D "";  /* empty EA, do not remove */
+=09return handler->set(handler, args);
 }
 EXPORT_SYMBOL(__vfs_setxattr);
=20
@@ -178,7 +177,16 @@ int __vfs_setxattr_noperm(struct dentry *dentry, const=
 char *name,
 =09if (issec)
 =09=09inode->i_flags &=3D ~S_NOSEC;
 =09if (inode->i_opflags & IOP_XATTR) {
-=09=09error =3D __vfs_setxattr(dentry, inode, name, value, size, flags);
+=09=09struct xattr_gs_args args =3D {
+=09=09=09.dentry =3D dentry,
+=09=09=09.inode =3D inode,
+=09=09=09.name =3D name,
+=09=09=09.value =3D value,
+=09=09=09.size =3D size,
+=09=09=09.flags =3D flags,
+=09=09};
+
+=09=09error =3D __vfs_setxattr(&args);
 =09=09if (!error) {
 =09=09=09fsnotify_xattr(dentry);
 =09=09=09security_inode_post_setxattr(dentry, name, value,
@@ -268,68 +276,61 @@ vfs_getxattr_alloc(struct dentry *dentry, const char =
*name, char **xattr_value,
 =09=09   size_t xattr_size, gfp_t flags)
 {
 =09const struct xattr_handler *handler;
-=09struct inode *inode =3D dentry->d_inode;
-=09char *value =3D *xattr_value;
+=09struct xattr_gs_args args;
 =09int error;
=20
-=09error =3D xattr_permission(inode, name, MAY_READ);
+=09error =3D xattr_permission(dentry->d_inode, name, MAY_READ);
 =09if (error)
 =09=09return error;
=20
-=09handler =3D xattr_resolve_name(inode, &name);
+=09handler =3D xattr_resolve_name(dentry->d_inode, &name);
 =09if (IS_ERR(handler))
 =09=09return PTR_ERR(handler);
 =09if (!handler->get)
 =09=09return -EOPNOTSUPP;
-=09error =3D handler->get(handler, dentry, inode, name, NULL, 0);
+=09memset(&args, 0, sizeof(args));
+=09args.inode =3D dentry->d_inode;
+=09args.dentry =3D dentry;
+=09args.name =3D name;
+=09error =3D handler->get(handler, &args);
 =09if (error < 0)
 =09=09return error;
=20
-=09if (!value || (error > xattr_size)) {
-=09=09value =3D krealloc(*xattr_value, error + 1, flags);
-=09=09if (!value)
+=09args.buffer =3D *xattr_value;
+=09if (!*xattr_value || (error > xattr_size)) {
+=09=09args.buffer =3D krealloc(*xattr_value, error + 1, flags);
+=09=09if (!args.buffer)
 =09=09=09return -ENOMEM;
-=09=09memset(value, 0, error + 1);
+=09=09memset(args.buffer, 0, error + 1);
 =09}
=20
-=09error =3D handler->get(handler, dentry, inode, name, value, error);
-=09*xattr_value =3D value;
+=09args.size =3D error;
+=09error =3D handler->get(handler, &args);
+=09*xattr_value =3D args.buffer;
 =09return error;
 }
=20
 ssize_t
-__vfs_getxattr(struct dentry *dentry, struct inode *inode, const char *nam=
e,
-=09       void *value, size_t size)
+__vfs_getxattr(struct xattr_gs_args *args)
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
-=09error =3D xattr_permission(inode, name, MAY_READ);
+=09if (args->flags & XATTR_NOSECURITY)
+=09=09goto nolsm;
+=09error =3D xattr_permission(args->inode, args->name, MAY_READ);
 =09if (error)
 =09=09return error;
=20
-=09error =3D security_inode_getxattr(dentry, name);
+=09error =3D security_inode_getxattr(args->dentry, args->name);
 =09if (error)
 =09=09return error;
=20
-=09if (!strncmp(name, XATTR_SECURITY_PREFIX,
+=09if (!strncmp(args->name, XATTR_SECURITY_PREFIX,
 =09=09=09=09XATTR_SECURITY_PREFIX_LEN)) {
-=09=09const char *suffix =3D name + XATTR_SECURITY_PREFIX_LEN;
-=09=09int ret =3D xattr_getsecurity(inode, suffix, value, size);
+=09=09const char *suffix =3D args->name + XATTR_SECURITY_PREFIX_LEN;
+=09=09int ret =3D xattr_getsecurity(args->inode, suffix,
+=09=09=09=09=09    args->buffer, args->size);
 =09=09/*
 =09=09 * Only overwrite the return value if a security module
 =09=09 * is actually active.
@@ -339,7 +340,27 @@ vfs_getxattr(struct dentry *dentry, const char *name, =
void *value, size_t size)
 =09=09return ret;
 =09}
 nolsm:
-=09return __vfs_getxattr(dentry, inode, name, value, size);
+=09handler =3D xattr_resolve_name(args->inode, &args->name);
+=09if (IS_ERR(handler))
+=09=09return PTR_ERR(handler);
+=09if (!handler->get)
+=09=09return -EOPNOTSUPP;
+=09return handler->get(handler, args);
+}
+EXPORT_SYMBOL(__vfs_getxattr);
+
+ssize_t
+vfs_getxattr(struct dentry *dentry, const char *name, void *buffer, size_t=
 size)
+{
+=09struct xattr_gs_args args =3D {
+=09=09.dentry =3D dentry,
+=09=09.inode =3D dentry->d_inode,
+=09=09.name =3D name,
+=09=09.buffer =3D buffer,
+=09=09.size =3D size,
+=09};
+
+=09return __vfs_getxattr(&args);
 }
 EXPORT_SYMBOL_GPL(vfs_getxattr);
=20
@@ -366,15 +387,20 @@ EXPORT_SYMBOL_GPL(vfs_listxattr);
 int
 __vfs_removexattr(struct dentry *dentry, const char *name)
 {
-=09struct inode *inode =3D d_inode(dentry);
 =09const struct xattr_handler *handler;
+=09struct xattr_gs_args args;
=20
-=09handler =3D xattr_resolve_name(inode, &name);
+=09handler =3D xattr_resolve_name(d_inode(dentry), &name);
 =09if (IS_ERR(handler))
 =09=09return PTR_ERR(handler);
 =09if (!handler->set)
 =09=09return -EOPNOTSUPP;
-=09return handler->set(handler, dentry, inode, name, NULL, 0, XATTR_REPLAC=
E);
+=09memset(&args, 0, sizeof(args));
+=09args.dentry =3D dentry;
+=09args.inode =3D d_inode(dentry);
+=09args.name =3D name;
+=09args.flags =3D XATTR_REPLACE;
+=09return handler->set(handler, &args);
 }
 EXPORT_SYMBOL(__vfs_removexattr);
=20
diff --git a/fs/xfs/libxfs/xfs_attr.c b/fs/xfs/libxfs/xfs_attr.c
index 510ca6974604..6289f93d79e9 100644
--- a/fs/xfs/libxfs/xfs_attr.c
+++ b/fs/xfs/libxfs/xfs_attr.c
@@ -338,7 +338,7 @@ int
 xfs_attr_set(
 =09struct xfs_inode=09*dp,
 =09const unsigned char=09*name,
-=09unsigned char=09=09*value,
+=09const unsigned char=09*value,
 =09int=09=09=09valuelen,
 =09int=09=09=09flags)
 {
@@ -357,7 +357,7 @@ xfs_attr_set(
 =09if (error)
 =09=09return error;
=20
-=09args.value =3D value;
+=09args.value =3D (unsigned char *)value;
 =09args.valuelen =3D valuelen;
 =09args.op_flags =3D XFS_DA_OP_ADDNAME | XFS_DA_OP_OKNOENT;
 =09args.total =3D xfs_attr_calc_size(&args, &local);
diff --git a/fs/xfs/libxfs/xfs_attr.h b/fs/xfs/libxfs/xfs_attr.h
index 94badfa1743e..f2244ac7a441 100644
--- a/fs/xfs/libxfs/xfs_attr.h
+++ b/fs/xfs/libxfs/xfs_attr.h
@@ -147,7 +147,7 @@ int xfs_attr_get_ilocked(struct xfs_inode *ip, struct x=
fs_da_args *args);
 int xfs_attr_get(struct xfs_inode *ip, const unsigned char *name,
 =09=09 unsigned char **value, int *valuelenp, int flags);
 int xfs_attr_set(struct xfs_inode *dp, const unsigned char *name,
-=09=09 unsigned char *value, int valuelen, int flags);
+=09=09 const unsigned char *value, int valuelen, int flags);
 int xfs_attr_set_args(struct xfs_da_args *args);
 int xfs_attr_remove(struct xfs_inode *dp, const unsigned char *name, int f=
lags);
 int xfs_attr_remove_args(struct xfs_da_args *args);
diff --git a/fs/xfs/xfs_xattr.c b/fs/xfs/xfs_xattr.c
index cb895b1df5e4..313a828a3d1f 100644
--- a/fs/xfs/xfs_xattr.c
+++ b/fs/xfs/xfs_xattr.c
@@ -17,20 +17,20 @@
=20
=20
 static int
-xfs_xattr_get(const struct xattr_handler *handler, struct dentry *unused,
-=09=09struct inode *inode, const char *name, void *value, size_t size)
+xfs_xattr_get(const struct xattr_handler *handler, struct xattr_gs_args *a=
rgs)
 {
 =09int xflags =3D handler->flags;
-=09struct xfs_inode *ip =3D XFS_I(inode);
-=09int error, asize =3D size;
+=09struct xfs_inode *ip =3D XFS_I(args->inode);
+=09int error, asize =3D args->size;
=20
 =09/* Convert Linux syscall to XFS internal ATTR flags */
-=09if (!size) {
+=09if (!args->size) {
 =09=09xflags |=3D ATTR_KERNOVAL;
-=09=09value =3D NULL;
+=09=09args->buffer =3D NULL;
 =09}
=20
-=09error =3D xfs_attr_get(ip, name, (unsigned char **)&value, &asize, xfla=
gs);
+=09error =3D xfs_attr_get(ip, (const unsigned char *)args->name,
+=09=09=09     args->buffer, &asize, xflags);
 =09if (error)
 =09=09return error;
 =09return asize;
@@ -59,26 +59,25 @@ xfs_forget_acl(
 }
=20
 static int
-xfs_xattr_set(const struct xattr_handler *handler, struct dentry *unused,
-=09=09struct inode *inode, const char *name, const void *value,
-=09=09size_t size, int flags)
+xfs_xattr_set(const struct xattr_handler *handler, struct xattr_gs_args *a=
rgs)
 {
 =09int=09=09=09xflags =3D handler->flags;
-=09struct xfs_inode=09*ip =3D XFS_I(inode);
+=09struct xfs_inode=09*ip =3D XFS_I(args->inode);
 =09int=09=09=09error;
=20
 =09/* Convert Linux syscall to XFS internal ATTR flags */
-=09if (flags & XATTR_CREATE)
+=09if (args->flags & XATTR_CREATE)
 =09=09xflags |=3D ATTR_CREATE;
-=09if (flags & XATTR_REPLACE)
+=09if (args->flags & XATTR_REPLACE)
 =09=09xflags |=3D ATTR_REPLACE;
=20
-=09if (!value)
-=09=09return xfs_attr_remove(ip, (unsigned char *)name, xflags);
-=09error =3D xfs_attr_set(ip, (unsigned char *)name,
-=09=09=09=09(void *)value, size, xflags);
+=09if (!args->value)
+=09=09return xfs_attr_remove(ip, (const unsigned char *)args->name,
+=09=09=09=09       xflags);
+=09error =3D xfs_attr_set(ip, (const unsigned char *)args->name,
+=09=09=09     args->value, args->size, xflags);
 =09if (!error)
-=09=09xfs_forget_acl(inode, name, xflags);
+=09=09xfs_forget_acl(args->inode, args->name, xflags);
=20
 =09return error;
 }
diff --git a/include/linux/xattr.h b/include/linux/xattr.h
index 6dad031be3c2..b2afbdcf000f 100644
--- a/include/linux/xattr.h
+++ b/include/linux/xattr.h
@@ -25,17 +25,27 @@ struct dentry;
  * name.  When @prefix is set instead, match attributes with that prefix a=
nd
  * with a non-empty suffix.
  */
+struct xattr_gs_args {
+=09struct dentry *dentry;
+=09struct inode *inode;
+=09const char *name;
+=09union {
+=09=09void *buffer;
+=09=09const void *value;
+=09};
+=09size_t size;
+=09int flags;
+};
+
 struct xattr_handler {
 =09const char *name;
 =09const char *prefix;
 =09int flags;      /* fs private flags */
 =09bool (*list)(struct dentry *dentry);
-=09int (*get)(const struct xattr_handler *, struct dentry *dentry,
-=09=09   struct inode *inode, const char *name, void *buffer,
-=09=09   size_t size);
-=09int (*set)(const struct xattr_handler *, struct dentry *dentry,
-=09=09   struct inode *inode, const char *name, const void *buffer,
-=09=09   size_t size, int flags);
+=09int (*get)(const struct xattr_handler *handler,
+=09=09   struct xattr_gs_args *args);
+=09int (*set)(const struct xattr_handler *handler,
+=09=09   struct xattr_gs_args *args);
 };
=20
 const char *xattr_full_name(const struct xattr_handler *, const char *);
@@ -46,10 +56,10 @@ struct xattr {
 =09size_t value_len;
 };
=20
-ssize_t __vfs_getxattr(struct dentry *, struct inode *, const char *, void=
 *, size_t);
+ssize_t __vfs_getxattr(struct xattr_gs_args *args);
 ssize_t vfs_getxattr(struct dentry *, const char *, void *, size_t);
 ssize_t vfs_listxattr(struct dentry *d, char *list, size_t size);
-int __vfs_setxattr(struct dentry *, struct inode *, const char *, const vo=
id *, size_t, int);
+int __vfs_setxattr(struct xattr_gs_args *args);
 int __vfs_setxattr_noperm(struct dentry *, const char *, const void *, siz=
e_t, int);
 int vfs_setxattr(struct dentry *, const char *, const void *, size_t, int)=
;
 int __vfs_removexattr(struct dentry *, const char *);
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
index 220be9fa2c41..eb1a31bf2de8 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3220,24 +3220,23 @@ static int shmem_initxattrs(struct inode *inode,
 }
=20
 static int shmem_xattr_handler_get(const struct xattr_handler *handler,
-=09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *name, void *buffer, size_t size)
+=09=09=09=09   struct xattr_gs_args *args)
 {
-=09struct shmem_inode_info *info =3D SHMEM_I(inode);
+=09struct shmem_inode_info *info =3D SHMEM_I(args->inode);
=20
-=09name =3D xattr_full_name(handler, name);
-=09return simple_xattr_get(&info->xattrs, name, buffer, size);
+=09return simple_xattr_get(&info->xattrs,
+=09=09=09=09xattr_full_name(handler, args->name),
+=09=09=09=09args->buffer, args->size);
 }
=20
 static int shmem_xattr_handler_set(const struct xattr_handler *handler,
-=09=09=09=09   struct dentry *unused, struct inode *inode,
-=09=09=09=09   const char *name, const void *value,
-=09=09=09=09   size_t size, int flags)
+=09=09=09=09   struct xattr_gs_args *args)
 {
-=09struct shmem_inode_info *info =3D SHMEM_I(inode);
+=09struct shmem_inode_info *info =3D SHMEM_I(args->inode);
=20
-=09name =3D xattr_full_name(handler, name);
-=09return simple_xattr_set(&info->xattrs, name, value, size, flags);
+=09return simple_xattr_set(&info->xattrs,
+=09=09=09=09xattr_full_name(handler, args->name),
+=09=09=09=09args->value, args->size, args->flags);
 }
=20
 static const struct xattr_handler shmem_security_xattr_handler =3D {
diff --git a/net/socket.c b/net/socket.c
index 6a9ab7a8b1d2..7920caece7cc 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -299,15 +299,15 @@ static const struct dentry_operations sockfs_dentry_o=
perations =3D {
 };
=20
 static int sockfs_xattr_get(const struct xattr_handler *handler,
-=09=09=09    struct dentry *dentry, struct inode *inode,
-=09=09=09    const char *suffix, void *value, size_t size)
+=09=09=09    struct xattr_gs_args *args)
 {
-=09if (value) {
-=09=09if (dentry->d_name.len + 1 > size)
+=09if (args->buffer) {
+=09=09if (args->dentry->d_name.len + 1 > args->size)
 =09=09=09return -ERANGE;
-=09=09memcpy(value, dentry->d_name.name, dentry->d_name.len + 1);
+=09=09memcpy(args->buffer, args->dentry->d_name.name,
+=09=09       args->dentry->d_name.len + 1);
 =09}
-=09return dentry->d_name.len + 1;
+=09return args->dentry->d_name.len + 1;
 }
=20
 #define XATTR_SOCKPROTONAME_SUFFIX "sockprotoname"
@@ -320,9 +320,7 @@ static const struct xattr_handler sockfs_xattr_handler =
=3D {
 };
=20
 static int sockfs_security_xattr_set(const struct xattr_handler *handler,
-=09=09=09=09     struct dentry *dentry, struct inode *inode,
-=09=09=09=09     const char *suffix, const void *value,
-=09=09=09=09     size_t size, int flags)
+=09=09=09=09     struct xattr_gs_args *args)
 {
 =09/* Handled by LSM. */
 =09return -EAGAIN;
diff --git a/security/commoncap.c b/security/commoncap.c
index f4ee0ae106b2..c58b684d5d9a 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -294,11 +294,15 @@ int cap_capset(struct cred *new,
  */
 int cap_inode_need_killpriv(struct dentry *dentry)
 {
-=09struct inode *inode =3D d_backing_inode(dentry);
-=09int error;
+=09struct xattr_gs_args args;
+
+=09memset(&args, 0, sizeof(args));
+=09args.dentry =3D dentry;
+=09args.inode =3D d_backing_inode(dentry);
+=09args.name =3D XATTR_NAME_CAPS;
+=09args.flags =3D XATTR_NOSECURITY;
=20
-=09error =3D __vfs_getxattr(dentry, inode, XATTR_NAME_CAPS, NULL, 0);
-=09return error > 0;
+=09return __vfs_getxattr(&args) > 0;
 }
=20
 /**
@@ -570,7 +574,7 @@ static inline int bprm_caps_from_vfs_caps(struct cpu_vf=
s_cap_data *caps,
  */
 int get_vfs_caps_from_disk(const struct dentry *dentry, struct cpu_vfs_cap=
_data *cpu_caps)
 {
-=09struct inode *inode =3D d_backing_inode(dentry);
+=09struct xattr_gs_args args;
 =09__u32 magic_etc;
 =09unsigned tocopy, i;
 =09int size;
@@ -580,13 +584,20 @@ int get_vfs_caps_from_disk(const struct dentry *dentr=
y, struct cpu_vfs_cap_data
 =09struct user_namespace *fs_ns;
=20
 =09memset(cpu_caps, 0, sizeof(struct cpu_vfs_cap_data));
+=09memset(&args, 0, sizeof(args));
=20
-=09if (!inode)
+=09args.dentry =3D (struct dentry *)dentry;
+=09args.inode =3D d_backing_inode(args.dentry);
+=09if (!args.inode)
 =09=09return -ENODATA;
=20
-=09fs_ns =3D inode->i_sb->s_user_ns;
-=09size =3D __vfs_getxattr((struct dentry *)dentry, inode,
-=09=09=09      XATTR_NAME_CAPS, &data, XATTR_CAPS_SZ);
+=09fs_ns =3D args.inode->i_sb->s_user_ns;
+
+=09args.name =3D XATTR_NAME_CAPS;
+=09args.buffer =3D &data;
+=09args.size =3D XATTR_CAPS_SZ;
+=09args.flags =3D XATTR_NOSECURITY;
+=09size =3D __vfs_getxattr(&args);
 =09if (size =3D=3D -ENODATA || size =3D=3D -EOPNOTSUPP)
 =09=09/* no data, that's ok */
 =09=09return -ENODATA;
diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/evm=
_main.c
index f9a81b187fae..a53ef9281186 100644
--- a/security/integrity/evm/evm_main.c
+++ b/security/integrity/evm/evm_main.c
@@ -91,16 +91,23 @@ static bool evm_key_loaded(void)
=20
 static int evm_find_protected_xattrs(struct dentry *dentry)
 {
-=09struct inode *inode =3D d_backing_inode(dentry);
+=09struct xattr_gs_args args;
 =09struct xattr_list *xattr;
 =09int error;
 =09int count =3D 0;
=20
-=09if (!(inode->i_opflags & IOP_XATTR))
+=09memset(&args, 0, sizeof(args));
+=09args.dentry =3D dentry;
+=09args.inode =3D d_backing_inode(dentry);
+
+=09if (!(args.inode->i_opflags & IOP_XATTR))
 =09=09return -EOPNOTSUPP;
=20
+=09args.flags =3D XATTR_NOSECURITY;
+
 =09list_for_each_entry_rcu(xattr, &evm_config_xattrnames, list) {
-=09=09error =3D __vfs_getxattr(dentry, inode, xattr->name, NULL, 0);
+=09=09args.name =3D xattr->name;
+=09=09error =3D __vfs_getxattr(&args);
 =09=09if (error < 0) {
 =09=09=09if (error =3D=3D -ENODATA)
 =09=09=09=09continue;
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 9625b99e677f..7cdd7d4d54ff 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -542,6 +542,8 @@ static int sb_finish_set_opts(struct super_block *sb)
 =09int rc =3D 0;
=20
 =09if (sbsec->behavior =3D=3D SECURITY_FS_USE_XATTR) {
+=09=09struct xattr_gs_args args;
+
 =09=09/* Make sure that the xattr handler exists and that no
 =09=09   error other than -ENODATA is returned by getxattr on
 =09=09   the root directory.  -ENODATA is ok, as this may be
@@ -554,7 +556,12 @@ static int sb_finish_set_opts(struct super_block *sb)
 =09=09=09goto out;
 =09=09}
=20
-=09=09rc =3D __vfs_getxattr(root, root_inode, XATTR_NAME_SELINUX, NULL, 0)=
;
+=09=09memset(&args, 0, sizeof(args));
+=09=09args.dentry =3D root;
+=09=09args.inode =3D root_inode;
+=09=09args.name =3D XATTR_NAME_SELINUX;
+=09=09args.flags =3D XATTR_NOSECURITY;
+=09=09rc =3D __vfs_getxattr(&args);
 =09=09if (rc < 0 && rc !=3D -ENODATA) {
 =09=09=09if (rc =3D=3D -EOPNOTSUPP)
 =09=09=09=09pr_warn("SELinux: (dev %s, type "
@@ -1373,6 +1380,7 @@ static int inode_doinit_use_xattr(struct inode *inode=
, struct dentry *dentry,
 =09char *context;
 =09unsigned int len;
 =09int rc;
+=09struct xattr_gs_args args;
=20
 =09len =3D INITCONTEXTLEN;
 =09context =3D kmalloc(len + 1, GFP_NOFS);
@@ -1380,12 +1388,21 @@ static int inode_doinit_use_xattr(struct inode *ino=
de, struct dentry *dentry,
 =09=09return -ENOMEM;
=20
 =09context[len] =3D '\0';
-=09rc =3D __vfs_getxattr(dentry, inode, XATTR_NAME_SELINUX, context, len);
+=09memset(&args, 0, sizeof(args));
+=09args.dentry =3D dentry;
+=09args.inode =3D inode;
+=09args.name =3D XATTR_NAME_SELINUX;
+=09args.buffer =3D context;
+=09args.size =3D len;
+=09args.flags =3D XATTR_NOSECURITY;
+=09rc =3D __vfs_getxattr(&args);
 =09if (rc =3D=3D -ERANGE) {
 =09=09kfree(context);
=20
 =09=09/* Need a larger buffer.  Query for the right size. */
-=09=09rc =3D __vfs_getxattr(dentry, inode, XATTR_NAME_SELINUX, NULL, 0);
+=09=09args.buffer =3D NULL;
+=09=09args.size =3D 0;
+=09=09rc =3D __vfs_getxattr(&args);
 =09=09if (rc < 0)
 =09=09=09return rc;
=20
@@ -1395,8 +1412,9 @@ static int inode_doinit_use_xattr(struct inode *inode=
, struct dentry *dentry,
 =09=09=09return -ENOMEM;
=20
 =09=09context[len] =3D '\0';
-=09=09rc =3D __vfs_getxattr(dentry, inode, XATTR_NAME_SELINUX,
-=09=09=09=09    context, len);
+=09=09args.buffer =3D context;
+=09=09args.size =3D len;
+=09=09rc =3D __vfs_getxattr(&args);
 =09}
 =09if (rc < 0) {
 =09=09kfree(context);
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index abeb09c30633..e9c843440dcd 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -282,25 +282,32 @@ static struct smack_known *smk_fetch(const char *name=
, struct inode *ip,
 =09=09=09=09=09struct dentry *dp)
 {
 =09int rc;
-=09char *buffer;
 =09struct smack_known *skp =3D NULL;
+=09struct xattr_gs_args args;
=20
 =09if (!(ip->i_opflags & IOP_XATTR))
 =09=09return ERR_PTR(-EOPNOTSUPP);
=20
-=09buffer =3D kzalloc(SMK_LONGLABEL, GFP_NOFS);
-=09if (buffer =3D=3D NULL)
+=09memset(&args, 0, sizeof(args));
+=09args.dentry =3D dp;
+=09args.inode =3D ip;
+=09args.name =3D name;
+=09args.buffer =3D kzalloc(SMK_LONGLABEL, GFP_NOFS);
+=09args.size =3D SMK_LONGLABEL;
+=09args.flags =3D XATTR_NOSECURITY;
+
+=09if (args.buffer =3D=3D NULL)
 =09=09return ERR_PTR(-ENOMEM);
=20
-=09rc =3D __vfs_getxattr(dp, ip, name, buffer, SMK_LONGLABEL);
+=09rc =3D __vfs_getxattr(&args);
 =09if (rc < 0)
 =09=09skp =3D ERR_PTR(rc);
 =09else if (rc =3D=3D 0)
 =09=09skp =3D NULL;
 =09else
-=09=09skp =3D smk_import_entry(buffer, rc);
+=09=09skp =3D smk_import_entry(args.buffer, rc);
=20
-=09kfree(buffer);
+=09kfree(args.buffer);
=20
 =09return skp;
 }
@@ -3422,6 +3429,8 @@ static void smack_d_instantiate(struct dentry *opt_de=
ntry, struct inode *inode)
 =09=09 * Transmuting directory
 =09=09 */
 =09=09if (S_ISDIR(inode->i_mode)) {
+=09=09=09struct xattr_gs_args args;
+
 =09=09=09/*
 =09=09=09 * If this is a new directory and the label was
 =09=09=09 * transmuted when the inode was initialized
@@ -3431,16 +3440,19 @@ static void smack_d_instantiate(struct dentry *opt_=
dentry, struct inode *inode)
 =09=09=09 * If there is a transmute attribute on the
 =09=09=09 * directory mark the inode.
 =09=09=09 */
+=09=09=09memset(&args, 0, sizeof(args));
+=09=09=09args.dentry =3D dp;
+=09=09=09args.inode =3D inode;
+=09=09=09args.name =3D XATTR_NAME_SMACKTRANSMUTE;
+=09=09=09args.size =3D TRANS_TRUE_SIZE;
 =09=09=09if (isp->smk_flags & SMK_INODE_CHANGED) {
 =09=09=09=09isp->smk_flags &=3D ~SMK_INODE_CHANGED;
-=09=09=09=09rc =3D __vfs_setxattr(dp, inode,
-=09=09=09=09=09XATTR_NAME_SMACKTRANSMUTE,
-=09=09=09=09=09TRANS_TRUE, TRANS_TRUE_SIZE,
-=09=09=09=09=090);
+=09=09=09=09args.value =3D TRANS_TRUE;
+=09=09=09=09rc =3D __vfs_setxattr(&args);
 =09=09=09} else {
-=09=09=09=09rc =3D __vfs_getxattr(dp, inode,
-=09=09=09=09=09XATTR_NAME_SMACKTRANSMUTE, trattr,
-=09=09=09=09=09TRANS_TRUE_SIZE);
+=09=09=09=09args.buffer =3D trattr;
+=09=09=09=09args.flags =3D XATTR_NOSECURITY;
+=09=09=09=09rc =3D __vfs_getxattr(&args);
 =09=09=09=09if (rc >=3D 0 && strncmp(trattr, TRANS_TRUE,
 =09=09=09=09=09=09       TRANS_TRUE_SIZE) !=3D 0)
 =09=09=09=09=09rc =3D -EINVAL;
--=20
2.23.0.866.gb869b98d4c-goog

