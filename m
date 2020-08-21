Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 701D224DE85
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Aug 2020 19:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598031237;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rMFkrpWHy9aKBxnnoBYk2+VdnNmfzS5880Ug4WOhEbo=;
	b=GaSEstRd97BllPhxvWwxS0jLoro3EL6B58FaxI9njQ4QFB/GFQHwg2GLOTMxubUqcArSo+
	HtO878qT8cZv6AgtlchAT65GLCL/g416/I7mMgQE/ZuDViQDT9GGAok693DHdsUteOVT3C
	WXuQ2rMaDOoHqtDCZY2FHsoejKHkZ60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-LPlSV0AgM8uA31qFTZ-8hg-1; Fri, 21 Aug 2020 13:33:55 -0400
X-MC-Unique: LPlSV0AgM8uA31qFTZ-8hg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E98E807341;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 193F57C55A;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA641181A87F;
	Fri, 21 Aug 2020 17:33:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LHXgAK028386 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 13:33:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C3685DA75; Fri, 21 Aug 2020 17:33:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-102.phx2.redhat.com [10.3.112.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD6D55DA74
	for <cluster-devel@redhat.com>; Fri, 21 Aug 2020 17:33:41 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Aug 2020 12:33:27 -0500
Message-Id: <20200821173337.20377-3-rpeterso@redhat.com>
In-Reply-To: <20200821173337.20377-1-rpeterso@redhat.com>
References: <20200821173337.20377-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 02/12] gfs2: add missing log_blocks
	trace points in gfs2_write_revokes
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Function gfs2_write_revokes was incrementing and decrementing the number
of log blocks free, but there was never a log_blocks trace point for it.
Thus, the free blocks from a log_blocks trace would jump around
mysteriously.

This patch adds the missing trace points so the trace makes more sense.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index a58333e3980d..01a645652a7d 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -716,16 +716,24 @@ void gfs2_write_revokes(struct gfs2_sbd *sdp)
 		atomic_dec(&sdp->sd_log_blks_free);
 		/* If no blocks have been reserved, we need to also
 		 * reserve a block for the header */
-		if (!sdp->sd_log_blks_reserved)
+		if (!sdp->sd_log_blks_reserved) {
 			atomic_dec(&sdp->sd_log_blks_free);
+			trace_gfs2_log_blocks(sdp, -2);
+		} else {
+			trace_gfs2_log_blocks(sdp, -1);
+		}
 	}
 	gfs2_ail1_empty(sdp, max_revokes);
 	gfs2_log_unlock(sdp);
 
 	if (!sdp->sd_log_num_revoke) {
 		atomic_inc(&sdp->sd_log_blks_free);
-		if (!sdp->sd_log_blks_reserved)
+		if (!sdp->sd_log_blks_reserved) {
 			atomic_inc(&sdp->sd_log_blks_free);
+			trace_gfs2_log_blocks(sdp, 2);
+		} else {
+			trace_gfs2_log_blocks(sdp, 1);
+		}
 	}
 }
 
-- 
2.26.2

