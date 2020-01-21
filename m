Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8E32A143B25
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jan 2020 11:38:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579603079;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ed/wemN9z6onpqKaKkioYSK6xljU6lSRRsipwJw81o0=;
	b=ErqiW94/SK8sZYWNIQHLzegVjhb9/qKk275BdxhhqonsEyPId7lEVcvvxLNGM9AD/Xu1Ol
	CfSYF49rEIzasDp5E5DvgUdnIS1r7bdjQZC7+COScOAPhEMPfDjxExzirzEuRZwYM3R92t
	nzcXPKXPOQcKTa97hwo2mohVV/d/cj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7--BRqwCJYM6ib7KheanET0Q-1; Tue, 21 Jan 2020 05:37:57 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A3161005513;
	Tue, 21 Jan 2020 10:37:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 097925DA60;
	Tue, 21 Jan 2020 10:37:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85C2481981;
	Tue, 21 Jan 2020 10:37:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00L8nO4u032183 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 03:49:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0CFAE2093CE6; Tue, 21 Jan 2020 08:49:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 084912093CE4
	for <cluster-devel@redhat.com>; Tue, 21 Jan 2020 08:49:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4D5580100B
	for <cluster-devel@redhat.com>; Tue, 21 Jan 2020 08:49:21 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R831e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04397;
	MF=alex.shi@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
	TI=SMTPD_---0ToHVLxs_1579596554;
Received: from out30-56.freemail.mail.aliyun.com
	(out30-56.freemail.mail.aliyun.com [115.124.30.56]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-273-1clNQe55PkWfxtrlJCrzDw-1;
	Tue, 21 Jan 2020 03:49:19 -0500
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com
	fp:SMTPD_---0ToHVLxs_1579596554) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 21 Jan 2020 16:49:15 +0800
From: Alex Shi <alex.shi@linux.alibaba.com>
To: 
Date: Tue, 21 Jan 2020 16:49:12 +0800
Message-Id: <1579596552-257820-1-git-send-email-alex.shi@linux.alibaba.com>
X-MC-Unique: 1clNQe55PkWfxtrlJCrzDw-1
X-MC-Unique: -BRqwCJYM6ib7KheanET0Q-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00L8nO4u032183
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 21 Jan 2020 05:36:16 -0500
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] fs/gfs2: remove IS_DINODE
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
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

After commit 1579343a73e3 ("GFS2: Remove dirent_first() function"), this
macro isn't used any more. so remove it.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Bob Peterson <rpeterso@redhat.com>=20
Cc: Andreas Gruenbacher <agruenba@redhat.com>=20
Cc: cluster-devel@redhat.com=20
Cc: linux-kernel@vger.kernel.org=20
---
 fs/gfs2/dir.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
index eb9c0578978f..636a8d0f3dab 100644
--- a/fs/gfs2/dir.c
+++ b/fs/gfs2/dir.c
@@ -74,7 +74,6 @@
 #include "util.h"
=20
 #define IS_LEAF     1 /* Hashed (leaf) directory */
-#define IS_DINODE   2 /* Linear (stuffed dinode block) directory */
=20
 #define MAX_RA_BLOCKS 32 /* max read-ahead blocks */
=20
--=20
1.8.3.1


