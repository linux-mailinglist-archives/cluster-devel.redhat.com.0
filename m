Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C1CE0285E23
	for <lists+cluster-devel@lfdr.de>; Wed,  7 Oct 2020 13:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602070278;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pssV5JTEY9wN8RaEkOHel8MNurnmINWWQ993FV1DOUs=;
	b=XN8o4Q3Mfc/okTX2cjiEZ8P43d13oGMZ81X75jpm7GdXyon9BI+e8UDJfKMV3j+MPjn9aZ
	PYp2OlY6JNcnzb6qoVRstFVALgslo66Wpogg6gzFwBtx3y3BNjiQxzjTxow+7TMfxmmwjE
	Cd9mPn3Iz2PL7JUadbDLYcEM1AS2eQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-uehUK2lWOPOFuJCUHLih4g-1; Wed, 07 Oct 2020 07:31:17 -0400
X-MC-Unique: uehUK2lWOPOFuJCUHLih4g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B15F81F004;
	Wed,  7 Oct 2020 11:31:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 447025576D;
	Wed,  7 Oct 2020 11:31:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D5F89181A86E;
	Wed,  7 Oct 2020 11:31:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 097BV51K003514 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 7 Oct 2020 07:31:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3BB0819C59; Wed,  7 Oct 2020 11:31:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45F4B19C4F;
	Wed,  7 Oct 2020 11:31:00 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  7 Oct 2020 12:30:58 +0100
Message-Id: <20201007113058.2128527-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: syzbot+43fa87986bdd31df9de6@syzkaller.appspotmail.com
Subject: [Cluster-devel] [PATCH] gfs2: Null-check gl in gfs2_rgrp_dump()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

When an rindex entry is found to be corrupt, compute_bitstructs() calls
gfs2_consist_rgrpd() which calls gfs2_rgrp_dump() like this:

    gfs2_rgrp_dump(NULL, rgd->rd_gl, fs_id_buf);

gfs2_rgrp_dump then dereferences the gl without checking it and we get

    BUG: KASAN: null-ptr-deref in gfs2_rgrp_dump+0x28/0x280

because there's no rgrp glock involved while reading the rindex on mount.

Add a NULL check for gl in gfs2_rgrp_dump() to allow the withdraw to
continue cleanly.

Reported-by: syzbot+43fa87986bdd31df9de6@syzkaller.appspotmail.com
Signed-off-by: Andrew Price <anprice@redhat.com>
---
 fs/gfs2/rgrp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 074f228ea839..ff0cabd819cc 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -2217,12 +2217,13 @@ static void rgblk_free(struct gfs2_sbd *sdp, struct gfs2_rgrpd *rgd,
 void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_glock *gl,
 		    const char *fs_id_buf)
 {
-	struct gfs2_rgrpd *rgd = gl->gl_object;
+	struct gfs2_rgrpd *rgd;
 	struct gfs2_blkreserv *trs;
 	const struct rb_node *n;
 
-	if (rgd == NULL)
+	if (gl == NULL || gl->gl_object == NULL)
 		return;
+	rgd = gl->gl_object;
 	gfs2_print_dbg(seq, "%s R: n:%llu f:%02x b:%u/%u i:%u r:%u e:%u\n",
 		       fs_id_buf,
 		       (unsigned long long)rgd->rd_addr, rgd->rd_flags,
-- 
2.26.2

