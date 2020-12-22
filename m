Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C33262E0F6F
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Dec 2020 21:37:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608669470;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=h2lfupn3pztWXL/8XcJzeKG0Zaqxr0Ut5wj0Vy7h9Pg=;
	b=T6HP3+s2RgYjhQ2LBq+FM9eRAtK+a+A/tvR23SzDh1hTVWOXnUoAr35HcRSLhtatnFMuFi
	9gH7hkezKKm2kDno0ssm7h14ePh13D+O3rIt7fCHTeuYLHFMxpB1xaBwViGBmX8qYjd+E7
	CW7hAtfQxFS30Dc/yItIq9LEjRyaiqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-TgaKmxhONSypthGPf5E5fw-1; Tue, 22 Dec 2020 15:37:48 -0500
X-MC-Unique: TgaKmxhONSypthGPf5E5fw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45CBE195D561;
	Tue, 22 Dec 2020 20:37:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D36F95F9A7;
	Tue, 22 Dec 2020 20:37:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9211C180954D;
	Tue, 22 Dec 2020 20:37:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BMKbcc6030413 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 22 Dec 2020 15:37:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4F7AFE2D8; Tue, 22 Dec 2020 20:37:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 471B3E2D6
	for <cluster-devel@redhat.com>; Tue, 22 Dec 2020 20:37:35 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17FFC18095C9
	for <cluster-devel@redhat.com>; Tue, 22 Dec 2020 20:37:35 +0000 (UTC)
Date: Tue, 22 Dec 2020 15:37:35 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <2119423285.38904287.1608669455029.JavaMail.zimbra@redhat.com>
In-Reply-To: <1658783505.38904158.1608669449869.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.81, 10.4.195.4]
Thread-Topic: gfs2: make gfs2_log_write_page static
Thread-Index: 5Y7rFUN0gTt7jMC8GjMHNfTRB2pmsA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: make gfs2_log_write_page static
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Function gfs2_log_write_page is only used in lops.c, so make it static.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/lops.c | 2 +-
 fs/gfs2/lops.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 3922b26264f5..9e9dd486bed9 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -369,7 +369,7 @@ static void gfs2_log_write_bh(struct gfs2_sbd *sdp, struct buffer_head *bh)
  * the page may be freed at any time.
  */
 
-void gfs2_log_write_page(struct gfs2_sbd *sdp, struct page *page)
+static void gfs2_log_write_page(struct gfs2_sbd *sdp, struct page *page)
 {
 	struct super_block *sb = sdp->sd_vfs;
 	u64 dblock;
diff --git a/fs/gfs2/lops.h b/fs/gfs2/lops.h
index fbdbb08dcec6..2280f68862de 100644
--- a/fs/gfs2/lops.h
+++ b/fs/gfs2/lops.h
@@ -22,7 +22,6 @@ extern void gfs2_log_incr_head(struct gfs2_sbd *sdp);
 extern u64 gfs2_log_bmap(struct gfs2_jdesc *jd, unsigned int lbn);
 extern void gfs2_log_write(struct gfs2_sbd *sdp, struct page *page,
 			   unsigned size, unsigned offset, u64 blkno);
-extern void gfs2_log_write_page(struct gfs2_sbd *sdp, struct page *page);
 extern void gfs2_log_submit_bio(struct bio **biop, int opf);
 extern void gfs2_pin(struct gfs2_sbd *sdp, struct buffer_head *bh);
 extern int gfs2_find_jhead(struct gfs2_jdesc *jd,

