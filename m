Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAA617C399
	for <lists+cluster-devel@lfdr.de>; Fri,  6 Mar 2020 18:05:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583514353;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=33RpWivNvcvr6z5RL8ki3C7G9DmazUryDEeP8YgS85U=;
	b=a17xrTLKCFlVff1Q9/G+CIkd8nFjedZ2zM8Br1lKBPMGc0cS1bAYLjmU88BnlhdlzAnDFq
	840flKDkhNy51Ds5y+tI0R65xyO1XLc8CA4OegADSy47B8Q7PzYubESws3thTOMtXbt9iT
	iWsiN4pQKcu180tBN6vbTsXAUgf18gU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-A0x5-AF6Ny-Jg9MWmPgBCQ-1; Fri, 06 Mar 2020 12:05:51 -0500
X-MC-Unique: A0x5-AF6Ny-Jg9MWmPgBCQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B2C5107ACCC;
	Fri,  6 Mar 2020 17:05:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11D7260C80;
	Fri,  6 Mar 2020 17:05:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6A5518089CF;
	Fri,  6 Mar 2020 17:05:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 026H5htG028712 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 12:05:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5650B8B75D; Fri,  6 Mar 2020 17:05:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A4998B74D
	for <cluster-devel@redhat.com>; Fri,  6 Mar 2020 17:05:41 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  6 Mar 2020 11:05:29 -0600
Message-Id: <20200306170534.1772544-2-rpeterso@redhat.com>
In-Reply-To: <20200306170534.1772544-1-rpeterso@redhat.com>
References: <20200306170534.1772544-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 1/6] gfs2: Additional information when
	gfs2_ail1_flush withdraws
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, if gfs2_ail1_flush gets an error from function
gfs2_ail1_start_one (which comes indirectly from generic_writepages)
the file system is withdrawn, but without any explanation why.

This patch adds an error message if gfs2_ail1_flush gets an error
from gfs2_ail1_start_one.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 67465a34954e..87f3e892be3e 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -172,8 +172,11 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writ=
eback_control *wbc)
 =09}
 =09spin_unlock(&sdp->sd_ail_lock);
 =09blk_finish_plug(&plug);
-=09if (ret)
+=09if (ret) {
+=09=09gfs2_lm(sdp, "gfs2_ail1_start_one (generic_writepages) "
+=09=09=09"returned: %d\n", ret);
 =09=09gfs2_withdraw(sdp);
+=09}
 =09trace_gfs2_ail_flush(sdp, wbc, 0);
 }
=20
--=20
2.24.1

