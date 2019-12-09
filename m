Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B879911709C
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Dec 2019 16:37:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575905839;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GJ5UGI6qWMHbO3t4S7h7WLvNJuBEm1OJyUbepCqoZug=;
	b=hm1Ndc3rki32fwXWE8E/TIQ7D65KK1Bdj5lcdyumn4c1XprLqvShRDiM8oLDqJw9zC3sLs
	4HYmJXpNAua1e/xem3sJgH71OkbK9180Yzxao/iPBD3BLbW6n5dE3gnE17D/YWKaq7LQ2x
	b7lCG3qyp9OFDV6UTCCbI1S6+RTcGdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-jWPj03kOPWq_-WA5837VSw-1; Mon, 09 Dec 2019 10:37:18 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE96E18044AB;
	Mon,  9 Dec 2019 15:37:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA51F66838;
	Mon,  9 Dec 2019 15:37:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFF401803C33;
	Mon,  9 Dec 2019 15:37:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9FbCar005020 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 10:37:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ADE275DA76; Mon,  9 Dec 2019 15:37:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-248.phx2.redhat.com [10.3.116.248])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 794A45DA75
	for <cluster-devel@redhat.com>; Mon,  9 Dec 2019 15:37:12 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon,  9 Dec 2019 09:36:56 -0600
Message-Id: <20191209153700.700208-19-rpeterso@redhat.com>
In-Reply-To: <20191209153700.700208-1-rpeterso@redhat.com>
References: <20191209153700.700208-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v8 PATCH 18/22] gfs2: Don't skip log flush if
	glock still has revokes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: jWPj03kOPWq_-WA5837VSw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
index b20eb0bec111..799119fa3ecc 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -799,7 +799,8 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
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

