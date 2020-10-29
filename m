Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C02B229EEC7
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Oct 2020 15:52:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603983135;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U2wH972xumILb+HSqS7vqAierdrUgm8G6ZdbY2m1250=;
	b=H8UZPnYnc9PVsK8dtr+z6rfy1MSv/MZ/vmh/oMiV2eRWnfltNHhRGZuIgLPl8vw9edpmxu
	rmAe3RTbAALXvrFY6YssVSvt0B6rJmRuljXmHgbqa7lQNOAFwU2bafjRGDOUVv9Nwadgo6
	ERbUSApGaxPt5Yf7hWFLaglZylJjBBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-5bCricf5O8-h0cdsipjQhQ-1; Thu, 29 Oct 2020 10:52:14 -0400
X-MC-Unique: 5bCricf5O8-h0cdsipjQhQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70612640A7;
	Thu, 29 Oct 2020 14:52:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 600D26EF70;
	Thu, 29 Oct 2020 14:52:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 497DE5810D;
	Thu, 29 Oct 2020 14:52:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09TEqAjt021704 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 10:52:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DE675B4A9; Thu, 29 Oct 2020 14:52:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-113-104.phx2.redhat.com [10.3.113.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F40C75B4AA
	for <cluster-devel@redhat.com>; Thu, 29 Oct 2020 14:52:09 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 29 Oct 2020 09:52:02 -0500
Message-Id: <20201029145203.451643-4-rpeterso@redhat.com>
In-Reply-To: <20201029145203.451643-1-rpeterso@redhat.com>
References: <20201029145203.451643-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 3/4] gfs2: init_journal's undo
	directive should also undo the statfs inodes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi,

Before this patch, function init_journal's "undo" directive jumped to label
fail_jinode_gh. But now that it does statfs initialization, it needs to
jump to fail_statfs instead. Failure to do so means that mount failures
after init_journal is successful will neglect to let go of the proper
statfs information, stranding the statfs_changeX inodes. This makes it
impossible to free its glocks, and results in:

 gfs2: fsid=sda.s: G:  s:EX n:2/805f f:Dqob t:EX d:UN/603701000 a:0 v:0 r:4 m:200 p:1
 gfs2: fsid=sda.s:  H: s:EX f:H e:0 p:1397947 [(ended)] init_journal+0x548/0x890 [gfs2]
 gfs2: fsid=sda.s:  I: n:6/32863 t:8 f:0x00 d:0x00000201 s:24 p:0
 gfs2: fsid=sda.s: G:  s:SH n:5/805f f:Dqob t:SH d:UN/603712000 a:0 v:0 r:3 m:200 p:0
 gfs2: fsid=sda.s:  H: s:SH f:EH e:0 p:1397947 [(ended)] gfs2_inode_lookup+0x1fb/0x410 [gfs2]
 VFS: Busy inodes after unmount of sda. Self-destruct in 5 seconds.  Have a nice day...

The next time the file system is mounted, it then reuses the same glocks,
which ends in a kernel NULL pointer dereference when trying to dump the
reused glock.

This patch makes the "undo" function of init_journal jump to fail_statfs
so the statfs files are properly deconstructed upon failure.

Fixes: 97fd734ba17e ("gfs2: lookup local statfs inodes prior to journal recovery")
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/ops_fstype.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 7a7e3c10a9a9..1ed4b61e3298 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -704,7 +704,7 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 
 	if (undo) {
 		jindex = 0;
-		goto fail_jinode_gh;
+		goto fail_statfs;
 	}
 
 	sdp->sd_jindex = gfs2_lookup_simple(master, "jindex");
-- 
2.26.2

