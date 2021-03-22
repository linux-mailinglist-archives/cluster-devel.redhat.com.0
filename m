Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 10E323446EB
	for <lists+cluster-devel@lfdr.de>; Mon, 22 Mar 2021 15:18:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616422682;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TzPZlwBP5HR794/z1pV5dC2WwRb0z0qq9meP/hMIGtU=;
	b=MKYvJGDYdnyjSqyOPnmyR8wxcwh3SXsoZ8v2hubnF44H06TLuhI+Z4E70I6xiieBDYP1oW
	TpVAWXHx0rAX4QSOQCFLPZfSgpLu4+B5b+BGdyhUFHiLdGV2J/DI/CpKNOK8D1C1GJcxEe
	JA7cXVZ7f4wLXDOJ/35W71r0pTq1aHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-sUrz4SIkOyiSQX6TmXm5ZQ-1; Mon, 22 Mar 2021 10:18:00 -0400
X-MC-Unique: sUrz4SIkOyiSQX6TmXm5ZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7421985EE8B;
	Mon, 22 Mar 2021 14:17:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6446F5C1A3;
	Mon, 22 Mar 2021 14:17:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE3C34BB7C;
	Mon, 22 Mar 2021 14:17:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12MEHrat031019 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 22 Mar 2021 10:17:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF20A3697; Mon, 22 Mar 2021 14:17:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9E465C1C4
	for <cluster-devel@redhat.com>; Mon, 22 Mar 2021 14:17:51 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 216E51809C81
	for <cluster-devel@redhat.com>; Mon, 22 Mar 2021 14:17:51 +0000 (UTC)
Date: Mon, 22 Mar 2021 10:17:51 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <118080683.65195486.1616422671077.JavaMail.zimbra@redhat.com>
In-Reply-To: <212220598.65195485.1616422666102.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.85, 10.4.195.12]
Thread-Topic: gfs2: Fix dir.c function parameter descriptions
Thread-Index: JyM4PPrzJ9NrBH8m1rh0R4WJuiMmqw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Fix dir.c function parameter
	descriptions
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This patch simply fixes a bunch of function parameter comments
in dir.c that were reported by the kernel test robot.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/dir.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
index 44875fbdfc64..6ff211ed7dcf 100644
--- a/fs/gfs2/dir.c
+++ b/fs/gfs2/dir.c
@@ -771,14 +771,13 @@ static int get_leaf(struct gfs2_inode *dip, u64 leaf_no,
 /**
  * get_leaf_nr - Get a leaf number associated with the index
  * @dip: The GFS2 inode
- * @index:
- * @leaf_out:
+ * @index: hash table index of the targeted leaf
+ * @leaf_out: Resulting leaf block number
  *
  * Returns: 0 on success, error code otherwise
  */
 
-static int get_leaf_nr(struct gfs2_inode *dip, u32 index,
-		       u64 *leaf_out)
+static int get_leaf_nr(struct gfs2_inode *dip, u32 index, u64 *leaf_out)
 {
 	__be64 *hash;
 	int error;
@@ -899,7 +898,7 @@ static struct gfs2_leaf *new_leaf(struct inode *inode, struct buffer_head **pbh,
 
 /**
  * dir_make_exhash - Convert a stuffed directory into an ExHash directory
- * @dip: The GFS2 inode
+ * @inode: The directory inode to be converted to exhash
  *
  * Returns: 0 on success, error code otherwise
  */
@@ -992,9 +991,8 @@ static int dir_make_exhash(struct inode *inode)
 
 /**
  * dir_split_leaf - Split a leaf block into two
- * @dip: The GFS2 inode
- * @index:
- * @leaf_no:
+ * @inode: The directory inode to be split
+ * @name: name of the dirent we're trying to insert
  *
  * Returns: 0 on success, error code on failure
  */
@@ -1253,6 +1251,7 @@ static int compare_dents(const void *a, const void *b)
  * @ctx: what to feed the entries to
  * @darr: an array of struct gfs2_dirent pointers to read
  * @entries: the number of entries in darr
+ * @sort_start: index of the directory array to start our sort
  * @copied: pointer to int that's non-zero if a entry has been copied out
  *
  * Jump through some hoops to make sure that if there are hash collsions,
@@ -1469,6 +1468,10 @@ static int gfs2_dir_read_leaf(struct inode *inode, struct dir_context *ctx,
 
 /**
  * gfs2_dir_readahead - Issue read-ahead requests for leaf blocks.
+ * @inode: the directory inode
+ * @hsize: hash table size
+ * @index: index into the hash table
+ * @f_ra: read-ahead parameters
  *
  * Note: we can't calculate each index like dir_e_read can because we don't
  * have the leaf, and therefore we don't have the depth, and therefore we
@@ -1518,8 +1521,9 @@ static void gfs2_dir_readahead(struct inode *inode, unsigned hsize, u32 index,
 
 /**
  * dir_e_read - Reads the entries from a directory into a filldir buffer
- * @dip: dinode pointer
+ * @inode: the directory inode
  * @ctx: actor to feed the entries to
+ * @f_ra: read-ahead parameters
  *
  * Returns: errno
  */
@@ -1628,7 +1632,7 @@ int gfs2_dir_read(struct inode *inode, struct dir_context *ctx,
 
 /**
  * gfs2_dir_search - Search a directory
- * @dip: The GFS2 dir inode
+ * @dir: The GFS2 directory inode
  * @name: The name we are looking up
  * @fail_on_exist: Fail if the name exists rather than looking it up
  *
@@ -1870,7 +1874,7 @@ int gfs2_dir_add(struct inode *inode, const struct qstr *name,
 /**
  * gfs2_dir_del - Delete a directory entry
  * @dip: The GFS2 inode
- * @filename: The filename
+ * @dentry: The directory entry we want to delete
  *
  * Returns: 0 on success, error code on failure
  */
@@ -1924,9 +1928,10 @@ int gfs2_dir_del(struct gfs2_inode *dip, const struct dentry *dentry)
 
 /**
  * gfs2_dir_mvino - Change inode number of directory entry
- * @dip: The GFS2 inode
- * @filename:
- * @new_inode:
+ * @dip: The GFS2 directory inode
+ * @filename: the filename to be moved
+ * @nip: the new GFS2 inode
+ * @new_type: the de_type of the new dirent
  *
  * This routine changes the inode number of a directory entry.  It's used
  * by rename to change ".." when a directory is moved.
@@ -1966,7 +1971,7 @@ int gfs2_dir_mvino(struct gfs2_inode *dip, const struct qstr *filename,
  * @len: the number of pointers to this leaf
  * @leaf_no: the leaf number
  * @leaf_bh: buffer_head for the starting leaf
- * last_dealloc: 1 if this is the final dealloc for the leaf, else 0
+ * @last_dealloc: 1 if this is the final dealloc for the leaf, else 0
  *
  * Returns: errno
  */
@@ -2288,8 +2293,8 @@ int gfs2_dir_exhash_dealloc(struct gfs2_inode *dip)
 
 /**
  * gfs2_diradd_alloc_required - find if adding entry will require an allocation
- * @ip: the file being written to
- * @filname: the filename that's going to be added
+ * @inode: the directory inode being written to
+ * @name: the filename that's going to be added
  * @da: The structure to return dir alloc info
  *
  * Returns: 0 if ok, -ve on error

