Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C24CA12D
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Oct 2019 17:36:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BBDEE10DCCA4;
	Thu,  3 Oct 2019 15:36:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D415E5C3F8;
	Thu,  3 Oct 2019 15:36:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58149180B76F;
	Thu,  3 Oct 2019 15:36:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x93FZxK1026701 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 3 Oct 2019 11:35:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BEEA960C83; Thu,  3 Oct 2019 15:35:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.36])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D74C960C18;
	Thu,  3 Oct 2019 15:35:55 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  3 Oct 2019 16:35:52 +0100
Message-Id: <20191003153552.2015-1-anprice@redhat.com>
In-Reply-To: <000000000000afc1b40593f68888@google.com>
References: <000000000000afc1b40593f68888@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: syzbot+c2fdfd2b783754878fb6@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: Fix memory leak when gfs2meta's
	fs_context is freed
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Thu, 03 Oct 2019 15:36:13 +0000 (UTC)

gfs2 and gfs2meta share an ->init_fs_context function which allocates an
args structure stored in fc->fs_private. gfs2 registers a ->free
function to free this memory when the fs_context is cleaned up, but
there was not one registered for gfs2meta, causing a leak.

Register a ->free function for gfs2meta. The existing gfs2_fc_free
function does what we need.

Reported-by: syzbot+c2fdfd2b783754878fb6@syzkaller.appspotmail.com
Signed-off-by: Andrew Price <anprice@redhat.com>
---
 fs/gfs2/ops_fstype.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 681b44682b0d..dc61af2c4d5e 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1600,6 +1600,7 @@ static int gfs2_meta_get_tree(struct fs_context *fc)
 }
 
 static const struct fs_context_operations gfs2_meta_context_ops = {
+	.free        = gfs2_fc_free,
 	.get_tree    = gfs2_meta_get_tree,
 };
 
-- 
2.21.0

