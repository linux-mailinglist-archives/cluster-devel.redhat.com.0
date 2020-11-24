Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C15F22C31E7
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Nov 2020 21:27:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606249626;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=xzfELINL89BuDbXRnOx0hyjgfYXlDBu0tR9rUHKoP8I=;
	b=OXs0W0xj1ICANBh1VMO3gbP3SHSdT1UEYEueDzU+0KB2VO1FyxHRi2bbyd1kHVNl0Y2s/P
	Qhtjb1RXm8qBXTzCbzNRMKfa+wuv1ySFbDZCjZm3Hjm5sKSot/IES0YlwRIPhEq3rT30TM
	pOAX8y9zlXSXfB1lhI+20lrFgwz7DDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-ISd_VrhcMPS9W_V_TBAxXQ-1; Tue, 24 Nov 2020 15:27:03 -0500
X-MC-Unique: ISd_VrhcMPS9W_V_TBAxXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79576873155;
	Tue, 24 Nov 2020 20:27:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCC1E60BE5;
	Tue, 24 Nov 2020 20:26:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5FA6F180954D;
	Tue, 24 Nov 2020 20:26:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AOKQrIk015438 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 15:26:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8257B60C43; Tue, 24 Nov 2020 20:26:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D9F260BE5
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 20:26:49 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D76A218095C7
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 20:26:49 +0000 (UTC)
Date: Tue, 24 Nov 2020 15:26:49 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1409715771.29450602.1606249609812.JavaMail.zimbra@redhat.com>
In-Reply-To: <355304031.29450600.1606249586453.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.100, 10.4.195.3]
Thread-Topic: gfs2: Remove sb_start_write from gfs2_statfs_sync
Thread-Index: R/NSkKDTKebXPoAZQnhQ8bJB9ljvLg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Remove sb_start_write from
	gfs2_statfs_sync
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Before this patch, function gfs2_statfs_sync called sb_start_write. This is a
violation of the basic vfs rules that state that sb_start_write should always
be taken before s_umount. See this document:

https://www.kernel.org/doc/htmldocs/filesystems/API-sb-start-write.html

"Since freeze protection behaves as a lock, users have to preserve
ordering of freeze protection and other filesystem locks. Generally,
freeze protection should be the outermost lock. In particular, we have:

sb_start_write -> i_mutex (write path, truncate, directory ops, ...) ->
s_umount (freeze_super, thaw_super)"

deactivate_super
   down_write(&s->s_umount); <------------------------------------ s_umount
   deactivate_locked_super
      gfs2_kill_sb
         kill_block_super
            generic_shutdown_super
               gfs2_put_super
                  gfs2_make_fs_ro
                     gfs2_statfs_sync(sdp->sd_vfs, 0);
                        sb_start_write <--------------------- sb_start_write

As far as I can tell, gfs2_statfs_sync doesn't need to call sb_start_write
any more than any other write to the file system, which are policed by glocks.
None of the other functions in gfs2 lock sb_start_write so it only affects
how vfs calls gfs2.

This patch simply removes the call to sb_start_write.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index b3d951ab8068..2f56acc41c04 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -353,7 +353,6 @@ int gfs2_statfs_sync(struct super_block *sb, int type)
 	struct buffer_head *m_bh, *l_bh;
 	int error;
 
-	sb_start_write(sb);
 	error = gfs2_glock_nq_init(m_ip->i_gl, LM_ST_EXCLUSIVE, GL_NOCACHE,
 				   &gh);
 	if (error)
@@ -392,7 +391,6 @@ int gfs2_statfs_sync(struct super_block *sb, int type)
 out_unlock:
 	gfs2_glock_dq_uninit(&gh);
 out:
-	sb_end_write(sb);
 	return error;
 }
 

