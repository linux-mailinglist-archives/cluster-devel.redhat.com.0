Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 06B0526EBB7
	for <lists+cluster-devel@lfdr.de>; Fri, 18 Sep 2020 04:09:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-JKzqPlX-Mk-aNA2yWqflgQ-1; Thu, 17 Sep 2020 22:08:58 -0400
X-MC-Unique: JKzqPlX-Mk-aNA2yWqflgQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18138186DD3B;
	Fri, 18 Sep 2020 02:08:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05E3D702E7;
	Fri, 18 Sep 2020 02:08:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 381D1183D040;
	Fri, 18 Sep 2020 02:08:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08I28qSk016460 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 17 Sep 2020 22:08:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8ABB010A1432; Fri, 18 Sep 2020 02:08:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 861C010A1431
	for <cluster-devel@redhat.com>; Fri, 18 Sep 2020 02:08:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBD54900C7E
	for <cluster-devel@redhat.com>; Fri, 18 Sep 2020 02:08:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-341-83dxDoIAN7eJMi88T5ngkg-1;
	Thu, 17 Sep 2020 22:08:45 -0400
X-MC-Unique: 83dxDoIAN7eJMi88T5ngkg-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id EDB6523976;
	Fri, 18 Sep 2020 02:08:42 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu, 17 Sep 2020 22:05:11 -0400
Message-Id: <20200918020802.2065198-35-sashal@kernel.org>
In-Reply-To: <20200918020802.2065198-1-sashal@kernel.org>
References: <20200918020802.2065198-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08I28qSk016460
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 4.19 035/206] gfs2: clean up iopen
	glock mess in gfs2_create_inode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit 2c47c1be51fbded1f7baa2ceaed90f97932f79be ]

Before this patch, gfs2_create_inode had a use-after-free for the
iopen glock in some error paths because it did this:

	gfs2_glock_put(io_gl);
fail_gunlock2:
	if (io_gl)
		clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);

In some cases, the io_gl was used for create and only had one
reference, so the glock might be freed before the clear_bit().
This patch tries to straighten it out by only jumping to the
error paths where iopen is properly set, and moving the
gfs2_glock_put after the clear_bit.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/inode.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index d968b5c5df217..a52b8b0dceeb9 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -715,7 +715,7 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 
 	error = gfs2_trans_begin(sdp, blocks, 0);
 	if (error)
-		goto fail_gunlock2;
+		goto fail_free_inode;
 
 	if (blocks > 1) {
 		ip->i_eattr = ip->i_no_addr + 1;
@@ -726,7 +726,7 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 
 	error = gfs2_glock_get(sdp, ip->i_no_addr, &gfs2_iopen_glops, CREATE, &io_gl);
 	if (error)
-		goto fail_gunlock2;
+		goto fail_free_inode;
 
 	BUG_ON(test_and_set_bit(GLF_INODE_CREATING, &io_gl->gl_flags));
 
@@ -735,7 +735,6 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 		goto fail_gunlock2;
 
 	glock_set_object(ip->i_iopen_gh.gh_gl, ip);
-	gfs2_glock_put(io_gl);
 	gfs2_set_iop(inode);
 	insert_inode_hash(inode);
 
@@ -768,6 +767,8 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 
 	mark_inode_dirty(inode);
 	d_instantiate(dentry, inode);
+	/* After instantiate, errors should result in evict which will destroy
+	 * both inode and iopen glocks properly. */
 	if (file) {
 		file->f_mode |= FMODE_CREATED;
 		error = finish_open(file, dentry, gfs2_open_common);
@@ -775,15 +776,15 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 	gfs2_glock_dq_uninit(ghs);
 	gfs2_glock_dq_uninit(ghs + 1);
 	clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
+	gfs2_glock_put(io_gl);
 	return error;
 
 fail_gunlock3:
 	glock_clear_object(io_gl, ip);
 	gfs2_glock_dq_uninit(&ip->i_iopen_gh);
-	gfs2_glock_put(io_gl);
 fail_gunlock2:
-	if (io_gl)
-		clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
+	clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
+	gfs2_glock_put(io_gl);
 fail_free_inode:
 	if (ip->i_gl) {
 		glock_clear_object(ip->i_gl, ip);
-- 
2.25.1


