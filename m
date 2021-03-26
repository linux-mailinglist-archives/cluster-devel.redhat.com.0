Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EF91434A458
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-jcRwVaAhMHSaA3TOHS0doA-1; Fri, 26 Mar 2021 05:31:16 -0400
X-MC-Unique: jcRwVaAhMHSaA3TOHS0doA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE2B7814339;
	Fri, 26 Mar 2021 09:31:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8DE66E703;
	Fri, 26 Mar 2021 09:31:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F8804A704;
	Fri, 26 Mar 2021 09:31:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9C6Wj012293 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF082FC734; Fri, 26 Mar 2021 09:12:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C07A4FA750
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3F6F848544
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:05 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
	[209.85.218.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-438-W2UHTuX1PJG64eYhs9WNnA-1; Fri, 26 Mar 2021 05:12:02 -0400
X-MC-Unique: W2UHTuX1PJG64eYhs9WNnA-1
Received: by mail-ej1-f41.google.com with SMTP id ce10so7315090ejb.6
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AgH3DJxocfXj8CzPXRPGR+bvGOz2TXMRbIxLhnqfhyo=;
	b=tEOqmJ2zDLXZTYmZyYgHyTUpVN2nRJkhumg9uw5PymmEiH2xvvAofmKovrR+yHnsI+
	5DgoRvHVOKi4s1ZZ+bbNMXqWCpePVy1sB2EIblcsO2cwM9UWtiRSWWDQaMAhCf9Gys5C
	tVlgIuN3q/axbHryoXVWi1TLfCzYxAHLTLIPEjfdwcHjzcTY54pDvMotkkf0ROs2f5/X
	TXY9TyV3I9CD5+llzJWESHc6+L+uLwcVRYvV0rydsdWDzkszVmoVbDO5EnKd6uhgscCK
	PswexDAjeRLVAV9uQqf3mk+inry1hIpgqqax77pyHQ3IkrgvkErO2UUjK9A9xDfg35VE
	1cCQ==
X-Gm-Message-State: AOAM533VQQXTPwRB/fm0J27k0pCK4DP3onRz7WG5cYIoj6fpPvl6/SNr
	Cl+MdmdTPE3ClKN15dwc9ZZCNe47pJMq5w==
X-Google-Smtp-Source: ABdhPJwpUh8wQHMagmRBhTdr1+38AIh6y15c0J3qnhYPq81xTQXWrvygESbWRGQmtUT9IaWouggylg==
X-Received: by 2002:a17:906:73d5:: with SMTP id
	n21mr14323052ejl.8.1616749915742; 
	Fri, 26 Mar 2021 02:11:55 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.11.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:11:55 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:34 +0000
Message-Id: <20210326091151.311647-2-lee.jones@linaro.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Mar 2021 05:31:04 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 01/18] fs: gfs2: dir: Finish off mostly
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

