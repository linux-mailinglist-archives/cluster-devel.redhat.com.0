Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5C934A455
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-VFvQMU3EPPGpBcE09Fo-Ow-1; Fri, 26 Mar 2021 05:31:15 -0400
X-MC-Unique: VFvQMU3EPPGpBcE09Fo-Ow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4DCB180FCB3;
	Fri, 26 Mar 2021 09:31:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A220F299A1;
	Fri, 26 Mar 2021 09:31:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8989A1809C83;
	Fri, 26 Mar 2021 09:31:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9C8RP012329 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10D8310DCF78; Fri, 26 Mar 2021 09:12:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C4CA1050182
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9FAB100DE7B
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:07 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
	[209.85.218.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-319-IeUqwAmuNNWHuOAseX8UlA-1; Fri, 26 Mar 2021 05:12:05 -0400
X-MC-Unique: IeUqwAmuNNWHuOAseX8UlA-1
Received: by mail-ej1-f49.google.com with SMTP id r12so7316783ejr.5
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6pxNg+VtgFbRADA/oIf65maU4RwEik/35LQthQpAW9I=;
	b=AJS1PjEpH7MH7vtot+8LKfUxP+2XLPaTjB9LCEvQWNp518qs+zJ0Qk4A6UU6MAlmdY
	weoyUkmPVnQHpTCSkqfNIgqdDhdyRPQjmSG3SRa8gzvZLjwjuUNlvjjpNQURl8ye8TWb
	VpI2qsz9x0bi2reSfY5AOCctlUTVlqg/JmjIQumA6eZfbnLJtG4l7SJ1/mF5SutPlrqL
	TuMBcgzPv5le2WpMdloxgf2dmiKzZOWU/QZAz0uAf/cMZXc8WSt5eul6vNZUk3dCLoZ1
	FoKadhafsToPS5pxGRfUMxhQJ6ARhRuVSTpeYLpCtzbNrXe3afLfVG3Yew4gPcbgEn/j
	kUmA==
X-Gm-Message-State: AOAM533LcTZ6KRT/yfY40VD56qGsnHmMjVVDCJdMtxJ0ZztgWpHzbYCW
	xLHxc6R4vHf6ErK3kxeHUf8glQ==
X-Google-Smtp-Source: ABdhPJziDl03qfoFrnO6tMQQoQxPK+B/djA1Wv1x/gXEDVc6MEnjYJJ/kR1Fmtbbt+SbQ8ijeF6YOg==
X-Received: by 2002:a17:907:75c7:: with SMTP id
	jl7mr14690318ejc.191.1616749924077; 
	Fri, 26 Mar 2021 02:12:04 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.12.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:12:03 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:43 +0000
Message-Id: <20210326091151.311647-11-lee.jones@linaro.org>
In-Reply-To: <20210326091151.311647-1-lee.jones@linaro.org>
References: <20210326091151.311647-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Mar 2021 05:31:04 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 10/18] fs: gfs2: inode: Fix worthy function
	headers demote others
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Fixes the following W=1 kernel build warning(s):

 fs/gfs2/inode.c:303: warning: Function parameter or member 'dir' not described in 'gfs2_lookupi'
 fs/gfs2/inode.c:303: warning: Excess function parameter 'd_gh' description in 'gfs2_lookupi'
 fs/gfs2/inode.c:303: warning: Excess function parameter 'i_gh' description in 'gfs2_lookupi'
 fs/gfs2/inode.c:485: warning: Excess function parameter 'bhp' description in 'init_dinode'
 fs/gfs2/inode.c:533: warning: expecting prototype for gfs2_trans_da_blocks(). Prototype was for gfs2_trans_da_blks() instead
 fs/gfs2/inode.c:606: warning: Function parameter or member 'excl' not described in 'gfs2_create_inode'
 fs/gfs2/inode.c:849: warning: Function parameter or member 'mnt_userns' not described in 'gfs2_create'
 fs/gfs2/inode.c:849: warning: Function parameter or member 'excl' not described in 'gfs2_create'
 fs/gfs2/inode.c:1094: warning: Function parameter or member 'dentry' not described in 'gfs2_unlink_inode'
 fs/gfs2/inode.c:1094: warning: Excess function parameter 'name' description in 'gfs2_unlink_inode'
 fs/gfs2/inode.c:1094: warning: Excess function parameter 'inode' description in 'gfs2_unlink_inode'
 fs/gfs2/inode.c:1211: warning: Function parameter or member 'mnt_userns' not described in 'gfs2_symlink'
 fs/gfs2/inode.c:1232: warning: Function parameter or member 'mnt_userns' not described in 'gfs2_mkdir'
 fs/gfs2/inode.c:1248: warning: Function parameter or member 'mnt_userns' not described in 'gfs2_mknod'
 fs/gfs2/inode.c:1845: warning: Function parameter or member 'mnt_userns' not described in 'gfs2_permission'
 fs/gfs2/inode.c:1845: warning: Excess function parameter 'flags' description in 'gfs2_permission'
 fs/gfs2/inode.c:1886: warning: Function parameter or member 'inode' not described in 'gfs2_setattr_simple'
 fs/gfs2/inode.c:1976: warning: Function parameter or member 'mnt_userns' not described in 'gfs2_setattr'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/inode.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index c9775d5c65949..8b1dfdb60d508 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -285,10 +285,9 @@ struct inode *gfs2_lookup_simple(struct inode *dip, const char *name)
 
 /**
  * gfs2_lookupi - Look up a filename in a directory and return its inode
- * @d_gh: An initialized holder for the directory glock
+ * @dir: The inode of the directory containing the inode to look-up
  * @name: The name of the inode to look for
  * @is_root: If 1, ignore the caller's permissions
- * @i_gh: An uninitialized holder for the new inode glock
  *
  * This can be called via the VFS filldir function when NFS is doing
  * a readdirplus and the inode which its intending to stat isn't
@@ -476,7 +475,6 @@ static void gfs2_init_xattr(struct gfs2_inode *ip)
  * @dip: The directory this inode is being created in
  * @ip: The inode
  * @symname: The symlink destination (if a symlink)
- * @bhp: The buffer head (returned to caller)
  *
  */
 
@@ -514,7 +512,7 @@ static void init_dinode(struct gfs2_inode *dip, struct gfs2_inode *ip,
 }
 
 /**
- * gfs2_trans_da_blocks - Calculate number of blocks to link inode
+ * gfs2_trans_da_blks - Calculate number of blocks to link inode
  * @dip: The directory we are linking into
  * @da: The dir add information
  * @nr_inodes: The number of inodes involved
@@ -595,6 +593,7 @@ static int gfs2_initxattrs(struct inode *inode, const struct xattr *xattr_array,
  * @dev: For device nodes, this is the device number
  * @symname: For symlinks, this is the link destination
  * @size: The initial size of the inode (ignored for directories)
+ * @excl: Force fail if directory exists
  *
  * Returns: 0 on success, or error code
  */
@@ -837,9 +836,11 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 
 /**
  * gfs2_create - Create a file
+ * @mnt_userns: User namespace of the mount the inode was found from
  * @dir: The directory in which to create the file
  * @dentry: The dentry of the new file
  * @mode: The mode of the new file
+ * @excl: Frorce fail if exists
  *
  * Returns: errno
  */
@@ -1080,8 +1081,7 @@ static int gfs2_unlink_ok(struct gfs2_inode *dip, const struct qstr *name,
 /**
  * gfs2_unlink_inode - Removes an inode from its parent dir and unlinks it
  * @dip: The parent directory
- * @name: The name of the entry in the parent directory
- * @inode: The inode to be removed
+ * @dentry: The dentry to unlink
  *
  * Called with all the locks and in a transaction. This will only be
  * called for a directory after it has been checked to ensure it is empty.
@@ -1199,6 +1199,7 @@ static int gfs2_unlink(struct inode *dir, struct dentry *dentry)
 
 /**
  * gfs2_symlink - Create a symlink
+ * @mnt_userns: User namespace of the mount the inode was found from
  * @dir: The directory to create the symlink in
  * @dentry: The dentry to put the symlink in
  * @symname: The thing which the link points to
@@ -1220,6 +1221,7 @@ static int gfs2_symlink(struct user_namespace *mnt_userns, struct inode *dir,
 
 /**
  * gfs2_mkdir - Make a directory
+ * @mnt_userns: User namespace of the mount the inode was found from
  * @dir: The parent directory of the new one
  * @dentry: The dentry of the new directory
  * @mode: The mode of the new directory
@@ -1236,6 +1238,7 @@ static int gfs2_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
 
 /**
  * gfs2_mknod - Make a special file
+ * @mnt_userns: User namespace of the mount the inode was found from
  * @dir: The directory in which the special file will reside
  * @dentry: The dentry of the special file
  * @mode: The mode of the special file
@@ -1829,9 +1832,9 @@ static const char *gfs2_get_link(struct dentry *dentry,
 
 /**
  * gfs2_permission -
+ * @mnt_userns: User namespace of the mount the inode was found from
  * @inode: The inode
  * @mask: The mask to be tested
- * @flags: Indicates whether this is an RCU path walk or not
  *
  * This may be called from the VFS directly, or from within GFS2 with the
  * inode locked, so we look to see if the glock is already locked and only
@@ -1874,10 +1877,8 @@ static int __gfs2_setattr_simple(struct inode *inode, struct iattr *attr)
 	return 0;
 }
 
-/**
+/*
  * gfs2_setattr_simple -
- * @ip:
- * @attr:
  *
  * Returns: errno
  */
@@ -1962,6 +1963,7 @@ static int setattr_chown(struct inode *inode, struct iattr *attr)
 
 /**
  * gfs2_setattr - Change attributes on an inode
+ * @mnt_userns: User namespace of the mount the inode was found from
  * @dentry: The dentry which is changing
  * @attr: The structure describing the change
  *
-- 
2.27.0

