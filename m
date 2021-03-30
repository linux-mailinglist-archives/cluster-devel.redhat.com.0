Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D62B434EE38
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:47:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-IIfVN4_DNeuOYKXJ_78jsw-1; Tue, 30 Mar 2021 12:47:03 -0400
X-MC-Unique: IIfVN4_DNeuOYKXJ_78jsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EC9281746E;
	Tue, 30 Mar 2021 16:47:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 461751000358;
	Tue, 30 Mar 2021 16:47:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2FC784BB7C;
	Tue, 30 Mar 2021 16:47:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjBEJ010764 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 464A911457C0; Tue, 30 Mar 2021 16:45:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ED4511457C5
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1731C8030CC
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:06 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-50-6FZTb8P1OC2uZ179VacopA-1; Tue, 30 Mar 2021 12:45:03 -0400
X-MC-Unique: 6FZTb8P1OC2uZ179VacopA-1
Received: by mail-wr1-f42.google.com with SMTP id v4so16859614wrp.13
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AgH3DJxocfXj8CzPXRPGR+bvGOz2TXMRbIxLhnqfhyo=;
	b=Gl2yweSmGQzvhD63AZgCyyNcaStJ5XL5qKSP6OciyCD2+eU7mSzcpMjgAcPa0LYYtw
	fENBP6Y+SEjueUvI6TESPW6FIOOSwOzRNKRDbSFqE0Tq8Ii/iM4u/04VBX3hh2/WAqrB
	31vVMPBCjqpeMm6lvRU2V88ikMRZ/KLSFdjYHczNUTK/IQStKQZr+K8Wgz1rWVZ7AF+n
	BszvNvpYj+zMciI07qH7XESHHU9p9bSc219qdQ6/ChwFQu3qedHgdU5c85BWGTIYP1kN
	t8VXTBy+7xmEs9zrsA5FwNexsHDiCy0wdfLEfe20vTxlbP/UykjyHtjTCHDQKyqR66Mc
	hw3w==
X-Gm-Message-State: AOAM532f6eHh7Whsq1cWVtpiLRy76LpoNCls6+qJNHgU/tvoWcd6pCW0
	qu9kCvKn0vYSzK/J3rhcJmb4Xw==
X-Google-Smtp-Source: ABdhPJws1Qko4Cx2qR/gy8xBRjKR25JXC+t27LNEoN/7S9huCXZU1SuL6zGBIsZhImOeMJESQK1JmA==
X-Received: by 2002:a5d:6304:: with SMTP id i4mr34815235wru.155.1617122702461; 
	Tue, 30 Mar 2021 09:45:02 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:01 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:28 +0100
Message-Id: <20210330164458.1625478-2-lee.jones@linaro.org>
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
Subject: [Cluster-devel] [PATCH 01/31] fs: gfs2: dir: Finish off mostly
	complete headers demote others
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Fixes the following W=1 kernel build warning(s):

 fs/gfs2/dir.c:781: warning: Function parameter or member 'index' not described in 'get_leaf_nr'
 fs/gfs2/dir.c:907: warning: Function parameter or member 'inode' not described in 'dir_make_exhash'
 fs/gfs2/dir.c:907: warning: Excess function parameter 'dip' description in 'dir_make_exhash'
 fs/gfs2/dir.c:1002: warning: Function parameter or member 'inode' not described in 'dir_split_leaf'
 fs/gfs2/dir.c:1002: warning: Function parameter or member 'name' not described in 'dir_split_leaf'
 fs/gfs2/dir.c:1002: warning: Excess function parameter 'dip' description in 'dir_split_leaf'
 fs/gfs2/dir.c:1002: warning: Excess function parameter 'leaf_no' description in 'dir_split_leaf'
 fs/gfs2/dir.c:1268: warning: Function parameter or member 'sort_start' not described in 'do_filldir_main'
 fs/gfs2/dir.c:1479: warning: Function parameter or member 'inode' not described in 'gfs2_dir_readahead'
 fs/gfs2/dir.c:1479: warning: Function parameter or member 'hsize' not described in 'gfs2_dir_readahead'
 fs/gfs2/dir.c:1479: warning: Function parameter or member 'index' not described in 'gfs2_dir_readahead'
 fs/gfs2/dir.c:1479: warning: Function parameter or member 'f_ra' not described in 'gfs2_dir_readahead'
 fs/gfs2/dir.c:1528: warning: Function parameter or member 'inode' not described in 'dir_e_read'
 fs/gfs2/dir.c:1528: warning: Function parameter or member 'f_ra' not described in 'dir_e_read'
 fs/gfs2/dir.c:1528: warning: Excess function parameter 'dip' description in 'dir_e_read'
 fs/gfs2/dir.c:1642: warning: Function parameter or member 'dir' not described in 'gfs2_dir_search'
 fs/gfs2/dir.c:1642: warning: Excess function parameter 'dip' description in 'gfs2_dir_search'
 fs/gfs2/dir.c:1873: warning: Function parameter or member 'dentry' not described in 'gfs2_dir_del'
 fs/gfs2/dir.c:1873: warning: Excess function parameter 'filename' description in 'gfs2_dir_del'
 fs/gfs2/dir.c:1934: warning: Function parameter or member 'filename' not described in 'gfs2_dir_mvino'
 fs/gfs2/dir.c:1934: warning: Function parameter or member 'nip' not described in 'gfs2_dir_mvino'
 fs/gfs2/dir.c:1934: warning: Function parameter or member 'new_type' not described in 'gfs2_dir_mvino'
 fs/gfs2/dir.c:1934: warning: Excess function parameter 'new_inode' description in 'gfs2_dir_mvino'
 fs/gfs2/dir.c:1971: warning: Function parameter or member 'last_dealloc' not described in 'leaf_dealloc'
 fs/gfs2/dir.c:2154: warning: Function parameter or member 'inode' not described in 'gfs2_diradd_alloc_required'
 fs/gfs2/dir.c:2154: warning: Function parameter or member 'name' not described in 'gfs2_diradd_alloc_required'
 fs/gfs2/dir.c:2154: warning: Excess function parameter 'ip' description in 'gfs2_diradd_alloc_required'
 fs/gfs2/dir.c:2154: warning: Excess function parameter 'filname' description in 'gfs2_diradd_alloc_required'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/dir.c | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
index c0f2875c946c9..9c1caaef3f0cd 100644
--- a/fs/gfs2/dir.c
+++ b/fs/gfs2/dir.c
@@ -767,7 +767,7 @@ static int get_leaf(struct gfs2_inode *dip, u64 leaf_no,
 	return error;
 }
 
-/**
+/*
  * get_leaf_nr - Get a leaf number associated with the index
  * @dip: The GFS2 inode
  * @index:
@@ -775,7 +775,6 @@ static int get_leaf(struct gfs2_inode *dip, u64 leaf_no,
  *
  * Returns: 0 on success, error code otherwise
  */
-
 static int get_leaf_nr(struct gfs2_inode *dip, u32 index,
 		       u64 *leaf_out)
 {
@@ -898,7 +897,7 @@ static struct gfs2_leaf *new_leaf(struct inode *inode, struct buffer_head **pbh,
 
 /**
  * dir_make_exhash - Convert a stuffed directory into an ExHash directory
- * @dip: The GFS2 inode
+ * @inode: The GFS2 inode
  *
  * Returns: 0 on success, error code otherwise
  */
@@ -989,11 +988,9 @@ static int dir_make_exhash(struct inode *inode)
 	return 0;
 }
 
-/**
+/*
  * dir_split_leaf - Split a leaf block into two
- * @dip: The GFS2 inode
- * @index:
- * @leaf_no:
+ * @inode: The GFS2 inode
  *
  * Returns: 0 on success, error code on failure
  */
@@ -1252,6 +1249,7 @@ static int compare_dents(const void *a, const void *b)
  * @ctx: what to feed the entries to
  * @darr: an array of struct gfs2_dirent pointers to read
  * @entries: the number of entries in darr
+ * @sort_start: the index into @darr to start the sort from
  * @copied: pointer to int that's non-zero if a entry has been copied out
  *
  * Jump through some hoops to make sure that if there are hash collsions,
@@ -1466,7 +1464,7 @@ static int gfs2_dir_read_leaf(struct inode *inode, struct dir_context *ctx,
 	return error;
 }
 
-/**
+/*
  * gfs2_dir_readahead - Issue read-ahead requests for leaf blocks.
  *
  * Note: we can't calculate each index like dir_e_read can because we don't
@@ -1515,14 +1513,11 @@ static void gfs2_dir_readahead(struct inode *inode, unsigned hsize, u32 index,
 	}
 }
 
-/**
+/*
  * dir_e_read - Reads the entries from a directory into a filldir buffer
- * @dip: dinode pointer
- * @ctx: actor to feed the entries to
  *
  * Returns: errno
  */
-
 static int dir_e_read(struct inode *inode, struct dir_context *ctx,
 		      struct file_ra_state *f_ra)
 {
@@ -1627,7 +1622,7 @@ int gfs2_dir_read(struct inode *inode, struct dir_context *ctx,
 
 /**
  * gfs2_dir_search - Search a directory
- * @dip: The GFS2 dir inode
+ * @dir: The GFS2 dir inode
  * @name: The name we are looking up
  * @fail_on_exist: Fail if the name exists rather than looking it up
  *
@@ -1636,7 +1631,6 @@ int gfs2_dir_read(struct inode *inode, struct dir_context *ctx,
  *
  * Returns: errno
  */
-
 struct inode *gfs2_dir_search(struct inode *dir, const struct qstr *name,
 			      bool fail_on_exist)
 {
@@ -1864,11 +1858,10 @@ int gfs2_dir_add(struct inode *inode, const struct qstr *name,
 /**
  * gfs2_dir_del - Delete a directory entry
  * @dip: The GFS2 inode
- * @filename: The filename
+ * @dentry: The directory entry to delete
  *
  * Returns: 0 on success, error code on failure
  */
-
 int gfs2_dir_del(struct gfs2_inode *dip, const struct dentry *dentry)
 {
 	const struct qstr *name = &dentry->d_name;
@@ -1916,11 +1909,9 @@ int gfs2_dir_del(struct gfs2_inode *dip, const struct dentry *dentry)
 	return 0;
 }
 
-/**
+/*
  * gfs2_dir_mvino - Change inode number of directory entry
  * @dip: The GFS2 inode
- * @filename:
- * @new_inode:
  *
  * This routine changes the inode number of a directory entry.  It's used
  * by rename to change ".." when a directory is moved.
@@ -1960,7 +1951,7 @@ int gfs2_dir_mvino(struct gfs2_inode *dip, const struct qstr *filename,
  * @len: the number of pointers to this leaf
  * @leaf_no: the leaf number
  * @leaf_bh: buffer_head for the starting leaf
- * last_dealloc: 1 if this is the final dealloc for the leaf, else 0
+ * @last_dealloc: 1 if this is the final dealloc for the leaf, else 0
  *
  * Returns: errno
  */
@@ -2142,8 +2133,8 @@ int gfs2_dir_exhash_dealloc(struct gfs2_inode *dip)
 
 /**
  * gfs2_diradd_alloc_required - find if adding entry will require an allocation
- * @ip: the file being written to
- * @filname: the filename that's going to be added
+ * @inode: The directory inode
+ * @name: the filename that's going to be added
  * @da: The structure to return dir alloc info
  *
  * Returns: 0 if ok, -ve on error
-- 
2.27.0

