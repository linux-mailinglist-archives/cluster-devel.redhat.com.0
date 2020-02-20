Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB8F1667AC
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 20:54:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582228466;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fO+vPIUXdLDX83co79fQo6aPKZlzoq65UUiHW7/Ukf4=;
	b=X8Gh+1k3CH6T1S8mG78mSleznGg6ctYFpyO4Med7XY1OlO6poLiMaKAr1z36AjbhGDF0jj
	9h/wc8xpWp6+Dh/Pvtg0MJED9YaJy6vje5852H+uetYaRUZC5Da9xKn5dogZFbNrxKsZ2G
	mgtQkwDXXIcdoSxfnh5J7a4vu/oeGt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-NtNaMsvbMcefSHuPtZ1esg-1; Thu, 20 Feb 2020 14:54:24 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B0B88010E7;
	Thu, 20 Feb 2020 19:54:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 589FC19E9C;
	Thu, 20 Feb 2020 19:54:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3725D8B2C8;
	Thu, 20 Feb 2020 19:54:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KJsIw6009294 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 14:54:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 68AE590F69; Thu, 20 Feb 2020 19:54:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F48390F65
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 19:54:17 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 20 Feb 2020 13:53:19 -0600
Message-Id: <20200220195329.952027-19-rpeterso@redhat.com>
In-Reply-To: <20200220195329.952027-1-rpeterso@redhat.com>
References: <20200220195329.952027-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 18/28] gfs2: Prepare to withdraw as
	soon as an IO error occurs in log write
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
X-MC-Unique: NtNaMsvbMcefSHuPtZ1esg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, function gfs2_end_log_write would detect any IO
errors writing to the journal and put out an appropriate message,
but it never set a withdrawing condition. Eventually, the log daemon
would see the error and determine it was time to withdraw, but in
the meantime, other processes could continue running as if nothing
bad ever happened. The biggest consequence is that __gfs2_glock_put
would BUG() when it saw that there were still unwritten items.

This patch sets the WITHDRAWING status as soon as an IO error is
detected, and that way, the BUG will be avoided so the file system
can be properly withdrawn and unmounted.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/lops.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 0af2e5ff0d97..7307e5e721d1 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -206,6 +206,9 @@ static void gfs2_end_log_write(struct bio *bio)
 =09=09if (!cmpxchg(&sdp->sd_log_error, 0, (int)bio->bi_status))
 =09=09=09fs_err(sdp, "Error %d writing to journal, jid=3D%u\n",
 =09=09=09       bio->bi_status, sdp->sd_jdesc->jd_jid);
+=09=09gfs2_withdraw_delayed(sdp);
+=09=09/* prevent more writes to the journal */
+=09=09clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 =09=09wake_up(&sdp->sd_logd_waitq);
 =09}
=20
--=20
2.24.1

