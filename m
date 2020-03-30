Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 0D90D197D5E
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:46:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576014;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KbOBOn69tSkYAegqS6JtgCup0T3jiCnOE9+RjtIP6Wo=;
	b=TpssY5DryE0oSgemIMlRtTo8vidHLdJ+XxiLyY9I3lubr6yF9K6NurlWYJcQQPopbHRPgc
	IKkz38qYXaR7yZtzdFhSsG8lKPVa1trRwd8VqbtuskTsmSbAY9epZ+XDYxl/nYHNeFmEMZ
	qR27DqvNPVkGTJzrn5bq2X5UVDoQlmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-IRScDl-lM4awywen_hVvYg-1; Mon, 30 Mar 2020 09:46:53 -0400
X-MC-Unique: IRScDl-lM4awywen_hVvYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E23E519067E3;
	Mon, 30 Mar 2020 13:46:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D194719488;
	Mon, 30 Mar 2020 13:46:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B54DF944D4;
	Mon, 30 Mar 2020 13:46:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkece020583 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5856A5C1A8; Mon, 30 Mar 2020 13:46:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BE4748
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:40 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:46:14 -0500
Message-Id: <20200330134624.259349-30-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 29/39] gfs2: Additional information
	when gfs2_ail1_flush withdraws
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
2.25.1

