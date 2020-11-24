Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 51C3F2C2BA8
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Nov 2020 16:44:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606232690;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ULJ3NiReHyoYqg6vimx3tI8LBAZ1WiLEldC/2f1E4dg=;
	b=aIQIuu9RSKwDcjsjEGuD+72yZskA+aZW9Hl/aPsayIeeahyosORiP/gKnyQrfmBIDiSdjR
	FrZkpzj+QfeV+e7zAxG7EHYUMHu7gPp5/IENQ1CdNA4a8vYMbPif6RtRHutXScNtMW5HXS
	Dk+VpGZoKOmYqEmbHEWoM7trMfTKQVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-2gTLpnZvMUaEr-6EUlRa8w-1; Tue, 24 Nov 2020 10:44:48 -0500
X-MC-Unique: 2gTLpnZvMUaEr-6EUlRa8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D40A3100C660;
	Tue, 24 Nov 2020 15:44:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8516B100164C;
	Tue, 24 Nov 2020 15:44:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B02AB4A7C6;
	Tue, 24 Nov 2020 15:44:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AOFid9f005018 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 10:44:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9BE1060BE5; Tue, 24 Nov 2020 15:44:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 979C560C4D
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 15:44:36 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA1324BB7B
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 15:44:36 +0000 (UTC)
Date: Tue, 24 Nov 2020 10:44:36 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <192964445.29401792.1606232676707.JavaMail.zimbra@redhat.com>
In-Reply-To: <1537223283.29401746.1606232653565.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.100, 10.4.195.6]
Thread-Topic: gfs2: check for empty rgrp tree in gfs2_ri_update
Thread-Index: 6Z2anmGXD9oS0zVmxB+WfwUx4I1LgA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] gfs2: check for empty rgrp tree in gfs2_ri_update
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

If gfs2 tries to mount a (corrupt) file system that has no resource groups
it still tries to set preferences on the first one, which causes a kernel null
pointer dereference. This patch adds a check to function gfs2_ri_update so
this condition is detected and reported back as an error.

Reported-by: syzbot
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/rgrp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index f7addc6197ed..5e8eef9990e3 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -985,6 +985,10 @@ static int gfs2_ri_update(struct gfs2_inode *ip)
 	if (error < 0)
 		return error;
 
+	if (RB_EMPTY_ROOT(&sdp->sd_rindex_tree)) {
+		fs_err(sdp, "no resource groups found in the file system.\n");
+		return -ENOENT;
+	}
 	set_rgrp_preferences(sdp);
 
 	sdp->sd_rindex_uptodate = 1;

