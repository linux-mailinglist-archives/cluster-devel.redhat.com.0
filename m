Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6E23822CDCF
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jul 2020 20:33:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595615603;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WN8bpYeZUAoeFL020KVVhJd/zqgIwTdigAlI7DT7PbI=;
	b=En5VZ6HmlAoSr/pCxZwrE4UK40E2FmudhVN9PM3rH324/TG7fGZbBv9WiaMho+fIW3S7wK
	5R2Mwo0UUlOSBEeH9DBUfvqBCYGACbzUT8dxlVR303l1sv6NZS+XnCxu53MD70l5lDg99+
	YJ8PYMglnyzhbr9Gx+tiWsWlqSJQxTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-5n1buZugMvi0CLmZgW7AoQ-1; Fri, 24 Jul 2020 14:33:21 -0400
X-MC-Unique: 5n1buZugMvi0CLmZgW7AoQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71C6B100AA22;
	Fri, 24 Jul 2020 18:33:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 631E0712C2;
	Fri, 24 Jul 2020 18:33:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50CACA3596;
	Fri, 24 Jul 2020 18:33:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OIXDB2016324 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 14:33:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D56E06FEFE; Fri, 24 Jul 2020 18:33:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7444709E4
	for <cluster-devel@redhat.com>; Fri, 24 Jul 2020 18:33:13 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 24 Jul 2020 13:33:03 -0500
Message-Id: <20200724183304.366913-11-rpeterso@redhat.com>
In-Reply-To: <20200724183304.366913-1-rpeterso@redhat.com>
References: <20200724183304.366913-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 10/11] gfs2: print details on
	transactions that aren't properly ended
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

If function gfs2_trans_begin is called with another transaction active
it BUGs out, but it doesn't give any details about the duplicate.
This patch moves function gfs2_print_trans and calls it when this
situation arises for better debugging.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/trans.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 897d08e2a6b0..3728872976da 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -25,13 +25,28 @@
 #include "util.h"
 #include "trace_gfs2.h"
 
+static void gfs2_print_trans(struct gfs2_sbd *sdp, const struct gfs2_trans *tr)
+{
+	fs_warn(sdp, "Transaction created at: %pSR\n", (void *)tr->tr_ip);
+	fs_warn(sdp, "blocks=%u revokes=%u reserved=%u touched=%u\n",
+		tr->tr_blocks, tr->tr_revokes, tr->tr_reserved,
+		test_bit(TR_TOUCHED, &tr->tr_flags));
+	fs_warn(sdp, "Buf %u/%u Databuf %u/%u Revoke %u/%u\n",
+		tr->tr_num_buf_new, tr->tr_num_buf_rm,
+		tr->tr_num_databuf_new, tr->tr_num_databuf_rm,
+		tr->tr_num_revoke, tr->tr_num_revoke_rm);
+}
+
 int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 		     unsigned int revokes)
 {
 	struct gfs2_trans *tr;
 	int error;
 
-	BUG_ON(current->journal_info);
+	if (current->journal_info) {
+		gfs2_print_trans(sdp, current->journal_info);
+		BUG();
+	}
 	BUG_ON(blocks == 0 && revokes == 0);
 
 	if (!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))
@@ -72,18 +87,6 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 	return error;
 }
 
-static void gfs2_print_trans(struct gfs2_sbd *sdp, const struct gfs2_trans *tr)
-{
-	fs_warn(sdp, "Transaction created at: %pSR\n", (void *)tr->tr_ip);
-	fs_warn(sdp, "blocks=%u revokes=%u reserved=%u touched=%u\n",
-		tr->tr_blocks, tr->tr_revokes, tr->tr_reserved,
-		test_bit(TR_TOUCHED, &tr->tr_flags));
-	fs_warn(sdp, "Buf %u/%u Databuf %u/%u Revoke %u/%u\n",
-		tr->tr_num_buf_new, tr->tr_num_buf_rm,
-		tr->tr_num_databuf_new, tr->tr_num_databuf_rm,
-		tr->tr_num_revoke, tr->tr_num_revoke_rm);
-}
-
 void gfs2_trans_end(struct gfs2_sbd *sdp)
 {
 	struct gfs2_trans *tr = current->journal_info;
-- 
2.26.2

