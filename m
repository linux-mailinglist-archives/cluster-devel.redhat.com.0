Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 78E4C3895C4
	for <lists+cluster-devel@lfdr.de>; Wed, 19 May 2021 20:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621450142;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=swdqpogIjcc3sB83SX+RZXQu0MvPaulgt6a06fjOZ9E=;
	b=Wvmtgu0G6z3iWkBquWihI5DhV5sHuCQ9a7t3BHlMcdfu3kjytQuC8d7/mZCDcxZl+AkIQH
	+wrEr0qcK0JHPkttQzM+MmUt4RljA55lDZnXDPX2S293XjVyJzgC7h5xJg1nLaUdGc/yuB
	wIod3xWtXF9zu2ORImKDkGrrYX7pKSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-q3rjV2KyN3aDBAKn9nRQbQ-1; Wed, 19 May 2021 14:49:00 -0400
X-MC-Unique: q3rjV2KyN3aDBAKn9nRQbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81E11501F9;
	Wed, 19 May 2021 18:48:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4944250FBF;
	Wed, 19 May 2021 18:48:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1C385BBE8;
	Wed, 19 May 2021 18:48:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14JIk3b4018713 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 May 2021 14:46:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F8651F4; Wed, 19 May 2021 18:46:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48E6D1971B;
	Wed, 19 May 2021 18:45:56 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F02318095C2;
	Wed, 19 May 2021 18:45:56 +0000 (UTC)
Date: Wed, 19 May 2021 14:45:56 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <571878245.29133664.1621449956194.JavaMail.zimbra@redhat.com>
In-Reply-To: <722661408.29133657.1621449951775.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.185, 10.4.195.26]
Thread-Topic: gfs2: Fix I_NEW check in gfs2_dinode_in
Thread-Index: C5hfCOJfNPvO5kl4EFOjA9Lbx4ZlFA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Fix I_NEW check in gfs2_dinode_in
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Patch 4a378d8a0d96 added a new check for I_NEW inodes, but unfortunately
it used the wrong variable, i_flags. This caused GFS2 to withdraw when
gfs2_lookup_by_inum needed to refresh an I_NEW inode. This patch switches
to use the correct variable, i_state.

Fixes: 4a378d8a0d96 ("gfs2: be careful with inode refresh")
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 454095e9fedf..54d3fbeb3002 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -396,7 +396,7 @@ static int gfs2_dinode_in(struct gfs2_inode *ip, const void *buf)
 	struct timespec64 atime;
 	u16 height, depth;
 	umode_t mode = be32_to_cpu(str->di_mode);
-	bool is_new = ip->i_inode.i_flags & I_NEW;
+	bool is_new = ip->i_inode.i_state & I_NEW;
 
 	if (unlikely(ip->i_no_addr != be64_to_cpu(str->di_num.no_addr)))
 		goto corrupt;

