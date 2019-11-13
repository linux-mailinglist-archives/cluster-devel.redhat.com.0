Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 44E13FBAD0
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680655;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eIROlpqk18QUJCpvanIgppHY6G9j46IasH79pKvTRPg=;
	b=WUrJzo/8g3xB60I1eMFEU5c19mqEzb5OfFNFOiiM4IQQbedYE5ItQPiEmibWH/4VHQP3GT
	yrlk0UYEGpqQaln6r+1CeQybCgv3L0/xDaifRFpEa4+TRoeBws5rAsZ65f5GAfBGWlf/Pb
	aakFDV27UIHRCYSkw17WyRV3sXJeJD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-g0m6oPUZPDuGezA5YXU38Q-1; Wed, 13 Nov 2019 16:30:53 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6093985EE6E;
	Wed, 13 Nov 2019 21:30:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E106F6E8;
	Wed, 13 Nov 2019 21:30:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 322A918034EB;
	Wed, 13 Nov 2019 21:30:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUlLB005411 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CD5DE6973B; Wed, 13 Nov 2019 21:30:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 91CA26A505
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:47 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:21 -0600
Message-Id: <20191113213030.237431-24-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 23/32] gfs2: Don't skip log flush if glock
	still has revokes
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
X-MC-Unique: g0m6oPUZPDuGezA5YXU38Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Before this patch,function gfs2_log_flush only did flush work if
it saw the LFLUSH flag on the given glock. However, that glock still
needs to be flushed if it has revokes attached that are still pending.
If we don't flush them, they can be missed in the journal and a
journal replay can replay metadata that should have been revoked.

This patch adds an additional check to gfs2_log_flush for this condition.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 6b5bac203d6d..80b8220c532f 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -789,7 +789,8 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
lock *gl, u32 flags)
 =09down_write(&sdp->sd_log_flush_lock);
=20
 =09/* Log might have been flushed while we waited for the flush lock */
-=09if (gl && !test_bit(GLF_LFLUSH, &gl->gl_flags)) {
+=09if (gl && !test_bit(GLF_LFLUSH, &gl->gl_flags) &&
+=09    atomic_read(&gl->gl_revokes) =3D=3D 0) {
 =09=09up_write(&sdp->sd_log_flush_lock);
 =09=09return;
 =09}
--=20
2.23.0

