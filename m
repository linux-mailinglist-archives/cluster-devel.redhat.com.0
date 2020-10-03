Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5468D2833F3
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Oct 2020 12:26:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-j4J45_p5NROctv6RVfT9wg-1; Mon, 05 Oct 2020 06:26:05 -0400
X-MC-Unique: j4J45_p5NROctv6RVfT9wg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93D7F1018F85;
	Mon,  5 Oct 2020 10:26:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CDFE10013C0;
	Mon,  5 Oct 2020 10:26:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F2D05181A55A;
	Mon,  5 Oct 2020 10:25:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0936XY2C012877 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 3 Oct 2020 02:33:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB75A2156A3C; Sat,  3 Oct 2020 06:33:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6E482156A4B
	for <cluster-devel@redhat.com>; Sat,  3 Oct 2020 06:33:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF856185A78B
	for <cluster-devel@redhat.com>; Sat,  3 Oct 2020 06:33:32 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-425-4hc3LeLsNQiNPRusfnQVTw-1; Sat, 03 Oct 2020 02:33:28 -0400
X-MC-Unique: 4hc3LeLsNQiNPRusfnQVTw-1
Received: by mail-pf1-f196.google.com with SMTP id o20so2962181pfp.11;
	Fri, 02 Oct 2020 23:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q6xweXElRWn54OBDJCo2YC9GbaWdrkEkmo/Vva5g7kY=;
	b=bWPP3JPGj/j86bEJcX7+Xll3RvqH99Ox0CtzAtDXFqpNgqzNhK4D1uHNDi5x9SFttt
	r/NwrKt0e14/qggrB7SrHoQrAo+fZq1ApVtmkGhKM90U6VcHgzJAeoJhKruCdW9JBZ1b
	ncw6zyvQVq4rytUisNePPhNGCfE6+kWLQnK9pUhKYmFkIIOmlB1X5xA4TAQ3jsNdajEH
	/EuVCx9q/8giKHl8AXCVJrWGVBhT5Vv6JlG9Nllx3PhzjJ5g47nnTcpGrfPeDKCc0yw1
	P6JvwkOmQ5Dps5RWNX7J5wb/k4rKQLs3k9oO8ZlYdRG5j9A7JnCU3xJLD/LMYYSmqmPL
	8gNQ==
X-Gm-Message-State: AOAM533mobEAUxqMvLN+1iQbzyh0EFfn0jXJJziWDid08aKGZqsCI6I6
	RIYpvzWiO6KJmOncj3YTWdgS/htY0kjuew==
X-Google-Smtp-Source: ABdhPJz+8ZPzDMqkEXY/l6D4yk3KnSI6kGzBe8Rg5VpGXoyWjW5iu7v+AHIDYMO19fXiHdn85yPNsA==
X-Received: by 2002:a63:4d57:: with SMTP id n23mr5523604pgl.43.1601706806975; 
	Fri, 02 Oct 2020 23:33:26 -0700 (PDT)
Received: from localhost.localdomain ([223.104.48.15])
	by smtp.gmail.com with ESMTPSA id r1sm3715664pgl.66.2020.10.02.23.33.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 02 Oct 2020 23:33:26 -0700 (PDT)
From: Fox Chen <foxhlchen@gmail.com>
To: rpeterso@redhat.com, agruenba@redhat.com
Date: Sat,  3 Oct 2020 14:31:43 +0800
Message-Id: <20201003063143.13093-1-foxhlchen@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 05 Oct 2020 06:25:54 -0400
Cc: cluster-devel@redhat.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, Fox Chen <foxhlchen@gmail.com>
Subject: [Cluster-devel] [PATCH] gfs2: gfs2_read_sb: put gfs2_assert inside
	the loop
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

for (x = 2;; x++) {
        ...
        gfs2_assert(sdp, x <= GFS2_MAX_META_HEIGHT);  <--- after
        ...
        if (d != sdp->sd_heightsize[x - 1] || m)
                break;
        sdp->sd_heightsize[x] = space;
}

sdp->sd_max_height = x
gfs2_assert(sdp, sdp->sd_max_height <= GFS2_MAX_META_HEIGHT) <--- before

Before this patch, gfs2_assert is put outside of the loop of
sdp->sd_heightsize[x] calculation. When something goes wrong,
x exceeds the size of GFS2_MAX_META_HEIGHT, it may already crash inside
the loop when

sdp->sd_heightsize[x] = space

tries to reach the out-of-bound
location, gfs2_assert won't help here.

This patch fixes this by moving gfs2_assert into the loop.
We will check x value each time to see if it exceeds GFS2_MAX_META_HEIGHT.

Signed-off-by: Fox Chen <foxhlchen@gmail.com>
---
 fs/gfs2/ops_fstype.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 6d18d2c91add..6cc32e3010f2 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -333,6 +333,7 @@ static int gfs2_read_sb(struct gfs2_sbd *sdp, int silent)
 		u64 space, d;
 		u32 m;
 
+		gfs2_assert(sdp, x <= GFS2_MAX_META_HEIGHT);
 		space = sdp->sd_heightsize[x - 1] * sdp->sd_inptrs;
 		d = space;
 		m = do_div(d, sdp->sd_inptrs);
@@ -343,7 +344,6 @@ static int gfs2_read_sb(struct gfs2_sbd *sdp, int silent)
 	}
 	sdp->sd_max_height = x;
 	sdp->sd_heightsize[x] = ~0;
-	gfs2_assert(sdp, sdp->sd_max_height <= GFS2_MAX_META_HEIGHT);
 
 	sdp->sd_max_dents_per_leaf = (sdp->sd_sb.sb_bsize -
 				      sizeof(struct gfs2_leaf)) /
-- 
2.25.1

