Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBE54297B0
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 21:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633981241;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4T3Z65FimuF2msKnyC0bsXdlv0PfZeOT/l5Za/gwzLQ=;
	b=L2UP/P4cIL7M9m/3UXZRbVJ54t+St1QX5Cfjz/MskKAbs4HHGP0VZsD5vaJ40vmEo/1zgv
	Zdpm2Ak+NBEg6dZ/uaw6pScypLbCqSGm34VrKC8rmltd+Nj6B9faVq4Mr3eT/AJr/l7LMu
	uO8CRSQ0RzExbG3A9352eBwdAUaNIag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-1q_mHdiBMZGeN-Kb6C8aXg-1; Mon, 11 Oct 2021 15:40:37 -0400
X-MC-Unique: 1q_mHdiBMZGeN-Kb6C8aXg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4F06100C611;
	Mon, 11 Oct 2021 19:40:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98A8D60938;
	Mon, 11 Oct 2021 19:40:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C00994EA2A;
	Mon, 11 Oct 2021 19:40:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BJeU8L028772 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 15:40:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 002D726DFD; Mon, 11 Oct 2021 19:40:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-2.phx2.redhat.com [10.3.114.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C327B26DE2
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:40:29 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 11 Oct 2021 14:39:59 -0500
Message-Id: <20211011194008.50097-5-rpeterso@redhat.com>
In-Reply-To: <20211011194008.50097-1-rpeterso@redhat.com>
References: <20211011194008.50097-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v3 PATCH 04/13] gfs2: dump glocks from
	gfs2_consist_OBJ_i
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, failed consistency checks printed out the object
that failed, but not the object's glock. This patch makes it also
print out the object glock so we can see the glock's holders and flags
to aid with debugging.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/util.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index cf345a86ef67..8241029a2a5d 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -454,6 +454,7 @@ void gfs2_consist_inode_i(struct gfs2_inode *ip,
 		(unsigned long long)ip->i_no_formal_ino,
 		(unsigned long long)ip->i_no_addr,
 		function, file, line);
+	gfs2_dump_glock(NULL, ip->i_gl, 1);
 	gfs2_withdraw(sdp);
 }
 
@@ -475,6 +476,7 @@ void gfs2_consist_rgrpd_i(struct gfs2_rgrpd *rgd,
 		"  function = %s, file = %s, line = %u\n",
 		(unsigned long long)rgd->rd_addr,
 		function, file, line);
+	gfs2_dump_glock(NULL, rgd->rd_gl, 1);
 	gfs2_withdraw(sdp);
 }
 
-- 
2.31.1

