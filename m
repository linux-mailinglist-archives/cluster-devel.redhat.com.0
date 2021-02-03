Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 074D830E1E9
	for <lists+cluster-devel@lfdr.de>; Wed,  3 Feb 2021 19:08:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612375695;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tanOn66AMHhac3hgzo7oKCWiirZhpRtGw+zE/OEPGlA=;
	b=bp9hiNfWplUeWh5M4vhI7Pv4K9I2CctlIFBac3tP4mt82eHYkEhnCeaOpmYfQVkA6cAP2X
	f3FVmaFuu4BVnhNJE9Mxhqbxz9tk54Fp5busxE2rmJIVM17sLbnCMFs1CLpgWN4qj5s3Dh
	XzHnic+MPy2QflkQQcsDRwVgGk2FiCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-iMnLpjCYMXaJzYPU6xELNQ-1; Wed, 03 Feb 2021 13:08:11 -0500
X-MC-Unique: iMnLpjCYMXaJzYPU6xELNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29A8EAFA90;
	Wed,  3 Feb 2021 18:08:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 196F960BFA;
	Wed,  3 Feb 2021 18:08:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 677D118095CD;
	Wed,  3 Feb 2021 18:08:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113I83TN028516 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 13:08:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E2AA43828; Wed,  3 Feb 2021 18:08:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-112-155.ams2.redhat.com [10.36.112.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A53460D07;
	Wed,  3 Feb 2021 18:08:03 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  3 Feb 2021 19:07:38 +0100
Message-Id: <20210203180755.246596-4-agruenba@redhat.com>
In-Reply-To: <20210203180755.246596-1-agruenba@redhat.com>
References: <20210203180755.246596-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v4 03/20] gfs2: Minor gfs2_write_revokes
	cleanups
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Clean up the computations in gfs2_write_revokes (no change in functionality).

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 2e9314091c81..ccce17fe605f 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -712,11 +712,13 @@ void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
 void gfs2_write_revokes(struct gfs2_sbd *sdp)
 {
 	/* number of revokes we still have room for */
-	int max_revokes = (sdp->sd_sb.sb_bsize - sizeof(struct gfs2_log_descriptor)) / sizeof(u64);
+	unsigned int max_revokes;
 
 	gfs2_log_lock(sdp);
-	while (sdp->sd_log_num_revoke > max_revokes)
-		max_revokes += (sdp->sd_sb.sb_bsize - sizeof(struct gfs2_meta_header)) / sizeof(u64);
+	max_revokes = sdp->sd_ldptrs;
+	if (sdp->sd_log_num_revoke > sdp->sd_ldptrs)
+		max_revokes += roundup(sdp->sd_log_num_revoke - sdp->sd_ldptrs,
+				       sdp->sd_inptrs);
 	max_revokes -= sdp->sd_log_num_revoke;
 	if (!sdp->sd_log_num_revoke) {
 		atomic_dec(&sdp->sd_log_blks_free);
-- 
2.26.2

