Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F8D7C96F
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Jul 2019 18:59:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3CA78308403B;
	Wed, 31 Jul 2019 16:59:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2063360922;
	Wed, 31 Jul 2019 16:59:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F37421800203;
	Wed, 31 Jul 2019 16:59:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6VGxFg5027094 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 31 Jul 2019 12:59:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2318660C44; Wed, 31 Jul 2019 16:59:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B54860BF7
	for <cluster-devel@redhat.com>; Wed, 31 Jul 2019 16:59:12 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F5AA30C1E2B
	for <cluster-devel@redhat.com>; Wed, 31 Jul 2019 16:58:54 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t14so30727874plr.11
	for <cluster-devel@redhat.com>; Wed, 31 Jul 2019 09:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=android.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=p6RSnHZej7dMZQfosYc1rQOAXMnG8HF3vzAcSS3MG98=;
	b=fmiQSh9yv929qF/IP6Uym2pEsxsKnDznkX0VjJ8cIh+7NzZrkbqvPCG3bssMygeAbK
	NmkNsix4uTqi91gMmHKksLpNQD7b0D1A9bda6aSayMw9sPfvhUAJO63BySMzz39Ednc6
	+iWQAfEEJ8NQ6QfBslJvC3DyBQUS6s3R1R0XZUZMZgKOLtN+EIac6ejHjwc9qbdb5uvz
	eiCuyG0A6yFWZLw5lHrPP3O5DsRBGnqxHkq8vNdP6QJnUoh2+fIqC3yhPbsH+qEpXwib
	mUbx7N0k3Aa9YqKq/FSCQYABcvQoWcmd3n7QaLFSg3+9u/w9YuhZ+4mMF/9YdnWbfIFZ
	JhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=p6RSnHZej7dMZQfosYc1rQOAXMnG8HF3vzAcSS3MG98=;
	b=jBgXqYXS67AHaQL56K7C/Ws9aj7FACcbiGOUCyqlyFqEljCpSzzchVxygL1ehFziJQ
	Xqu8ecnU0VNcJ4dNDsxhFLfmSHWsng5cTHMerVEEfVyTiuygJvTwdaQmrxdYClAORwIL
	t9Zrzw+q57VnC1zwZrF61WPy7qXB9CkfREFuTKsmhJMUxiRom1iXJDuVnyvNqdN4nizF
	Vxhh6xgtv+5RsmR6Ew+xAa0LWTWzYkAG2dZpmRpovJPA3YTABgj3+nyha9X3s3VO7xsx
	z/lWNt4bqiAPbGCDJIGcdDVCB0dfwysarit3CU5WEHl6cWNp3JukwcAUdY96px7Znm+a
	Ve4A==
X-Gm-Message-State: APjAAAU63/2w5r4eUnXQ2wmYYrhQUC9mGwddbjy1SN6ikISWTj+YO0xZ
	Ao+pkcTuYbTjywvRekZ2S5M=
X-Google-Smtp-Source: APXvYqyB1157MtzfYeWJ1dBcWuMDKOUJgOnzq0VC5i1SowoHtyq/iVzFaALo7AjUpN0O6A6XZS+NfQ==
X-Received: by 2002:a17:902:9a85:: with SMTP id
	w5mr121452633plp.221.1564592333814; 
	Wed, 31 Jul 2019 09:58:53 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
	([2620:15c:211:200:5404:91ba:59dc:9400])
	by smtp.gmail.com with ESMTPSA id
	f72sm2245954pjg.10.2019.07.31.09.58.51
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 31 Jul 2019 09:58:53 -0700 (PDT)
From: Mark Salyzyn <salyzyn@android.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 31 Jul 2019 09:57:59 -0700
Message-Id: <20190731165803.4755-5-salyzyn@android.com>
In-Reply-To: <20190731165803.4755-1-salyzyn@android.com>
References: <20190731165803.4755-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 31 Jul 2019 16:58:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Wed, 31 Jul 2019 16:58:54 +0000 (UTC) for IP:'209.85.214.195'
	DOMAIN:'mail-pl1-f195.google.com'
	HELO:'mail-pl1-f195.google.com' FROM:'salyzyn@android.com' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, SPF_HELO_NONE,
	SPF_PASS) 209.85.214.195 mail-pl1-f195.google.com 209.85.214.195
	mail-pl1-f195.google.com <salyzyn@android.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Amir Goldstein <amir73il@gmail.com>,
	David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	ocfs2-devel@oss.oracle.com, netdev@vger.kernel.org,
	Tyler Hicks <tyhicks@canonical.com>, linux-afs@lists.infradead.org,
	Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
	Sage Weil <sage@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Richard Weinberger <richard@nod.at>,
	Mark Fasheh <mark@fasheh.com>, devel@lists.orangefs.org,
	Hugh Dickins <hughd@google.com>,
	linux-security-module@vger.kernel.org, cluster-devel@redhat.com,
	Vyacheslav Dubeyko <slava@dubeyko.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Stephen Smalley <sds@tycho.nsa.gov>, linux-mm@kvack.org,
	Vivek Goyal <vgoyal@redhat.com>, Chao Yu <yuchao0@huawei.com>,
	linux-cifs@vger.kernel.org,
	Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-mtd@lists.infradead.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-nfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mathieu Malaterre <malat@debian.org>, kernel-team@android.com,
	Miklos Szeredi <miklos@szeredi.hu>,
	Jeff Layton <jlayton@kernel.org>, linux-unionfs@vger.kernel.org,
	stable@vger.kernel.org, Mark Salyzyn <salyzyn@android.com>,
	Steve French <sfrench@samba.org>,
	=?UTF-8?q?Ernesto=20A=20=2E=20Fern=C3=A1ndez?=
	<ernesto.mnd.fernandez@gmail.com>,
	"Eric W . Biederman" <ebiederm@xmission.com>, Jan Kara <jack@suse.com>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [Cluster-devel] [PATCH v13 4/5] overlayfs: internal getxattr
	operations without sepolicy checking
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Wed, 31 Jul 2019 16:59:18 +0000 (UTC)

Check impure, opaque, origin & meta xattr with no sepolicy audit
(using __vfs_getxattr) since these operations are internal to
overlayfs operations and do not disclose any data.  This became
an issue for credential override off since sys_admin would have
been required by the caller; whereas would have been inherently
present for the creator since it performed the mount.

This is a change in operations since we do not check in the new
ovl_do_vfs_getxattr function if the credential override is off or
not.  Reasoning is that the sepolicy check is unnecessary overhead,
especially since the check can be expensive.

Because for override credentials off, this affects _everyone_ that
underneath performs private xattr calls without the appropriate
sepolicy permissions and sys_admin capability.  Providing blanket
support for sys_admin would be bad for all possible callers.

For the override credentials on, this will affect only the mounter,
should it lack sepolicy permissions. Not considered a security
problem since mounting by definition has sys_admin capabilities,
but sepolicy contexts would still need to be crafted.

It should be noted that there is precedence, __vfs_getxattr is used
in other filesystems for their own internal trusted xattr management.

Signed-off-by: Mark Salyzyn <salyzyn@android.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: Eric W. Biederman <ebiederm@xmission.com>
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Smalley <sds@tycho.nsa.gov>
Cc: linux-unionfs@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: kernel-team@android.com
Cc: Eric Van Hensbergen <ericvh@gmail.com>
Cc: Latchesar Ionkov <lucho@ionkov.net>
Cc: Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>
Cc: Chris Mason <clm@fb.com>
Cc: Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>
Cc: Jeff Layton <jlayton@kernel.org>
Cc: Sage Weil <sage@redhat.com>
Cc: Ilya Dryomov <idryomov@gmail.com>
Cc: Steve French <sfrench@samba.org>
Cc: Tyler Hicks <tyhicks@canonical.com>
Cc: Jan Kara <jack@suse.com>
Cc: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <yuchao0@huawei.com>
Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: Dave Kleikamp <shaggy@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>
Cc: Mark Fasheh <mark@fasheh.com>
Cc: Joel Becker <jlbec@evilplan.org>
Cc: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Mike Marshall <hubcap@omnibond.com>
Cc: Martin Brandenburg <martin@omnibond.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Cc: Darrick J. Wong <darrick.wong@oracle.com>
Cc: linux-xfs@vger.kernel.org
Cc: Hugh Dickins <hughd@google.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mathieu Malaterre <malat@debian.org>
Cc: Ernesto A. Fernández <ernesto.mnd.fernandez@gmail.com>
Cc: Vyacheslav Dubeyko <slava@dubeyko.com>
Cc: v9fs-developer@lists.sourceforge.net
Cc: linux-afs@lists.infradead.org
Cc: linux-btrfs@vger.kernel.org
Cc: ceph-devel@vger.kernel.org
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Cc: ecryptfs@vger.kernel.org
Cc: linux-ext4@vger.kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: linux-fsdevel@vger.kernel.org
Cc: cluster-devel@redhat.com
Cc: linux-mtd@lists.infradead.org
Cc: jfs-discussion@lists.sourceforge.net
Cc: linux-nfs@vger.kernel.org
Cc: ocfs2-devel@oss.oracle.com
Cc: devel@lists.orangefs.org
Cc: reiserfs-devel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: netdev@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
Cc: stable@vger.kernel.org # 4.4, 4.9, 4.14 & 4.19
---
v13 - rebase to use __vfs_getxattr flags option

v12 - rebase

v11 - switch name to ovl_do_vfs_getxattr, fortify comment

v10 - added to patch series
---
 fs/overlayfs/namei.c     | 12 +++++++-----
 fs/overlayfs/overlayfs.h |  2 ++
 fs/overlayfs/util.c      | 25 ++++++++++++++++---------
 3 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
index 9702f0d5309d..a4a452c489fa 100644
--- a/fs/overlayfs/namei.c
+++ b/fs/overlayfs/namei.c
@@ -106,10 +106,11 @@ int ovl_check_fh_len(struct ovl_fh *fh, int fh_len)
 
 static struct ovl_fh *ovl_get_fh(struct dentry *dentry, const char *name)
 {
-	int res, err;
+	ssize_t res;
+	int err;
 	struct ovl_fh *fh = NULL;
 
-	res = vfs_getxattr(dentry, name, NULL, 0);
+	res = ovl_do_vfs_getxattr(dentry, name, NULL, 0);
 	if (res < 0) {
 		if (res == -ENODATA || res == -EOPNOTSUPP)
 			return NULL;
@@ -123,7 +124,7 @@ static struct ovl_fh *ovl_get_fh(struct dentry *dentry, const char *name)
 	if (!fh)
 		return ERR_PTR(-ENOMEM);
 
-	res = vfs_getxattr(dentry, name, fh, res);
+	res = ovl_do_vfs_getxattr(dentry, name, fh, res);
 	if (res < 0)
 		goto fail;
 
@@ -141,10 +142,11 @@ static struct ovl_fh *ovl_get_fh(struct dentry *dentry, const char *name)
 	return NULL;
 
 fail:
-	pr_warn_ratelimited("overlayfs: failed to get origin (%i)\n", res);
+	pr_warn_ratelimited("overlayfs: failed to get origin (%zi)\n", res);
 	goto out;
 invalid:
-	pr_warn_ratelimited("overlayfs: invalid origin (%*phN)\n", res, fh);
+	pr_warn_ratelimited("overlayfs: invalid origin (%*phN)\n",
+			    (int)res, fh);
 	goto out;
 }
 
diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index ab3d031c422b..9d26d8758513 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -205,6 +205,8 @@ int ovl_want_write(struct dentry *dentry);
 void ovl_drop_write(struct dentry *dentry);
 struct dentry *ovl_workdir(struct dentry *dentry);
 const struct cred *ovl_override_creds(struct super_block *sb);
+ssize_t ovl_do_vfs_getxattr(struct dentry *dentry, const char *name, void *buf,
+			    size_t size);
 struct super_block *ovl_same_sb(struct super_block *sb);
 int ovl_can_decode_fh(struct super_block *sb);
 struct dentry *ovl_indexdir(struct super_block *sb);
diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
index f5678a3f8350..c588c0d66d8c 100644
--- a/fs/overlayfs/util.c
+++ b/fs/overlayfs/util.c
@@ -40,6 +40,13 @@ const struct cred *ovl_override_creds(struct super_block *sb)
 	return override_creds(ofs->creator_cred);
 }
 
+ssize_t ovl_do_vfs_getxattr(struct dentry *dentry, const char *name, void *buf,
+			    size_t size)
+{
+	return __vfs_getxattr(dentry, d_inode(dentry), name, buf, size,
+			      XATTR_NOSECURITY);
+}
+
 struct super_block *ovl_same_sb(struct super_block *sb)
 {
 	struct ovl_fs *ofs = sb->s_fs_info;
@@ -537,9 +544,9 @@ void ovl_copy_up_end(struct dentry *dentry)
 
 bool ovl_check_origin_xattr(struct dentry *dentry)
 {
-	int res;
+	ssize_t res;
 
-	res = vfs_getxattr(dentry, OVL_XATTR_ORIGIN, NULL, 0);
+	res = ovl_do_vfs_getxattr(dentry, OVL_XATTR_ORIGIN, NULL, 0);
 
 	/* Zero size value means "copied up but origin unknown" */
 	if (res >= 0)
@@ -550,13 +557,13 @@ bool ovl_check_origin_xattr(struct dentry *dentry)
 
 bool ovl_check_dir_xattr(struct dentry *dentry, const char *name)
 {
-	int res;
+	ssize_t res;
 	char val;
 
 	if (!d_is_dir(dentry))
 		return false;
 
-	res = vfs_getxattr(dentry, name, &val, 1);
+	res = ovl_do_vfs_getxattr(dentry, name, &val, 1);
 	if (res == 1 && val == 'y')
 		return true;
 
@@ -837,13 +844,13 @@ int ovl_lock_rename_workdir(struct dentry *workdir, struct dentry *upperdir)
 /* err < 0, 0 if no metacopy xattr, 1 if metacopy xattr found */
 int ovl_check_metacopy_xattr(struct dentry *dentry)
 {
-	int res;
+	ssize_t res;
 
 	/* Only regular files can have metacopy xattr */
 	if (!S_ISREG(d_inode(dentry)->i_mode))
 		return 0;
 
-	res = vfs_getxattr(dentry, OVL_XATTR_METACOPY, NULL, 0);
+	res = ovl_do_vfs_getxattr(dentry, OVL_XATTR_METACOPY, NULL, 0);
 	if (res < 0) {
 		if (res == -ENODATA || res == -EOPNOTSUPP)
 			return 0;
@@ -852,7 +859,7 @@ int ovl_check_metacopy_xattr(struct dentry *dentry)
 
 	return 1;
 out:
-	pr_warn_ratelimited("overlayfs: failed to get metacopy (%i)\n", res);
+	pr_warn_ratelimited("overlayfs: failed to get metacopy (%zi)\n", res);
 	return res;
 }
 
@@ -878,7 +885,7 @@ ssize_t ovl_getxattr(struct dentry *dentry, char *name, char **value,
 	ssize_t res;
 	char *buf = NULL;
 
-	res = vfs_getxattr(dentry, name, NULL, 0);
+	res = ovl_do_vfs_getxattr(dentry, name, NULL, 0);
 	if (res < 0) {
 		if (res == -ENODATA || res == -EOPNOTSUPP)
 			return -ENODATA;
@@ -890,7 +897,7 @@ ssize_t ovl_getxattr(struct dentry *dentry, char *name, char **value,
 		if (!buf)
 			return -ENOMEM;
 
-		res = vfs_getxattr(dentry, name, buf, res);
+		res = ovl_do_vfs_getxattr(dentry, name, buf, res);
 		if (res < 0)
 			goto fail;
 	}
-- 
2.22.0.770.g0f2c4a37fd-goog

