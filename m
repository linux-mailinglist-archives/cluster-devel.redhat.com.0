Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E268B2479
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Sep 2019 19:04:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15113C08E2BB;
	Fri, 13 Sep 2019 17:04:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32370600C6;
	Fri, 13 Sep 2019 17:04:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C17B52551E;
	Fri, 13 Sep 2019 17:04:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8DH3rcc012296 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 13 Sep 2019 13:03:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F2C8A600D1; Fri, 13 Sep 2019 17:03:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.36])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C510600CE
	for <cluster-devel@redhat.com>; Fri, 13 Sep 2019 17:03:49 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 13 Sep 2019 18:03:46 +0100
Message-Id: <20190913170346.32102-1-anprice@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2_edit: Don't move cursor when
	displaying indirect blocks
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 13 Sep 2019 17:04:21 +0000 (UTC)

This move() call moves the cursor to column 9 which can cause already
printed characters to be overwritten in interactive mode. Remove it
so that the lines are formatted as in command line mode.

Before: " 24: 0x180x5106 / 20742"
After:  " 24: 0x18 => 0x5106 / 20742"

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/extended.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/gfs2/edit/extended.c b/gfs2/edit/extended.c
index d24d7550..f38fc7bf 100644
--- a/gfs2/edit/extended.c
+++ b/gfs2/edit/extended.c
@@ -178,8 +178,6 @@ static int display_indirect(struct iinfo *ind, int indblocks, int level,
 				print_gfs2("   ");
 		}
 		print_gfs2("%d: 0x%"PRIx64" => ", pndx, ind->ii[pndx].ptroff);
-		if (termlines)
-			move(line,9);
 		print_gfs2("0x%"PRIx64" / %"PRId64, ind->ii[pndx].block,
 			   ind->ii[pndx].block);
 		if (termlines) {
-- 
2.21.0

