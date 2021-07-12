Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9833B3C606D
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jul 2021 18:24:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-XQCjgkCxNXmusVC5JzNqxA-1; Mon, 12 Jul 2021 12:24:53 -0400
X-MC-Unique: XQCjgkCxNXmusVC5JzNqxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1300D10C1ADC;
	Mon, 12 Jul 2021 16:24:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C60195D9CA;
	Mon, 12 Jul 2021 16:24:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7AFB4EA2A;
	Mon, 12 Jul 2021 16:24:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16CGOfdS017755 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 12 Jul 2021 12:24:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4A7169C072; Mon, 12 Jul 2021 16:24:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45C229C059
	for <cluster-devel@redhat.com>; Mon, 12 Jul 2021 16:24:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D4D8185A794
	for <cluster-devel@redhat.com>; Mon, 12 Jul 2021 16:24:37 +0000 (UTC)
Received: from smtp-relay-canonical-1.canonical.com
	(smtp-relay-canonical-1.canonical.com [185.125.188.121]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-597-KBIrHqboNyC6XS5dSowhwQ-1;
	Mon, 12 Jul 2021 12:24:32 -0400
X-MC-Unique: KBIrHqboNyC6XS5dSowhwQ-1
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id
	B36104049F; Mon, 12 Jul 2021 16:24:30 +0000 (UTC)
From: Colin King <colin.king@canonical.com>
To: Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>, Abhi Das <adas@redhat.com>, 
	cluster-devel@redhat.com
Date: Mon, 12 Jul 2021 17:24:30 +0100
Message-Id: <20210712162430.104913-1-colin.king@canonical.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 16CGOfdS017755
X-loop: cluster-devel@redhat.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: Fix memory leak of object lsi on
	error return path
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Colin Ian King <colin.king@canonical.com>

In the case where IS_ERR(lsi->si_sc_inode) is true the error exit path
to free_local does not kfree the allocated object lsi leading to a memory
leak. Fix this by kfree'ing lst before taking the error exit path.

Addresses-Coverity: ("Resource leak")
Fixes: 97fd734ba17e ("gfs2: lookup local statfs inodes prior to journal recovery")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/gfs2/ops_fstype.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 5f4504dd0875..bd3b3be1a473 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -677,6 +677,7 @@ static int init_statfs(struct gfs2_sbd *sdp)
 			error = PTR_ERR(lsi->si_sc_inode);
 			fs_err(sdp, "can't find local \"sc\" file#%u: %d\n",
 			       jd->jd_jid, error);
+			kfree(lsi);
 			goto free_local;
 		}
 		lsi->si_jid = jd->jd_jid;
-- 
2.31.1


