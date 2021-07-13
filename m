Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C9D083C763E
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jul 2021 20:10:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626199816;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N2SJGUFHlzLXx93dfxK5jeOKz0DXwn766nvipvrPwhM=;
	b=ASarb7RPXB7v26hlk5CGMFwdH3GFwr4adv1Lr4ZjpWjuMAtc/704OdyYEww/IDhOFPef3G
	2zKzeYMtvCrlcenasI7tBNGyZoyaZqA4hFPgIVBdLTdbaf6eZsbxpG55yZm8LKp1D7Zhq3
	zuosFDl+HVlre/3aU4dk2yJjnvuFmzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-SgrXI6FxMgGBrsx30-amzg-1; Tue, 13 Jul 2021 14:10:15 -0400
X-MC-Unique: SgrXI6FxMgGBrsx30-amzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2FC41023F43;
	Tue, 13 Jul 2021 18:10:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90AD35D703;
	Tue, 13 Jul 2021 18:10:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BED31809C99;
	Tue, 13 Jul 2021 18:10:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16DIA45A022103 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Jul 2021 14:10:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 940C6100EB3D; Tue, 13 Jul 2021 18:10:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-12.phx2.redhat.com [10.3.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63C201042A52
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 18:10:04 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 13 Jul 2021 13:09:52 -0500
Message-Id: <20210713180958.66995-5-rpeterso@redhat.com>
In-Reply-To: <20210713180958.66995-1-rpeterso@redhat.com>
References: <20210713180958.66995-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 04/10] gfs2: trivial clean up of
	gfs2_ail_error
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch does not change function. It adds variable sdp to clean up
function gfs2_ail_error and make it more readable.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 9f3b68806376..744cacd27213 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -33,16 +33,18 @@ extern struct workqueue_struct *gfs2_control_wq;
 
 static void gfs2_ail_error(struct gfs2_glock *gl, const struct buffer_head *bh)
 {
-	fs_err(gl->gl_name.ln_sbd,
+	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
+
+	fs_err(sdp,
 	       "AIL buffer %p: blocknr %llu state 0x%08lx mapping %p page "
 	       "state 0x%lx\n",
 	       bh, (unsigned long long)bh->b_blocknr, bh->b_state,
 	       bh->b_page->mapping, bh->b_page->flags);
-	fs_err(gl->gl_name.ln_sbd, "AIL glock %u:%llu mapping %p\n",
+	fs_err(sdp, "AIL glock %u:%llu mapping %p\n",
 	       gl->gl_name.ln_type, gl->gl_name.ln_number,
 	       gfs2_glock2aspace(gl));
-	gfs2_lm(gl->gl_name.ln_sbd, "AIL error\n");
-	gfs2_withdraw(gl->gl_name.ln_sbd);
+	gfs2_lm(sdp, "AIL error\n");
+	gfs2_withdraw(sdp);
 }
 
 /**
-- 
2.31.1

