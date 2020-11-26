Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2575C2C5C69
	for <lists+cluster-devel@lfdr.de>; Thu, 26 Nov 2020 20:02:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606417377;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/wH+LMd8YUqxixjo8MGi5Ji1Pw4JWYFKkHkWvm60ERs=;
	b=SpwFm2WfkHTUAViE1Cs1xnO9G9Kg3Da5xPNPp9lggcTyhNMNKaP3yGuuPMLIjLmyyWd/7n
	YFy7Gk4UHJPPrKJQARLYBBSSzdRbm8Z1/2SD2NFVvcX5S1oINVPP9sRiVFDJNNitcp+o79
	9KDMEewo7XyGpmo08OzOBcDpagmBcMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-fZNuiMflNuOAl_tC7PvaPQ-1; Thu, 26 Nov 2020 14:02:55 -0500
X-MC-Unique: fZNuiMflNuOAl_tC7PvaPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF6948143E5;
	Thu, 26 Nov 2020 19:02:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE5A25C1BD;
	Thu, 26 Nov 2020 19:02:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA8374BB7B;
	Thu, 26 Nov 2020 19:02:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AQJ2oSA008326 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 26 Nov 2020 14:02:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 876F51852F; Thu, 26 Nov 2020 19:02:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B91A219C66;
	Thu, 26 Nov 2020 19:02:46 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 26 Nov 2020 20:02:45 +0100
Message-Id: <20201126190245.539818-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Make inode_operations static
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

The inode operations are not used outside inode.c.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index eed1a1bac6f6..65d15c5c8246 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -36,6 +36,10 @@
 #include "super.h"
 #include "glops.h"
 
+static const struct inode_operations gfs2_file_iops;
+static const struct inode_operations gfs2_dir_iops;
+static const struct inode_operations gfs2_symlink_iops;
+
 static int iget_test(struct inode *inode, void *opaque)
 {
 	u64 no_addr = *(u64 *)opaque;
@@ -2135,7 +2139,7 @@ static int gfs2_update_time(struct inode *inode, struct timespec64 *time,
 	return generic_update_time(inode, time, flags);
 }
 
-const struct inode_operations gfs2_file_iops = {
+static const struct inode_operations gfs2_file_iops = {
 	.permission = gfs2_permission,
 	.setattr = gfs2_setattr,
 	.getattr = gfs2_getattr,
@@ -2146,7 +2150,7 @@ const struct inode_operations gfs2_file_iops = {
 	.update_time = gfs2_update_time,
 };
 
-const struct inode_operations gfs2_dir_iops = {
+static const struct inode_operations gfs2_dir_iops = {
 	.create = gfs2_create,
 	.lookup = gfs2_lookup,
 	.link = gfs2_link,
@@ -2167,7 +2171,7 @@ const struct inode_operations gfs2_dir_iops = {
 	.atomic_open = gfs2_atomic_open,
 };
 
-const struct inode_operations gfs2_symlink_iops = {
+static const struct inode_operations gfs2_symlink_iops = {
 	.get_link = gfs2_get_link,
 	.permission = gfs2_permission,
 	.setattr = gfs2_setattr,
diff --git a/fs/gfs2/inode.h b/fs/gfs2/inode.h
index b52ecf4ffe63..8073b8d2c7fa 100644
--- a/fs/gfs2/inode.h
+++ b/fs/gfs2/inode.h
@@ -107,9 +107,6 @@ extern int gfs2_open_common(struct inode *inode, struct file *file);
 extern loff_t gfs2_seek_data(struct file *file, loff_t offset);
 extern loff_t gfs2_seek_hole(struct file *file, loff_t offset);
 
-extern const struct inode_operations gfs2_file_iops;
-extern const struct inode_operations gfs2_dir_iops;
-extern const struct inode_operations gfs2_symlink_iops;
 extern const struct file_operations gfs2_file_fops_nolock;
 extern const struct file_operations gfs2_dir_fops_nolock;
 

