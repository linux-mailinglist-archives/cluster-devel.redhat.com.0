Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 626B74821F1
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Dec 2021 05:26:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-WD_QrAjaO6K0YKAhl4BJjw-1; Thu, 30 Dec 2021 23:26:50 -0500
X-MC-Unique: WD_QrAjaO6K0YKAhl4BJjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B59A61006AA3;
	Fri, 31 Dec 2021 04:26:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECC275ED29;
	Fri, 31 Dec 2021 04:26:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9E741809CB9;
	Fri, 31 Dec 2021 04:26:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BV4QVS7004554 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 30 Dec 2021 23:26:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7BC5F141DEF6; Fri, 31 Dec 2021 04:26:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 771B2141DECB
	for <cluster-devel@redhat.com>; Fri, 31 Dec 2021 04:26:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FFD629AA383
	for <cluster-devel@redhat.com>; Fri, 31 Dec 2021 04:26:31 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
	(out30-42.freemail.mail.aliyun.com [115.124.30.42]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-668-kYzILnanPrq3vsyNlMygow-1; Thu, 30 Dec 2021 23:26:27 -0500
X-MC-Unique: kYzILnanPrq3vsyNlMygow-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
	TI=SMTPD_---0V0Ofr7J_1640924452
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
	fp:SMTPD_---0V0Ofr7J_1640924452) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 31 Dec 2021 12:20:53 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: rpeterso@redhat.com
Date: Fri, 31 Dec 2021 12:20:51 +0800
Message-Id: <20211231042051.21736-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Abaci Robot <abaci@linux.alibaba.com>,
	Yang Li <yang.lee@linux.alibaba.com>, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH -next] gfs2: Fix __gfs2_holder_init()
	kernel-doc comment
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Add the description of @ip to remove warning found
by running scripts/kernel-doc, which is caused by
using 'make W=1'.
fs/gfs2/glock.c:1258: warning: Function parameter or member 'ip' not
described in '__gfs2_holder_init'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 fs/gfs2/glock.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index b7ab8430333c..2f3f91e518de 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1250,6 +1250,9 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
  * @state: the state we're requesting
  * @flags: the modifier flags
  * @gh: the holder structure
+ * @ip: Get the return address of the current function, that is, the function
+ *	is called by another function, and then when the function is finished,
+ *	the return address is the address at that time.
  *
  */
 
-- 
2.20.1.7.g153144c

