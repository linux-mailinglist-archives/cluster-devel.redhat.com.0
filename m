Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1E6197D75
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:48:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576088;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Xav9Va+xT4Uy9qKJMctkKkAkI6I2uUrlpmOpN9TaQk8=;
	b=PXYMRfEaptO8SQ8PjpfpG011LZ+h/9UPC+yTyHSK/fcSGnfFWQWFDU0DeqaWQx3/XN3a0m
	c8XKD8miDnr1ALkYqjkJa6F5qgzoujQIg+K4wMWex4NUTXX/shqR+dYz5YThFYRr9Y0Wqv
	Vf3QRxmLRsiTNhJ97OrUi8hh1qtFiOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-ojklaThkPNeXG_aAUMjgjg-1; Mon, 30 Mar 2020 09:46:52 -0400
X-MC-Unique: ojklaThkPNeXG_aAUMjgjg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDD2586A06B;
	Mon, 30 Mar 2020 13:46:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D67C46031F;
	Mon, 30 Mar 2020 13:46:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B656118089CD;
	Mon, 30 Mar 2020 13:46:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkdQH020557 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 88C3848; Mon, 30 Mar 2020 13:46:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E7055C1A8
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:39 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:46:12 -0500
Message-Id: <20200330134624.259349-28-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 27/39] gfs2: allow journal replay to
	hold sd_log_flush_lock
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, journal replays could stomp on log flushes
and each other because both log flushes and journal replays used
the same sd_log_bio. Function gfs2_log_flush prevents other log
flushes from interfering by taking the sd_log_flush_lock rwsem
during the flush. However, it does not protect against journal
replays. This patch allows the journal replay to take the same
sd_log_flush_lock rwsem so use of the sd_log_bio is not stomped.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/recovery.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index 8cc26bef4e64..21fc44b31863 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -398,6 +398,10 @@ void gfs2_recover_func(struct work_struct *work)
 =09=09fs_info(sdp, "jid=3D%u: Replaying journal...0x%x to 0x%x\n",
 =09=09=09jd->jd_jid, head.lh_tail, head.lh_blkno);
=20
+=09=09/* We take the sd_log_flush_lock here primarily to prevent log
+=09=09 * flushes and simultaneous journal replays from stomping on
+=09=09 * each other wrt sd_log_bio. */
+=09=09down_write(&sdp->sd_log_flush_lock);
 =09=09for (pass =3D 0; pass < 2; pass++) {
 =09=09=09lops_before_scan(jd, &head, pass);
 =09=09=09error =3D foreach_descriptor(jd, head.lh_tail,
@@ -408,6 +412,7 @@ void gfs2_recover_func(struct work_struct *work)
 =09=09}
=20
 =09=09clean_journal(jd, &head);
+=09=09up_write(&sdp->sd_log_flush_lock);
=20
 =09=09gfs2_glock_dq_uninit(&thaw_gh);
 =09=09t_rep =3D ktime_get();
--=20
2.25.1

