Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEAB3597FB
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Apr 2021 10:35:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-u-jHlQNCNUqbkh9tG-Dhug-1; Fri, 09 Apr 2021 04:35:40 -0400
X-MC-Unique: u-jHlQNCNUqbkh9tG-Dhug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E374107ACE8;
	Fri,  9 Apr 2021 08:35:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ECDA60BE5;
	Fri,  9 Apr 2021 08:35:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52AD01806D0F;
	Fri,  9 Apr 2021 08:35:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1398Za0Z012383 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 04:35:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 435EA2051AEC; Fri,  9 Apr 2021 08:35:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DBC32051ACA
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 08:35:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E08EC811E9C
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 08:35:32 +0000 (UTC)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-552-EF0tNLQmOIybD8LQhc8PyA-1; Fri, 09 Apr 2021 04:35:28 -0400
X-MC-Unique: EF0tNLQmOIybD8LQhc8PyA-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FGrc46wPnzlWy1;
	Fri,  9 Apr 2021 16:18:12 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.498.0; Fri, 9 Apr 2021 16:19:53 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: <weiyongjun1@huawei.com>, Bob Peterson <rpeterso@redhat.com>, "Andreas
	Gruenbacher" <agruenba@redhat.com>
Date: Fri, 9 Apr 2021 08:29:57 +0000
Message-ID: <20210409082957.2909213-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1398Za0Z012383
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Hulk Robot <hulkci@huawei.com>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH -next] gfs2: use kmem_cache_free() instead
	of kfree()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit

memory allocated by kmem_cache_alloc() should be freed using
kmem_cache_free(), not kfree().

Fixes: 7d6eec37a105 ("gfs2: Allocate bufdata object before taking log lock")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 fs/gfs2/trans.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index c50de22d7cbf..1b47d08ac4fb 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -206,7 +206,7 @@ void gfs2_trans_add_data(struct gfs2_glock *gl, struct buffer_head *bh)
 	}
 	gfs2_log_lock(sdp);
 	if (bh->b_private) {
-		kfree(bd);
+		kmem_cache_free(gfs2_bufdata_cachep, bd);
 		bd = bh->b_private;
 	} else {
 		bh->b_private = bd;
@@ -246,12 +246,12 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh)
 	}
 	gfs2_log_lock(sdp);
 	if (bh->b_private) {
-		kfree(bd);
+		kmem_cache_free(gfs2_bufdata_cachep, bd);
 		bd = bh->b_private;
 	} else {
 		lock_page(bh->b_page);
 		if (bh->b_private) {
-			kfree(bd);
+			kmem_cache_free(gfs2_bufdata_cachep, bd);
 			bd = bh->b_private;
 		} else {
 			bh->b_private = bd;


