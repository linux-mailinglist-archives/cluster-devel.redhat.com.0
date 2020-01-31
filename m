Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 89C4014F1E9
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 19:08:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580494098;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ApynzhURcqeooXDbGG3mTtM91jcBuxfcmDik8L7BHoY=;
	b=hywNv6PR9IFKYdRXQYZgA+v46/XehLHqPXfYuj4mT1N0mhgo4GK1YmG2sMjqcRsAPhiDji
	eL8Igc2FXyiayf/if0Rzl/nntej2+84hYbrfJVFkuD3XYrm566GSzaekMG8usp/AXB7RD2
	wuTB+nMUMDBKvgG9KKw1ZLlnSBcHGtI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-Cb1jc1jeNgiPuvVxvABwDg-1; Fri, 31 Jan 2020 13:08:16 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05DAE802CB5;
	Fri, 31 Jan 2020 18:08:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E786B5DA81;
	Fri, 31 Jan 2020 18:08:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDFE818089C8;
	Fri, 31 Jan 2020 18:08:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VI89j0027037 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 13:08:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2C35060BE1; Fri, 31 Jan 2020 18:08:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3E4260BE0
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 18:08:07 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 31 Jan 2020 12:07:16 -0600
Message-Id: <20200131180723.178863-19-rpeterso@redhat.com>
In-Reply-To: <20200131180723.178863-1-rpeterso@redhat.com>
References: <20200131180723.178863-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 18/25] gfs2: Prepare to withdraw as
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Cb1jc1jeNgiPuvVxvABwDg-1
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
index 45fa5cd88feb..3862c1f5c463 100644
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

