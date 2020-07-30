Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E8525233818
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Jul 2020 20:03:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596132199;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=P8EEva/pVEOuZnmjp+xnF7+b58ITKBJqCt3r4r8xF2U=;
	b=BEDRBxBGFOfuIVviks5HlnbI9HnKhYykBGXtZjRFB7hk9ToeJbzxTvIxTKI/eyc8OS2jJE
	ysUCgrRSgp7mguX4wSAhlcaMb/I3+OkOSxDppZ24p1aYq8Ex/WcQHZL/HLfYGxyusdxL9E
	VwKwCfRpuQg4aG8yAw9Lo27uC1qJj7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-7RIBedbmMvO-R4vXEXORHw-1; Thu, 30 Jul 2020 14:03:17 -0400
X-MC-Unique: 7RIBedbmMvO-R4vXEXORHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E2EC100AA22;
	Thu, 30 Jul 2020 18:03:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A8115DA73;
	Thu, 30 Jul 2020 18:03:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 577C89A0ED;
	Thu, 30 Jul 2020 18:03:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UI0Hcb018349 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 14:00:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8876410023A0; Thu, 30 Jul 2020 18:00:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 813B2100239B
	for <cluster-devel@redhat.com>; Thu, 30 Jul 2020 18:00:05 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8FC0180954D
	for <cluster-devel@redhat.com>; Thu, 30 Jul 2020 18:00:05 +0000 (UTC)
Date: Thu, 30 Jul 2020 14:00:05 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <834298411.9841479.1596132005639.JavaMail.zimbra@redhat.com>
In-Reply-To: <1895648325.9841473.1596131990652.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.85, 10.4.195.13]
Thread-Topic: gfs2: When gfs2_dirty_inode gets a glock error, dump the glock
Thread-Index: iSKm04N+YaL1lX8Eul/TTOEOW/7dgQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: When gfs2_dirty_inode gets a
 glock error, dump the glock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Before this patch, if function gfs2_dirty_inode got an error when
trying to lock the inode glock, it complained, but it didn't say
what glock or inode had the problem.

In this case, it almost always means that dinode_in found an error
with the dinode in the file system. So it makes sense to dump the
glock, which tells us the location of the dinode in the file system.
That will allow us to analyze the corruption from the metadata.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 47d0ae158b69..9f4d9e7be839 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -566,6 +566,7 @@ static void gfs2_dirty_inode(struct inode *inode, int flags)
 		ret = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
 		if (ret) {
 			fs_err(sdp, "dirty_inode: glock %d\n", ret);
+			gfs2_dump_glock(NULL, ip->i_gl, true);
 			return;
 		}
 		need_unlock = 1;

