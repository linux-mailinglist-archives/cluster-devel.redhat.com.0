Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 26729197D77
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:48:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576088;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TvA2RG0/jPbhWUZiUp/B8paPWKJOxxuEbKYRTCW1S2o=;
	b=DPDHWncp55l6Iz3/FVXQGA1lEGRvLW7gCwkuygFQifiiGN7HcpY1sCMD4Qxq/HTfS2zhJk
	sy9jgli+3wMq/NPamkUEFKzkN1YCFd8dBain8wmG7fpguV73GIrcbhlSk0aW+z8RdZD9/T
	n92n9GjbWJFCRT6iWxv2eD1VHOn/ozg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-bf5cWTqRPtynDjQNwL_Vfw-1; Mon, 30 Mar 2020 09:47:01 -0400
X-MC-Unique: bf5cWTqRPtynDjQNwL_Vfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A833EDBAB;
	Mon, 30 Mar 2020 13:46:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 903871001B07;
	Mon, 30 Mar 2020 13:46:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74AE7944DC;
	Mon, 30 Mar 2020 13:46:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkl1f020713 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2A2EE48; Mon, 30 Mar 2020 13:46:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E19D396F88
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:46 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:46:23 -0500
Message-Id: <20200330134624.259349-39-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 38/39] gfs2: change from write to read
	lock for sd_log_flush_lock in journal replay
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Function gfs2_recover_func grabs the sd_log_flush_lock rw_semaphore in
write mode. This is unnecessary because we only need to prevent log flush
from using sd_log_bio bio while it does. Therefore, a read lock will be
enough. This is a small step in cleaning up log flush.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/recovery.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index 34dfdb211439..96c345f49273 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -401,7 +401,7 @@ void gfs2_recover_func(struct work_struct *work)
 =09=09/* We take the sd_log_flush_lock here primarily to prevent log
 =09=09 * flushes and simultaneous journal replays from stomping on
 =09=09 * each other wrt sd_log_bio. */
-=09=09down_write(&sdp->sd_log_flush_lock);
+=09=09down_read(&sdp->sd_log_flush_lock);
 =09=09for (pass =3D 0; pass < 2; pass++) {
 =09=09=09lops_before_scan(jd, &head, pass);
 =09=09=09error =3D foreach_descriptor(jd, head.lh_tail,
@@ -412,7 +412,7 @@ void gfs2_recover_func(struct work_struct *work)
 =09=09}
=20
 =09=09clean_journal(jd, &head);
-=09=09up_write(&sdp->sd_log_flush_lock);
+=09=09up_read(&sdp->sd_log_flush_lock);
=20
 =09=09gfs2_glock_dq_uninit(&thaw_gh);
 =09=09t_rep =3D ktime_get();
--=20
2.25.1

