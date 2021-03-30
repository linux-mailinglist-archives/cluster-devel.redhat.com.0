Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 314E034EE28
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:45:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-wzBQOhxDNU2ryLZN76MNOw-1; Tue, 30 Mar 2021 12:45:22 -0400
X-MC-Unique: wzBQOhxDNU2ryLZN76MNOw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A171187139C;
	Tue, 30 Mar 2021 16:45:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D9455C5AE;
	Tue, 30 Mar 2021 16:45:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 433D84BB7B;
	Tue, 30 Mar 2021 16:45:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjGSL010836 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6AEA311457C1; Tue, 30 Mar 2021 16:45:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6690C11457C0
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F4E3802BEE
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:16 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-211-U83LDCHyPv2-K_22Huuyow-1; Tue, 30 Mar 2021 12:45:12 -0400
X-MC-Unique: U83LDCHyPv2-K_22Huuyow-1
Received: by mail-wm1-f44.google.com with SMTP id
	z6-20020a1c4c060000b029010f13694ba2so8764709wmf.5
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6pxNg+VtgFbRADA/oIf65maU4RwEik/35LQthQpAW9I=;
	b=c7355Koyi18axddER4Hel4M1hi7GItV81Td42GVl6K5BQOdM0UtJSa7kwo4SLlJqa6
	BzPZtPXRd/vkPpT6U+xHL56hIe+byOwY28Qt5Yrk1b3TyGOFm/H0gGQf/vXJAJrNPaK9
	EZsdE8uzTe5LPcf0qqg/bqdKw1zXYnrTirUsUUu8o/rq48lQF8d/bo0v4q9N1LLlaeiC
	WJBWnJ3DXHrK0MB5hB+Orkuo6hW0VDKFHyqNeGpE1d/H/a6A7v10GdoaB5a+d551s3+1
	GcOJlSgzYOoMhvpUgF/q3S0kMdy8nfv84JgyjRWpxtcxn9pTn7uHS36LnSMp0JemlLpU
	OB1A==
X-Gm-Message-State: AOAM531i5L/DLrA/YCkfizXfbxyr7YxBqKRFVIPxtZr95Z/gzGqMaz3a
	oDhmsCHGHTGVlVz4ExyO7Hz5AA==
X-Google-Smtp-Source: ABdhPJyVkUveTYMwp1Bkkn9K9StXyRHeF6bR1BepENx3c8zj6jFiQAb1im/yFHJ3QFpVJt/YQBIWug==
X-Received: by 2002:a1c:771a:: with SMTP id t26mr5018941wmi.60.1617122710936; 
	Tue, 30 Mar 2021 09:45:10 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:10 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:37 +0100
Message-Id: <20210330164458.1625478-11-lee.jones@linaro.org>
In-Reply-To: <20210330164458.1625478-1-lee.jones@linaro.org>
References: <20210330164458.1625478-1-lee.jones@linaro.org>
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 10/31] fs: gfs2: inode: Fix worthy function
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

