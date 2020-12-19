Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CB0EA2DF19D
	for <lists+cluster-devel@lfdr.de>; Sat, 19 Dec 2020 21:49:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608410952;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8hYFTBWyh4qwmPE1Lb4aHj2ZsnWGr0t8ZzrwUKJ4Ij0=;
	b=fXonyXOXo8lJ6SULO10MaPtr32F0PhO5EkZvFEVjH6fPjwzwaoVHaOqgHFlA9bH0Ks4Gf4
	/q7x+uVPpDvJBkOXz5FtlJcpzTwH9dmIZU4a2kxeixnKcor3TGHsfyaGriWmUj1PLWwnh0
	qqOEE854o1dnu1HFpf1uSRE9HzNtz2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-upm7SuYENJmGHaP_pl36lg-1; Sat, 19 Dec 2020 15:49:09 -0500
X-MC-Unique: upm7SuYENJmGHaP_pl36lg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3A601005314;
	Sat, 19 Dec 2020 20:49:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4589F50C0E;
	Sat, 19 Dec 2020 20:49:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2CFE4A7C6;
	Sat, 19 Dec 2020 20:49:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJKn2LK020114 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 19 Dec 2020 15:49:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 79E1750ADB; Sat, 19 Dec 2020 20:49:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-115-196.ams2.redhat.com [10.36.115.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DE0A2DAD0;
	Sat, 19 Dec 2020 20:49:00 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 19 Dec 2020 21:48:31 +0100
Message-Id: <20201219204848.285781-4-agruenba@redhat.com>
In-Reply-To: <20201219204848.285781-1-agruenba@redhat.com>
References: <20201219204848.285781-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 03/20] gfs2: Minor gfs2_write_revokes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
index 41d13f19d1b4..6778473b2a7f 100644
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

