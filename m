Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BD0941F23CA
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jun 2020 01:17:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591658278;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=09u6F3z6PRra+9KuTEsPYn6oYET+4XDn+y7jQ225AbU=;
	b=CKL5al2SCh6asw5mf97WpVDXTG9YkKdcfYv8G/R/GwUg9vPez5a57HkBwmgayfhHJ2UEHG
	Z2iqmxkwVjpKnRHxPHBUrYd1Rc0QS0+pdqeGWuqHYGIYuirYtR+YhUlUJfR+VbQRFz6pG9
	HoQ4v++rnkniYg8Xi3xend7p2U92pIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-v75SckNTN9-msIchzrdDvg-1; Mon, 08 Jun 2020 19:17:56 -0400
X-MC-Unique: v75SckNTN9-msIchzrdDvg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1473B800053;
	Mon,  8 Jun 2020 23:17:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05AA678FC5;
	Mon,  8 Jun 2020 23:17:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E34D714CF3;
	Mon,  8 Jun 2020 23:17:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058NHq8J031332 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 19:17:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 357502028DCC; Mon,  8 Jun 2020 23:17:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30F9F2026FFE
	for <cluster-devel@redhat.com>; Mon,  8 Jun 2020 23:17:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76C1F856FFF
	for <cluster-devel@redhat.com>; Mon,  8 Jun 2020 23:17:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-353-MI0lLk3RM5KwzCTjWZ9Ipg-1;
	Mon, 08 Jun 2020 19:17:42 -0400
X-MC-Unique: MI0lLk3RM5KwzCTjWZ9Ipg-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E936920884;
	Mon,  8 Jun 2020 23:17:34 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon,  8 Jun 2020 19:06:29 -0400
Message-Id: <20200608231211.3363633-264-sashal@kernel.org>
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 058NHq8J031332
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.6 264/606] gfs2: Grab glock
	reference sooner in gfs2_add_revoke
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Andreas Gruenbacher <agruenba@redhat.com>

[ Upstream commit f4e2f5e1a527ce58fc9f85145b03704779a3123e ]

This patch rearranges gfs2_add_revoke so that the extra glock
reference is added earlier on in the function to avoid races in which
the glock is freed before the new reference is taken.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/log.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 60d911e293e6..2674feda1d7a 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -603,13 +603,13 @@ void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd)
 	struct buffer_head *bh = bd->bd_bh;
 	struct gfs2_glock *gl = bd->bd_gl;
 
+	sdp->sd_log_num_revoke++;
+	if (atomic_inc_return(&gl->gl_revokes) == 1)
+		gfs2_glock_hold(gl);
 	bh->b_private = NULL;
 	bd->bd_blkno = bh->b_blocknr;
 	gfs2_remove_from_ail(bd); /* drops ref on bh */
 	bd->bd_bh = NULL;
-	sdp->sd_log_num_revoke++;
-	if (atomic_inc_return(&gl->gl_revokes) == 1)
-		gfs2_glock_hold(gl);
 	set_bit(GLF_LFLUSH, &gl->gl_flags);
 	list_add(&bd->bd_list, &sdp->sd_log_revokes);
 }
-- 
2.25.1


