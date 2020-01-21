Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE4F143B18
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jan 2020 11:37:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579603042;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d87sE+pBfVaXff8O795dZh85T0cUo337jOMOfW6/nDE=;
	b=T/e51uNTYfyrYda3SETuc/L/ebi2S05yf/LNKQIXMqioZwAFDBUvBcIgP0qqv/IV1M2/4B
	uur3XU2BCNcZfxIXLYVUqMeSWwTxoPlLOTj4JbXzZ6ZPaps7mWCj5JFzagWu4d5mnIMUQZ
	myPuznSSr772WmhbSVs+8q5SKRJi+vk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-QQJPu2t8OQi2MeBzB3jHNw-1; Tue, 21 Jan 2020 05:37:21 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CC4A107ACC4;
	Tue, 21 Jan 2020 10:37:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCC78860EC;
	Tue, 21 Jan 2020 10:37:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0808F1809567;
	Tue, 21 Jan 2020 10:37:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00L8ncgZ032210 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 03:49:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3F91F2166B2A; Tue, 21 Jan 2020 08:49:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3520B2166B32
	for <cluster-devel@redhat.com>; Tue, 21 Jan 2020 08:49:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4803185B0C8
	for <cluster-devel@redhat.com>; Tue, 21 Jan 2020 08:49:35 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e07488;
	MF=alex.shi@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
	TI=SMTPD_---0ToHVLyx_1579596558;
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
	[47.88.44.36]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-274-dn86MiO8P7mhiUwB1-Z6UA-1; Tue, 21 Jan 2020 03:49:32 -0500
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com
	fp:SMTPD_---0ToHVLyx_1579596558) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 21 Jan 2020 16:49:18 +0800
From: Alex Shi <alex.shi@linux.alibaba.com>
To: 
Date: Tue, 21 Jan 2020 16:49:17 +0800
Message-Id: <1579596557-257872-1-git-send-email-alex.shi@linux.alibaba.com>
X-MC-Unique: dn86MiO8P7mhiUwB1-Z6UA-1
X-MC-Unique: QQJPu2t8OQi2MeBzB3jHNw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00L8ncgZ032210
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 21 Jan 2020 05:36:16 -0500
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] fs/gfs2: remove unused macro lbitskip etc
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

After commit 223b2b889f37 ("GFS2: Fix alignment issue and tidy
gfs2_bitfit"), these 3 macros aren't used anymore. remove them.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Bob Peterson <rpeterso@redhat.com>=20
Cc: Andreas Gruenbacher <agruenba@redhat.com>=20
Cc: cluster-devel@redhat.com=20
Cc: linux-kernel@vger.kernel.org=20
---
 fs/gfs2/rgrp.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 2466bb44a23c..e7bf91ec231c 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -36,16 +36,6 @@
 #define BFITNOENT ((u32)~0)
 #define NO_BLOCK ((u64)~0)
=20
-#if BITS_PER_LONG =3D=3D 32
-#define LBITMASK   (0x55555555UL)
-#define LBITSKIP55 (0x55555555UL)
-#define LBITSKIP00 (0x00000000UL)
-#else
-#define LBITMASK   (0x5555555555555555UL)
-#define LBITSKIP55 (0x5555555555555555UL)
-#define LBITSKIP00 (0x0000000000000000UL)
-#endif
-
 /*
  * These routines are used by the resource group routines (rgrp.c)
  * to keep track of block allocation.  Each block is represented by two
--=20
1.8.3.1


