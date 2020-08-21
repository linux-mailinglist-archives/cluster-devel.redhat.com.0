Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 39B8F24DE88
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Aug 2020 19:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598031238;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sALzgn83gJtNsRRAzDOmHPVhgDi8dNVi8tGBTj2MX+g=;
	b=O/kx6wquvm6hIRrGSj6sIA/SJD91LW26EJbtHtocInvdz4J42+ZBdNqxcI0eM6z3otkpI/
	5LHhwsv0GlNCu/V6M7MbXAUfI2pyifTHOXfA+ROB9rzkuwwEr+nOs10SkdPFdvo2cG/s7D
	yZ9ghI/MewH1UnG/5SqLxSdd+urkNqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-Kg4FCGVkPCK4WNLBfIm8pg-1; Fri, 21 Aug 2020 13:33:56 -0400
X-MC-Unique: Kg4FCGVkPCK4WNLBfIm8pg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F5CB1885D92;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F96F5C1D0;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6664D181A869;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LHXhFv028415 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 13:33:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B87045DA75; Fri, 21 Aug 2020 17:33:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-102.phx2.redhat.com [10.3.112.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83CCE5DA74
	for <cluster-devel@redhat.com>; Fri, 21 Aug 2020 17:33:43 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Aug 2020 12:33:32 -0500
Message-Id: <20200821173337.20377-8-rpeterso@redhat.com>
In-Reply-To: <20200821173337.20377-1-rpeterso@redhat.com>
References: <20200821173337.20377-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 07/12] gfs2: make gfs2_ail1_empty_one
	return the count of active items
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch is one baby step toward simplifying the journal management.
It simply changes function gfs2_ail1_empty_one from a void to an int and
makes it return a count of active items. This allows the caller to check
the return code rather than list_empty on the tr_ail1_list. This way
we can, in a later patch, combine transaction ail1 and ail2 lists.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 3e24e8733950..4fb1a96b8124 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -244,13 +244,15 @@ static void gfs2_ail1_start(struct gfs2_sbd *sdp)
  * @tr: the transaction
  * @max_revokes: If nonzero, issue revokes for the bd items for written buffers
  *
+ * returns: the transaction's count of remaining active items
  */
 
-static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
+static int gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
 				int *max_revokes)
 {
 	struct gfs2_bufdata *bd, *s;
 	struct buffer_head *bh;
+	int active_count = 0;
 
 	list_for_each_entry_safe_reverse(bd, s, &tr->tr_ail1_list,
 					 bd_ail_st_list) {
@@ -265,8 +267,10 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
 		 * If the ail buffer is not busy and caught an error, flag it
 		 * for others.
 		 */
-		if (!sdp->sd_log_error && buffer_busy(bh))
+		if (!sdp->sd_log_error && buffer_busy(bh)) {
+			active_count++;
 			continue;
+		}
 		if (!buffer_uptodate(bh) &&
 		    !cmpxchg(&sdp->sd_log_error, 0, -EIO)) {
 			gfs2_io_error_bh(sdp, bh);
@@ -285,6 +289,7 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
 		}
 		list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
 	}
+	return active_count;
 }
 
 /**
@@ -303,8 +308,7 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp, int max_revokes)
 
 	spin_lock(&sdp->sd_ail_lock);
 	list_for_each_entry_safe_reverse(tr, s, &sdp->sd_ail1_list, tr_list) {
-		gfs2_ail1_empty_one(sdp, tr, &max_revokes);
-		if (list_empty(&tr->tr_ail1_list) && oldest_tr)
+		if (!gfs2_ail1_empty_one(sdp, tr, &max_revokes) && oldest_tr)
 			list_move(&tr->tr_list, &sdp->sd_ail2_list);
 		else
 			oldest_tr = 0;
-- 
2.26.2

