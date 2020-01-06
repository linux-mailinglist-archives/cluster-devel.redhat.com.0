Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 367AD1318CC
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Jan 2020 20:33:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578339210;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=60Dx9h1M9Z4IIeny1XChoab6rYpWGAGqEbUkv9vwVU0=;
	b=Trc7X7XpINoCRPPAQuvn0wTXrqD/UANE0x/oasw0+Ry6970hqovTRDVqfoqlOLDzmh9nNl
	Sr1fcVHUN5z8LYY0x+SQ8uEUVzumlfnGCsjE4zmIX4nztoif9k/tHNaYRZxn7sB/Qbh1Gg
	tgd7OxX8yN7G+eqtF9hyOwB7ps2D1sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-C5GjZVp3NRSj7Ckw41i25A-1; Mon, 06 Jan 2020 14:33:27 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F07B2801E6C;
	Mon,  6 Jan 2020 19:33:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76697691AD;
	Mon,  6 Jan 2020 19:33:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 305444E166;
	Mon,  6 Jan 2020 19:33:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006JXIXV029675 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 14:33:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7941A5C290; Mon,  6 Jan 2020 19:33:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73FD95C21A
	for <cluster-devel@redhat.com>; Mon,  6 Jan 2020 19:33:16 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09C8C18095FF
	for <cluster-devel@redhat.com>; Mon,  6 Jan 2020 19:33:16 +0000 (UTC)
Date: Mon, 6 Jan 2020 14:33:15 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <60573784.748919.1578339195978.JavaMail.zimbra@redhat.com>
In-Reply-To: <695632580.748759.1578339159724.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.64, 10.4.195.22]
Thread-Topic: gfs2: remove tr_num_revoke from assert clause
Thread-Index: GKIL1s7TDMMMzxXbcvm+QrxHnvKyaQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: remove tr_num_revoke from assert
	clause
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: C5GjZVp3NRSj7Ckw41i25A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Patch e955537e326 ("gfs2: eliminate tr_num_revoke_rm") made it
possible for tr_num_revoke to go negative. That's not a problem
because any given transaction can add a revoke for changed
metadata, but it may then remove several revoke bds that are
queued off the superblock. So it may remove more than it added.

However, this sometimes caused this assert:

fatal: assertion "(nbuf <= tr->tr_blocks) &&
   (tr->tr_num_revoke <= tr->tr_revokes)" failed
   function = gfs2_trans_end, file = gfs2/trans.c, line = 110

This patch makes tr_num_revoke a signed int rather than unsigned,
and it removes the tr_num_revoke clause from the assert.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/incore.h | 2 +-
 fs/gfs2/trans.c  | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index b5d9c11f4901..e09859384559 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -504,7 +504,7 @@ struct gfs2_trans {
 	unsigned int tr_num_databuf_new;
 	unsigned int tr_num_buf_rm;
 	unsigned int tr_num_databuf_rm;
-	unsigned int tr_num_revoke;
+	int tr_num_revoke;
 
 	struct list_head tr_list;
 	struct list_head tr_databuf;
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 4d01fe19c125..60369f9950e2 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -76,7 +76,7 @@ static void gfs2_print_trans(struct gfs2_sbd *sdp, const struct gfs2_trans *tr)
 	fs_warn(sdp, "blocks=%u revokes=%u reserved=%u touched=%u\n",
 		tr->tr_blocks, tr->tr_revokes, tr->tr_reserved,
 		test_bit(TR_TOUCHED, &tr->tr_flags));
-	fs_warn(sdp, "Buf %u/%u Databuf %u/%u Revoke %u\n",
+	fs_warn(sdp, "Buf %u/%u Databuf %u/%u Revoke %d\n",
 		tr->tr_num_buf_new, tr->tr_num_buf_rm,
 		tr->tr_num_databuf_new, tr->tr_num_databuf_rm,
 		tr->tr_num_revoke);
@@ -103,8 +103,7 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 	nbuf -= tr->tr_num_buf_rm;
 	nbuf -= tr->tr_num_databuf_rm;
 
-	if (gfs2_assert_withdraw(sdp, (nbuf <= tr->tr_blocks) &&
-				       (tr->tr_num_revoke <= tr->tr_revokes)))
+	if (gfs2_assert_withdraw(sdp, (nbuf <= tr->tr_blocks)))
 		gfs2_print_trans(sdp, tr);
 
 	gfs2_log_commit(sdp, tr);

