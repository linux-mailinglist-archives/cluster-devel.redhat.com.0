Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F2B772F41
	for <lists+cluster-devel@lfdr.de>; Mon,  7 Aug 2023 21:40:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691437230;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cXmeQta2YnDvYvm7pY7KY7bX0E4AZ538puGeB+V7R8o=;
	b=Pm7ETZAu0hqyugNsuxoTiapv0g/01VadYMrsTrwOzdyAelNBuIEjlqc4PhoE8TevmlRk0p
	I9jMavA5w+Vh1vGZLOZnpyBlgHmIf1R7kotnEyRg5cLRf/jaYpfvToA3zaQPM5a8CX95/J
	ks03RarDmnWb59VntLDGy/7ThUoUu0s=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-BSI9Wk54NqecGqk278xcZg-1; Mon, 07 Aug 2023 15:40:27 -0400
X-MC-Unique: BSI9Wk54NqecGqk278xcZg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7250D3C0DDCC;
	Mon,  7 Aug 2023 19:40:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 654724021B9;
	Mon,  7 Aug 2023 19:40:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BF4AE194658F;
	Mon,  7 Aug 2023 19:40:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3334D194658D for <cluster-devel@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 19:40:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 108152026D68; Mon,  7 Aug 2023 19:40:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 086852026D4B
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 19:40:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0FC985CCE1
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 19:40:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-fZLvYB31MBCMDJwRzaj6HQ-1; Mon, 07 Aug 2023 15:40:02 -0400
X-MC-Unique: fZLvYB31MBCMDJwRzaj6HQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B89FC621D9;
 Mon,  7 Aug 2023 19:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4372C433AD;
 Mon,  7 Aug 2023 19:39:52 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:42 -0400
MIME-Version: 1.0
Message-Id: <20230807-mgctime-v7-11-d1dec143a704@kernel.org>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
In-Reply-To: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
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
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Amir Goldstein <amir73il@gmail.com>, "Darrick J. Wong" <djwong@kernel.org>, 
 Benjamin Coddington <bcodding@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2949; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=5z/xbylGSvl+hXVOci3wcsIYNghIXwAhUC+C2rSRnrI=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug+ahpKwIw68/bt2wjNnF2D/E8cVJSHtX8/R
 sXB1tpcF9OJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPgAKCRAADmhBGVaC
 Fc+TD/9lkfr49t1rf4jw+BkwpfhPF+kXhDXXn3JpvdSRXx2GnfpdpGAjnd90Z8aGsx1BFxKE/U1
 4SnV5bD7hd4pTxXoYonVw1Au0ScYhllztfa2Hoo6YscHqdI0YFfYuTOhIKpf/TqFhPt5LXShftq
 akT7g5jSAyFqMcvc34edKo52PSy2ZDZFn3fCKzuh8JMbxOPW0vHTXUR9yfqsptnG02lViGcDLD/
 usJGZnShDoatUOAxVBdS2VCHlNAmhuPg6/GSFQAfYSiUSAgIS/4nnihBj5HcOkdg614hVQzoepW
 NZleVbruxT4TtqCIItw72wFSRiod6LYA4EoqeEnO7wZbI/tNUVN3trpz6y/fIbjGv6jHhuClnv6
 wwOv7I31YG5jvzYf1fSy/PTr2oON8d9hfkUbAYbwnTNYgJCTqRmDAJVdywazPPMg3AU1IHKfqcN
 DkWBDtFjjgn53eKNgj832Is8wO3G/xHb1a3KJfNIIVIL5Tia+Bz9OWrrvGueMAq5Oa+ffbRHKg8
 yvGkRqpZLrGhy2sjzzcQ5fzgs0MRVXxFFv+WD50ZANZ4cpN7ZGps63xtDnwy8nadXecAb1McpGY
 uMniWQ8CVTofdNKp0AlscttAtXLOcBoKTT8g1aTXg8PxvDKrAPFzf8U6VxFBT9ZCtw3/4kG/jlE
 8U/73oVup4s0oKg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH v7 11/13] xfs: switch to multigrain
 timestamps
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Enable multigrain timestamps, which should ensure that there is an
apparent change to the timestamp whenever it has been written after
being actively observed via getattr.

Also, anytime the mtime changes, the ctime must also change, and those
are now the only two options for xfs_trans_ichgtime. Have that function
unconditionally bump the ctime, and ASSERT that XFS_ICHGTIME_CHG is
always set.

Acked-by: "Darrick J. Wong" <djwong@kernel.org>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/xfs/libxfs/xfs_trans_inode.c | 6 +++---
 fs/xfs/xfs_iops.c               | 8 ++++----
 fs/xfs/xfs_super.c              | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inode.c
index 6b2296ff248a..ad22656376d3 100644
--- a/fs/xfs/libxfs/xfs_trans_inode.c
+++ b/fs/xfs/libxfs/xfs_trans_inode.c
@@ -62,12 +62,12 @@ xfs_trans_ichgtime(
 	ASSERT(tp);
 	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
 
-	tv = current_time(inode);
+	/* If the mtime changes, then ctime must also change */
+	ASSERT(flags & XFS_ICHGTIME_CHG);
 
+	tv = inode_set_ctime_current(inode);
 	if (flags & XFS_ICHGTIME_MOD)
 		inode->i_mtime = tv;
-	if (flags & XFS_ICHGTIME_CHG)
-		inode_set_ctime_to_ts(inode, tv);
 	if (flags & XFS_ICHGTIME_CREATE)
 		ip->i_crtime = tv;
 }
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index c73529f77bac..2ededd3f6b8c 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -573,10 +573,10 @@ xfs_vn_getattr(
 	stat->gid = vfsgid_into_kgid(vfsgid);
 	stat->ino = ip->i_ino;
 	stat->atime = inode->i_atime;
-	stat->mtime = inode->i_mtime;
-	stat->ctime = inode_get_ctime(inode);
 	stat->blocks = XFS_FSB_TO_BB(mp, ip->i_nblocks + ip->i_delayed_blks);
 
+	fill_mg_cmtime(stat, request_mask, inode);
+
 	if (xfs_has_v3inodes(mp)) {
 		if (request_mask & STATX_BTIME) {
 			stat->result_mask |= STATX_BTIME;
@@ -917,7 +917,7 @@ xfs_setattr_size(
 	if (newsize != oldsize &&
 	    !(iattr->ia_valid & (ATTR_CTIME | ATTR_MTIME))) {
 		iattr->ia_ctime = iattr->ia_mtime =
-			current_time(inode);
+			current_mgtime(inode);
 		iattr->ia_valid |= ATTR_CTIME | ATTR_MTIME;
 	}
 
@@ -1036,7 +1036,7 @@ xfs_vn_update_time(
 	int			log_flags = XFS_ILOG_TIMESTAMP;
 	struct xfs_trans	*tp;
 	int			error;
-	struct timespec64	now = current_time(inode);
+	struct timespec64	now;
 
 	trace_xfs_update_time(ip);
 
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 818510243130..4b10edb2c972 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -2009,7 +2009,7 @@ static struct file_system_type xfs_fs_type = {
 	.init_fs_context	= xfs_init_fs_context,
 	.parameters		= xfs_fs_parameters,
 	.kill_sb		= kill_block_super,
-	.fs_flags		= FS_REQUIRES_DEV | FS_ALLOW_IDMAP,
+	.fs_flags		= FS_REQUIRES_DEV | FS_ALLOW_IDMAP | FS_MGTIME,
 };
 MODULE_ALIAS_FS("xfs");
 

-- 
2.41.0

